#!/usr/bin/env python
"""Tagged-water science comparison, v2: TWP-ICE (ocean) vs ARM SGP summer 1997 X (land).
Both runs: qv_tag_init_mode = 0, large-scale forcing on.

Changes from v1:
  - TWP-ICE rainy phase (days 0-6) marked on Figs 1-3
  - averages, profiles, diurnal composite and summary use days 7 to end (AVG_START_DAYS)
  - new Fig 6: column tagged fraction of ice and snow over time, with real ice/snow path
  - ARM SGP labelled as having prescribed surface fluxes
  - must-check also reports near-zero points (known stratosphere/model-top issue)

Prints checks and a summary table to screen; saves PNG figures to ./tag_science_figs_v2/
Usage:  python plot_tag_science_v2.py
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
        start_hour_utc=3.0, utc_off=9.5, color="tab:blue", rainy=(0.0, 6.0)),
    "ARM SGP (land, prescribed fluxes)": dict(
        path=f"{RUN}/output_arm_sgp_summer_1997_X_SCM_GFS_v17_p8_ugwpv1_qv0_forcing_on/output.nc",
        start_hour_utc=23.0, utc_off=-5.0, color="tab:orange", rainy=None),
}
AVG_START_DAYS = 7.0       # averages from here to the end (after TWP-ICE rainy phase / spin-up)
OUT = "tag_science_figs_v2"
G, LV = 9.80665, 2.5e6
SPECIES = ["qv", "ql", "qi", "qr", "qs", "qg"]
THR = 1e-7                 # cutoff used for plotted ratios
THR_TINY = 1e-15           # cutoff for the near-zero report in the must-check
PATH_THR = 1e-3            # mm; column paths below this are not used for ratios

P_CANDS = ["pres", "pressure", "p"]
PI_CANDS = ["pres_i", "pressure_i", "p_i"]
LH_CANDS = ["lhf", "lh", "latent_heat_flux", "hflx_q", "dqsfc"]
PR_CANDS = ["tprcp_rate_inst", "tprcp_rate_accum", "precip_rate", "prcp_rate",
            "tprcp_inst", "tprcp_accum", "precip", "rain"]


def arr(d, n):
    return np.squeeze(np.ma.filled(d[n][:].astype("f8"), np.nan))


def find(d, cands, label):
    for c in cands:
        if c in d.variables:
            print(f"  {label:14s}: using '{c}' [{getattr(d[c], 'units', '?')}]")
            return c
    keys = {c[:3] for c in cands}
    hint = [v for v in d.variables if any(k in v.lower() for k in keys)]
    print(f"  {label:14s}: NOT FOUND (tried {cands}); similar names: {hint[:10]}")
    return None


def to_mm_day(x, units):
    u = (units or "").replace(" ", "").lower()
    if u.startswith("w"):
        return x / LV * 86400.0
    if u in ("kgm-2s-1", "kg/m2/s", "mms-1", "mm/s"):
        return x * 86400.0
    if u in ("ms-1", "m/s"):
        return x * 1000.0 * 86400.0
    print(f"    (units '{units}' not converted; plotted as is)")
    return x


def load(name, cfg):
    print(f"\n== {name}\n  file: {cfg['path']}")
    d = nc.Dataset(cfg["path"])
    c = dict(name=name, **cfg)
    c["ti"] = arr(d, "time_inst")
    c["q"] = {s: arr(d, s) for s in SPECIES if s in d.variables}
    c["t"] = {s: arr(d, s + "_tag") for s in SPECIES if s + "_tag" in d.variables}
    td = arr(d, "time_diag") if "time_diag" in d.variables else None

    pn, pin = find(d, P_CANDS, "pressure"), find(d, PI_CANDS, "pressure_int")
    p = arr(d, pn)
    if p.ndim == 1:
        p = np.broadcast_to(p, c["q"]["qv"].shape)
    if pin is not None:
        pi = arr(d, pin)
        if pi.ndim == 1:
            pi = np.broadcast_to(pi, (p.shape[0], pi.size))
        dp = np.abs(np.diff(pi, axis=1))
    else:
        dp = np.abs(np.gradient(p, axis=1))
    if dp.shape != c["q"]["qv"].shape:
        raise SystemExit(f"  dp shape {dp.shape} != qv shape {c['q']['qv'].shape}")
    c["p"], c["dp"] = p, dp

    for key, cands, lab in [("E", LH_CANDS, "latent heat"), ("P", PR_CANDS, "precip")]:
        n = find(d, cands, lab)
        if n is None:
            c[key] = None
            continue
        x = to_mm_day(arr(d, n), getattr(d[n], "units", ""))
        tt = c["ti"] if x.shape[0] == c["ti"].size else td
        c[key] = (tt, x)
    d.close()
    return c


def colint(c, x):
    return np.nansum(x * c["dp"], axis=1) / G          # kg m-2 = mm


def ratio(tag, real, thr):
    return np.where(real > thr, tag / np.where(real > thr, real, 1.0), np.nan)


def days(t):
    return t / 86400.0


def must_check(c):
    print(f"\n-- tag/real checks: {c['name']}  (ratios where real > {THR:g})")
    print(f"{'species':8s} {'max tag(t=0)':>13s} {'min tag':>11s} {'min tag/real':>13s} "
          f"{'max tag/real':>13s} {'pts >1':>8s} | {'near-zero pts >1 or <0':>22s}")
    for s in SPECIES:
        if s not in c["t"] or s not in c["q"]:
            continue
        tg, rl = c["t"][s], c["q"][s]
        r = ratio(tg, rl, THR)
        rt = ratio(tg, rl, THR_TINY)
        n_over = int(np.nansum(r > 1.0 + 1e-6))
        n_tiny = int(np.nansum((rt > 1.0 + 1e-6) | (rt < -1e-6))) - n_over
        print(f"{s:8s} {np.nanmax(np.abs(tg[0])):13.3e} {np.nanmin(tg):11.3e} "
              f"{np.nanmin(r):13.4f} {np.nanmax(r):13.4f} {n_over:8d} | {n_tiny:22d}")
    print("  (near-zero points: known stratosphere/model-top issue, see README_open_tag_issues.md)")


def mark_rainy(a, c, label=None, image=False):
    if not c.get("rainy"):
        return
    t0, t1 = c["rainy"]
    if image:
        a.axvline(t1, color="white", ls="--", lw=1.2)
        a.text(0.5 * (t0 + t1), 0.03, "rainy phase", color="white", fontsize=9,
               ha="center", va="bottom", transform=a.get_xaxis_transform())
    else:
        a.axvspan(t0, t1, color="grey", alpha=0.15, lw=0, label=label)


cases = [load(n, cfg) for n, cfg in CASES.items()]
os.makedirs(OUT, exist_ok=True)
for c in cases:
    must_check(c)
    c["Wv"], c["Wv_tag"] = colint(c, c["q"]["qv"]), colint(c, c["t"]["qv"])
    c["Wall"] = sum(colint(c, c["q"][s]) for s in SPECIES if s in c["q"])
    c["Wall_tag"] = sum(colint(c, c["t"][s]) for s in SPECIES if s in c["t"])
    c["avg"] = days(c["ti"]) >= AVG_START_DAYS

# ---- Fig 1: evaporation and precipitation ---------------------------------
fig, ax = plt.subplots(1, 2, figsize=(13, 4), sharey=True)
for a, c in zip(ax, cases):
    mark_rainy(a, c, label="rainy phase")
    for key, lab, col in [("E", "Evaporation", "tab:green"), ("P", "Precipitation", "tab:purple")]:
        if c[key] is not None:
            a.plot(days(c[key][0]), c[key][1], color=col, lw=1, label=lab)
    a.set_title(c["name"]); a.set_xlabel("Elapsed days"); a.legend(); a.grid(alpha=.3)
ax[0].set_ylabel("mm day$^{-1}$")
fig.tight_layout(); fig.savefig(f"{OUT}/fig1_evap_precip.png", dpi=150); plt.close(fig)

# ---- Fig 2: column tagged fraction ----------------------------------------
fig, ax = plt.subplots(1, 2, figsize=(13, 4))
for a in ax:
    for c in cases:
        mark_rainy(a, c, label="TWP-ICE rainy phase")
for c in cases:
    ax[0].plot(days(c["ti"]), c["Wv_tag"] / c["Wv"], color=c["color"], label=c["name"])
    ax[0].plot(days(c["ti"]), c["Wall_tag"] / c["Wall"], color=c["color"], ls="--", lw=1)
    ax[1].plot(days(c["ti"]), c["Wv_tag"], color=c["color"], label=c["name"])
ax[0].set_title("Column tagged fraction (solid: vapor, dashed: total water)")
ax[0].set_ylabel("tagged / real"); ax[0].set_ylim(0, None)
ax[1].set_title("Tagged water vapor path"); ax[1].set_ylabel("mm")
for a in ax:
    a.set_xlabel("Elapsed days"); a.grid(alpha=.3); a.legend(fontsize=8)
fig.tight_layout(); fig.savefig(f"{OUT}/fig2_column_tag_fraction.png", dpi=150); plt.close(fig)

# ---- Fig 3: time-height qv_tag/qv -----------------------------------------
fig, ax = plt.subplots(1, 2, figsize=(13, 4.5), sharey=True)
for a, c in zip(ax, cases):
    r = ratio(c["t"]["qv"], c["q"]["qv"], THR)
    pm = np.nanmean(c["p"], axis=0) / 100.0
    im = a.pcolormesh(days(c["ti"]), pm, r.T, vmin=0, vmax=1, cmap="viridis", shading="auto")
    mark_rainy(a, c, image=True)
    a.set_title(f"{c['name']}: qv_tag / qv"); a.set_xlabel("Elapsed days")
ax[0].set_ylim(1000, 100); ax[0].set_ylabel("Pressure (hPa)")
fig.colorbar(im, ax=ax, label="tagged fraction")
fig.savefig(f"{OUT}/fig3_time_height_qv_frac.png", dpi=150, bbox_inches="tight"); plt.close(fig)

# ---- Fig 4: mean profiles from AVG_START_DAYS -----------------------------
fig, ax = plt.subplots(1, 2, figsize=(11, 5), sharey=True)
styles = {"ql": "-", "qi": "--", "qs": ":"}
for c in cases:
    m = c["avg"]
    pm = np.nanmean(c["p"][m], axis=0) / 100.0
    rv = np.nanmean(c["t"]["qv"][m], 0) / np.nanmean(c["q"]["qv"][m], 0)
    ax[0].plot(rv, pm, color=c["color"], label=c["name"])
    for s, ls in styles.items():
        if s in c["t"]:
            mr = np.nanmean(c["q"][s][m], 0)
            rr = np.where(mr > 1e-8, np.nanmean(c["t"][s][m], 0) / np.where(mr > 1e-8, mr, 1), np.nan)
            ax[1].plot(rr, pm, color=c["color"], ls=ls, label=f"{c['name'].split(' (')[0]} {s}")
ax[0].set_title(f"qv_tag / qv, mean from day {AVG_START_DAYS:g}")
ax[1].set_title(f"Condensate tagged fraction, from day {AVG_START_DAYS:g}")
for a in ax:
    a.set_xlim(0, 1); a.set_xlabel("tagged / real"); a.grid(alpha=.3); a.legend(fontsize=8)
ax[0].set_ylim(1000, 100); ax[0].set_ylabel("Pressure (hPa)")
fig.tight_layout(); fig.savefig(f"{OUT}/fig4_mean_profiles.png", dpi=150); plt.close(fig)

# ---- Fig 5: diurnal composite (local time) from AVG_START_DAYS ------------
fig, ax = plt.subplots(1, 2, figsize=(11, 4))
for c in cases:
    if c["E"] is not None:
        tE, E = c["E"]
        hE = (c["start_hour_utc"] + c["utc_off"] + tE / 3600.0) % 24
        keep = days(tE) >= AVG_START_DAYS
        hb = np.floor(hE[keep]).astype(int)
        ax[0].plot(range(24), [np.nanmean(E[keep][hb == h]) for h in range(24)],
                   color=c["color"], marker="o", ms=3, label=c["name"])
    dW = np.diff(c["Wv_tag"]) / np.diff(c["ti"]) * 86400.0
    tm = 0.5 * (c["ti"][1:] + c["ti"][:-1])
    hW = np.floor((c["start_hour_utc"] + c["utc_off"] + tm / 3600.0) % 24).astype(int)
    keep = days(tm) >= AVG_START_DAYS
    ax[1].plot(range(24), [np.nanmean(dW[keep][hW[keep] == h]) for h in range(24)],
               color=c["color"], marker="o", ms=3, label=c["name"])
ax[0].set_title(f"Evaporation by local hour (from day {AVG_START_DAYS:g})"); ax[0].set_ylabel("mm day$^{-1}$")
ax[1].set_title("Change of tagged vapor path by local hour"); ax[1].set_ylabel("mm day$^{-1}$")
for a in ax:
    a.set_xlabel("Local hour"); a.set_xticks(range(0, 24, 3)); a.grid(alpha=.3); a.legend(fontsize=8)
fig.tight_layout(); fig.savefig(f"{OUT}/fig5_diurnal.png", dpi=150); plt.close(fig)

# ---- Fig 6: tagged ice and snow over time ---------------------------------
fig, ax = plt.subplots(1, 2, figsize=(13, 4))
for a in ax:
    for c in cases:
        mark_rainy(a, c, label="TWP-ICE rainy phase")
for c in cases:
    for s, ls in [("qi", "-"), ("qs", ":")]:
        if s not in c["q"] or s not in c["t"]:
            continue
        rw, tw = colint(c, c["q"][s]), colint(c, c["t"][s])
        frac = np.where(rw > PATH_THR, tw / np.where(rw > PATH_THR, rw, 1.0), np.nan)
        lab = f"{c['name'].split(' (')[0]} {'ice' if s == 'qi' else 'snow'}"
        ax[0].plot(days(c["ti"]), frac, color=c["color"], ls=ls, lw=1.2, label=lab)
        ax[1].plot(days(c["ti"]), rw, color=c["color"], ls=ls, lw=1.2, label=lab)
ax[0].set_title("Column tagged fraction of ice and snow"); ax[0].set_ylabel("tagged / real")
ax[0].set_ylim(0, 1)
ax[1].set_title("Real ice and snow path (when ice is abundant)"); ax[1].set_ylabel("mm")
for a in ax:
    a.set_xlabel("Elapsed days"); a.grid(alpha=.3); a.legend(fontsize=8)
fig.tight_layout(); fig.savefig(f"{OUT}/fig6_ice_snow_tag_fraction.png", dpi=150); plt.close(fig)

# ---- Summary table ---------------------------------------------------------
print(f"\n== Summary (averages from day {AVG_START_DAYS:g} to end of each run)")
print(f"{'case':34s} {'E mm/d':>8s} {'P mm/d':>8s} {'Wv mm':>7s} {'Wv_tag/Wv':>10s} "
      + " ".join(f"{s+'_tag/'+s:>9s}" for s in ["ql", "qi", "qs"]))
for c in cases:
    m = c["avg"]

    def tmean(key):
        if c[key] is None:
            return np.nan
        tt, x = c[key]
        return np.nanmean(x[days(tt) >= AVG_START_DAYS])
    fr = []
    for s in ["ql", "qi", "qs"]:
        rw = np.nanmean(colint(c, c["q"][s])[m]) if s in c["q"] else np.nan
        tw = np.nanmean(colint(c, c["t"][s])[m]) if s in c["t"] else np.nan
        fr.append(tw / rw if rw > 1e-6 else np.nan)
    print(f"{c['name']:34s} {tmean('E'):8.2f} {tmean('P'):8.2f} {np.nanmean(c['Wv'][m]):7.1f} "
          f"{np.nanmean(c['Wv_tag'][m] / c['Wv'][m]):10.3f} "
          + " ".join(f"{v:9.3f}" for v in fr))
print(f"\nFigures saved in ./{OUT}/")
