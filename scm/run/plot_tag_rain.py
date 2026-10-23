#!/usr/bin/env python
"""Tagged rain vs real rain: TWP-ICE (ocean) vs ARM SGP summer 1997 X (land).
Both runs: qv_tag_init_mode = 0, large-scale forcing on.

Uses column-integrated rain in the air (qr, qr_tag), since tagged surface precipitation
is not in the output.  Prints a summary to screen; saves the figure to ./tag_rain_figs/
Usage:  python plot_tag_rain.py
"""
import os
import numpy as np
import netCDF4 as nc
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

RUN = "/glade/work/asiyab/SWI_NCAR/UFS_versions_dev/ccpp-scm_dev/scm/run"
CASES = {
    "TWP-ICE (ocean)": dict(
        path=f"{RUN}/output_twpice_SCM_GFS_v17_p8_ugwpv1_qv0_forcing_on/output.nc",
        color="tab:blue", rainy=(0.0, 6.0)),
    "ARM SGP (land, prescribed fluxes)": dict(
        path=f"{RUN}/output_arm_sgp_summer_1997_X_SCM_GFS_v17_p8_ugwpv1_qv0_forcing_on/output.nc",
        color="tab:orange", rainy=None),
}
LATER_START_DAYS = 7.0     # "later period" starts here
RAIN_THR = 1e-3            # mm; column rain below this is treated as no rain
OUT = "tag_rain_figs"
G = 9.80665


def arr(d, n):
    return np.squeeze(np.ma.filled(d[n][:].astype("f8"), np.nan))


def load(name, cfg):
    d = nc.Dataset(cfg["path"])
    c = dict(name=name, **cfg)
    c["days"] = arr(d, "time_inst") / 86400.0
    pi = arr(d, "pres_i")
    dp = np.abs(np.diff(pi, axis=1))
    col = lambda x: np.nansum(x * dp, axis=1) / G      # kg m-2 = mm
    c["R"], c["R_tag"] = col(arr(d, "qr")), col(arr(d, "qr_tag"))
    c["Wv"], c["Wv_tag"] = col(arr(d, "qv")), col(arr(d, "qv_tag"))
    if "tprcp_rate_inst" in d.variables:
        p = arr(d, "tprcp_rate_inst") * 1000.0 * 86400.0   # m s-1 -> mm day-1
        c["P"] = p if p.shape[0] == c["days"].size else None
    else:
        c["P"] = None
    d.close()
    rain = c["R"] > RAIN_THR
    c["frac"] = np.where(rain, c["R_tag"] / np.where(rain, c["R"], 1.0), np.nan)
    c["vfrac"] = c["Wv_tag"] / c["Wv"]
    return c


def shade(a, c, label=None):
    if c.get("rainy"):
        a.axvspan(*c["rainy"], color="grey", alpha=0.15, lw=0, label=label)


cases = [load(n, cfg) for n, cfg in CASES.items()]
os.makedirs(OUT, exist_ok=True)

fig, ax = plt.subplots(2, 2, figsize=(13, 7), sharex="col")
for j, c in enumerate(cases):
    # top: real and tagged rain in the column, surface precipitation on a second axis
    a = ax[0, j]
    shade(a, c, "rainy phase")
    a.plot(c["days"], c["R"], color="tab:purple", lw=1, label="rain (real)")
    a.plot(c["days"], c["R_tag"], color="tab:green", lw=1, label="rain (tagged)")
    a.set_ylabel("column rain (mm)")
    a.set_title(c["name"])
    a.grid(alpha=.3)
    if c["P"] is not None:
        b = a.twinx()
        b.plot(c["days"], c["P"], color="grey", lw=0.6, alpha=0.6, label="surface precip")
        b.set_ylabel("surface precip (mm day$^{-1}$)", color="grey")
        h1, l1 = a.get_legend_handles_labels()
        h2, l2 = b.get_legend_handles_labels()
        a.legend(h1 + h2, l1 + l2, fontsize=8, loc="upper right")
    else:
        a.legend(fontsize=8, loc="upper right")

    # bottom: tagged fraction of rain vs column vapor tagged fraction
    a = ax[1, j]
    shade(a, c)
    a.plot(c["days"], c["vfrac"], color="black", lw=1, label="column vapor tagged fraction")
    a.plot(c["days"], c["frac"], ".", ms=3, color=c["color"], label="rain tagged fraction")
    a.set_ylim(0, 1)
    a.set_ylabel("tagged / real")
    a.set_xlabel("Elapsed days")
    a.grid(alpha=.3)
    a.legend(fontsize=8, loc="upper left")
fig.tight_layout()
fig.savefig(f"{OUT}/fig7_tagged_rain.png", dpi=150)
plt.close(fig)

# ---- summary ---------------------------------------------------------------
print(f"\n== Rain tagged fraction (rain-weighted: sum of tagged rain / sum of rain)")
print(f"{'case':34s} {'period':16s} {'rain frac':>10s} {'vapor frac':>11s} {'hours w/ rain':>14s}")
for c in cases:
    periods = []
    if c.get("rainy"):
        periods.append((f"days {c['rainy'][0]:g}-{c['rainy'][1]:g}",
                        (c["days"] >= c["rainy"][0]) & (c["days"] < c["rainy"][1])))
    periods.append((f"days {LATER_START_DAYS:g}-end", c["days"] >= LATER_START_DAYS))
    periods.append(("whole run", np.ones_like(c["days"], dtype=bool)))
    for lab, m in periods:
        mr = m & (c["R"] > RAIN_THR)
        rf = np.nansum(c["R_tag"][mr]) / np.nansum(c["R"][mr]) if mr.any() else np.nan
        vf = np.nanmean(c["vfrac"][m])
        print(f"{c['name']:34s} {lab:16s} {rf:10.3f} {vf:11.3f} {int(mr.sum()):14d}")
print(f"\nFigure saved: ./{OUT}/fig7_tagged_rain.png")
