import sys
import numpy as np
from netCDF4 import Dataset

path = sys.argv[1] if len(sys.argv) > 1 else "output.nc"

with Dataset(path) as ds:
    qv = ds.variables['qv'][:]
    dq_pbl = ds.variables['dq_dt_pbl'][:]

    print(f"qv shape: {qv.shape}")
    print(f"dq_pbl shape: {dq_pbl.shape}")
    print()
    print("dq_pbl max abs per time index, first 10 indices:")
    for t in range(min(10, dq_pbl.shape[0])):
        print(f"  t={t}: max_abs = {np.max(np.abs(dq_pbl[t])):.6e}")
