import numpy as np
from netCDF4 import Dataset

with Dataset("output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc") as ds:
    qv = ds.variables['qv'][:]
    qv_tag = ds.variables['qv_tag'][:]
    nt = qv.shape[0]
    print("last valid timestep in file:", nt-1)
    print("min qv in file:", np.nanmin(qv))
    print("max qv_tag in file:", np.nanmax(qv_tag))
    print("any NaN in qv:", np.any(np.isnan(qv)))
    print("any NaN in qv_tag:", np.any(np.isnan(qv_tag)))
    # location of qv's minimum
    idx = np.unravel_index(np.nanargmin(qv), qv.shape)
    print("qv min location (t,k,i):", idx, "value:", qv[idx])
