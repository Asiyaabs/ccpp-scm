import numpy as np
from netCDF4 import Dataset
with Dataset("output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc") as ds:
    ql = ds.variables['ql'][:]
    qi = ds.variables['qi'][:]
    qc = ds.variables['qc'][:]
    print("max|qc - (ql+qi)|:", np.max(np.abs(qc - (ql+qi))))
