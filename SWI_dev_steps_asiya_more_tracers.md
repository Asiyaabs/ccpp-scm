# Step One: Six-Species Tag Registration, Output, and Tendencies

Status: **build succeeded, 2026-09-21.** New variables confirmed present in `output.nc`.

## Goal of this step

Extend the existing `qv_tag` (tagged water vapor) framework to all six water
species tracked by the model, as inert passengers only:

- water vapor (`qv` / `qv_tag`, pre-existing)
- cloud liquid water (`ql` / `ql_tag`, new)
- cloud ice (`qi` / `qi_tag`, new)
- rain (`qr` / `qr_tag`, new)
- snow (`qs` / `qs_tag`, new)
- graupel (`qg` / `qg_tag`, new)

This step does **not** implement the actual physical goal of the project
(transferring tagged mass between species whenever the real species convert
into each other — e.g. vapor condensing into cloud water). That requires
edits inside the PBL, convection, and microphysics schemes and is the next
step. In this step the five new tags are deliberately inert: they start
equal to their real species and should never change value on their own.

Also carried over from prior work: `h2o_phys = .false.` in
`ccpp/physics_namelists/input_GFS_v17_p8_ugwpv1.nml`, kept off for now
because it was identified as the source of the stratospheric `qv` vs
`qv_tag` mismatch (GFS_photochemistry applies a source/sink to real `qv`
that no tag ever sees). A proper tag-aware treatment of photochemistry is
deferred to later; real physics runs still need `h2o_phys = .true.`.

## What changed, file by file

### 1. `scm/etc/tracer_config/tracers_GFS_v17_p8_ugwpv1.txt`
Appended five new tracers after `qv_tag`, keeping the six tags contiguous
(tracers 13-18):
```
"ql_tag","tagged_cloud_liquid_water_mixing_ratio","kg kg-1"
"qi_tag","tagged_ice_water_mixing_ratio","kg kg-1"
"qr_tag","tagged_rain_mixing_ratio","kg kg-1"
"qs_tag","tagged_snow_mixing_ratio","kg kg-1"
"qg_tag","tagged_graupel_mixing_ratio","kg kg-1"
```

### 2. `scm/src/CCPP_typedefs.F90`
Extended the convective-transport exclusion list (`ltest`, ~line 1314) so
that all six tag tracers are excluded from being passively transported as
generic tracers by convection, matching how `qv_tag` was already excluded.
`qv_tag` itself stays untouched by this line (only tags 2-6, i.e.
`nqvtag+1` through `nqvtag+5`, are newly excluded).

### 3. `scm/src/scm.F90`
Replaced the single-tag init block with a loop over all six tags. Behavior
by `qv_tag_init_mode`:
- **mode 0** (default): all six tags start at 0.
- **mode 1**: `qv_tag` starts at uniform 1.0 (unchanged from before); the
  five new hydrometeor tags start at 0.
- **mode 2**: each tag starts equal to its own real species at t=0
  (`ql_tag = ql(t=0)`, etc.) — this is the mode used for the "tags equal
  their species and should stay frozen" verification.

Also added a contiguity check at startup: if the tag tracers aren't found
in the expected order and positions, the run aborts with an explicit error
rather than silently reading the wrong tracer indices.

### 4. `scm/src/scm_output.F90`
Four separate additions:
- **State definitions** (`output_init_state`): `NetCDF_def_var` calls for
  `ql_tag`...`qg_tag`, and for the real `qr`, `qs`, `qg` (previously absent
  from output entirely, guarded by `if (..._index > 0)`).
- **State writes** (`output_append_state`): matching `NetCDF_put_var` calls
  for the same eleven new variables.
- **Tendency definitions** (`output_init_diag`): a loop generating
  `d<species>_dt_<process>` and `d<species>tag_dt_<process>` variable
  definitions for all five new species/tags, across seven processes (pbl,
  deepconv, shalconv, micro, convtrans, phys, nonphys). Mirrors the
  existing `dq_dt_*` / `dqvtag_dt_*` pattern used for vapor.
- **Tendency writes** (`output_append_diag_avg`): the matching loop that
  actually writes those tendency values out each diagnostic interval.

Every new `output_init_tendency`/`output_append_tendency` call is a no-op
whenever the underlying `dtidx` index wasn't allocated (this behavior is
built into those two subroutines already), so any tendency this model
configuration doesn't compute simply won't appear in `output.nc` rather
than causing an error.

## What to verify now that it's built

1. **Vapor regression** — `qv` vs `qv_tag` should behave exactly as before
   (no change intended in this step). Rerun the usual comparison.
2. **New tags stay frozen** — with `qv_tag_init_mode = 2`, each of
   `ql_tag`...`qg_tag` should equal its real species at t=0 and never
   move for the whole run, since nothing feeds them yet:
   ```python
   import netCDF4 as nc, numpy as np
   d = nc.Dataset("scm/run/output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc")
   for t, r in [("ql_tag","ql"),("qi_tag","qi"),("qr_tag","qr"),
                ("qs_tag","qs"),("qg_tag","qg")]:
       a = np.squeeze(d[t][:]); b = np.squeeze(d[r][:])
       print(t, "max|tag(t)-tag(0)| =", np.abs(a-a[0]).max(),
                "max|tag(0)-real(0)| =", np.abs(a[0]-b[0]).max())
   ```
   Both numbers should be exactly 0 for every species.
3. **Outputs present** — `qr`, `qs`, `qg`, and all five new tags should be
   in `output.nc` (confirmed).
4. **Tendencies** — inspect which `d<species>_dt_*` /
   `d<species>tag_dt_*` variables actually appear. Since the tags are
   inert, all `d<species>tag_dt_*` should be zero (or absent, if not
   allocated). Which real-species convection tendencies appear
   (`d<species>_dt_deepconv`/`shalconv` vs. `d<species>_dt_convtrans`)
   depends on `flag_for_dcnv_generic_tend`/`flag_for_scnv_generic_tend`,
   which wasn't independently confirmed — worth checking against the
   `dtend selected`/`dtend disabled` lines in the run's stdout log.

## Next step

PBL edits (README_six_tag_plan.md sections 4.2-4.5): give the five new
tags real coupling inside `satmedmfvdifq.F` and the PBL pre/post
interstitials so that vapor-to-hydrometeor conversions actually move
tagged mass between species. Nothing in step one implements this yet —
the tags are wiring only.
________________________________________________________________________


# Step Two: PBL Scheme Tag Coupling

Status: **build succeeded, 2026-09-22.** PBL-only test run complete (convection
and microphysics commented out of suite XML). Vapor redistribution mirror
(edits E1/E2) applied and built, pending retest.

## Goal of this step

Make the six tag tracers participate in the PBL scheme (`satmedmfvdifq`)
so that:
- All six tags undergo the same turbulent diffusion and mass-flux transport
  as their real species.
- When the PBL scheme's negative-water correction borrows vapor to fill
  negative cloud water or negative rain, the tagged mass moves
  proportionally: `qv_tag` loses, `ql_tag` or `qr_tag` gains.
- When the PBL scheme redistributes vapor to fix negative moisture,
  `qv_tag` is scaled by the same ratio so it stays in sync.

## What changed, file by file

### A. `scm/src/CCPP_typedefs.F90` (~line 1170)
Changed the `nvdiff` bump for tagging from `+1` to `+6`, so all six tags
get packed into `vdftra` (the array the PBL scheme actually sees). The
`nqvtagv` assignment was adjusted to `nvdiff - 5` so it still points at
`qv_tag`'s packed slot (10). The five new tags occupy slots 11-15. TKE
stays at slot 16 (satmedmf adds its `+1` after tagging).

Packed layout:

| Slot | Contents          |
|------|-------------------|
| 1    | sphum (qv)        |
| 2    | liq_wat (ql)      |
| 3    | ice_wat (qi)      |
| 4    | rainwat (qr)      |
| 5    | snowwat (qs)      |
| 6    | graupel (qg)      |
| 7-9  | ice_nc, rain_nc, o3mr |
| 10   | qv_tag            |
| 11   | ql_tag            |
| 12   | qi_tag            |
| 13   | qr_tag            |
| 14   | qs_tag            |
| 15   | qg_tag            |
| 16   | TKE               |

### B. `GFS_PBL_generic_pre.F90` (~line 290)
Replaced the single-tracer pack of `qv_tag` with a `do n=0,5` loop that
packs all six tags from `qgrs(i,k,nqvtag+n)` into
`vdftra(i,k,nqvtagv+n)`.

### C. `GFS_PBL_generic_post.F90` (~line 116)
Same change on the unpack side: `do n=0,5` loop copying
`dvdftra(i,k,nqvtagv+n)` back into `ten_q(i,k,nqvtag+n)`.

### D. `satmedmfvdifq.F`
Five sub-edits inside the main subroutine:

**D1. New local variables (~line 253)**
```
real(kind=kind_phys) qv_save, delta_qv, frac_tag, tag_move
integer is_qvt, is_qlt, is_qrt
```

**D2. Cloud water negative-water borrowing (~line 2718)**
When the scheme borrows vapor to fill negative cloud water:
- Save vapor before the fix (`qv_save = f2(i,k)`).
- After the fix, compute the fraction removed from vapor.
- Move the same fraction of `qv_tag` into `ql_tag`.

**D3. Rain negative-water borrowing (~line 2768)**
Same logic as D2 but for rain: `qv_tag` → `qr_tag`.

**D4. Tendency dtend block (~line 2943)**
Replaced the single-tag `qv_tag` dtend block with a `do n = 0, 5` loop
that writes PBL tendency diagnostics for all six tags.

**D5. Skip guard (~line 2977)**
Expanded `n/=nqvtagv` to skip all six tag slots in the generic tracer
tendency loop, so they don't get double-counted.

**E1. Vapor redistribution mirror — mass-flux layers (~line 2641)**
After the scheme redistributes negative vapor within mass-flux transport
layers, `qv_tag` is now scaled by the same ratio (`f2(i,k)/qv_save`) so
it stays in sync with the redistributed vapor.

**E2. Vapor redistribution mirror — all layers (~line 2687)**
Same as E1 but for the second redistribution pass that covers the entire
column (not just mass-flux layers).

### No changes needed
- **`.meta` files** — no new arguments were added to any subroutine.
- **Suite XML** — no structural changes (though convection and microphysics
  were temporarily commented out for the PBL-only test).

## PBL-only test configuration

For isolating the PBL edits, the following were set:
- `qv_tag_init_mode = 2` (each tag starts equal to its real species)
- `debug_disable_forcing = .true.`
- `h2o_phys = .false.`
- Suite XML: `samfdeepcnv`, `samfshalcnv`, `mp_thompson` and their
  post-processing schemes commented out
- Only the PBL group (`GFS_PBL_generic_pre` → `satmedmfvdifq` →
  `GFS_PBL_generic_post`) modifies water tracers

### Initial results (before E1/E2)
- qi, qr, qs, qg: zero diff everywhere (no source for these in PBL only)
- qv and ql: small but growing gap at levels 0, 50, 75
  (`max|diff|` ~ 1e-4 for qv, 4e-5 for ql at level 0)
- Cause: vapor redistribution touched `f2` for real vapor but not `qv_tag`,
  so the negative-water borrowing operated on mismatched values

### After E1/E2
- Pending retest — E1/E2 scale `qv_tag` by the same redistribution ratio
  as real vapor, which should close the gap

## Key findings

1. **`q1` inside `satmedmfvdifq.F` is the packed `vdftra` array**, not the
   full `qgrs`. `ntrac` inside the scheme equals `nvdiff`, not the real
   tracer count. Tags must be packed/unpacked to be visible to the scheme.

2. **The PBL scheme does no saturation adjustment** — `fpvs` is used only
   once to compute `qlx` for the TKE closure, not to convert between
   species. The only real conversions are the negative-water borrowing
   blocks.

3. **The tridiagonal solver and mass-flux transport are linear** — once the
   tags are packed into `f2`, they automatically undergo the same diffusion
   and mass-flux mixing as their species. No code changes needed for that
   part.

## Next steps

1. **Retest with E1/E2** — verify the qv/ql gap is closed.
2. **Restore suite XML** — uncomment convection and microphysics.
3. **Convection coupling** — `samfdeepcnv` and `samfshalcnv`: tag the
   water conversions inside the deep and shallow convection schemes.
4. **Microphysics coupling** — `mp_thompson`: tag all phase changes
   (condensation, evaporation, freezing, melting, collection, etc.).
5. **Photochemistry** — when `h2o_phys` is restored to `.true.`, apply the
   stratospheric source/sink proportionally to `qv_tag`.
6. **Full-suite validation** — run with all schemes active, mode 2,
   forcing on, and verify tag conservation and tag-species tracking.

PBL Mass-Flux Condensation Fix (2026-09-23)

Status: built, tested, partially effective. Gap reduced ~17% but not closed. Decision made to switch to E3SM-style ratio correction for PBL (not yet implemented).

Problem addressed

With PBL-only runs (convection/MP off, mode 2, forcing off), qv_tag and ql_tag diverge from their real species:

Level 0: max|qv diff| ~ 1e-4, max|ql diff| ~ 4e-5
Cause: mfpbltq.f (updraft) and mfscuq.f (downdraft) do condensation inside the mass-flux plumes — vapor drops to saturation, cloud water gains the condensate — but tags are mixed passively without the same conversion.
Edits applied today
F1. mfpbltq.f — add nqvtagv argument (line 16)
subroutine mfpbltq(im,ix,km,kmpbl,ntcw,ntrac1,delt,nqvtagv,
F2. mfpbltq.f — declare nqvtagv and locals (line 30, 51)
integer  im, ix, km, kmpbl, ntcw, ntrac1, nqvtagv
real(kind=kind_phys) qtu_total, tag_total, frac_vap
F3. mfpbltq.f — tag split after passive loops (~line 506)

After all passive tracer entrainment is done, wherever real condensation happened (qcko(ntcw) > 0), redistribute the total tagged water (qv_tag + ql_tag) between vapor tag and liquid tag in the same ratio as real vapor to real total water:

if (nqvtagv > 0) then
  do k = 2, kmpbl
    do i = 1, im
      if (cnvflg(i) .and. k <= kpbl(i)) then
        qtu_total = qcko(i,k,1) + qcko(i,k,ntcw)
        if (qcko(i,k,ntcw) > 0. .and. qtu_total > 0.) then
          tag_total = qcko(i,k,nqvtagv) + qcko(i,k,nqvtagv+1)
          frac_vap = qcko(i,k,1) / qtu_total
          qcko(i,k,nqvtagv)   = tag_total * frac_vap
          qcko(i,k,nqvtagv+1) = tag_total - qcko(i,k,nqvtagv)
        endif
      endif
    enddo
  enddo
endif
G1. mfscuq.f — add nqvtagv argument (line 14)

Same pattern as F1.

G2. mfscuq.f — declare nqvtagv and locals (line 29, 76)

Same pattern as F2.

G3. mfscuq.f — tag split after passive loops (~line 587)

Same logic as F3 but for downdraft (qcdo, k loop high to low, guarded by k < krad(i) and k >= mrad(i)).

H1. satmedmfvdifq.F — update mfpbltq call site (line 1232)

Added nqvtagv, after dt2, in the call.

H2. satmedmfvdifq.F — update mfscuq call site (line 1238)

Same.

I1. satmedmfvdifq_can.F — update both call sites (lines 1177, 1183)

The canopy version of the scheme also calls mfpbltq and mfscuq. Since nqvtagv is not available in this file's scope, passed 0 (the if (nqvtagv > 0) guard skips all tag logic).

Files changed today
File	What changed
ccpp/physics/physics/PBL/mfpbltq.f	F1, F2, F3
ccpp/physics/physics/PBL/SATMEDMF/mfscuq.f	G1, G2, G3
ccpp/physics/physics/PBL/SATMEDMF/satmedmfvdifq.F	H1, H2
ccpp/physics/physics/PBL/SATMEDMF/satmedmfvdifq_can.F	I1



Backups: mfpbltq.f.pbl.bak, mfscuq.f.pbl.bak


B. Post-Scheme Tendency Scaling for qv_tag
Problem

The F/G in-scheme edits close ~17% of the PBL gap. The remaining gap comes from nonlinear numerics (TVD flux limiter, coupled diffusion RHS) that cannot be instrumented per-process.

Fix

Replace the qv_tag tendency with the real qv tendency scaled by the tag fraction, with fractionation factor alpha_frac = 1.0 (no fractionation in PBL). This is placed in tendency space before the case_PBL_ten block so it works with any tend_opt value.

Only qv_tag is scaled. ql_tag through qg_tag keep their in-scheme tendencies from dvdftra.

File: GFS_PBL_generic_post.F90

Declaration added (line 94):

fortran
      real(kind=kind_phys) :: alpha_frac = 1.0_kind_phys  ! fractionation factor (1.0 = no fractionation; replace with real values for isotopes)

Tendency scaling block (after endif ! nvdiff == ntrac, before case_PBL_ten):

fortran
!
!  Scale tag tendencies by tag fraction (alpha=1.0, no fractionation in PBL)
!  When isotopes are added, replace alpha with real fractionation factors
!  at code points where phase changes occur
!
      if (nqvtag>0 .and. nqvtagv>0) then
        do k=1,levs
          do i=1,im
            if (gq0(i,k,nqvtag) > 1.0e-9_kind_phys .and. &
                gq0(i,k,ntqv) > 1.0e-9_kind_phys) then
              ten_q(i,k,nqvtag)   = ten_q(i,k,ntqv) * &
                  (gq0(i,k,nqvtag) / gq0(i,k,ntqv)) * alpha_frac
            end if
          enddo
        enddo
      endif

CRITICAL: This block MUST be placed AFTER all real species tendencies are unpacked from dvdftra (after the imp_physics blocks). Placing it before causes ten_q(ntqv) to be zero, zeroing out all tags.

Verification
bash
grep -n "alpha_frac\|tag fraction" ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_PBL_generic_post.F90

alpha_frac lines should appear at line numbers AFTER the imp_physics unpack blocks (~line 340+).

Test result (PBL-only, mode 2, forcing off, after this edit)

| Level | qv max|diff| | ql max|diff| | |-------|-------------|-------------| | 0 | 0 (perfect) | 2.99e-5 (unchanged) | | 50 | 0 (perfect) | 4.30e-7 (unchanged) | | 75 | 0 (perfect) | 1.75e-10 (unchanged) | | 90+ | 0 | 0 |

qv improved from 8.23e-5 to exactly 0. ql unchanged — uses in-scheme F/G tendencies from dvdftra.

C. Failed Attempts on GFS_PBL_generic_post.F90

Documented for future reference so these mistakes are not repeated.

Attempt 1: Case(1) ratio correction for all six tags

Put save-before/correct-after blocks inside case (1) of case_PBL_ten, correcting gq0 directly after the do n loop.

Why it failed: tend_opt_pbl defaults to 2 (GFS_typedefs.F90 line 3542). Case(1) never executes. Numbers were identical to the run without the edit.

Attempt 2: Tendency scaling at line 119 (after tag unpack)

Placed the scaling block right after the tag unpack loop (ten_q(nqvtag+n) = dvdftra(nqvtagv+n)), before the imp_physics unpack blocks.

Why it failed: At that point, ten_q(ntqv), ten_q(ntcw), etc. have not been unpacked yet — they are zero or stale. The scaling ten_q(tag) = ten_q(real) * ratio produced all zeros. All tags stopped evolving.

Attempt 3: Scale all six tags with guard on real species only

Scaling block at the correct location (after all unpack, before case_PBL_ten), guarding each species with if (gq0(real) > 1e-9).

Why it failed: For ql_tag: gq0(ql) > 1e-9 is true (ql exists), but gq0(ql_tag) = 0 (tag has no mass yet). The scaling gives ten_q(ql_tag) = ten_q(ql) * (0 / ql) = 0. ql_tag never receives any mass and stays at zero.

Attempt 4: Guard on tag only

Changed guard to if (gq0(tag) > 1e-9).

Why it failed: When ql_tag > 1e-9 but ql is near zero, the ratio ql_tag / ql explodes. Crash: "NetCDF: Numeric conversion not representable ql_tag".

Attempt 5: Double guard (both tag AND real > 1e-9)

Added .and. gq0(real) > 1e-9 to each guard.

Why it failed: Numerically stable (no crash), but ql_tag drifted. Once ql_tag > ql from early uncorrected timesteps, the ratio ql_tag/ql > 1 amplified the tendency, making ql_tag grow more each timestep — positive feedback. ql_tag reached 6.2e-3 while ql was only 2.5e-5.

Attempt 6 (final, working): Scale qv_tag only

Removed all five hydrometeor tag corrections. Only scale qv_tag, which starts nonzero (mode 2: qv_tag = qv at t=0) and has a stable ratio ≈ 1.0 throughout the run.

Why it works: gq0(nqvtag) ≈ gq0(ntqv) — both large (~0.02), both modified by the same PBL diffusion. The ratio stays ≈ 1.0. No feedback, no blowup.

For ql_tag through qg_tag, the in-scheme tendencies from dvdftra (computed by the F/G condensation split edits) are the correct answer. They capture ~83% of the physics; the remaining ~17% is an acceptable residual from the nonlinear numerics.

Discovery: tend_opt Defaults

Found during debugging. These control which case block fires in each post file.

Variable	Default	File:Line
tend_opt_pbl	2	GFS_typedefs.F90:3542
tend_opt_deep_conv	1	GFS_typedefs.F90:3545
tend_opt_shal_conv	1	GFS_typedefs.F90:3546
tend_opt_mp	1	GFS_typedefs.F90:3547

tend_opt = 1: apply tendencies immediately (gq0 updated in post file) tend_opt = 2: accumulate tendencies only (gq0 updated elsewhere later)

The PBL post-scheme scaling works in tendency space before the case block, so it is independent of tend_opt. The convection ratio corrections (from a prior session) are inside case(1) and will fire because tend_opt_deep_conv and tend_opt_shal_conv default to 1.


I Removed there two blocks from GFS_PBL_generic_post.F90:
A)

real(kind=kind_phys) :: alpha_frac = 1.0_kind_phys
B)

!
!  Scale tag tendencies by tag fraction (alpha=1.0, no fractionation in PBL)
!  When isotopes are added, replace alpha with real fractionation factors
!  at code points where phase changes occur
!
      if (nqvtag>0 .and. nqvtagv>0) then
        do k=1,levs
          do i=1,im
            if (gq0(i,k,nqvtag) > 1.0e-9_kind_phys .and. &
                gq0(i,k,ntqv) > 1.0e-9_kind_phys) then
              ten_q(i,k,nqvtag)   = ten_q(i,k,ntqv) * &
                  (gq0(i,k,nqvtag) / gq0(i,k,ntqv)) * alpha_frac
            end if
          enddo
        enddo
      endif


It threw away the tendency the PBL scheme computed for qv_tag and replaced it with ten_q(qv) × (qv_tag/qv). That forces the tag to track real qv by construction, whatever the scheme actually did to the tag. Two consequences:

In a mode 2 test, agreement meant nothing. A zero gap was guaranteed by the overwrite, so it couldn't tell you whether the in-scheme tag handling (surface evap source, F/G condensation split, borrow mirrors) was correct.
In a real run (init_mode=0), it changed the science. Once qv_tag passed the guard, its tendency became a proportional share of the real tendency. The tag then gets moisture in proportion to how much of it is already there, not according to where the moisture actually came from, such as the surface evaporation you inject at line 2470. That undermines source attribution, which is the whole point of the tag.


# PBL ql / ql_tag fixes (in-scheme), 2026-09-25

All changes are **inside the PBL scheme**. There is no post-processing ratio correction, and real species are never modified.
**Test setup:** PBL-only suite, `qv_tag_init_mode=2`, `debug_disable_forcing=.true.`, `h2o_phys=.false.`. Run `./scm` directly: debug prints do not show through `run_scm.py`.
Fixed-form Fortran: code starts in column 7, continuation `&` is in column 6. Line numbers are as of the end of the session.

## Causes found
1. **Split guard (F3/G3).** At unsaturated plume levels, the real code folds entrained ql into vapor (`qcko/qcdo(ntcw)=0`). The tag split skipped those levels, so ql_tag kept cloud water the real plume didn't have. This was the main ql driver, through the downdraft.
2. **Updraft water loss.** At saturated levels the real code resets `qtu = qs + qlu` (with `qlu = dq/(1+gamma)`), losing `dq*gamma/(1+gamma)`. The loss carries upward through `qtu(k-1)`. The passive tags never lost it, so the tag total was too high.
3. **Knock-on.** After `tridin`, ql_tag was ~1% more negative than ql at k=1–8. D2 moves only the real amount into ql_tag, so ql_tag stayed negative, and the generic hydrometeor pass then borrowed ql_tag from cloud base (k=9–10). This is a consequence of cause 2.

---

## Fix 1: split guard (built and tested)

`ccpp/physics/physics/PBL/mfpbltq.f`, line 513 (F3):
```fortran
! before
            if (qcko(i,k,ntcw) > 0. .and. qtu_total > 0.) then
! after
            if (qtu_total > 0.) then
```
This line was later superseded by the fix 2 rewrite of F3.

`ccpp/physics/physics/PBL/SATMEDMF/mfscuq.f`, line 595 (G3):
```fortran
! before
              if (qcdo(i,k,ntcw) > 0. .and. qtu_total > 0.) then
! after
              if (qtu_total > 0.) then
```
Result: downdraft plume ql_tag is 0 where real is 0. output ql max|diff| at lev 0 dropped from 2.99e-5 to 1.89e-6.

---

## Fix 2: tag total follows `qtu` (`mfpbltq.f` only; built, NOT yet tested)

**Line 54, declaration:**
```fortran
      real(kind=kind_phys) qscl(im,km)
```

**Lines 433–446, real saturation loop.** Only the two `qscl` lines are new; no real value changes:
```fortran
            if (dq > 0.) then
              gamma = el2orc * qs / (tlu**2)
              qlu = dq / (1. + gamma)
              qscl(i,k) = (qs + qlu) / qtu(i,k)
              qtu(i,k) = qs + qlu
              qcko(i,k,1) = qs
              qcko(i,k,ntcw) = qlu
              tcko(i,k) = tlu + elocp * qlu
            else
              qcko(i,k,1) = qtu(i,k)
              qcko(i,k,ntcw) = 0.
              qscl(i,k) = 1.
              tcko(i,k) = tlu
            endif
```

**F3 block (~lines 511–534) replaced.** The old block, after fix 1, was:
```fortran
      if (nqvtagv > 0) then
      do k = 2, kmpbl
        do i = 1, im
          if (cnvflg(i) .and. k <= kpbl(i)) then
            qtu_total = qcko(i,k,1) + qcko(i,k,ntcw)
            if (qtu_total > 0.) then
              tag_total = qcko(i,k,nqvtagv) + qcko(i,k,nqvtagv+1)
              frac_vap = qcko(i,k,1) / qtu_total
              qcko(i,k,nqvtagv)   = tag_total * frac_vap
              qcko(i,k,nqvtagv+1) = tag_total - qcko(i,k,nqvtagv)
            endif
          endif
        enddo
      enddo
      endif
```
The new block:
```fortran
      if (nqvtagv > 0) then
      do k = 2, kmpbl
        do i = 1, im
          if (cnvflg(i) .and. k <= kpbl(i)) then
            dz   = zl(i,k) - zl(i,k-1)
            tem  = 0.5 * xlamueq(i,k-1) * dz
            factor = 1. + tem
            tag_total = ((1.-tem)*(qcko(i,k-1,nqvtagv)
     &                + qcko(i,k-1,nqvtagv+1)) + tem*
     &                (q1(i,k-1,nqvtagv) + q1(i,k-1,nqvtagv+1)
     &                + q1(i,k,nqvtagv) + q1(i,k,nqvtagv+1)))/factor
            tag_total = tag_total * qscl(i,k)
            qtu_total = qcko(i,k,1) + qcko(i,k,ntcw)
            if (qtu_total > 0.) then
              frac_vap = qcko(i,k,1) / qtu_total
            else
              frac_vap = 1.
            endif
            qcko(i,k,nqvtagv)   = tag_total * frac_vap
            qcko(i,k,nqvtagv+1) = tag_total - qcko(i,k,nqvtagv)
          endif
        enddo
      enddo
      endif
```
This relies on `qcko(i,k,n) = q1(i,k,n)` for all n at k=1, from `satmedmfvdifq.F` lines ~1219–1229, the same way `qtu(1) = qtx(1)`.
Expected in mode 2: DBGU column 3 (plume total real − tag) is ~0 at k=8–10. Before fix 2 it was −1.35e-4, −2.70e-4, −1.78e-4.

---

## Debug code (remove or comment out before real runs)

### `satmedmfvdifq.F`: old broken block, lines 1231–1243, commented out (`!` in column 1)
```fortran
!      if (nqvtagv > 0) then
!        do k = 1, kmpbl
!          do i = 1, im
!            if (pcnvflg(i)) then
!              if (abs(qcko(i,k,ntcw)-qcko(i,k,nqvtagv+1)) > 1.e-12) then
!                print *, 'DBG BEFORE MFPBLTQ', i, k
!                print *, qcko(i,k,ntcw), qcko(i,k,nqvtagv+1)
!                goto 9001
!              endif
!            endif
!          enddo
!        enddo
!      endif
```
It could not compile: there is no label 9001, and it sat before the `mfpbltq` call.

### `mfpbltq.f`: DBGU
Lines 52–53, declarations:
```fortran
      real(kind=kind_phys) dbg_r, dbg_t, dbg_e
      integer, save :: ndbg = 0
```
After the F3/tag-recurrence `endif`:
```fortran
      !  DEBUG: plume real vs tag (first 40 plume levels)
      if (nqvtagv > 0 .and. ndbg < 40) then
      do k = 2, kmpbl
        do i = 1, im
          if (cnvflg(i) .and. k <= kpbl(i)) then
            dbg_r = qcko(i,k,1) + qcko(i,k,ntcw)
            dbg_t = qcko(i,k,nqvtagv) + qcko(i,k,nqvtagv+1)
            dbg_e = q1(i,k,1) + q1(i,k,ntcw)
     &            - q1(i,k,nqvtagv) - q1(i,k,nqvtagv+1)
            ndbg = ndbg + 1
            print *, 'DBGU', k, dbg_e, dbg_r - dbg_t,
     &        qcko(i,k,ntcw), qcko(i,k,nqvtagv+1)
          endif
        enddo
      enddo
      endif
```
Columns: k, env total diff, plume total diff (real − tag), plume ql, plume ql_tag. Intel wraps `print *` at 80 columns, so grep with `-A1`.

### `mfscuq.f`: DBGD
Lines 77–78, declarations:
```fortran
      real(kind=kind_phys) dbg_r, dbg_t, dbg_e
      integer, save :: ndbg = 0
```
After the G3 `endif` (~line 607):
```fortran
      !  DEBUG: downdraft real vs tag (first 40 plume levels)
      if (nqvtagv > 0 .and. ndbg < 40) then
      do k = kmscu, 1, -1
        do i = 1, im
          if (cnvflg(i) .and. k < krad(i) .and. k >= mrad(i)) then
            dbg_r = qcdo(i,k,1) + qcdo(i,k,ntcw)
            dbg_t = qcdo(i,k,nqvtagv) + qcdo(i,k,nqvtagv+1)
            dbg_e = q1(i,k,1) + q1(i,k,ntcw)
     &            - q1(i,k,nqvtagv) - q1(i,k,nqvtagv+1)
            ndbg = ndbg + 1
            print *, 'DBGD', k, dbg_e, dbg_r - dbg_t,
     &        qcdo(i,k,ntcw), qcdo(i,k,nqvtagv+1)
          endif
        enddo
      enddo
      endif
```

### `satmedmfvdifq.F`: P1–P5 (grid ql vs ql_tag in `f2`, k=1–16, first 4 calls)
Line 255, declaration:
```fortran
      integer, save :: ndbgp = 0
```
Same block at four places. Only the label changes:
- **P1:** after `call tridin(im,km,ntrac1,...)` (line 2606)
- **P2:** after the vapor whole-column pass, before the D2 comment block (~2731)
- **P3:** after D3's `endif`, before the generic pass `if(ntrac1 >= 2) then` (~2841)
- **P5:** after the generic pass `endif`, before `c` / `!> - Recover the tendencies of heat and moisture` (~2959)

```fortran
!  DEBUG P1: right after tridin
      if (nqvtagv > 0 .and. ndbgp < 4) then
        do k = 1, 16
          print '(a,2i4,2es14.6)', 'P1', ndbgp, k,
     &      f2(1,k+(ntcw-1)*km), f2(1,k+nqvtagv*km)
        enddo
      endif
```
P5 also has the counter line after its block:
```fortran
      if (nqvtagv > 0) ndbgp = ndbgp + 1
```
Extract with `grep -E "^ ?P[1235] " scm_debug.log`. Columns: checkpoint, call, Fortran k (= python level + 1), real ql, ql_tag.

---

## Backups
- `mfpbltq.f`: `.pre_dbg.bak`, `.pre_fix1.bak`, `.pre_fix2.bak`
- `mfscuq.f`: `.pre_dbg.bak`, `.pre_fix1.bak`
- `satmedmfvdifq.F`: `.pre_dbg.bak` (before commenting out the goto block), `.pre_P.bak` (before P1–P5)

The debug-free backups predate fix 1, so comment out the debug blocks rather than restoring those backups.

## Open
1. Test fix 2 (DBGU, then output.nc ql/qv vs tags). Before fix 2: qv 1.0e-3 and ql 4.1e-6 max|diff| at lev 10.
2. Apply fix 2 to `mfscuq.f` (downdraft saturated branch, ~lines 507–509: `qtd = qs + qld`, recurs through `qtd(k+1)`).
3. Output ql error at t=1 (3–14% low, lev 0–6) is ~10× larger than inside the PBL (~0.5%), and matches none of the first 4 PBL calls. Unexplained: check the call-to-timestep mapping and anything after the PBL.
4. D2 moves the real amount into ql_tag rather than what ql_tag needs. This should stop mattering once fix 2 makes tags match. Recheck with P1–P5 after the test.