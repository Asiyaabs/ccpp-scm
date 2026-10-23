import sys
import numpy as np
from netCDF4 import Dataset

path = sys.argv[1] if len(sys.argv) > 1 else "output.nc"

#with Dataset(path) as ds:

with Dataset("output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc") as ds:
    dq_sc = ds.variables['dq_dt_shalconv'][:]
    print("dq_dt_shalconv nonzero count at t=1:", np.count_nonzero(dq_sc[1]))
    exit()
    qv = ds.variables['qv'][:]
    qv_tag = ds.variables['qv_tag'][:]
    dq_dc = ds.variables['dq_dt_deepconv'][:]
    dqvtag_dc = ds.variables['dqvtag_dt_deepconv'][:]
    dq_micro = ds.variables['dq_dt_micro'][:]

    print(f"max|qv_tag(0)-qv(0)| = {np.max(np.abs(qv_tag[0]-qv[0])):.6e}")
    print(f"max|qv_tag(1)-qv(1)| = {np.max(np.abs(qv_tag[1]-qv[1])):.6e}")
    print()

    print(f"max|dq_dt_micro| at t=1: {np.max(np.abs(dq_micro[1])):.6e}")
    print(f"nonzero count of dq_dt_micro at t=1: {np.count_nonzero(dq_micro[1])}")
    print()

    # find first timestep (excluding t=0 placeholder) where deep conv actually fired
    nt = dq_dc.shape[0]
    t = None
    for tt in range(1, nt):
        if np.any(dq_dc[tt] != 0):
            t = tt
            break

    if t is None:
        print("deep convection never fired in this run")
    else:
        print(f"deep convection first active at t={t}")
