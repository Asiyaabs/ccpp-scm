import numpy as np
import matplotlib
matplotlib.use('Agg')  # headless, no display on Derecho
import matplotlib.pyplot as plt
from netCDF4 import Dataset

from netCDF4 import Dataset
import numpy as np

from netCDF4 import Dataset

with Dataset("output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc") as ds:
    pres = ds.variables['pres'][0, :, 0]  # Pa, t=0

    print(f"{'level':>6} {'pressure (hPa)':>16}")
    for k, p in enumerate(pres):
        print(f"{k:6d} {p/100:16.2f}")    
with Dataset("output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc") as ds:
    qv = ds.variables['qv'][:]
    qv_tag = ds.variables['qv_tag'][:]

nt = qv.shape[0]
print(qv.shape)
t_axis = np.arange(nt)
gap = np.max(np.abs(qv_tag - qv), axis=(1,2))

# pick level 0 (near-surface) since that's where most of our sampled points landed
lev = 92
qv_lev = qv[:, lev, 0]
qvtag_lev = qv_tag[:, lev, 0]

fig, axes = plt.subplots(2, 1, figsize=(12, 8), sharex=True)

axes[0].plot(t_axis, qv_lev, label='qv', linewidth=1)
axes[0].plot(t_axis, qvtag_lev, label='qv_tag', linewidth=1, linestyle='--')
axes[0].set_ylabel('specific humidity (kg/kg)')
axes[0].set_title(f'qv vs qv_tag at level {lev} (PBL-only run: MP + convection removed)')
axes[0].legend()

axes[1].plot(t_axis, gap, color='red', linewidth=1)
axes[1].set_ylabel('max|qv_tag - qv| (whole column)')
axes[1].set_xlabel('timestep')
axes[1].set_title('Gap magnitude over time')

plt.tight_layout()
plt.savefig(f'qv_qvtag_pbl_only.{lev}.png', dpi=150)
print("saved qv_qvtag_pbl_only.png")
plt.show()
