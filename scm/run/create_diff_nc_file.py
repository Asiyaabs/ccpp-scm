#!/usr/bin/env python
"""Write tag-minus-real differences (states + tendencies) from an SCM output.nc.

Usage: python tag_minus_real.py <input output.nc> [<output diff .nc>]
"""
import sys
import numpy as np
import netCDF4 as nc

src = sys.argv[1]
dst = sys.argv[2] if len(sys.argv) > 2 else "tag_minus_real.nc"

species = ["qv", "ql", "qi", "qr", "qs", "qg"]
procs = ["pbl", "deepconv", "shalconv", "micro", "convtrans", "phys", "nonphys"]

d = nc.Dataset(src)
names = set(d.variables)

pairs, missing = [], []          # (tag, real)
for s in species:
    if f"{s}_tag" in names:
        (pairs if s in names else missing).append((f"{s}_tag", s))
    for p in procs:
        t = f"d{s}tag_dt_{p}"
        if t not in names:
            continue
        cands = [f"d{s}_dt_{p}"] + ([f"dq_dt_{p}"] if s == "qv" else [])
        r = next((c for c in cands if c in names), None)
        if r:
            pairs.append((t, r))
        else:
            missing.append((t, " or ".join(cands)))

covered = {t for t, _ in pairs} | {t for t, _ in missing}
unmatched = sorted(v for v in names if "tag" in v and v not in covered)

out = nc.Dataset(dst, "w")
dims = set()
for t, r in pairs:
    dims.update(d[t].dimensions)
for dim in dims:
    D = d.dimensions[dim]
    out.createDimension(dim, None if D.isunlimited() else len(D))

# copy 1-D coordinate variables (e.g. time axes) living on those dims
for v in sorted(names):
    var = d[v]
    if len(var.dimensions) == 1 and var.dimensions[0] in dims:
        o = out.createVariable(v, var.dtype, var.dimensions,
                               fill_value=getattr(var, "_FillValue", None))
        o.setncatts({k: var.getncattr(k) for k in var.ncattrs() if k != "_FillValue"})
        o[:] = var[:]

print(f"{'difference':45s} {'max|tag-real|':>14s} {'max|real|':>12s}")
for t, r in pairs:
    if d[t].shape != d[r].shape:
        print(f"SKIP {t} vs {r}: shapes {d[t].shape} vs {d[r].shape}")
        continue
    a = d[t][:].astype("f8")
    b = d[r][:].astype("f8")
    diff = a - b
    name = f"{t}_minus_{r}"
    o = out.createVariable(name, "f8", d[t].dimensions, fill_value=9.96921e36)
    o.description = f"{t} minus {r}"
    o.units = getattr(d[t], "units", "")
    o[:] = diff
    print(f"{name:45s} {np.ma.abs(diff).max():14.4e} {np.ma.abs(b).max():12.4e}")

out.close()
d.close()

if missing:
    print("\nTag variables with no real partner in the file:")
    for t, r in missing:
        print(f"  {t}  (looked for {r})")
if unmatched:
    print("\nOther variables containing 'tag' (not paired):")
    for v in unmatched:
        print(f"  {v}")
print(f"\nWrote {dst}")
