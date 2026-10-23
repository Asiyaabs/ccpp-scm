import netCDF4 as nc, numpy as np

d=nc.Dataset('output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc')
for v in d.variables:
  if v.endswith('_tag') and v[:-4] in d.variables:
    t=np.ma.filled(np.squeeze(d[v][:]).astype(float), np.nan)
    r=np.ma.filled(np.squeeze(d[v[:-4]][:]).astype(float), np.nan)
    ok=np.isfinite(t)&np.isfinite(r)&(np.abs(r)<1e30)&(np.abs(t)<1e30)
    nt=int(np.any(ok,axis=tuple(range(1,ok.ndim))).sum())
    df=np.where(ok,np.abs(t-r),0.); m=ok&(r>1e-8)
    rel=np.where(m, df/np.where(m,r,1.), 0.)
    it=np.unravel_index(rel.argmax(), rel.shape)
    print('%-8s nvalid_t=%d max|d|=%.3e maxrel=%.3e at (t,k)=%s rel_end=%.3e' % (v, nt, df.max(), rel.max(), it, rel[nt-1].max() if nt>0 else 0))
