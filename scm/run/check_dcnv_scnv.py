import numpy as np
from netCDF4 import Dataset

with Dataset("output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc") as ds:
    qv = ds.variables['qv'][:]
    qv_tag = ds.variables['qv_tag'][:]

    nt = qv.shape[0]
    diff = np.abs(qv_tag - qv)
    gap = diff.max(axis=(1,2))

    print(f"max|qv_tag(0)-qv(0)| = {gap[0]:.6e}")
    print(f"max|qv_tag(1)-qv(1)| = {gap[1]:.6e}")
    print()

    print(f"{'t':>6} {'k':>4} {'qv':>14} {'qv_tag':>14} {'abs diff':>12} {'rel diff':>10}")
    for t in [0, 1, 2, 3, 5, 10, 50, 100, 500, 1000, 2000, nt-1]:
        k = np.unravel_index(np.argmax(diff[t]), diff[t].shape)
        qv_val = qv[t][k]
        qvt_val = qv_tag[t][k]
        d = diff[t][k]
        rel = d/abs(qv_val) if qv_val != 0 else float('nan')
        print(f"{t:6d} {k[0]:4d} {qv_val:14.6e} {qvt_val:14.6e} {d:12.4e} {rel:10.4%}")

    print()
    mask = (diff/np.where(qv!=0,np.abs(qv),np.nan)) > 0.05
    print(f"points with >5% relative error: {np.sum(mask)} out of {diff.size}")
    if np.sum(mask) > 0:
        print(f"  qv magnitude at those points: min={qv[mask].min():.2e}, max={qv[mask].max():.2e}")
