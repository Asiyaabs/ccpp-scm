# Part A: near-zero tag bound fixes (2026-10-07)

Goal: `0 <= tag <= real` everywhere, at all times, with the tag evolving exactly like qv
(no limiters). Found in the stratosphere (TWP-ICE 57-93 hPa) and at the model top (ARM SGP),
at qv ~1e-10 kg/kg. Negligible for tropospheric science, but must be fixed before isotopes
(delta values are ratios and break at tiny water amounts).

All changes are general (every case and suite), not case-specific.

---

## 1. Forcing: tag dried with real qv at all levels (main cause)

**File:** `scm/src/scm_forcing.F90`, lines ~924, 1134, 1458 (leapfrog, forward Euler, DEPHY)
**Backup:** `scm_forcing.F90.pre_partA.bak`

```fortran
! before
if (scm_state%qv_force_tend(i,k) < 0.0 .and. old_qv(i,k) > 1.0e-9) then
! after
if (scm_state%qv_force_tend(i,k) < 0.0 .and. old_qv(i,k) > 0.0) then
```

**Why:** below qv = 1e-9 the forcing dried real qv but skipped the tag, so the tag was
left above real. While drying, `new_qv/old_qv < 1`, so proportional scaling cannot blow up
and needs no threshold.

**Note:** the forcing tendency is never written to `dq_dt_nonphys` / `dqvtag_dt_nonphys`
(always 0 in the SCM). That is why the forcing drying looked like an "unrecorded" real-qv
loss in budget checks.

---

## 2. Thompson vapor floor: floor water gets the run's initial tagged fraction

Thompson clips `qv = max(1e-10, qv)`. This water is created from nothing and has no source,
so it cannot be mirrored with a source fraction. The old mirror used `tg1d/qv1d`, which is
roundoff/roundoff when the level is effectively empty, and gave tag/real up to 70 or
negative values. New rule: floor water is treated like the initial water of the run.

| init mode | initial water | `qvtag_floor_frac` |
|---|---|---|
| 0 | untagged | 0 |
| 1 (uniform tracer test) | n/a | 0 |
| 2 | fully tagged | 1 |

This uses no ratio and no threshold. Mode 2 stays exact. It is a hook for isotopes: later,
one value per tracer (e.g. the initial isotope ratio).

**Backups:** `*.pre_floorfrac.bak` for every file below.

| File | Change |
|---|---|
| `scm/src/GFS_typedefs.F90` | `real(kind=kind_phys) :: qvtag_floor_frac` after `tagging` (l.1236); `Model%qvtag_floor_frac = 0.0` after `Model%tagging = tagging` (l.5357) |
| `scm/src/GFS_typedefs.meta` | new entry `[qvtag_floor_frac]`, `standard_name = tagged_fraction_of_microphysics_vapor_floor_water`, real, kind_phys, `()` (l.5758) |
| `scm/src/scm.F90` | after the tag init block (l.~226): `qvtag_floor_frac = 1.0` if `qv_tag_init_mode == 2`, else `0.0` |
| `MP/Thompson/mp_thompson.meta` | new optional `intent=in` argument `[qvtag_floor_frac]` after `[nqvtag]` (l.989) |
| `MP/Thompson/mp_thompson.F90` | `use module_mp_thompson, only : tg_floor_frac` (l.16); argument added after `nqvtag` (l.388); declaration (l.459); after the `ltag` setup: `tg_floor_frac = 0; if (present(qvtag_floor_frac)) tg_floor_frac = qvtag_floor_frac` (l.710-711) |
| `MP/Thompson/module_mp_thompson.F90` | module var `real(wp), public :: tg_floor_frac = 0.0_wp` (l.68); floor line (l.4567): `... + (1.E-10 - tg_x)*tg_floor_frac` (was `*tg_f(1)`) |

`.meta` changes need cmake + make. The generated `*_phys_ts_cap.F90` files pass
`qvtag_floor_frac=physics%model%qvtag_floor_frac` in all six Thompson suites (checked).

Leftover: l.4564-4565 still compute `tg_f(1)`, which the floor line no longer uses
(harmless). The rate fractions at l.3397-3398 are unchanged.

---

## 3. H2O photochemistry: tag gets the net source

**File:** `ccpp/physics/physics/photochem/module_h2ophys.F90`, l.239-240
**Backup:** `module_h2ophys.F90.pre_partA.bak`

```fortran
tg_spos = max(pltc(iCol,1) + pltc(iCol,3)*temp, 0.0_kind_phys)
tg_sneg = min(pltc(iCol,1) + pltc(iCol,3)*temp, 0.0_kind_phys)
```

(Before: the positive and negative parts of P and C/tau were split separately.)

**Why:** with the split, `tag <= real` breaks whenever the negative sink exceeds the water
present. With the net source, a positive source is tagged in full and a negative one is
removed at the tag fraction, so `tag_new = f*h2o_new`. This was **not** the cause of either
issue: the climatology at 68-100 hPa has tau ~1e9 s and a tiny positive net source.
It supersedes the 2026-09-28 gross-production rule. Keep or revert (open decision).

---

## 4. Reverted / removed (no limiters, no debug left from this work)

- The `tg_f(1) = max(0., min(1., ...))` cap at both Thompson vapor-fraction lines was reverted
  to `tg1d(k,1)/qv1d(k)` (backup `module_mp_thompson.F90.pre_cleanup.bak`).
- Temporary prints DBGFL (Thompson) and DBGPH (`GFS_photochemistry.F90`) were removed
  (backups `*.pre_cleanup.bak`, `*.pre_dbgfl2.bak`, `*.pre_dbgph.bak`).
- Older debug prints are still present and were not touched: P1/P2 in `satmedmfvdifq.F`,
  the print at its l.432, DBGM2 in `mp_thompson.F90`, PHDBG in `GFS_photochemistry.F90`.

---

## How the cause was found (short)

1. h2ophys tag formula → partial improvement only (max tag/real 186 → 3.8).
2. A run with `h2o_phys = .false.` still had the same real-qv residual, so photochemistry
   was not the cause.
3. DBGFL at MP entry and DBGPH at photochemistry entry: real was already below the tag
   before photochemistry, and the tag was untouched (exactly 1e-10).
4. The PBL code (diffusion, mass flux, negative-vapor borrowing) treats real and tag
   identically.
5. Suite order: forcing runs first in each step → the 1e-9 guard in `scm_forcing.F90`.
6. After the forcing fix and the cap removal, levels 70-77 showed the floor
   roundoff/roundoff fraction → floor-fraction rule.

---

## Tests (mode 0, forcing on, `h2o_phys = .true.`)

1e-15 scan (`tag/real > 1+1e-6` or `< -1e-6` wherever qv > 1e-15):

| Case | Suite | Length | Result |
|---|---|---|---|
| TWP-ICE | `SCM_GFS_v17_p8_ugwpv1` | 110 h | clean |
| ARM SGP summer 1997 | `SCM_GFS_v17_p8_ugwpv1_ps` | 270 h | clean (incl. model top 124-126) |

Troposphere (qv > 1e-7), TWP-ICE new vs the old 594 h run: max |frac_new − frac_old| = 0.093.
Where this occurs (near the tropopause or lower) has not been checked yet.

---

## Open items

- Locate the 0.093 tropospheric difference (read-only percentile/level check).
- 3-day mode 2 check (tests the `qvtag_floor_frac = 1` path) before the next mode 2 use.
- Lower `THR` in `plot_tag_science.py` (v1) so the must-check covers near-zero values.
- h2ophys tag rule: keep the net source or revert to the gross split.
- Isotopes later: make `qvtag_floor_frac` per tracer (initial isotope ratio). Mask delta
  where qv is near the 1e-10 floor.
- Then Part B (tagged precipitation outputs).


# Part B: CESM / iCESM-style precipitation outputs for the water tag (CCPP-SCM)

Date: 2026-10-08
Repo: `/glade/work/asiyab/SWI_NCAR/UFS_versions_dev/ccpp-scm_dev`
Suites tested: `SCM_GFS_v17_p8_ugwpv1` (caps for the `_ps` suite and the other Thompson / SAMF suites were also regenerated)

This file documents the precipitation output plumbing added today: what the new fields are, how they
are computed, every file that was changed, the two bugs that were found and fixed, the tests and their
results, and what is still open.

---

## 1. New output fields (all in `output.nc`, m s-1 liquid water equivalent)

Real water, standard CAM names:

| Field | Meaning | Computed as (per physics step, then / dt) |
|---|---|---|
| `PRECC` | convective precipitation (rain + snow) | `rainc` (deep + shallow SAMF, with `frain`) |
| `PRECSC` | convective snow | `rainc` if `tsfc < 273.15 K`, else 0 |
| `PRECL` | large-scale (Thompson) precipitation, all phases | `frain * rain1` (`rain1` = `prcpmp`) |
| `PRECSL` | large-scale snow + graupel + ice | `frain * (snow0 + ice0 + graupel0)` |
| `PRECT` | total | `tprcp` (= `PRECC + PRECL`) |

Tagged water, iCESM names, built from the tag name in the namelist (default `COL`):

| Field | Meaning | Computed as |
|---|---|---|
| `PRECRC_COLr` | tagged convective rain | `frain*(raincd_tag + raincs_tag)` if `tsfc >= 273.15 K`, else 0 |
| `PRECSC_COLs` | tagged convective snow | `frain*(raincd_tag + raincs_tag)` if `tsfc < 273.15 K`, else 0 |
| `PRECRL_COLR` | tagged large-scale rain | `frain * rainmp_tag` |
| `PRECSL_COLS` | tagged large-scale snow + graupel + ice | `frain * snowmp_tag` |

Tagged total = sum of the four (computed in analysis, as iCESM users do).
Lowercase `r`/`s` = convective, uppercase `R`/`S` = large-scale (iCESM convention).

The convective rain/snow split uses exactly the rule GFS already uses for Thompson in
`GFS_MP_generic_post` (`crain`/`csnow` by surface skin temperature, `lsm /= lsm_ruc` branch), applied
identically to real and tagged convective precipitation.

Also written (test points, m per physics step): `dcnv_prcp_tag_inst`, `scnv_prcp_tag_inst`
(tagged counterparts of `dcnv_prcp_inst`, `scnv_prcp_inst`). These can be removed later.

### Tag definition in the case namelist

New settings in `&case_config` (defaults shown; nothing needs to be added to existing namelists):

```
qv_tag_names(1)   = 'COL'       ! used in field names: PRECRC_<name>r, ...
qv_tag_sources(1) = 'surface'   ! surface evaporation in this column
```

Both are lists (10 entries) so more tags can be listed later. For now the run stops with a clear message
if more than one tag is listed or a source other than `surface` is given. The tag name and source are
written into the long_name of each tagged field. Tip for future names: use uppercase (e.g. `ATLW`), so
the convective/large-scale case convention of the last letter stays readable.

---

## 2. How the data flows

```
samfdeepcnv  tg_rn --rn_tag-->  Interstitial%raincd_tag --+
samfshalcnv  tg_rn --rn_tag-->  Interstitial%raincs_tag --+
                                                          |
mp_thompson (column) tg_ppt(4)                            |
  -> mp_gt_driver  tg_pcp_acc (sum over inner steps)      |
  -> tgpcpv(:,:,2) -> mp_thompson.F90 wrapper (mm -> m)   |
  -> Interstitial%rainmp_tag, snowmp_tag -----------------+
                                                          v
                        GFS_MP_generic_post: PRECC..PRECSL, tagged PREC* (m per step)
                                                          v
                        scm_output.F90: divide by dt, write with CESM/iCESM names
```

---

## 3. Changes by file

All files were backed up first as `<file>.pre_precip.bak` (no git). Rebuild with cmake + make after any
`.meta` change.

### 3.1 Deep convection: `ccpp/physics/physics/CONV/SAMF/samfdeepcnv.f` and `.meta`

`tg_rn` (tagged convective rain) was already built and evaporated alongside `rn`, but was local and
discarded.

- New optional argument `rn_tag(:)` (intent out), after `otsptflag` and before `errmsg`.
- `rn_tag(:) = 0.` right after `if (present(nqvtag)) tg_n = nqvtag` (covers the early `totflg` return).
- After the final reset `if(rn(i) < 0. .and. .not.flg(i)) rn(i) = 0.`:
  `if(rn(i) <= 0.) tg_rn(i) = 0.` (mirror of the real reset that follows) and
  `if (present(rn_tag)) rn_tag(i) = tg_rn(i)`.
- `.meta`: `[rn_tag]`, standard name
  `lwe_thickness_of_deep_convective_precipitation_amount_of_tagged_water`, before `[errmsg]`.

### 3.2 Shallow convection: `ccpp/physics/physics/CONV/SAMF/samfshalcnv.f` and `.meta`

Same four pieces. The tag reset is placed **before** the real line
`if(rn(i) < 0. .or. .not.flg(i)) rn(i) = 0.` (that line changes `rn`, and zeroes it even when positive
if `flg` is false); the copy `rn_tag(i) = tg_rn(i)` follows it.
`.meta`: `[rn_tag]`, standard name
`lwe_thickness_of_shallow_convective_precipitation_amount_of_tagged_water`.

### 3.3 Thompson column routine and driver: `ccpp/physics/physics/MP/Thompson/module_mp_thompson.F90`

Column routine `mp_thompson`:
- New argument `tg_ppt(4)` (intent inout) after `pptice`: tagged surface precip, 1 = rain, 2 = snow,
  3 = graupel, 4 = ice. Local scalar `tg_psfc`.
- Rain: `precipt=tg_psfc` added to the rain `semi_lagrange_sedim` call;
  `tg_ppt(1) = tg_ppt(1) + tg_psfc` right after `pptrain = pptrain + rainsfc`.
- Graupel: same with `graulsfc` and `tg_ppt(3)`.
- Ice: at the end of each tag sedimentation substep,
  `if (tg_rr(kts).gt.R1*rr_min) tg_ppt(4) = tg_ppt(4) + tg_sd(kts)*DT*onstep(2)`
  (exact mirror of the real `pptice` line; `tg_rr` is the copy of real `ri` with the same R1 floors).
- Snow: same with `tg_ppt(2)` and `onstep(3)`.
- `semi_lagrange_sedim` already had the optional `precipt` (sum of `tfr(k)*` the real rain-out pieces);
  no change there.

Driver `mp_gt_driver`:
- New optional argument `tgpcpv(ims:ime, jms:jme, 2)` after `qtag`
  (1 = tagged rain, 2 = tagged snow + graupel + ice, mm per physics step like `RAINNCV`).
- Local `tg_ppt(4)`, zeroed with `pptrain`...`pptice` each inner step and passed in the column call.
- Local `tg_pcp_acc(its:ite, jts:jte, 2)`, zeroed with `pcp_*` before the inner loop
  (`do it = 1, ndt`) and summed next to `pcp_ra`...`pcp_ic` every inner step.
- `tgpcpv` is set after the `SR(i,j)` line every inner step (the `ndt = 1` case), and overwritten from
  `tg_pcp_acc` inside `if (ndt>1 .and. it==ndt)` right after `RAINNCV(i,j) = RAINNC(i,j)`, exactly
  like the real per-step totals. See bug 2 below.

### 3.4 Thompson CCPP wrapper: `ccpp/physics/physics/MP/Thompson/mp_thompson.F90` and `.meta`

- New optional arguments `rainmp_tag(:)`, `snowmp_tag(:)` (intent inout) after `qvtag_floor_frac`.
- Local `tg_pcp(1:ncol,2)`, zeroed with the `delta_*_mp`.
- `tgpcpv=tg_pcp` added to all three `mp_gt_driver` calls (aerosol-aware, MERRA2, default).
- After the real `rain = rain + ...` line, the same mm -> m conversion:
  `rainmp_tag = rainmp_tag + max(0.0, tg_pcp(:,1)/1000.0)`, same for `snowmp_tag` with `tg_pcp(:,2)`.
- `.meta`: `[rainmp_tag]` (`lwe_thickness_of_explicit_rain_amount_of_tagged_water`) and `[snowmp_tag]`
  (`lwe_thickness_of_explicit_frozen_precipitation_amount_of_tagged_water`), after `[qvtag_floor_frac]`.

### 3.5 `ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_MP_generic_post.F90` and `.meta`

- 12 new optional arguments after `use_lake_model`, before `errmsg`:
  inputs `raincd_tag, raincs_tag, rainmp_tag, snowmp_tag`;
  outputs `precc, precsc, precl, precsl, precrc_tag, precsc_tag, precrl_tag, precsl_tag`.
- One compute block just before `if_save_fields: if (lssav) then` (all inputs final there), using the
  formulas in section 1.
- `.meta`: 12 entries in the same order, before `[errmsg]`.

New standard names (all `_cesm_diag` / `_of_tagged_water`):

| Variable | Standard name |
|---|---|
| `precc` | `lwe_thickness_of_convective_precipitation_amount_cesm_diag` |
| `precsc` | `lwe_thickness_of_convective_snow_amount_cesm_diag` |
| `precl` | `lwe_thickness_of_large_scale_precipitation_amount_cesm_diag` |
| `precsl` | `lwe_thickness_of_large_scale_snow_amount_cesm_diag` |
| `precrc_tag` | `lwe_thickness_of_convective_rain_amount_of_tagged_water` |
| `precsc_tag` | `lwe_thickness_of_convective_snow_amount_of_tagged_water` |
| `precrl_tag` | `lwe_thickness_of_large_scale_rain_amount_of_tagged_water` |
| `precsl_tag` | `lwe_thickness_of_large_scale_snow_amount_of_tagged_water` |

### 3.6 Host variables: `scm/src/CCPP_typedefs.F90` and `.meta`

12 new 1-D Interstitial arrays (m per step), each declared, allocated, deallocated and reset in
`gfs_interstitial_reset` (the same subroutine that resets `prcpmp`, needed because `rainmp_tag` /
`snowmp_tag` are added to, like `prcp`):
`raincd_tag, raincs_tag, rainmp_tag, snowmp_tag, precc, precsc, precl, precsl, precrc_tag, precsc_tag,
precrl_tag, precsl_tag`. Placed after `raincs` / before `rainmcadj` in the `.meta`.

### 3.7 SCM state and input: `scm/src/scm_type_defs.F90`, `scm/src/scm_input.F90`

- `scm_state`: `n_qv_tags`, `qv_tag_names(10)`, `qv_tag_sources(10)` (next to `qv_tag_init_mode`).
- `scm_input.F90`: same-named locals, added to the `case_config` namelist, defaults `'COL'` /
  `'surface'`, copied to `scm_state` after `qv_tag_init_mode` with the one-tag / surface-only check.

### 3.8 Output: `scm/src/scm_output.F90`

- `dcnv_prcp_tag_inst`, `scnv_prcp_tag_inst` defined next to `scnv_prcp_inst` and written in
  `output_append_interstitial_inst`.
- `PRECC`, `PRECSC`, `PRECL`, `PRECSL`, `PRECT` (always) and the four tagged fields
  (inside `if (scm_state%tagging)`) defined at the end of `output_init_state` (it has `scm_state`;
  `output_init_interstitial` does not) and written in `output_append_interstitial_inst` as amount /
  `scm_state%dt`. `PRECT` is `Sfcprop%tprcp / dt`.
- Local `character(len=64) :: tgn` in both subroutines.

---

## 4. Bugs found and fixed

**Bug 1: tagged convective rain not reset with real rain (deep and shallow).**
At the end of both SAMF schemes, real `rn` is set to 0 in some cases (negative after evaporation, or
`flg` false in shallow), but `tg_rn` was not. `tg_rn` is not used after that point, so this did **not**
affect the tags in the column; it only mattered for the new output. Fixed by the mirror lines in 3.1/3.2.

**Bug 2: tagged Thompson surface precipitation kept only the last inner step.**
With `dt_inner = 150 s` and a 600 s physics step, Thompson runs `ndt = 4` inner steps. The driver
replaces the per-inner-step `RAINNCV` (and `SNOWNCV`, `ICENCV`, `GRAUPELNCV`) with the 4-step total at
`it == ndt`; the tagged amount was set inside the inner loop only, so it held the last 150 s.
Symptom in mode 2: `PRECRL_COLR / (PRECL - PRECSL)` = 0.00, 0.99, 0.68, 0.64, 0.78 at the 5 rainy hours
(0 when it rained only in earlier inner steps), while every tagged species in the column stayed exactly
equal to real. A temporary print in the rain sedimentation loop showed every iteration matched exactly,
which pointed to the inner-step summation. Fixed with `tg_pcp_acc` (section 3.3). Applies to rain and to
snow / graupel / ice.

---

## 5. Tests

| Run | Setup | Result |
|---|---|---|
| Convection test | TWP-ICE, mode 2, forcing off, 3 days | `dcnv/scnv_prcp_tag_inst` = real exactly (max diff 0) |
| Full test | mode 2, forcing off, 8 days | all tags = real in the column; convective PREC exact; `PRECRL_COLR` ~66% (bug 2) |
| After fix | mode 2, forcing off, 6 days | `PRECRL_COLR / (PRECL - PRECSL)` = 1.000000 at all rainy hours |
| Science run | TWP-ICE, mode 0, forcing on, 594 h | all checks pass (below) |

Checks in every test: `PRECT = PRECC + PRECL` (3e-8, float roundoff) and `= tprcp_rate_inst` (exact);
`mp_prcp_inst / PRECL` = 600 s (one constant, confirms the m/s conversion).

Mode 0, forcing on, 594 h:

| | Rainy hours | Real total | Tagged fraction | tag > real | tag < 0 |
|---|---|---|---|---|---|
| Convective rain | 280 | 208.8 mm | 0.319 | 0 | 0 |
| Convective snow | 0 | 0 | - | 0 | 0 |
| Large-scale rain | 318 | 40.6 mm | 0.060 | 0 | 0 |
| Large-scale snow | 0 | 0 | - | 0 | 0 |

Reading: about a third of the convective rain and about 6% of the large-scale rain come from water
evaporated in this column during the run (mode 0, tag starts at 0), consistent with convection drawing
on boundary-layer moisture and Thompson rain forming in air dominated by advected (untagged) water.

Test notes:
- In `twpice.nml`, `debug_disable_forcing = .true.` means forcing **off**.
- `run_scm.py` hides the model's own screen output; use `-v` to see prints.
- Backup of the namelist before the tests: `scm/etc/case_config/twpice.nml.pre_precip_test.bak`
  (now restored to mode 0, forcing on).

---

## 6. Open items

1. **Snow fields not exercised.** `PRECSC_COLs` needs `tsfc < 273.15 K`; `PRECSL_COLS` needs snow,
   graupel or ice at the surface. TWP-ICE has neither. Run a cold-season case in mode 2, forcing off:
   `PRECSC_COLs = PRECSC` and `PRECSL_COLS = PRECSL` must hold exactly.
2. **RUC LSM branch:** the convective rain/snow split follows the `lsm /= lsm_ruc` rule; with RUC, GFS
   uses `srflag = sr` instead and the split here would not match. Not relevant for the current suites.
3. **One tag only.** Multiple tags (e.g. `COL` + `ADV`, or regions such as `ATLW` in the 3D model) need
   more tracer blocks, a loop over tags in every scheme, and 2-D `(im, ntag)` precipitation arrays.
   The namelist lists and the name-based output are already in place for that.
4. **Isotopes later:** each isotopologue becomes one more tracer name with the same four fields
   (`PRECRC_<name>r`, `PRECSC_<name>s`, `PRECRL_<name>R`, `PRECSL_<name>S`).
5. **Cleanup (optional):** remove the test outputs `dcnv_prcp_tag_inst`, `scnv_prcp_tag_inst`.
6. **Plots:** extend `plot_tag_rain.py` to plot each real `PREC` field with its tagged counterpart and
   the tagged fraction over time.

---

## 7. Backups and how to revert

`<file>.pre_precip.bak` (state before today's Part B edits) for:
`samfdeepcnv.f`, `samfshalcnv.f`, `samfdeepcnv.meta`, `samfshalcnv.meta`, `module_mp_thompson.F90`,
`mp_thompson.F90`, `mp_thompson.meta`, `GFS_MP_generic_post.F90`, `GFS_MP_generic_post.meta`,
`scm/src/CCPP_typedefs.F90`, `scm/src/CCPP_typedefs.meta`, `scm/src/scm_output.F90`,
`scm/src/scm_type_defs.F90`, `scm/src/scm_input.F90`.

Also: `module_mp_thompson.F90.pre_dbgpr.bak` (before the temporary print; the print is removed) and
`module_mp_thompson.F90.pre_innerfix.bak` (before the bug 2 fix).

To revert all of Part B: copy each `.pre_precip.bak` back over its file, then cmake + make.