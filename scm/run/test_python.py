
import numpy as np, netCDF4 as nc
f = nc.Dataset("output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc")
for r, t in [("qv","qv_tag"), ("ql","ql_tag")]:
    a, b = f[r][:].squeeze(), f[t][:].squeeze()
    d = np.abs(a - b)
    print(r, "shape", d.shape, "overall max", d.max())
    for lev in (0, 10, 50, 75):
        print("  lev", lev, "max|diff|", d[:, lev].max(), "max real", a[:, lev].max())
    first = np.argmax(d.max(axis=1) > 1e-12)
    print("  first time index with diff>1e-12:", first)

