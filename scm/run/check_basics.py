"""
Verifies the fundamentals before theorizing about source code:
1. Does qv_tag(t=0) actually equal qv(t=0) exactly, as init_mode=2 should guarantee?
2. Side-by-side per-level values of qv, qv_tag, dq_dt_pbl, dqvtag_dt_pbl at t=0,
   so we can see WHERE and HOW they differ (specific levels? scale factor? sign flip?
   shifted by one level? only near-zero values affected?) instead of guessing.

Usage:
  /glade/work/asiyab/conda-envs/py/bin/python check_basics.py <path_to_output.nc>
"""
import sys
import numpy as np
from netCDF4 import Dataset

path = sys.argv[1] if len(sys.argv) > 1 else "output.nc"

with Dataset(path) as ds:
    qv = ds.variables['qv'][:]           # (595, 127, 1)
    qv_tag = ds.variables['qv_tag'][:]   # (595, 127, 1)
    dq_pbl = ds.variables['dq_dt_pbl'][:]        # (594, 127, 1)
    dqvtag_pbl = ds.variables['dqvtag_dt_pbl'][:]

    print("=== STEP 1: Is qv_tag(t=0) == qv(t=0) exactly? ===")
    diff0 = qv_tag[0] - qv[0]
    print(f"max|qv_tag(0) - qv(0)| = {np.max(np.abs(diff0)):.6e}")
    print(f"qv(0) range: [{np.min(qv[0]):.6e}, {np.max(qv[0]):.6e}]")
    print(f"qv_tag(0) range: [{np.min(qv_tag[0]):.6e}, {np.max(qv_tag[0]):.6e}]")
    n_exact = np.sum(diff0 == 0.0)
    n_total = diff0.size
    print(f"Exactly equal at {n_exact}/{n_total} levels")
    print()

    print("=== STEP 2: Per-level values at t=0 (state) driving the PBL tendency ===")
    print(f"{'lev':>4} {'qv(0)':>14} {'qv_tag(0)':>14} {'dq_pbl(0)':>14} {'dqvtag_pbl(0)':>14} {'ratio_q':>10} {'ratio_tend':>10}")
    for k in range(qv.shape[1]):
        q_val = qv[0, k, 0]
        qt_val = qv_tag[0, k, 0]
        dq_val = dq_pbl[0, k, 0]
        dqt_val = dqvtag_pbl[0, k, 0]
        ratio_q = qt_val/q_val if q_val != 0 else float('nan')
        ratio_t = dqt_val/dq_val if dq_val != 0 else float('nan')
        if abs(dq_val) > 1e-9 or abs(dqt_val) > 1e-9:
            print(f"{k:4d} {q_val:14.6e} {qt_val:14.6e} {dq_val:14.6e} {dqt_val:14.6e} {ratio_q:10.4f} {ratio_t:10.4f}")
