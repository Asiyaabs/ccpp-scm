import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from netCDF4 import Dataset

pairs = [('qv','qv_tag'), ('ql','ql_tag'), ('qi','qi_tag'),
         ('qr','qr_tag'), ('qs','qs_tag'), ('qg','qg_tag')]

with Dataset("output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc") as ds:
    data = {}
    for real_name, tag_name in pairs:
        data[real_name] = ds.variables[real_name][:]
        data[tag_name]  = ds.variables[tag_name][:]

nt = data['qv'].shape[0]
t_axis = np.arange(nt)

levs = [0, 50, 75, 90, 95, 100, 120, 126]

for lev in levs:
    fig, axes = plt.subplots(6, 2, figsize=(16, 20), sharex=True)

    for idx, (real_name, tag_name) in enumerate(pairs):
        r = data[real_name][:, lev, 0]
        t = data[tag_name][:, lev, 0]
        gap = np.abs(t - r)

        axes[idx, 0].plot(t_axis, r, 'b-', linewidth=1, label=real_name)
        axes[idx, 0].plot(t_axis, t, 'r--', linewidth=1, label=tag_name)
        axes[idx, 0].set_ylabel('kg/kg')
        axes[idx, 0].set_title(f'{real_name} vs {tag_name} — level {lev}')
        axes[idx, 0].legend(fontsize=8)

        axes[idx, 1].plot(t_axis, gap, 'r-', linewidth=1)
        axes[idx, 1].set_ylabel('|tag - real|')
        axes[idx, 1].set_title(f'{tag_name} gap — level {lev}')

    axes[5, 0].set_xlabel('timestep')
    axes[5, 1].set_xlabel('timestep')

    plt.tight_layout()
    plt.savefig(f'all_species_vs_tags_pbl_dcnv_scnv_MP_forcing.qv0.{lev}.png', dpi=150)
    plt.close()
    print(f"saved all_species_vs_tags_pbl_dcnv_scnv_MP_forcing_qv0.{lev}.png")
