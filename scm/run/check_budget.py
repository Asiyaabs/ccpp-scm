#!/usr/bin/env python
"""Read-only budget check: state change between outputs vs averaged phys+nonphys.
Prints to screen only.  Usage: python check_budget.py <output.nc>
"""
import sys
import numpy as np
import netCDF4 as nc

d = nc.Dataset(sys.argv[1])
V = d.variables


def g(n):
    return np.squeeze(V[n][:]).astype("f8") if n in V else None


ti = g("time_inst")
td = g("time_diag")
print(f"time_inst: {len(ti)} points, time_diag: {len(td)} points")
print(f"first time_inst {ti[:3]}, first time_diag {td[:3]}")

print("\n== A) budget closure: (X(t+1)-X(t))/dt  vs  phys+nonphys ==")
for s in ["qv", "ql", "qi", "qr", "qs", "qg"]:
    for kind, x, pre in [("real", s, "dq" if s == "qv" else f"d{s}"),
                         ("tag", f"{s}_tag", f"d{s}tag")]:
        X, ph, nph = g(x), g(f"{pre}_dt_phys"), g(f"{pre}_dt_nonphys")
        if X is None or ph is None:
            continue
        if nph is None:
            nph = 0 * ph
        if X.shape[0] != ph.shape[0] + 1:
            print(f"{s:3s} {kind:4s} SKIP: state has {X.shape[0]} times, tendency {ph.shape[0]}")
            continue
        dXdt = (X[1:] - X[:-1]) / np.diff(ti)[:, None]
        res = dXdt - (ph + nph)
        print(f"{s:3s} {kind:4s} max|dX/dt|={np.abs(dXdt).max():.4e}  "
              f"max|phys+nonphys|={np.abs(ph + nph).max():.4e}  "
              f"max|residual|={np.abs(res).max():.4e}")

print("\n== B) real convtrans vs tag deepconv+shalconv ==")
for s in ["ql", "qi", "qs"]:
    rc = g(f"d{s}_dt_convtrans")
    td_ = g(f"d{s}tag_dt_deepconv")
    ts_ = g(f"d{s}tag_dt_shalconv")
    if rc is None or td_ is None or ts_ is None:
        print(f"{s}: missing one of convtrans/deepconv/shalconv")
        continue
    print(f"{s}: max|real convtrans|={np.abs(rc).max():.4e}  "
          f"max|tag deep|={np.abs(td_).max():.4e}  max|tag shal|={np.abs(ts_).max():.4e}  "
          f"max|convtrans-(deep+shal)|={np.abs(rc - td_ - ts_).max():.4e}")
