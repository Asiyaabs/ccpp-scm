import numpy as np
from netCDF4 import Dataset

with Dataset("output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc") as ds:
    qv = ds.variables['qv'][:]
    qv_tag = ds.variables['qv_tag'][:]
    dq_dc = ds.variables['dq_dt_deepconv'][:]

    nt = qv.shape[0]
    diff = np.abs(qv_tag - qv)

    print(f"{'t':>6} {'k':>4} {'qv':>14} {'qv_tag':>14} {'abs diff':>12} {'rel diff':>10}")
    for t in [0, 1, 2, 3, 5, 10, 50, 100, 150, nt-1]:
        k = np.unravel_index(np.argmax(diff[t]), diff[t].shape)
        qv_val = qv[t][k]
        qvt_val = qv_tag[t][k]
        d = diff[t][k]
        rel = d/abs(qv_val) if qv_val != 0 else float('nan')
        print(f"{t:6d} {k[0]:4d} {qv_val:14.6e} {qvt_val:14.6e} {d:12.4e} {rel:10.4%}")

    peak_t = np.argmax(diff.max(axis=(1,2)))
    k = np.unravel_index(np.argmax(diff[peak_t]), diff[peak_t].shape)
    print()
    print(f"--- global peak at t={peak_t}, level={k[0]} ---")
    print(f"  qv     = {qv[peak_t][k]:.6e}")
    print(f"  qv_tag = {qv_tag[peak_t][k]:.6e}")
    print(f"  diff   = {diff[peak_t][k]:.6e}")
    print(f"  rel    = {diff[peak_t][k]/abs(qv[peak_t][k]):.4%}")
