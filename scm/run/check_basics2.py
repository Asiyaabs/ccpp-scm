import sys
import numpy as np
from netCDF4 import Dataset

path = sys.argv[1] if len(sys.argv) > 1 else "output.nc"

with Dataset(path) as ds:
    qv = ds.variables['qv'][:]
    qv_tag = ds.variables['qv_tag'][:]
    dq_pbl = ds.variables['dq_dt_pbl'][:]
    dqvtag_pbl = ds.variables['dqvtag_dt_pbl'][:]

    print("=== STEP 1 ===")
    diff0 = qv_tag[0] - qv[0]
    print(f"max|qv_tag(0)-qv(0)| = {np.max(np.abs(diff0)):.6e}")
    print()

    print("=== STEP 2: NO FILTER, first 15 levels ===")
    print(f"{'lev':>4} {'dq_pbl(0)':>16} {'dqvtag_pbl(0)':>16} {'diff':>16} {'ratio_tend':>10}")
    for k in range(15):
        dq_val = dq_pbl[0, k, 0]
        dqt_val = dqvtag_pbl[0, k, 0]
        diff = dqt_val - dq_val
        ratio_t = dqt_val/dq_val if dq_val != 0 else float('nan')
        print(f"{k:4d} {dq_val:16.8e} {dqt_val:16.8e} {diff:16.8e} {ratio_t:10.4f}")

    print()
    print("=== Overall max/min of tendency arrays at t=0 ===")
    print(f"dq_pbl(0) max abs: {np.max(np.abs(dq_pbl[0])):.6e}")
    print(f"dqvtag_pbl(0) max abs: {np.max(np.abs(dqvtag_pbl[0])):.6e}")
