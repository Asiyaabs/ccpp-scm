import numpy as np
from netCDF4 import Dataset

pairs = [('qv','qv_tag'), ('ql','ql_tag'), ('qi','qi_tag'),
         ('qr','qr_tag'), ('qs','qs_tag'), ('qg','qg_tag')]

levs = [0, 50, 75, 90, 95, 100, 120, 126]

with Dataset("output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc") as ds:
    for lev in levs:
        print(f"\n{'='*70}")
        print(f"LEVEL {lev}")
        print(f"{'='*70}")
        for real_name, tag_name in pairs:
            r = ds.variables[real_name][:, lev, 0]
            t = ds.variables[tag_name][:, lev, 0]
            diff = t - r
            print(f"\n  {real_name:6s}  t=0: {r[0]:.6e}   t=-1: {r[-1]:.6e}")
            print(f"  {tag_name:6s}  t=0: {t[0]:.6e}   t=-1: {t[-1]:.6e}")
            print(f"  diff     t=0: {diff[0]:.6e}   t=-1: {diff[-1]:.6e}   max|diff|: {np.abs(diff).max():.6e}")
