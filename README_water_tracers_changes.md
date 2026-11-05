# Water Tracers in CCPP-SCM: Change Log

This document records every code change made for water tracers (water tagging now, water
isotopes later) in CCPP-SCM v8.0.0 with the `SCM_GFS_v17_p8_ugwpv1` suite.

| | |
|---|---|
| **SCM repository** | [Asiyaabs/ccpp-scm](https://github.com/Asiyaabs/ccpp-scm), branch `feature/water-tracers` |
| **Physics repository** | [Asiyaabs/ccpp-physics](https://github.com/Asiyaabs/ccpp-physics), branch `feature/water-tracers` (submodule `ccpp/physics`) |
| **Base** | CCPP-SCM v8.0.0 (`70dd01b`), CCPP-Physics v8.0.0 (`2a66945`) |
| **Overview / user guide** | [`README_water_tracers.md`](README_water_tracers.md) |

---

## Contents

1. [What water tracers are](#1-what-water-tracers-are)
2. [Status](#2-status)
3. [How to switch tracers on](#3-how-to-switch-tracers-on)
4. [Namelist reference](#4-namelist-reference)
5. [Tracer sets, names and index tables](#5-tracer-sets-names-and-index-tables)
6. [Changed files](#6-changed-files)
7. [Tests](#7-tests)
8. [Next steps](#8-next-steps)

---

## 1. What water tracers are

A water tracer is an extra copy of the model's water (`qv, ql, qi, qr, qs, qg`). It is moved
by the same processes as the model water, so it can follow:

- **Bulk check set (`H2O`)**: a full copy of the model water. If the tracer code is right, it
  stays equal to the model water. This is the main correctness test.
- **Tag sets (`H2O_<TAG>`)**: water from one source only. For example, `COL` holds water that
  evaporated from the surface inside the column.
- **Isotope sets (`HDO`, `H218O`)**: planned for Phase 4. The fractionation hooks (`alpha`)
  will be in place from Phase 2.

The physics never reads the tracers back, so **the model answer does not change** when
tracers are switched on.

---

## 2. Status

| Phase / step | Content | Status |
|---|---|---|
| 0 | Base v8.0.0, input data, case namelists, baseline runs | ✅ done |
| 1 – step 4 | Namelist, tracer registration, index tables | ✅ done, tested |
| 1 – step 5 | Helper module (`wtr_transfer`, `wtr_alpha`) | ✅ done, tested |
| 1 – step 6 | Host rules: initial values, forcing, clipping, output | ✅ done, tested |
| 2 – step 7a | PBL (`satmedmfvdifq`): tracers mixed, surface evaporation into tracer vapour | ✅ done, tested |
| 2 – step 7b | PBL: condensation in updrafts (`mfpbltq`) and downdrafts (`mfscuq`), negative cloud water / rain borrowed from vapour | ✅ done, tested |
| 2 – step 8 | Shallow convection (`samfshalcnv`): updraft condensation, rain, rain evaporation, detrained cloud water | ✅ done, tested |
| 2 – step 9 | Deep convection (`samfdeepcnv`): as step 8, plus the downdraft (rain evaporation / condensation in it) | ✅ done, tested |
| 2 | Next schemes, one per commit (shallow conv → deep conv → Thompson → photochem / surface / sea ice → Noah-MP) | ⏳ |
| 3 | Documentation | ⏳ |
| 4 | Isotopes (HDO, H218O) | ⏳ |

---

## 3. How to switch tracers on

1. Open the physics namelist `ccpp/physics_namelists/input_GFS_v17_p8_ugwpv1.nml`.
2. In the `&water_tracer_nml` group at the end of the file, set:
   ```fortran
   tagging = .true.
   ```
3. Run the case as usual. No rebuild is needed:
   ```bash
   cd scm/bin
   qcmd -V -A <project> --ntasks 1 -l walltime=02:00:00 -- python run_scm.py -c flux_chaz_2022081500 -s SCM_GFS_v17_p8_ugwpv1 > run.log 2>&1
   ```

You don't need to edit the tracer file (`scm/etc/tracer_config/tracers_GFS_v17_p8_ugwpv1.txt`).
The host appends the water tracers to the tracer list in memory.

The `&water_tracer_nml` group is **optional**. Leaving it out of a namelist file has the same
effect as `tagging = .false.`.

---

## 4. Namelist reference

```fortran
&water_tracer_nml
  tagging        = .false.     ! master switch
  wtr_species    = 'H2O'       ! species list: H2O (HDO, H218O later)
  wtr_tag_names  = 'COL'       ! tag names, up to 10
  wtr_tag_source = 'surface'   ! where the water of each tag enters
  wtr_bulk_check = .true.      ! add the H2O bulk check set
  wtr_init_tags  = 'zero'      ! initial tags: 'zero' | 'bulk' | 'fraction'
  wtr_init_frac  = 0.5         ! initial tag fraction when wtr_init_tags = 'fraction'
  wtr_tag_moisten = .false.    ! test mode: tags get the full forcing, like the bulk set
/
```

| Variable | Type | Default | Allowed values |
|---|---|---|---|
| `tagging` | logical | `.false.` | |
| `wtr_species` | string list | `'H2O'` | `H2O` only for now (`HDO` and `H218O` give "not implemented yet") |
| `wtr_tag_names` | string list | `'COL'` | any names, no duplicates, up to 10 |
| `wtr_tag_source` | string list | `'surface'` | `surface` only for now |
| `wtr_bulk_check` | logical | `.true.` | for H2O only; isotopes always get a bulk set |
| `wtr_init_tags` | string | `'zero'` | `zero`, `bulk`, `fraction` |
| `wtr_init_frac` | real | `0.5` | 0 to 1 |
| `wtr_tag_moisten` | logical | `.false.` | `.true.` only for testing (see §7, step 6 test C) |

An invalid value stops the run with a message that starts with `water_tracers_config:`.


---

## 5. Tracer sets, names and index tables

### Sets

For each species, the code creates the optional bulk set and then one set per tag:

| Set | Species | Kind | Bulk set |
|---|---|---|---|
| 1 `H2O` | 1 (H2O) | 1 (bulk) | 1 (itself) |
| 2 `H2O_COL` | 1 (H2O) | 2 (tag) | 1 |

When `wtr_bulk_check = .false.`, H2O tags have bulk set `0`, which means the model water itself.

### Tracer names

Each set has 6 phases, named `<phase>_<set>`:

```
qv_H2O      ql_H2O      qi_H2O      qr_H2O      qs_H2O      qg_H2O
qv_H2O_COL  ql_H2O_COL  qi_H2O_COL  qr_H2O_COL  qs_H2O_COL  qg_H2O_COL
```

With the default namelist this gives 2 sets × 6 phases = **12 tracers**, added in memory after
the tracers from the tracer file (the file itself is not changed). Their type is generic (0),
so the convection schemes (samfdeepcnv, samfshalcnv) transport them with the mass flux, like
other generic tracers (selection `otsptflag` in `gfs_interstitial_setup_tracers`,
`scm/src/CCPP_typedefs.F90`). From step 8 only the vapour tracers are transported: the model
condensate (`ql`, `qi`, `qr`, `qs`, `qg`) is not transported by convection, so neither are the
tracer condensate phases.

With Thompson microphysics, `satmedmfvdifq` mixes only a fixed list of tracers (`nvdiff`, set
in `gfs_interstitial_setup_tracers`, copied in `GFS_PBL_generic_pre`): the water species,
number concentrations, ozone and TKE (10). Step 7a adds the 12 water tracers to this list,
just before TKE, which must stay last (`nvdiff` = 22).

### Index tables

The physics finds the tracers through these tables, which are stored in `GFS_control_type`:

| Field | Shape | Meaning |
|---|---|---|
| `wtr_idx(set, phase)` | (nset, 6) | position of the tracer in `qgrs` / `gq0` |
| `wtr_model_idx(phase)` | (6) | position of the model water (`ntqv, ntcw, ntiw, ntrw, ntsw, ntgl`), 0 if absent |
| `wtr_species(set)` | (nset) | 1 H2O, 2 HDO, 3 H218O |
| `wtr_kind(set)` | (nset) | 1 bulk, 2 tag |
| `wtr_bulk(set)` | (nset) | bulk set of this set (0 = model water) |

The phase order is always `qv, ql, qi, qr, qs, qg`. When tagging is off, `wtr_nset = 0` and
all of these arrays have size zero.

---

## 6. Changed files

### 6.1 Physics repository (`ccpp/physics`)

| File | Change |
|---|---|
| `physics/tools/water_tracers_config.F90` | **New (step 4).** Module `water_tracers_config`: reads `&water_tracer_nml` (`wtr_read_nml`), checks it, and builds sets, names and index tables (`wtr_nset`, `wtr_set_info`, `wtr_tracer_names`, `wtr_index_table`). This is a plain Fortran module, not a CCPP scheme. Step 6 adds the option `wtr_tag_moisten`. |
| `physics/tools/water_tracers_utils.F90` | **New (step 5).** Module `water_tracers_utils`, the helper used inside the schemes: `wtr_transfer(src_q, src_trc, dq, dst_trc, alpha)` moves `alpha × (src_trc / src_q) × dq` from a source tracer to a destination tracer (or out of the atmosphere when `dst_trc` is absent), capped so the source never goes negative. It is `elemental`. `wtr_alpha(species, process, temp)` is the fractionation hook (returns 1 for now). Process ids `wtr_proc_*`. |
| `physics/PBL/SATMEDMF/satmedmfvdifq.F` / `.meta` | **Step 7a.** New arguments `tagging, wtr_nset, wtr_nphase, wtr_kind, wtr_qflx`. One block after the surface boundary condition of `qv` (`f2(i,1) = q1(i,1,1) + dtdz1*evap`) gives the vapour tracer of each set its surface flux: bulk sets get `evap`; tags get `evap` when it is upward, and lose vapour at their lowest-layer ratio when it is downward (dew/frost: `wtr_transfer`, `wtr_proc_cond_liq` or `wtr_proc_dep_ice` below 273.15 K; fix commit after step 9). Fills `wtr_qflx = rho_a × flux`. `.meta`: the 5 arguments, `water_tracers_config.F90` dependency. **Step 7b.** New argument `wtr_species`, `water_tracers_utils.F90` dependency. (1) After `mfpbltq` / `mfscuq`: the model parcel entrains total water `qv + ql` and splits it into vapour and cloud water at each level; the tracer parcel of each set entrains its own `qv + ql` the same way, is scaled by the model's total-water change in the split, and its cloud water is condensed from it with `wtr_transfer` (`wtr_proc_cond_liq`, α hook). This replaces the passive entrainment of the `qv` and `ql` tracers in `qcko` / `qcdo`. (2) After the solver, where negative cloud water or rain borrows vapour in the same layer, the net vapour given to cloud water and to rain by the two borrowings is moved in one block after both, from each vapour tracer to its cloud-water / rain tracer (one `wtr_transfer` per destination, no fractionation: a numerical fix). |
| `physics/CONV/SAMF/samfdeepcnv.f` / `.meta` | **Step 9.** Same arguments and pattern as `samfshalcnv` (step 8), with `wtr_raincd`. In addition: `wpwav` = tracer part of the column condensate `pwavo`; the downdraft vapour tracer `ecdo` is entrained like `qcdo` (kept in `wqcd`), then gets rain evaporation at the composition `wpwav/pwavo` (`wtr_transfer`, `wtr_proc_evap_liq`) or condenses where supersaturated (`wtr_proc_cond_liq`) to follow `qrcdo`; `wpwdo` = tracer `pwdo`. The model tendency uses `qcdo` at k-1 and `qrcdo` at k, the tracer loop `ecdo` at both: one block adds the k-1 difference. Tracer rain = updraft + downdraft share; rain evaporation, reset where the model rain is ≤ 0, and detrained ice/liquid as in step 8 (only where the model rain > 0). `GFS_DCNV_generic_post` is unchanged. |
| `physics/CONV/SAMF/samfshalcnv.f` / `.meta` | **Step 8.** New arguments `tagging, wtr_nset, wtr_nphase, wtr_idx, wtr_species, otsptflag, wtr_raincs`; `water_tracers_utils.F90` dependency. The vapour tracer of each set (found in `qtr` from `otsptflag`): (1) on interface levels it is set to the model `qo` times its tracer/model ratio; (2) its updraft value `ecko` is recomputed like `qcko` and gives its share of the condensate removed at each level and at cloud top (`wtr_transfer`, `wtr_proc_cond_liq`); `wrt` keeps that share per level; (3) tracer rain collects `wrt × pwo`, rain evaporation is `wtr_transfer` (`wtr_proc_evap_liq`) back into the vapour tracer, the final rain reset is mirrored and the result goes to `wtr_raincs`; (4) detrained cloud water `wrt × dellal` is split into ice/liquid like the model (a ratio, no fractionation) and returned as tendencies of the `ql`/`qi` tracers (`ten_q`). The tendency, subsidence and feedback code already treats tracers like `q1` and is unchanged. |
| `physics/Interstitials/UFS_SCM_NEPTUNE/GFS_PBL_generic_pre.F90` / `.meta` | **Step 7a.** New arguments `tagging, wtr_nset, wtr_nphase, wtr_idx`. When `nvdiff ≠ ntrac` (e.g. Thompson), copies the water tracers into `vdftra`, just before TKE. |
| `physics/Interstitials/UFS_SCM_NEPTUNE/GFS_PBL_generic_post.F90` / `.meta` | **Step 7a.** Same arguments. Maps the PBL tendencies of the water tracers back to `dqdt` (`ten_q`). |

### 6.2 SCM repository

| File | Change |
|---|---|
| `scm/src/scm_input.F90` | New routine `add_water_tracers`, called right after `get_tracers` in `get_config_nml`. When tagging is on, it appends the water tracer names (type 0) and prints `water tracers: tagging on, N tracers added:`. Step 6: keeps the namelist settings in `wtr_host_cfg`. |
| `scm/src/GFS_typedefs.F90` | 8 new fields in `GFS_control_type` (see §5). In `control_initialize`, after the tracer indices are set, it reads `&water_tracer_nml`, fills the index tables and prints the sets (master task only). |
| `scm/src/GFS_typedefs.meta` | Metadata for the 8 new fields. Adds `tools/water_tracers_config.F90` and (step 5) `tools/water_tracers_utils.F90` to `dependencies`. |
| `scm/src/scm_water_tracers.F90` | **New (step 6).** Host rules, all called only when tagging is on: `wtr_host_init` (initial values), `wtr_host_forcing` (large-scale forcing of the vapour tracers), `wtr_host_clip` (0 ≤ tag ≤ bulk), `wtr_output_init` / `wtr_output_append` (output fields, §6.4). |
| `scm/src/scm.F90` | Step 6: calls `wtr_host_init` right after `ccpp_physics_init`. |
| `scm/src/scm_time_integration.F90` | Step 6: calls `wtr_host_forcing` after `apply_forcing_DEPHY`, and `wtr_host_clip` after the physics (after the state is copied to time level 1). |
| `scm/src/scm_time_integration.meta` | Step 6: adds `scm_water_tracers.F90` to `dependencies`. |
| `scm/src/scm_output.F90` | Step 6: calls `wtr_output_init` and `wtr_output_append` when tagging is on. |
| `scm/src/CCPP_typedefs.F90` / `.meta` | Step 6: 5 per-time-step arrays in `GFS_interstitial_type`, shape (column, set), filled by the schemes in Phase 2 and reset to 0 every step (§6.3). Zero size when tagging is off. Step 7a: in `gfs_interstitial_setup_tracers`, `nvdiff` grows by `wtr_nset × wtr_nphase` when tagging is on and `nvdiff ≠ ntrac`, before the TKE position (`ntkev`) is set. Step 8: the water tracer phases `ql … qg` are left out of convective transport (`otsptflag`). |
| `ccpp/physics_namelists/input_GFS_v17_p8_ugwpv1.nml` | `&water_tracer_nml` group appended, `tagging = .false.` (step 6: `wtr_tag_moisten = .false.`) |
| `ccpp/physics_namelists/input_GFS_v17_p8_ugwpv1_ps.nml` | same |
| `.gitmodules` | `ccpp-physics` URL points to `Asiyaabs/ccpp-physics` |
| `scm/etc/case_config/flux_chaz_2022081500.nml` | **New** case (August) |
| `scm/etc/case_config/flux_chaz_2023011500.nml` | **New** case (January) |
| `scm/etc/case_config/flux_chaz_2023031400.nml` | **New** case (March) |

### 6.3 New CCPP standard names

| Standard name | Field |
|---|---|
| `flag_for_water_tracers` | `tagging` |
| `number_of_water_tracer_sets` | `wtr_nset` |
| `number_of_water_tracer_phases` | `wtr_nphase` |
| `index_of_water_tracers_in_tracer_concentration_array` | `wtr_idx` |
| `index_of_model_water_per_water_tracer_phase_in_tracer_concentration_array` | `wtr_model_idx` |
| `species_of_water_tracer_sets` | `wtr_species` |
| `kind_of_water_tracer_sets` | `wtr_kind` |
| `bulk_set_of_water_tracer_sets` | `wtr_bulk` |
| `lwe_thickness_of_deep_convective_precipitation_amount_of_water_tracers` | `wtr_raincd` (m per step) |
| `lwe_thickness_of_shallow_convective_precipitation_amount_of_water_tracers` | `wtr_raincs` (m per step) |
| `lwe_thickness_of_explicit_rain_amount_of_water_tracers` | `wtr_rainmp` (m per step) |
| `lwe_thickness_of_explicit_frozen_precipitation_amount_of_water_tracers` | `wtr_snowmp` (snow + ice + graupel, m per step) |
| `surface_upward_water_flux_of_water_tracers` | `wtr_qflx` (kg m-2 s-1) |

### 6.4 Host rules and output (step 6)

| Rule | What happens |
|---|---|
| Initial values | Bulk sets = model water. Tags = 0, model water, or `wtr_init_frac` × model water (`wtr_init_tags`). Set after `ccpp_physics_init`, so they start from the same water as the physics. |
| Forcing | With `dqv = dt × qv_force_tend` (the increment the model vapour gets): bulk sets get `+ dqv`; tags lose vapour at their own ratio when `dqv < 0` and get nothing when `dqv > 0` (advected vapour did not evaporate in the column). With `wtr_tag_moisten = .true.`, tags get `+ dqv` like the bulk set. |
| Clipping | After the physics: `0 ≤ tag ≤ max(bulk, 0)` for each phase. The bulk set is the H2O bulk set, or the model water if there is none. Bulk sets are not clipped. |

New fields in `output.nc` (instantaneous, only when tagging is on):

| Field | Meaning | Units |
|---|---|---|
| `qv_<set>` … `qg_<set>` | water tracers | kg kg-1 |
| `PRECC` | model convective precipitation (deep + shallow) | m s-1 |
| `PRECSC` | model convective snow (`PRECC` where `tsfc < 273.15 K`, as in `GFS_MP_generic_post`) | m s-1 |
| `PRECL` | model large-scale (microphysics) precipitation | m s-1 |
| `PRECSL` | model large-scale snow + ice + graupel | m s-1 |
| `PRECT` | model total precipitation | m s-1 |
| `QFLX` | model surface upward water flux | kg m-2 s-1 |
| `PRECRC_<set>r`, `PRECSC_<set>s` | convective rain / snow of each set | m s-1 |
| `PRECRL_<set>R`, `PRECSL_<set>S` | large-scale rain / snow + ice + graupel of each set | m s-1 |
| `QFLX_<set>` | surface upward water flux of each set | kg m-2 s-1 |

The per-set precipitation and flux fields stay 0 until the scheme that produces them is done
(convection, Thompson, surface).

### 6.5 Not tracked in git

Input data (`scm/data/processed_case_input`, `physics_input_data`, `comparison_data`),
`scm/run/` and private notes (`notes/`) are listed in `.git/info/exclude`.

> **Build note:** in v8, capgen runs only when cmake runs. After adding a file or changing a
> `.meta` file, re-run `cmake -DCCPP_SUITES=SCM_GFS_v17_p8_ugwpv1 ../..` in `scm/bin` before `make`.

---

## 7. Tests

Build: Intel oneAPI 2025.3.1, spack-stack 2.1.1 (`module load derecho_intel/2.1.1`), Derecho.

### Step 4, test 1: tagging off gives the same answer (✅ passed, 2026-11-02)

All six cases were run with `tagging = .false.` using the step-4 executable and compared
with the v8.0.0 baseline (`/glade/work/asiyab/SWI_NCAR/baseline_v8/`) by `cmp`:

| Case | Run length (s) | Status | `output.nc` vs baseline |
|---|---|---|---|
| `flux_chaz_2022081500` | 172800 | 0 | byte-identical |
| `flux_chaz_2023011500` | 172800 | 0 | byte-identical |
| `flux_chaz_2023031400` | 172800 | 0 | byte-identical |
| `gabls3_noahmp` | 86400 | 0 | byte-identical |
| `MOSAiC-AMPS` | 604800 | 0 | byte-identical |
| `twpice` | 2138400 | 0 | byte-identical |

### Step 4, test 2: tagging on (✅ passed, 2026-11-02)

Result for `flux_chaz_2022081500`: status 0, `output.nc` byte-identical to the baseline, and the log shows

```
water tracers: tagging on, 12 tracers added:
qv_H2O      ql_H2O      qi_H2O      qr_H2O      qs_H2O      qg_H2O
qv_H2O_COL  ql_H2O_COL  qi_H2O_COL  qr_H2O_COL  qs_H2O_COL  qg_H2O_COL
...
water tracers: tagging on, 2 sets
set     H2O     species 1 kind 1 bulk set 1 tracer idx 13 14 15 16 17 18
set H2O_COL     species 1 kind 2 bulk set 1 tracer idx 19 20 21 22 23 24
```

The 12 tracers from the tracer file come first (24 tracers in total).

How to repeat the test:

Run `flux_chaz_2022081500` with `tagging = .true.`. Add `-v` to `run_scm.py`, because
without it the model's own printout (including the water-tracer lines) is not written to the log:

```bash
cd scm/bin
qcmd -V -A <project> --ntasks 1 -l walltime=02:00:00 -- python run_scm.py -c flux_chaz_2022081500 -s SCM_GFS_v17_p8_ugwpv1 -v > run_flux_chaz_2022081500_tagon.log 2>&1
grep -A3 "water tracers" run_flux_chaz_2022081500_tagon.log
```

Expected:

- The log lists 12 tracers (`qv_H2O … qg_H2O_COL`) and 2 sets with their tracer indices.
- The model fields in `output.nc` are the same as the baseline, because the tracers are not
  written to the output until step 6 and they don't feed back on the physics.

### Steps 5 and 6 (✅ passed, 2026-11-02)

Cases `flux_chaz_2022081500` (dry: no clouds, no precipitation) and `twpice` (wet). Checks done with a small
netCDF script comparing `output.nc` with the baseline.

**Test A, tagging off:** `flux_chaz_2022081500` and `twpice`, `output.nc` byte-identical to the baseline.

**Test B, tagging on** (`wtr_init_tags = 'zero'`):

| Check | Result |
|---|---|
| Model fields vs baseline | none differ |
| Bulk = model water at t = 0 (`qv`, `ql`, `qi`) | max difference 0 |
| `qv_H2O_COL` | stays 0 (no source of tagged water yet) |
| Tags ≥ 0 and ≤ bulk | yes |
| `PRECT - PRECC - PRECL` | 0 (this case has no precipitation) |

`qv_H2O` drifts away from `qv` and goes negative (down to −1.3e-2) after about 5 h. This is
expected: the bulk set gets the forcing but not yet the physics sources (surface evaporation
through the PBL), and the PBL does not mix the tracers yet. Phase 2 closes this gap.

**Test B on a wet case** (`twpice`, 595 hourly outputs, convection and rain), tagging on,
`wtr_init_tags = 'zero'`:

| Check | Result |
|---|---|
| Model fields vs baseline | none differ |
| Bulk = model water at t = 0 | max difference 0 |
| `PRECT` vs the existing `tprcp_rate_inst` | identical |
| `PRECT - PRECC - PRECL` | ≤ 5.7e-14 m s-1 (float rounding), with `PRECT` up to 2.3e-6 m s-1 (8 mm h-1) |
| `PRECSC`, `PRECSL` | 0 (tropical case: no frozen precipitation at the surface) |
| `QFLX × L_v` vs `lhf` | equal to 3e-5 W m-2 (`lhf` up to 425 W m-2) |
| Tracer precipitation and flux fields | 0 (no scheme fills them yet) |
| `ql_H2O` … `qg_H2O` | 0 (no cloud at t = 0, and no scheme condenses into the tracers yet) |

`qv_H2O` is already 1.2e-2 away from `qv` after the first hour and grows to 0.27 kg kg-1:
the bulk vapour gets the strong moistening of the forcing but never condenses or rains out.
This is the expected state before Phase 2.

**Test C, test mode** (`wtr_init_tags = 'bulk'`, `wtr_tag_moisten = .true.`): wherever the bulk
set is ≥ 0, `qv_H2O_COL = qv_H2O` exactly (difference 0.0). The only differences (989 of 6223
points) are where the bulk set is negative and the clip sets the tag to 0, as intended.

### Step 7a, PBL mixing and surface evaporation (✅ passed, 2026-11-04)

Case `flux_chaz_2022081500` (dry: no clouds, no precipitation, so only the forcing and the PBL
change the water), 48 h, hourly output.

**Test A, tagging off:** `flux_chaz_2022081500` and `twpice`, `output.nc` byte-identical to the
baseline (`cmp`, run with the 7b build).

**Test B, tagging on** (`wtr_init_tags = 'zero'`):

| Check | Result |
|---|---|
| Model fields vs baseline | none differ |
| `qv_H2O` vs `qv`, troposphere, first 39 h | column totals equal to ~1e-6 (before 7a: off by up to 1.3e-2) |
| `qv_H2O` vs `qv`, model top | up to 1e-7: stratospheric water photochemistry (`h2o_phys`), not yet applied to the tracers |
| `QFLX_H2O` vs `QFLX` | equal to 0.3 % (2e-7 of 1.1e-4 kg m-2 s-1): `QFLX_H2O` uses the air density inside the PBL scheme, `QFLX` the density at the end of the step |
| `qv_H2O_COL` | grows from 0 (column sum 0.034 after 24 h); `QFLX_H2O_COL` ≥ 0 except for dew |
| Tags ≥ 0 and ≤ bulk | yes |

After 40 h the forcing dries the whole column (model vapour column from 0.27 to 3e-6) and
pushes `qv` below zero. Thompson microphysics resets negative `qv` to 1e-7
(`module_mp_thompson.F90`, l. 1634), which adds water; the bulk set does not follow this reset
and goes down to −1.4e-3 at 974 hPa. This is a Thompson step item, not a PBL error.

**Test C, test mode** (`wtr_init_tags = 'bulk'`, `wtr_tag_moisten = .true.`): wherever the bulk
set is ≥ 0, `qv_H2O_COL = qv_H2O` exactly (difference 0.0), and `QFLX_H2O_COL = QFLX_H2O`
exactly. The only differences (406 points, all in the last hours) are where the bulk set is
negative and the clip sets the tag to 0.

### Step 7b, PBL condensation and negative-water fixes (✅ passed, 2026-11-04)

**Test A, tagging off:** see step 7a (same build).

**Test C, test mode** (`wtr_init_tags = 'bulk'`, `wtr_tag_moisten = .true.`), `twpice`:

| Check | Result |
|---|---|
| Model fields vs baseline | none differ |
| Tag vs bulk, every phase, where bulk ≥ 0 | 0.0 |
| Tag vs bulk where bulk < 0 | 2 points, bulk −5e-20 (`ql`) and −3e-26 (`qr`): rounding at zero, clipped |
| `ql_H2O`, `qr_H2O` | now non-zero (up to 3.6e-3 and 4.5e-7 kg kg-1); before 7b they stayed 0 |
| `QFLX_H2O_COL` vs `QFLX_H2O` | 0.0 |

`flux_chaz_2022081500` test C gives the same result as in step 7a.

On `twpice` the bulk set still differs from the model water (`qv` up to 3.3e-2, `ql_H2O` up to
3.6e-3 against 9.5e-4 in the model, `qi_H2O` = 0): convection and Thompson do not condense,
rain out or freeze the tracers yet. This closes with those steps.

### Step 8, shallow convection (✅ passed, 2026-11-04)

**Test C, test mode**, `twpice`:

| Check | Result |
|---|---|
| Model fields vs baseline | none differ |
| Tag vs bulk, every phase, where bulk ≥ 0 | 0.0 |
| Tag vs bulk where bulk < 0 | 6 points, bulk ≥ −9e-19: rounding at zero, clipped |
| Convective precipitation, tag vs bulk | 0.0 |
| `QFLX_H2O_COL` vs `QFLX_H2O` | 0.0 |

**Test B** (`wtr_init_tags = 'zero'`), `twpice`: model fields unchanged; tracer convective
precipitation is now non-zero (bulk up to 1.9e-7 m s-1, mean 4.6e-9, against model `PRECC`
mean 9.5e-8 m s-1, which is mostly deep convection); `H2O_COL` precipitation ≤ bulk.

The bulk set is still far from the model water on `twpice` (`qv_H2O` up to 0.11, `ql_H2O` up to
0.17 kg kg-1): deep convection does not condense the tracer vapour yet and Thompson does not
convert the tracer cloud water to rain, so tracer water piles up. Because shallow-convective
rain is computed from the tracer's share of the updraft water, the too-moist bulk set can rain
more than the model at some times (bulk convective precipitation exceeds `PRECC` by up to 8e-8
m s-1). Both close with the deep convection and Thompson steps.

**Test A, tagging off:** `flux_chaz_2022081500` and `twpice`, `output.nc` byte-identical to the
baseline (`cmp`).

### Step 9, deep convection (✅ passed, 2026-11-04)

**Test A, tagging off:** `flux_chaz_2022081500` and `twpice`, `output.nc` byte-identical to the
baseline (`cmp`).

**Test B** (`wtr_init_tags = 'zero'`), `twpice`, compared with step 8:

| Check | Step 8 | Step 9 |
|---|---|---|
| Model fields vs baseline | none differ | none differ |
| max\|`qv_H2O` − `qv`\| after 1 h | 1.3e-2 | 3.5e-4 |
| max\|`qv_H2O` − `qv`\| over the run | 9.7e-2 | 4.5e-2 |
| Bulk convective precipitation, run mean (model `PRECC` 9.5e-8 m s-1) | 4.6e-9 | 7.1e-8 |
| `qi_H2O` | 0 | up to 4.3e-3 (detrained convective ice) |

The rest of the gap is Thompson: tracer cloud water is not yet converted to rain or evaporated
(`ql_H2O` up to 0.14 kg kg-1), so the bulk set is too moist and its convective precipitation
can exceed `PRECC` at some times (by up to 6.7e-8 m s-1). `flux_chaz_2022081500` (no convection)
is unchanged from step 7.

**Test C, test mode**, `twpice`: tag = bulk wherever bulk ≥ 0 (`ql` … `qg` 0.0, `qv` ≤ 8.5e-22,
rounding next to zero); convective precipitation tag vs bulk 0.0; `QFLX` tag vs bulk 0.0.

### Fix after step 9: helper use and grouping

Rule: every fractionating process is its own `wtr_transfer` call with an α hook; non-fractionating
moves are applied once, as a net change after the model steps.

| Scheme | Change |
|---|---|
| `satmedmfvdifq` | Dew/frost is now a `wtr_transfer` call with an α hook (was an inline ratio). The two negative-water borrowings (cloud water, rain) are moved in one block after both (was one block after each). |
| `samfshalcnv`, `samfdeepcnv` | The ice/liquid split of detrained cloud water is a ratio (was a `wtr_transfer` call with `wtr_proc_freeze`): it does not fractionate. |

Tests (✅ passed, 2026-11-05): tagging off, `flux_chaz_2022081500` and `twpice` byte-identical
to the baseline; test C on `twpice`: tag = bulk wherever bulk ≥ 0 (`qv` ≤ 8.5e-22, rounding next
to zero; other phases 0.0), convective precipitation and `QFLX` tag vs bulk 0.0. Bulk-vs-model
numbers equal to step 9 within rounding (e.g. bulk convective precipitation max 1.259e-6 against
1.263e-6 m s-1).

---

## 8. Next steps

1. **Phase 2, step 10: Thompson microphysics (`mp_thompson`)**: cloud water / ice / rain / snow /
   graupel processes, `wtr_rainmp`, `wtr_snowmp`; also the reset of negative `qv` to 1e-7.
   (Known limit of step 7b: the tracer vapour gets the PBL negative-vapour fix after the
   borrowing instead of before; this matters only where the model vapour itself goes negative.)
2. Then the other schemes, one at a time, one commit each. After each scheme, the bulk set must
   still equal the model water, and in test mode (test C) every tag must still equal the bulk set.
