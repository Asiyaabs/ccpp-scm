import numpy as np
from netCDF4 import Dataset

with Dataset("/glade/work/asiyab/SWI_NCAR/UFS_versions_dev/ccpp-scm_dev/scm/run/output_twpice_SCM_GFS_v17_p8_ugwpv1_pbl_convec/output.nc") as ds:
    qv = ds.variables['qv'][:]
    qv_tag = ds.variables['qv_tag'][:]
    pres = ds.variables['pres'][:]

    diff = np.abs(qv_tag - qv)
    rel = diff / np.where(qv != 0, np.abs(qv), np.nan)

    # location of the single worst relative error anywhere in the run
    idx = np.unravel_index(np.nanargmax(rel), rel.shape)
    t, k, i = idx
    print(f"worst relative error at t={t}, level={k} ({pres[t,k,0]/100:.1f} hPa)")
    print(f"  qv     = {qv[idx]:.6e}")
    print(f"  qv_tag = {qv_tag[idx]:.6e}")
    print(f"  abs diff = {diff[idx]:.6e}")
    print(f"  rel diff = {rel[idx]:.4%}")

    # how many points actually exceed, say, 5% relative error, and what's their qv magnitude
    mask = rel > 0.05
    print()
    print(f"points with >5% relative error: {np.sum(mask)} out of {rel.size}")
    if np.sum(mask) > 0:
        print(f"  qv magnitude at those points: min={qv[mask].min():.2e}, max={qv[mask].max():.2e}, median={np.median(qv[mask]):.2e}")
