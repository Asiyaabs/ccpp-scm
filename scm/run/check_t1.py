import sys
import numpy as np
from netCDF4 import Dataset

path = sys.argv[1] if len(sys.argv) > 1 else "output.nc"

with Dataset(path) as ds:
    qv = ds.variables['qv'][:]
    qv_tag = ds.variables['qv_tag'][:]
    dq_pbl = ds.variables['dq_dt_pbl'][:]
    dqvtag_pbl = ds.variables['dqvtag_dt_pbl'][:]

    t = 1
    print(f"=== t={t}: is qv==qv_tag going INTO this interval (i.e. at t=0)? ===")
    print(f"max|qv_tag(0)-qv(0)| = {np.max(np.abs(qv_tag[0]-qv[0])):.6e}")
    print()

    print(f"=== t={t}: per-level dq_pbl vs dqvtag_pbl ===")
    print(f"{'lev':>4} {'dq_pbl':>16} {'dqvtag_pbl':>16} {'diff':>16} {'ratio':>10}")
    for k in range(40):
        dq_val = dq_pbl[t, k, 0]
        dqt_val = dqvtag_pbl[t, k, 0]
        diff = dqt_val - dq_val
        ratio = dqt_val/dq_val if dq_val != 0 else float('nan')
        print(f"{k:4d} {dq_val:16.8e} {dqt_val:16.8e} {diff:16.8e} {ratio:10.4f}")
