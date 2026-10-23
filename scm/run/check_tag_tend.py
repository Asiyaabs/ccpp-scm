#!/usr/bin/env python
"""Read-only diagnosis of tag tendency mismatches. Prints to screen only.
Usage: python check_tag_tend.py <output.nc>
"""
import sys
import numpy as np
import netCDF4 as nc

d = nc.Dataset(sys.argv[1])
V = d.variables


def g(n):
    return np.squeeze(V[n][:]).astype("f8") if n in V else None


procs = ["pbl", "deepconv", "shalconv", "micro", "convtrans"]

print("== 1) phys tendency vs sum of individual processes ==")
for s in ["qv", "ql", "qi", "qr", "qs", "qg"]:
    for kind, pre in [("real", "dq" if s == "qv" else f"d{s}"), ("tag", f"d{s}tag")]:
        ph = g(f"{pre}_dt_phys")
        if ph is None:
            continue
        parts = [p for p in procs if f"{pre}_dt_{p}" in V]
        tot = sum(g(f"{pre}_dt_{p}") for p in parts) if parts else 0 * ph
        print(f"{s:3s} {kind:4s} max|phys|={np.abs(ph).max():.4e}  "
              f"max|sum|={np.abs(tot).max():.4e}  "
              f"max|phys-sum|={np.abs(ph - tot).max():.4e}  parts={parts}")

print("\n== 2) where is dqrtag_dt_pbl nonzero? ==")
a = g("dqrtag_dt_pbl")
nz = np.abs(a) > 0
print(f"shape={a.shape} nonzero points={nz.sum()}  min={a.min():.4e} max={a.max():.4e}")
if nz.any():
    it, ik = np.argwhere(nz).T
    print(f"time index range {it.min()}-{it.max()}, level index range {ik.min()}-{ik.max()}")
    i = np.unravel_index(np.abs(a).argmax(), a.shape)
    print(f"largest |value| at (time, level) index {i}")

print("\n== 3) does dqrtag_dt_pbl equal (+/-) any other variable? ==")
ref = np.abs(a).max()
hits = []
for n in V:
    if n == "dqrtag_dt_pbl" or V[n].shape != V["dqrtag_dt_pbl"].shape:
        continue
    b = g(n)
    for sgn in (1, -1):
        hits.append((np.abs(a - sgn * b).max() / ref if ref > 0 else np.inf, n, sgn))
for r, n, sgn in sorted(hits)[:6]:
    print(f"  {'+' if sgn > 0 else '-'}{n:35s} max|diff|/max|qrtag_pbl| = {r:.3e}")

print("\n== 4) qv phys mismatch ==")
dp = g("dqvtag_dt_phys") - g("dq_dt_phys")
i = np.unravel_index(np.abs(dp).argmax(), dp.shape)
print(f"max|diff|={np.abs(dp).max():.4e} at (time, level) {i}; "
      f"real there={g('dq_dt_phys')[i]:.4e}, tag there={g('dqvtag_dt_phys')[i]:.4e}")
