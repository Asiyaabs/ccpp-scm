#!/usr/bin/env python
"""
Compare qv and qv_tag between two CCPP-SCM runs (default: no-radiation vs with-radiation).

All differences are  A - B  =  (no radiation) - (with radiation).

Usage (from scm/run, or anywhere):
    python compare_qvtag_rad.py
    python compare_qvtag_rad.py --a output_twpice_SCM_GFS_v17_p8_ugwpv1 \
                                --b output_twpice_SCM_GFS_v17_p8_ugwpv1_with_rad \
                                --outdir rad_compare

Each of --a / --b may be a run directory (output.nc is looked up inside) or a .nc file.
Variables are searched for at top level AND inside netCDF groups, so it works whether
qv/qv_tag sit in output.nc's root or in a group such as time_inst.
"""
import argparse
import os
import sys

import numpy as np
import netCDF4 as nc
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt

A_DEFAULT = "output_twpice_SCM_GFS_v17_p8_ugwpv1"
B_DEFAULT = "output_twpice_SCM_GFS_v17_p8_ugwpv1_with_rad"
QV_FLOOR = 1.0e-9  # ignore relative errors where qv is at/below the model floor
VIOL_RTOL = 1.0e-6  # tolerance for the qv_tag <= qv check (FP noise)


def walk(g, path=""):
    yield path, g
    for name, sub in g.groups.items():
        yield from walk(sub, path + "/" + name)


def find_group(ds, names):
    for path, g in walk(ds):
        if all(n in g.variables for n in names):
            return (path or "/"), g
    raise KeyError(f"no group contains all of {names}")


def to_time_lev(var):
    """Return float array shaped (time, lev) with NaN for fill; squeezes singleton dims."""
    arr = np.ma.filled(var[:].astype(float), np.nan)
    dims = list(var.dimensions)
    keep = [i for i, s in enumerate(arr.shape) if s > 1]
    arr = arr.reshape([arr.shape[i] for i in keep])
    dims = [dims[i] for i in keep]
    if arr.ndim != 2:
        raise ValueError(f"{var.name}: expected 2D (time, lev) after squeeze, got {arr.shape} {dims}")
    if "time" not in dims[0].lower() and "time" in dims[1].lower():
        arr = arr.T
    return arr


def load(path):
    f = path if path.endswith(".nc") else os.path.join(path, "output.nc")
    if not os.path.exists(f):
        sys.exit(f"cannot find {f}")
    ds = nc.Dataset(f)
    gpath, g = find_group(ds, ["qv", "qv_tag"])
    out = {"file": f, "group": gpath}
    out["qv"] = to_time_lev(g.variables["qv"])
    out["qv_tag"] = to_time_lev(g.variables["qv_tag"])
    nt, nl = out["qv"].shape

    # vertical coordinate: pressure if available with matching shape, else level index
    out["p"] = None
    for pname in ("pres", "pressure", "p"):
        if pname in g.variables:
            try:
                p = to_time_lev(g.variables[pname])
                if p.shape == (nt, nl):
                    out["p"] = p
                    break
            except ValueError:
                pass
    # time axis
    out["t"] = None
    if "time" in g.variables:
        t = np.ma.filled(g.variables["time"][:].astype(float), np.nan).squeeze()
        if t.ndim == 1 and t.size == nt:
            out["t"] = t
    ds.close()
    return out


def stats(name, d, p1d):
    """Print max/rms of an (nt, nl) difference array and where the max occurs."""
    ad = np.abs(d)
    if np.all(np.isnan(ad)):
        print(f"  {name:<28s} all NaN")
        return
    it, il = np.unravel_index(np.nanargmax(ad), ad.shape)
    ploc = f"{p1d[il]:.1f} hPa" if p1d is not None else f"lev {il}"
    rms = np.sqrt(np.nanmean(d ** 2))
    print(f"  {name:<28s} max|d|={np.nanmax(ad):.3e} at t={it}, {ploc}   rms={rms:.3e}")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--a", default=A_DEFAULT, help="run A (default: no-radiation run)")
    ap.add_argument("--b", default=B_DEFAULT, help="run B (default: with-radiation run)")
    ap.add_argument("--labelA", default="no rad")
    ap.add_argument("--labelB", default="with rad")
    ap.add_argument("--outdir", default="rad_compare")
    args = ap.parse_args()
    os.makedirs(args.outdir, exist_ok=True)

    A, B = load(args.a), load(args.b)
    print(f"A ({args.labelA}): {A['file']}  [group {A['group']}]  shape {A['qv'].shape}")
    print(f"B ({args.labelB}): {B['file']}  [group {B['group']}]  shape {B['qv'].shape}")

    nt = min(A["qv"].shape[0], B["qv"].shape[0])
    nl = min(A["qv"].shape[1], B["qv"].shape[1])
    if A["qv"].shape != B["qv"].shape:
        print(f"WARNING: shapes differ; truncating both to (time={nt}, lev={nl})")
    for D in (A, B):
        for k in ("qv", "qv_tag", "p", "t"):
            if D[k] is not None:
                D[k] = D[k][:nt] if k == "t" else D[k][:nt, :nl]

    # vertical coordinate (time-mean pressure, hPa) and time axis
    pref = B["p"] if B["p"] is not None else A["p"]
    if pref is not None:
        p1d = np.nanmean(pref, axis=0)
        if np.nanmax(p1d) > 2000:  # Pa -> hPa
            p1d = p1d / 100.0
    else:
        p1d = None
    t = B["t"] if B["t"] is not None else (A["t"] if A["t"] is not None else np.arange(nt, dtype=float))
    tlabel = "time" if (B["t"] is not None or A["t"] is not None) else "output index"

    dqv = A["qv"] - B["qv"]
    dtag = A["qv_tag"] - B["qv_tag"]

    # relative difference of qv_tag, only where reference qv_tag/qv are above the floor
    ref_ok = (B["qv"] > QV_FLOOR) & (B["qv_tag"] > QV_FLOOR)
    rel = np.where(ref_ok, dtag / np.where(ref_ok, B["qv_tag"], np.nan), np.nan)

    # ratios and qv_tag <= qv check, per run
    print("\n== qv_tag <= qv check (tolerance rtol=%.0e) ==" % VIOL_RTOL)
    for lab, D in ((args.labelA, A), (args.labelB, B)):
        ok = np.isfinite(D["qv"]) & np.isfinite(D["qv_tag"])
        viol = (D["qv_tag"] > D["qv"] * (1 + VIOL_RTOL)) & ok
        print(f"  {lab:<10s} violations: {viol.sum()} / {ok.sum()} points ({100*viol.sum()/max(ok.sum(),1):.2f}%)  "
              f"max qv_tag/qv = {np.nanmax(np.where(D['qv'] > QV_FLOOR, D['qv_tag']/D['qv'], np.nan)):.4f}")

    print("\n== differences (A - B) ==")
    stats("qv", dqv, p1d)
    stats("qv_tag", dtag, p1d)
    print(f"  qv_tag relative diff (where qv, qv_tag > {QV_FLOOR:g}): "
          f"max|rel|={np.nanmax(np.abs(rel)):.3e}, median|rel|={np.nanmedian(np.abs(rel)):.3e}")

    for name, d in (("qv", dqv), ("qv_tag", dtag)):
        big = np.where(np.nanmax(np.abs(d), axis=1) > 1e-12)[0]
        print(f"  first output step where max|d{name}| > 1e-12: {big[0] if big.size else 'never'}")

    # ---- Figure 1: time-height differences ----
    def tz(ax, Z, title, cmap="RdBu_r", sym=True, label=""):
        Zm = np.ma.masked_invalid(Z)
        v = np.nanmax(np.abs(Z)) or 1.0
        Y = p1d if p1d is not None else np.arange(Z.shape[1])
        pc = ax.pcolormesh(t, Y, Zm.T, cmap=cmap, vmin=-v if sym else None, vmax=v if sym else None,
                           shading="auto")
        ax.set_title(title, fontsize=10)
        ax.set_xlabel(tlabel)
        ax.set_ylabel("pressure (hPa)" if p1d is not None else "level index")
        if p1d is not None:
            ax.set_ylim(np.nanmax(p1d), np.nanmin(p1d))
        plt.colorbar(pc, ax=ax, label=label)

    fig, axs = plt.subplots(2, 2, figsize=(14, 9))
    tz(axs[0, 0], dqv, f"qv: {args.labelA} - {args.labelB}", label="kg/kg")
    tz(axs[0, 1], dtag, f"qv_tag: {args.labelA} - {args.labelB}", label="kg/kg")
    tz(axs[1, 0], rel, f"qv_tag relative diff (ref qv, qv_tag > {QV_FLOOR:g})", label="fraction")
    ax = axs[1, 1]
    ax.semilogy(t, np.nanmax(np.abs(dqv), axis=1) + 1e-30, label="max|d qv|")
    ax.semilogy(t, np.nanmax(np.abs(dtag), axis=1) + 1e-30, label="max|d qv_tag|")
    ax.set_xlabel(tlabel)
    ax.set_ylabel("kg/kg")
    ax.set_title("column-max |difference| vs time", fontsize=10)
    ax.legend()
    ax.grid(alpha=0.3)
    fig.tight_layout()
    f1 = os.path.join(args.outdir, "qv_qvtag_diff_timeheight.png")
    fig.savefig(f1, dpi=150)
    plt.close(fig)

    # ---- Figure 2: time-mean profiles and qv_tag/qv ratio ----
    Y = p1d if p1d is not None else np.arange(nl)
    fig, axs = plt.subplots(1, 3, figsize=(15, 6), sharey=True)
    for lab, D, ls in ((args.labelA, A, "-"), (args.labelB, B, "--")):
        axs[0].plot(np.nanmean(D["qv_tag"], axis=0), Y, ls, label=f"qv_tag {lab}")
        axs[0].plot(np.nanmean(D["qv"], axis=0), Y, ls, alpha=0.5, label=f"qv {lab}")
    axs[0].set_xscale("log")
    axs[0].set_title("time-mean qv and qv_tag")
    axs[0].set_xlabel("kg/kg")
    axs[0].legend(fontsize=8)
    axs[1].plot(np.nanmean(dtag, axis=0), Y, label="qv_tag (A-B)")
    axs[1].plot(np.nanmean(dqv, axis=0), Y, label="qv (A-B)")
    axs[1].axvline(0, color="k", lw=0.5)
    axs[1].set_title("time-mean difference")
    axs[1].set_xlabel("kg/kg")
    axs[1].legend(fontsize=8)
    for lab, D, ls in ((args.labelA, A, "-"), (args.labelB, B, "--")):
        ratio = np.where(D["qv"] > QV_FLOOR, D["qv_tag"] / D["qv"], np.nan)
        axs[2].plot(np.nanmean(ratio, axis=0), Y, ls, label=lab)
    axs[2].set_title("time-mean qv_tag / qv")
    axs[2].set_xlabel("ratio")
    axs[2].legend(fontsize=8)
    axs[0].set_ylabel("pressure (hPa)" if p1d is not None else "level index")
    if p1d is not None:
        axs[0].set_ylim(np.nanmax(p1d), np.nanmin(p1d))
    for a in axs:
        a.grid(alpha=0.3)
    fig.tight_layout()
    f2 = os.path.join(args.outdir, "qv_qvtag_profiles.png")
    fig.savefig(f2, dpi=150)
    plt.close(fig)

    print(f"\nSaved:\n  {f1}\n  {f2}")


if __name__ == "__main__":
    main()
