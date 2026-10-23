import numpy as np
from netCDF4 import Dataset

with Dataset("output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc") as ds:
    qv = ds.variables['qv'][:]
    qv_tag = ds.variables['qv_tag'][:]
    dq_dc = ds.variables['dq_dt_deepconv'][:]
    dq_sc = ds.variables['dq_dt_shalconv'][:]

    gap = np.max(np.abs(qv_tag - qv), axis=(1,2))
    dc_on = np.any(dq_dc != 0, axis=(1,2))
    sc_on = np.any(dq_sc != 0, axis=(1,2))

    changed = np.where(np.diff(gap) != 0)[0] + 1
    print(f"gap jumps at {len(changed)} timesteps (out of {len(gap)} total)")
    for t in changed[:15]:
        print(f"t={t}: gap {gap[t-1]:.3e} -> {gap[t]:.3e}  dc={dc_on[t]} sc={sc_on[t]}")
