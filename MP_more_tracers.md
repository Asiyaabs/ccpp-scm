# Thompson MP in-scheme water tagging -- complete README (2026-10-01)

Single complete record of the water-tagging work in the Thompson microphysics
(CCPP-SCM, suite `SCM_GFS_v17_p8_ugwpv1`): the design, how Thompson is structured, every
code edit in its final form (in file order, with anchor, code and reason), why the
numerical-floor mirroring was needed, the validation history and scripts, build/run
notes and pitfalls, the debug code still in, open items, and the isotope-hook plan.
Follows the process classification of Nusbaumer et al. (2017, JAMES, sec. 2.3-2.4).

**Principle:** every change the real water gets inside MP is given to the tags, at the
source's tag fraction. That includes Thompson's numerical safety steps (`max(R1, ...)`
floors, the `max(1e-10, ...)` qv clip, `<= R1` zeroing, the rain override, and the
"phantom" R1 the real code puts into empty levels). Water that the real code creates
from nothing (a floor) gets the local tag fraction: the level's own fraction for that
species, or the local **vapor** fraction if the level had none. No isotope hooks yet:
every transfer is a plain mass transfer.

**Tag order everywhere:** `1=qv, 2=ql, 3=qi, 4=qr, 5=qs, 6=qg` = `gq0(:,:,nqvtag+0..5)`.

**Result:** full suite (PBL + deep + shallow + photochemistry + Thompson MP), mode 2,
forcing off, no post corrections, 3-day run: all six tags identical to the real water
in `output.nc` (max |diff| 0 for qv/qr/qg; <= 4e-21 kg/kg for ql/qi/qs, only where the
real value is ~0).

Line numbers are approximate (current file); always locate by the anchor text.

Progression of the worst residual during this work (mode 2):

| Stage of the work | qv | ql | qi | qr | qs |
|---|---|---|---|---|---|
| 2026-09-29, ratio block removed | 3.5e-9 | 7.3e-12 | 4.0e-10 | 4.0e-11 | 3.3e-10 |
| 2026-09-30, Batch 10 (ice/snow floors) | 1.9e-9 | 7.3e-12 | 4.4e-12 | 4.0e-11 | 4.4e-12 |
| 2026-10-01, Batch 12 (audit: phantom R1) | 1.9e-9 | 1.4e-20 | 1.1e-11 | 1.9e-12 | 1.1e-11 |
| 2026-10-01, Batch 14 (tag start = real refresh) | **0** | 1.4e-20 | 1.9e-21 | 4.3e-25 | 3.9e-26 |

(max |tag - real| in kg/kg; the qv values of 1.86e-9 were single float32 output steps
caused by the ice/snow residual reaching vapor through deposition/sublimation.)

**Files touched**

| File | What |
|---|---|
| `MP/Thompson/mp_thompson.meta` | M1: new arguments `gq0`, `nqvtag` |
| `MP/Thompson/mp_thompson.F90` | T1-T4: pass tags in, convert units, output tag tendencies |
| `MP/Thompson/module_mp_thompson.F90` | A1-A7 (driver plumbing), column routine edits, `semi_lagrange_sedim` |
| `Interstitials/UFS_SCM_NEPTUNE/GFS_MP_generic_post.F90` | P1: ratio correction removed |
| `ccpp/suites/suite_SCM_GFS_v17_p8_ugwpv1.xml` | MP schemes re-enabled |
| `PBL/SATMEDMF/mfscuq.f` | downdraft tag fix, found while validating MP |

**Backups:** `module_mp_thompson.F90.pre_tag.bak`, `module_mp_thompson.F90.pre_floor2.bak`,
`mp_thompson.F90.pre_tag.bak`, `mp_thompson.meta.pre_tag.bak`,
`GFS_MP_generic_post.F90.pre_mptag.bak`, `mfscuq.f.pre_fix2.bak`.

**Contents**
1. Structure of Thompson (what the tag code follows)
2. Why the floor ("phantom R1") mirroring was needed, and the audit
3. Code: `mp_thompson.meta`
4. Code: `mp_thompson.F90` (CCPP driver)
5. Code: `module_mp_thompson.F90` (driver plumbing, column routine, `semi_lagrange_sedim`)
6. Code outside the MP files (post, suite XML, PBL downdraft)
7. Validation history and check scripts
8. Build and run notes, pitfalls
9. Debug code currently in (and what to remove)
10. Known residuals and open items
11. Isotope hooks (later)

---

## 1. Structure of Thompson (what the tag code follows)

Column routine `mp_thompson` runs in this order; each stage has its own tag treatment.

| Stage | Tag treatment |
|---|---|
| Start of column: species <= R1 deleted (not moved to vapor) | zero the matching tag |
| Rates computed, then limiters rescale them | tag block placed after the limiters, so it sees final rates |
| Rates -> tendencies | tag-rate block: every rate at its source's tag fraction |
| Rain override `qrten = -qr1d*odts` when rain is tiny | mirrored |
| `prw_vcd` cloud condensation/evaporation | transfer at provisional source fraction |
| `prv_rev` rain evaporation | transfer at provisional rain fraction |
| Sedimentation: cloud/ice/snow flux form; rain/graupel semi-Lagrangian (`sedi_semi=.true.`) | tag falls with the real fall speeds |
| `xri`/`xrc` instant melt/freeze | whole provisional tag moved |
| Final update: `qv = max(1e-10, ...)` clip; species <= R1 zeroed | clip mirrored at vapor fraction; tags zeroed |

Key facts found while mapping:
- Thompson itself does **not** strictly conserve water in two 3-way collisions
  (rain-snow cold branch; rain-ice -> graupel): the limiters rescale the sources
  without re-balancing the destination. Tags copy the real numbers exactly, including
  the leak: sources lose their own fraction; the destination gains its real amount x
  the mass-weighted source fraction. Mode 2 is exact by construction.
- `semi_lagrange_sedim` is **not** linear in the field (velocity masking, early exit,
  monotone limiter, R1 floor), so the tag cannot be a separate call. It is an
  optional argument of the same call: geometry from the real field, each mass piece
  weighted by its source cell's tag fraction.
- The driver converts specific humidity <-> mixing ratio. Tags use the **real**
  factors: vapor always; hydrometeors only if `convert_dry_rho`.
- The scheme only outputs tendencies. `ten_q` is zeroed at the top of
  `mp_thompson_run` and was never filled; tag tendencies now go into
  `ten_q(:,:,nqvtag..nqvtag+5)`, which `GFS_MP_generic_post` already applies.

---

---

## 2. Why the floor ("phantom R1") mirroring was needed (2026-09-30 / 10-01)

After the ratio block was removed, ice, snow and rain still differed from the real
water by up to ~4e-10 kg/kg in mode 2. The cause was never a physical process; it was
always one of Thompson's numerical safety steps that change the real water but were
not given to the tag:

1. **R1 floors in ice/snow flux-form sedimentation.** Every substep the real
   `ri`/`rs` are floored at `max(R1, ...)` (R1 = 1e-12 kg m-3), and the fall-speed
   carry-down (`vtik(k) = vtik(k+1)`, `vtsk(k) = vtsk(k+1)`) lets that floor water fall.
   The tag was floored at 0. Fixed in Batch 10 (G2/G3 rewritten).
2. **"Phantom" R1 in empty levels (rain, graupel, cloud).** Before sedimentation the
   real code sets an empty level's working density to R1 (`rr = max(R1, prov*rho)`,
   `rc = max(R1, ...)`, `rg = R1` if empty). `semi_lagrange_sedim` treats cells <= R1 as
   empty and returns `max(qn, R1)`, and the real tendency is `(rr_new - rr_tmp)`. So
   rain falling into a phantom cell makes the real rain lose that R1, and a cell that
   empties keeps R1. The tag started at 0 and was floored at 0. Found with DBGR1/DBGR2
   (the mismatch was exactly ~R1/rho: 8.5e-13 kg/kg near the surface, 1.2e-12 aloft).
   Fixed in Batch 12a/12b.
3. **Phantom water evaporated or transferred.** `prw_vcd = -rc*orho*odt` can evaporate
   a phantom R1 of cloud; the near-zero branch of `prv_rev` can evaporate a phantom R1
   of rain; rates can act on an "empty" (phantom) source. The tag had no fraction for
   such sources. Fixed in Batch 12b (local vapor fraction).
4. **Tag start from round-off leftovers.** At levels where the rates had used up
   almost all ice, both the real and tag provisional values were round-off leftovers
   (~1e-23, opposite signs). The real refresh treated the level as empty
   (`prov .gt. R1` false -> `ri = R1`), but the tag computed its start fraction as a ratio
   of the two leftovers (`max(0, -2.6e-22)/2.3e-23 = 0`), so the tag had no share of the
   R1 that then fell. Found with the stage checks (DBGST) and a one-off print (DBGI).
   Fixed in Batch 14.

**Rule used for every floor case (also the isotope-correct choice):** water that the
real code creates from nothing (a floor) gets the local tag fraction: the level's own
fraction if it holds that species, otherwise the local **vapor** tag fraction. In mode 2
every fraction is exactly 1, so the tag reproduces the real values bit for bit.

### 2a. Audit (2026-10-01): every real-water change in the column routine

Listed with
`awk 'NR>=1900 && NR<=4560 && /(q[vcirsg]ten\(k\)|q[vcirsg]1d\(k\)|\<r[rcisg]\(k\)|rr_tmp|rg_tmp)[^=]*=/ && !/tg_/ && !/^ *!/'`
(line numbers as of the audit):

| Real lines | What they do | Tag counterpart |
|---|---|---|
| 2104-2109 | zero tendencies | B3 |
| 2299/2327/2357/2369/2379 | start-of-column <= R1 deletion | B2 |
| 2302/2330/2360/2371/2381 | empty species -> working density = R1 (phantom) | handled where used (Batch 12, 14) |
| 2581-3121 | rate limiters (use `rc/rr/ri/rs/rg`) | rates enter B1 |
| 3262-3387, 3376 | rates -> tendencies; rain override | B1 |
| 3534-3593 | refresh after rates (`= prov*rho` if prov > R1, else R1) | sedimentation starts (Batch 10, 12, 14) |
| 3755, 3767-3768 | `prw_vcd`, incl. `-rc*orho*odt` on phantom cloud | E1 + Batch 12b fallback |
| 3787 | cloud refresh `max(R1, ...)` | G1 start (Batch 12b, 14) |
| 3871-3872 | `prv_rev`, incl. near-zero branch on phantom rain | E2 + Batch 12b fallback |
| 3890 | rain refresh `max(R1, ...)` | F2 start (Batch 12a, 14) |
| 4127-4139, 4407-4415 | flux-form rain/graupel (`sedi_semi = .false.`) | **not tagged** (unused by this suite) |
| 4156/4169, 4431/4442 | semi-Lagrangian rain/graupel | F2/F3 + Batch 12a floor mirror |
| 4228-4230 | cloud sedimentation | G1 |
| 4293-4305, 4376-4384 | ice/snow sedimentation with floors | G2/G3 (Batch 10) |
| 4480-4501 | `xri`/`xrc` | E3/E4 |
| 4530-... | qv clip, updates, <= R1 zeroing | C1/C2 |
| `semi_lagrange_sedim`: `qq` masking, final `max(qn, R1)` | mass masking, floor | tfr + S5 (Batch 12a) |

---

---

## 3. `ccpp/physics/physics/MP/Thompson/mp_thompson.meta`

**M1 -- run table, directly after the `[ten_q]` block (before `[dspechum]`), ~973-988.**
```
[gq0]
  standard_name = tracer_concentration
  long_name = tracer concentration
  units = kg kg-1
  dimensions = (horizontal_loop_extent,vertical_layer_dimension,number_of_tracers)
  type = real
  kind = kind_phys
  intent = in
[nqvtag]
  standard_name = index_of_tagged_water_vapor_in_tracer_concentration_array
  long_name = tracer index for tagged water vapor
  units = index
  dimensions = ()
  type = integer
  intent = in
  optional = True
```
*Why:* Thompson only received the real species as separate arrays; the tags live in the
tracer array. Units/dimensions match `[gq0]` in `GFS_MP_generic_post.meta`. `nqvtag` is
optional so other suites are unaffected.

---

## 4. `ccpp/physics/physics/MP/Thompson/mp_thompson.F90` (CCPP driver)

**T1 -- argument list of `mp_thompson_run` (~387).**
```fortran
                              ten_q, gq0, nqvtag,                  &
                              dspechum, dqc, dqr,                  &
```
*Why:* order must match the `.meta` (after `ten_q`).

**T2 -- declarations.** After `ten_q(:,:,:)` (~456-457):
```fortran
         real(kind_phys),           intent(in   ) :: gq0(:,:,:)
         integer,         optional, intent(in   ) :: nqvtag
```
After `real(kind_phys) :: new_spechum(1:ncol,1:nlev)` (~516-519):
```fortran
         ! qv_tag MP tagging: local tags in mixing ratio (1=v,2=l,3=i,4=r,5=s,6=g)
         real(kind_phys) :: tg_q(1:ncol,1:nlev,6)
         logical         :: ltag
         integer         :: n6
```

**T3 -- convert tags in, directly after `qv = new_spechum/(1.0_kind_phys-new_spechum)`.**
```fortran
         ! qv_tag: tags use the same conversion factors as the real species
         ltag = .false.
         if (present(nqvtag)) then
            if (nqvtag > 0) ltag = .true.
         endif
         tg_q = 0.0_kind_phys
         if (ltag) then
            tg_q(:,:,1) = gq0(:,:,nqvtag)/(1.0_kind_phys-new_spechum)
            do n6 = 2, 6
               if (convert_dry_rho) then
                  tg_q(:,:,n6) = gq0(:,:,nqvtag+n6-1)/(1.0_kind_phys-new_spechum)
               else
                  tg_q(:,:,n6) = gq0(:,:,nqvtag+n6-1)
               endif
            enddo
         endif
```
*Why:* Thompson works in mixing ratio. The tags must use the **real** conversion factors
(vapor always; hydrometeors only if `convert_dry_rho`), not their own.

**T3b -- all three `mp_gt_driver` calls** get `qtag=tg_q` on its own continuation line:
```fortran
            call mp_gt_driver(qtag=tg_q, &
                              qv=qv, qc=new_qc, qr=new_qr, qi=new_qi, ...
```
*Why:* one argument carries all six tags; its own line keeps the call <= 132 columns.
Done with
`sed -i 's/call mp_gt_driver(qv=qv,/call mp_gt_driver(qtag=tg_q, \&\n                              qv=qv,/' mp_thompson.F90`.

**T4a -- convert tags back, directly after `new_spechum = qv/(1.0_kind_phys+qv)`.**
```fortran
         ! qv_tag: convert tags back with the real factors
         if (ltag) then
            tg_q(:,:,1) = tg_q(:,:,1)/(1.0_kind_phys+qv)
            if (convert_dry_rho) then
               do n6 = 2, 6
                  tg_q(:,:,n6) = tg_q(:,:,n6)/(1.0_kind_phys+qv)
               enddo
            endif
         endif
```

**T4b -- tag tendencies, directly after `dspechum = (new_spechum - spechum)/dtp`.**
```fortran
         ! qv_tag: tag tendencies (applied by GFS_MP_generic_post)
         if (ltag) then
            do n6 = 1, 6
               ten_q(:,:,nqvtag+n6-1) = (tg_q(:,:,n6) - gq0(:,:,nqvtag+n6-1))/dtp
            enddo
         endif
```
*Why:* the scheme only outputs tendencies. `ten_q` is zeroed at the top of
`mp_thompson_run` and was never filled for the tag slots; `GFS_MP_generic_post` already
applies `ten_q` for every tracer.

---

## 5. `ccpp/physics/physics/MP/Thompson/module_mp_thompson.F90`

### 5a. Driver `mp_gt_driver` (plumbing)

**A1 -- signature (~1004).**
```fortran
      subroutine mp_gt_driver(qtag, qv, qc, qr, qi, qs, qg, ni, nr, nc,  &
```
*Why:* all callers use keywords, so the new optional argument can go first.

**A2 -- after the `qv, qc, qr, qi, qs, qg, ni, nr` declaration (~1058-1059).**
```fortran
         ! qv_tag MP tagging: tags (1=v,2=l,3=i,4=r,5=s,6=g), mixing ratio
         real(wp), dimension(ims:ime, kms:kme, jms:jme, 6), optional, intent(inout):: qtag
```

**A7 -- local, after `t1d, p1d, w1d, dz1d, rho, dBZ, pfil1, pfll1` (~1127-1128).**
```fortran
   !..qv_tag MP tagging: local column tags (1=v,2=l,3=i,4=r,5=s,6=g)
         real(wp), dimension(kts:kte,6) :: tg1d
```

**A3 -- copy-in, after `qg1d(k) = qg(i,k,j)` (~1400).**
```fortran
                  if (present(qtag)) then
                     tg1d(k,:) = qtag(i,k,j,:)
                  else
                     tg1d(k,:) = 0.
                  endif
```

**A5 -- column call (~1474).**
```fortran
               call mp_thompson(tg1d, present(qtag), qv1d, qc1d, qi1d, qr1d, qs1d, qg1d, ni1d,     &
```

**A4 -- copy-out, after `qg(i,k,j) = qg1d(k)` (~1561).**
```fortran
                  if (present(qtag)) qtag(i,k,j,:) = tg1d(k,:)
```
*Why:* copy-in/out sit inside the `dt_inner` loop (`do it = 1, ndt`), so tags follow
the inner loop automatically. The driver's qv fix-up after the column call
(`qv = max(1.E-7, ...)` when `qv1d < 0`) is not mirrored: it cannot fire after the
column's 1e-10 clip.

### 5b. Column routine `mp_thompson` (in code order)

**A6 -- signature (~1893) and declarations after `pfil1, pfll1` (~1931-1932).**
```fortran
   subroutine mp_thompson (tg1d, ltag, qv1d, qc1d, qi1d, qr1d, qs1d, qg1d, ni1d,   &
```
```fortran
      ! qv_tag MP tagging: tags (1=v,2=l,3=i,4=r,5=s,6=g), mixing ratio
      real(wp), dimension(kts:kte,6), intent(inout) :: tg1d
      logical, intent(in) :: ltag
```
*Why:* only one caller, so a plain array plus a flag (no `present()` checks in the
physics).

**B4 -- locals, after `real(dp), dimension(kts:kte) :: prw_vcd` (~1972-1988).**
```fortran
      ! qv_tag MP tagging locals (1=v,2=l,3=i,4=r,5=s,6=g)
      real(wp), dimension(kts:kte,6) :: tg_ten
      real(wp), dimension(6) :: tg_f, tg_d
      real(wp), dimension(21) :: tg_p
      real(wp), dimension(3) :: tg_gt
      real(wp) :: tg_x, tg_m, tg_s
      integer, dimension(3) :: tg_gs
      integer :: tg_n, tg_j
      integer, parameter :: tg_a(21) = (/1,1,1,1,1,1,2,2,2,2,2,2,3,3,4,4,5,6,5,6,4/)
      integer, parameter :: tg_b(21) = (/3,3,3,5,5,6,4,4,3,5,6,6,5,5,3,6,4,4,3,3,6/)
      integer, save :: tg_ncall = 0   ! DEBUG DBGM1
      real(wp), dimension(kts:kte)   :: tg_rs   ! tag density for sedimentation
      real(wp), dimension(kts:kte+1) :: tg_sd   ! tag flux / scratch
      real(wp), dimension(kts:kte)   :: tg_rr   ! copy of real ri/rs in sedimentation
      real(wp), dimension(kts:kte+1) :: tg_rq   ! copy of real sedimentation flux
      real(wp) :: tg_fv, tg_fk, tg_o
```
*Why:* `tg_ten` accumulates tag tendencies exactly like `qvten...qgten`; `tg_a`/`tg_b`
are the source/destination of the 21 two-body rates in B1. `tg_ncall` is debug only
(remove last).

**B3 -- zero tag tendencies, directly after `qgten(k) = 0.` (~2103).**
```fortran
         tg_ten(k,:) = 0.
```

**B2 -- start-of-column zeroing.** One line after each real zeroing in the `else`
branch of `if (q*1d(k) .gt. R1)` (~2293-2373):

| After | Insert |
|---|---|
| `qc1d(k) = 0.0` | `tg1d(k,2) = 0.` |
| `qi1d(k) = 0.0` | `tg1d(k,3) = 0.` |
| `qr1d(k) = 0.0` | `tg1d(k,4) = 0.` |
| `qs1d(k) = 0.0` | `tg1d(k,5) = 0.` |
| `qg1d(k) = 0.0` | `tg1d(k,6) = 0.` |

*Why:* the real code deletes species <= R1 at the start (not moved to vapor).

**B1 -- tag-rate block, directly before `!>  - Temperature tendency` (~3387-3470),
inside the tendency-assembly `do k` loop, after the limiters and the rain override.**
```fortran
!>  - qv_tag MP tagging: every rate moves tag at the source's tag fraction
         if (ltag) then
            tg_f = 0.
            if (qv1d(k) .gt. 0.) tg_f(1) = tg1d(k,1)/qv1d(k)
            tg_f(2:6) = tg_f(1)   ! empty/phantom sources carry the local vapor fraction
            if (qc1d(k) .gt. R1) tg_f(2) = tg1d(k,2)/qc1d(k)
            if (qi1d(k) .gt. R1) tg_f(3) = tg1d(k,3)/qi1d(k)
            if (qr1d(k) .gt. R1) tg_f(4) = tg1d(k,4)/qr1d(k)
            if (qs1d(k) .gt. R1) tg_f(5) = tg1d(k,5)/qs1d(k)
            if (qg1d(k) .gt. R1) tg_f(6) = tg1d(k,6)/qg1d(k)
            tg_d = 0.
            ! two-body: tg_p > 0 moves tg_a -> tg_b, tg_p < 0 moves tg_b -> tg_a
            tg_p(1)  = pri_inu(k)
            tg_p(2)  = pri_iha(k)
            tg_p(3)  = pri_ide(k)
            tg_p(4)  = prs_ide(k)
            tg_p(5)  = prs_sde(k)
            tg_p(6)  = prg_gde(k)
            tg_p(7)  = prr_wau(k)
            tg_p(8)  = prr_rcw(k)
            tg_p(9)  = pri_wfz(k)
            tg_p(10) = prs_scw(k)
            tg_p(11) = prg_scw(k)
            tg_p(12) = prg_gcw(k)
            tg_p(13) = prs_iau(k)
            tg_p(14) = prs_sci(k)
            tg_p(15) = pri_rfz(k)
            tg_p(16) = prg_rfz(k)
            tg_p(17) = prr_sml(k)
            tg_p(18) = prr_gml(k)
            tg_p(19) = prs_ihm(k)
            tg_p(20) = prg_ihm(k)
            tg_p(21) = prg_rcg(k)
            do tg_n = 1, 21
               if (tg_p(tg_n) .gt. 0.) then
                  tg_x = tg_p(tg_n)*tg_f(tg_a(tg_n))
               else
                  tg_x = tg_p(tg_n)*tg_f(tg_b(tg_n))
               endif
               tg_d(tg_a(tg_n)) = tg_d(tg_a(tg_n)) - tg_x
               tg_d(tg_b(tg_n)) = tg_d(tg_b(tg_n)) + tg_x
            enddo
            ! three-way collisions (not mass-balanced in real): sources lose own
            ! fraction, gainers get their real gain x mass-weighted source fraction
            do tg_j = 1, 2
               if (tg_j .eq. 1) then
                  tg_gs = (/3, 4, 6/)
                  tg_gt(1) = -pri_rci(k)
                  tg_gt(2) = -prr_rci(k)
                  tg_gt(3) =  prg_rci(k)
               else
                  tg_gs = (/4, 5, 6/)
                  tg_gt(1) = prr_rcs(k)
                  tg_gt(2) = prs_rcs(k)
                  tg_gt(3) = prg_rcs(k)
               endif
               tg_m = 0.
               tg_s = 0.
               do tg_n = 1, 3
                  if (tg_gt(tg_n) .lt. 0.) then
                     tg_m = tg_m - tg_gt(tg_n)
                     tg_s = tg_s - tg_gt(tg_n)*tg_f(tg_gs(tg_n))
                     tg_d(tg_gs(tg_n)) = tg_d(tg_gs(tg_n))                   &
                                       + tg_gt(tg_n)*tg_f(tg_gs(tg_n))
                  endif
               enddo
               if (tg_m .gt. 0.) then
                  do tg_n = 1, 3
                     if (tg_gt(tg_n) .gt. 0.) tg_d(tg_gs(tg_n)) =            &
                          tg_d(tg_gs(tg_n)) + tg_gt(tg_n)*tg_s/tg_m
                  enddo
               endif
            enddo
            tg_ten(k,:) = tg_ten(k,:) + tg_d*orho
            ! mirror the rain override (qrten = -qr1d*odts when xrr <= R1)
            if (.not. (xrr .gt. R1)) tg_ten(k,4) = -tg1d(k,4)*odts
            ! (DEBUG DBGM1 block here -- see section 9)
         endif
```
*Why:* the limiters (~3111-3200) run before this, so the tags see the final rates.
Every real rate in the `qvten...qgten` assembly appears exactly once:

| Rates | From -> to |
|---|---|
| `pri_inu`, `pri_iha`, `pri_ide` | v <-> i (signed) |
| `prs_ide`, `prs_sde` | v <-> s (signed) |
| `prg_gde` | v <-> g (signed) |
| `prr_wau`, `prr_rcw` | l -> r |
| `pri_wfz` | l -> i |
| `prs_scw` | l -> s |
| `prg_scw`, `prg_gcw` | l -> g |
| `prs_iau`, `prs_sci` | i -> s |
| `pri_rfz` / `prg_rfz` | r -> i / g |
| `prr_sml` / `prr_gml` | s / g -> r |
| `prs_ihm`, `prg_ihm` (`pri_ihm` = sum) | s, g -> i |
| `prg_rcg` (`prr_rcg` = -`prg_rcg`) | r <-> g (signed) |
| `pri_rci` + `prr_rci` -> `prg_rci` | 3-way, weighted |
| `prr_rcs`, `prs_rcs`, `prg_rcs` | 3-way signed, weighted |

The three-way collisions are not mass-balanced in Thompson itself (the limiters rescale
the sources, not the destination); the tags copy that exactly. The line
`tg_f(2:6) = tg_f(1)` gives rates acting on an empty (phantom-R1) source the local vapor
fraction (Batch 12b).

**E1 -- cloud condensation/evaporation, directly after `qcten(k) = qcten(k) + prw_vcd(k)`
(~3763-3785).**
```fortran
            ! qv_tag MP tagging: cloud condensation/evaporation, provisional source fraction
            if (ltag) then
               tg_x = prw_vcd(k)
               tg_s = 0.
               if (tg_x .gt. 0.) then
                  tg_m = qv1d(k) + (qvten(k) + tg_x)*DT
                  if (tg_m .gt. 0.) tg_s = (tg1d(k,1) + tg_ten(k,1)*DT)/tg_m
               else
                  tg_m = qc1d(k) + (qcten(k) - tg_x)*DT
                  if (tg_m .gt. 0.) then
                     tg_s = (tg1d(k,2) + tg_ten(k,2)*DT)/tg_m
                  elseif (qv1d(k) .gt. 0.) then
                     tg_s = tg1d(k,1)/qv1d(k)
                  endif
               endif
               tg_ten(k,1) = tg_ten(k,1) - tg_x*tg_s
               tg_ten(k,2) = tg_ten(k,2) + tg_x*tg_s
            endif
```
*Why:* `prw_vcd` is a saturation adjustment computed after the other rates, so it uses
the provisional (post-rate) fraction. `qvten`/`qcten` already include this `prw_vcd`,
hence `+tg_x`/`-tg_x` to rebuild the state before it. The `elseif` (Batch 12b) covers
`prw_vcd = -rc*orho*odt` evaporating a phantom R1 of cloud. **`if (tg_x .gt. 0.)` here
is the sign of condensation; never change it.**

**E2 -- rain evaporation, directly after `qvten(k) = qvten(k) + prv_rev(k)` (~3867-3880).**
```fortran
            ! qv_tag MP tagging: rain evaporation, provisional rain fraction
            if (ltag) then
               tg_s = 0.
               tg_m = qr1d(k) + (qrten(k) + prv_rev(k))*DT
               if (tg_m .gt. 0.) then
                  tg_s = (tg1d(k,4) + tg_ten(k,4)*DT)/tg_m
               elseif (qv1d(k) .gt. 0.) then
                  tg_s = tg1d(k,1)/qv1d(k)
               endif
               tg_ten(k,4) = tg_ten(k,4) - prv_rev(k)*tg_s
               tg_ten(k,1) = tg_ten(k,1) + prv_rev(k)*tg_s
            endif
```
*Why:* same provisional-fraction logic; the `elseif` (Batch 12b) covers the near-zero
branch evaporating a phantom `rr = R1`.

**F2 -- rain sedimentation (semi-Lagrangian loop, `sedi_semi = .true.`).**
(a) Directly after `rr_tmp(:) = rr(:)`:
```fortran
               ! qv_tag MP tagging: rain tag sediments with the real geometry
               if (n .eq. 1) then
                  do k = kts, kte
                     tg_x = qr1d(k) + DT*qrten(k)
                     if (rr(k) .ne. R1) then
                        tg_fk = max(0., tg1d(k,4) + DT*tg_ten(k,4))/tg_x
                     else
                        tg_fk = 0.
                        if (qv1d(k) .gt. 0.) tg_fk = tg1d(k,1)/qv1d(k)
                     endif
                     tg_rs(k) = rr(k)*tg_fk
                  enddo
               endif
               tg_sd(kts:kte) = tg_rs(kts:kte)
```
(b) The real call gets the tag as an optional argument:
```fortran
               call semi_lagrange_sedim(kte,dzq,vtrk,rr,rainsfc,pfll,dtcfl,R1,rqt=tg_rs)
```
(c) Directly after `qrten(k) = qrten(k) + (rr(k) - rr_tmp(k)) * orhodt`:
```fortran
                  tg_ten(k,4) = tg_ten(k,4) + (tg_rs(k) - tg_sd(k))*orhodt
```
*Why:* `semi_lagrange_sedim` is not linear in the field (velocity masking, limiter, R1
floor), so the tag rides along in the same call with the real geometry. The start
follows the real working value `rr` **including its phantom R1** (the real refresh is
`rr = max(R1, prov*rho)`), and decides floor vs. provisional **exactly as the real
code**: `rr(k) .ne. R1` (the real code sets exactly R1 when it floors). `tg_sd` plays
the role of `rr_tmp`.

**F3 -- graupel sedimentation (semi-Lagrangian loop).** Same three edits.
(a) Directly after `rg_tmp(:) = rg(:)`:
```fortran
               ! qv_tag MP tagging: graupel tag sediments with the real geometry
               if (n .eq. 1) then
                  do k = kts, kte
                     tg_x = qg1d(k) + DT*qgten(k)
                     if (rg(k) .ne. R1) then
                        tg_fk = max(0., tg1d(k,6) + DT*tg_ten(k,6))/tg_x
                     else
                        tg_fk = 0.
                        if (qv1d(k) .gt. 0.) tg_fk = tg1d(k,1)/qv1d(k)
                     endif
                     tg_rs(k) = rg(k)*tg_fk
                  enddo
               endif
               tg_sd(kts:kte) = tg_rs(kts:kte)
```
(b)
```fortran
               call semi_lagrange_sedim(kte,dzq,vtgk,rg,graulsfc,pfil,dtcfl,R1,rqt=tg_rs)
```
(c) Directly after `qgten(k) = qgten(k) + (rg(k) - rg_tmp(k))*orhodt`:
```fortran
                  tg_ten(k,6) = tg_ten(k,6) + (tg_rs(k) - tg_sd(k))*orhodt
```

**G1 -- cloud sedimentation, directly after the SECOND
`if (ANY(L_qc .eqv. .true.)) then` (the one followed by `sed_c(k) = vtck(k)*rc(k)`).**
```fortran
         ! qv_tag MP tagging: cloud tag sediments with the real fall speed
         do k = kts, kte
            tg_x = qc1d(k) + DT*qcten(k)
            if (rc(k) .ne. R1) then
               tg_fk = max(0., tg1d(k,2) + DT*tg_ten(k,2))/tg_x
            else
               tg_fk = 0.
               if (qv1d(k) .gt. 0.) tg_fk = tg1d(k,1)/qv1d(k)
            endif
            tg_rs(k) = rc(k)*tg_fk
            tg_sd(k) = vtck(k)*tg_rs(k)
         enddo
         tg_sd(kte+1) = 0.
         do k = ksed1(5), kts, -1
            tg_ten(k,2) = tg_ten(k,2) + (tg_sd(k+1)-tg_sd(k))/(dzq(k)*rho(k))
         enddo
```
*Why:* single-pass flux form; the tag flux uses the real fall speed. The start follows
the real `rc` (refresh `rc = max(R1, prov*rho)`) including phantom R1, with the real
refresh test. The FIRST `if (ANY(L_qc ...))` is the fall-speed/`ksed1(5)` block, not
sedimentation.

**G2 -- ice sedimentation, directly after `nstep = nint(1./onstep(2))`.**
```fortran
         ! qv_tag MP tagging: ice tag sediments exactly as real ice. A copy of
         ! real ri (tg_rr) runs the same substeps and R1 floors; tag flux = vt x
         ! tag density; water created by a floor gets the local tag fraction
         ! (vapor tag fraction where the level had no ice)
         do k = kts, kte
            tg_fv = 0.
            if (qv1d(k) .gt. 0.) tg_fv = tg1d(k,1)/qv1d(k)
            tg_x = qi1d(k) + qiten(k)*DT
            if (ri(k) .ne. R1) then
               tg_fk = max(0., tg1d(k,3) + tg_ten(k,3)*DT)/tg_x
            else
               tg_fk = tg_fv
            endif
            tg_rr(k) = ri(k)
            tg_rs(k) = ri(k)*tg_fk
         enddo
         do n = 1, nstep
            do k = kte, kts, -1
               tg_sd(k) = vtik(k)*tg_rs(k)
               tg_rq(k) = vtik(k)*tg_rr(k)
            enddo
            k = kte
            tg_o = 1./dzq(k)
            tg_ten(k,3) = tg_ten(k,3) - tg_sd(k)*tg_o*onstep(2)*(1./rho(k))
            tg_x = tg_rr(k) - tg_rq(k)*tg_o*DT*onstep(2)
            tg_m = tg_rs(k) - tg_sd(k)*tg_o*DT*onstep(2)
            if (tg_x .lt. R1) then
               tg_m = tg_m + (R1 - tg_x)*tg_rs(k)/tg_rr(k)
               tg_x = R1
            endif
            tg_rr(k) = tg_x
            tg_rs(k) = max(0., tg_m)
            do k = ksed1(2), kts, -1
               tg_o = 1./dzq(k)
               tg_ten(k,3) = tg_ten(k,3)                                     &
                           + (tg_sd(k+1)-tg_sd(k))*tg_o*onstep(2)*(1./rho(k))
               tg_x = tg_rr(k) + (tg_rq(k+1)-tg_rq(k))*tg_o*DT*onstep(2)
               tg_m = tg_rs(k) + (tg_sd(k+1)-tg_sd(k))*tg_o*DT*onstep(2)
               if (tg_x .lt. R1) then
                  tg_m = tg_m + (R1 - tg_x)*tg_rs(k)/tg_rr(k)
                  tg_x = R1
               endif
               tg_rr(k) = tg_x
               tg_rs(k) = max(0., tg_m)
            enddo
         enddo
```
*Why:* the real ice loop floors `ri` at R1 every substep, and the fall-speed carry-down
(`vtik(k) = vtik(k+1)`) lets floor water fall. The copy (`tg_rr`) runs the same
substeps, expressions and floors as the real loop that follows it (checked statement by
statement). Floor-created water gets the level's current tag fraction. The start test
`ri(k) .ne. R1` reproduces the real refresh
(`if ((qi1d+qiten*DT) .gt. R1) ri = prov*rho else ri = R1`); an earlier
`if (tg_x .gt. 0.)` divided two round-off leftovers at floored levels and gave the tag
no share of that R1.

**G3 -- snow sedimentation, directly after `nstep = nint(1./onstep(3))`.**
```fortran
         ! qv_tag MP tagging: snow tag sediments exactly as real snow. A copy of
         ! real rs (tg_rr) runs the same substeps and R1 floors; tag flux = vt x
         ! tag density; water created by a floor gets the local tag fraction
         ! (vapor tag fraction where the level had no snow)
         do k = kts, kte
            tg_fv = 0.
            if (qv1d(k) .gt. 0.) tg_fv = tg1d(k,1)/qv1d(k)
            tg_x = qs1d(k) + qsten(k)*DT
            if (rs(k) .ne. R1) then
               tg_fk = max(0., tg1d(k,5) + tg_ten(k,5)*DT)/tg_x
            else
               tg_fk = tg_fv
            endif
            tg_rr(k) = rs(k)
            tg_rs(k) = rs(k)*tg_fk
         enddo
         do n = 1, nstep
            do k = kte, kts, -1
               tg_sd(k) = vtsk(k)*tg_rs(k)
               tg_rq(k) = vtsk(k)*tg_rr(k)
            enddo
            k = kte
            tg_o = 1./dzq(k)
            tg_ten(k,5) = tg_ten(k,5) - tg_sd(k)*tg_o*onstep(3)*(1./rho(k))
            tg_x = tg_rr(k) - tg_rq(k)*tg_o*DT*onstep(3)
            tg_m = tg_rs(k) - tg_sd(k)*tg_o*DT*onstep(3)
            if (tg_x .lt. R1) then
               tg_m = tg_m + (R1 - tg_x)*tg_rs(k)/tg_rr(k)
               tg_x = R1
            endif
            tg_rr(k) = tg_x
            tg_rs(k) = max(0., tg_m)
            do k = ksed1(3), kts, -1
               tg_o = 1./dzq(k)
               tg_ten(k,5) = tg_ten(k,5)                                     &
                           + (tg_sd(k+1)-tg_sd(k))*tg_o*onstep(3)*(1./rho(k))
               tg_x = tg_rr(k) + (tg_rq(k+1)-tg_rq(k))*tg_o*DT*onstep(3)
               tg_m = tg_rs(k) + (tg_sd(k+1)-tg_sd(k))*tg_o*DT*onstep(3)
               if (tg_x .lt. R1) then
                  tg_m = tg_m + (R1 - tg_x)*tg_rs(k)/tg_rr(k)
                  tg_x = R1
               endif
               tg_rr(k) = tg_x
               tg_rs(k) = max(0., tg_m)
            enddo
         enddo
```
*Why:* identical to G2 for snow (real refresh
`if ((qs1d+qsten*DT) .gt. R1) rs = prov*rho else rs = R1`).

**E3 -- instant melt, directly after `qiten(k) = qiten(k) - xri*odt`.**
```fortran
               ! qv_tag MP tagging: instant melt moves the whole provisional ice tag
               if (ltag) then
                  tg_x = max(0., tg1d(k,3) + tg_ten(k,3)*DT)
                  tg_ten(k,2) = tg_ten(k,2) + tg_x*odt
                  tg_ten(k,3) = tg_ten(k,3) - tg_x*odt
               endif
```

**E4 -- instant freeze, directly after `qcten(k) = qcten(k) - xrc*odt`.**
```fortran
               ! qv_tag MP tagging: instant freeze moves the whole provisional cloud tag
               if (ltag) then
                  tg_x = max(0., tg1d(k,2) + tg_ten(k,2)*DT)
                  tg_ten(k,3) = tg_ten(k,3) + tg_x*odt
                  tg_ten(k,2) = tg_ten(k,2) - tg_x*odt
               endif
```
*Why (E3/E4):* the real code moves all of the provisional ice (above 0 C) or cloud
(below HGFR); the tag moves all of its provisional amount too.

**C1 -- apply tag tendencies, directly BEFORE
`qv1d(k) = max(1.E-10, qv1d(k) + qvten(k)*DT)`.**
```fortran
         ! qv_tag MP tagging: apply tag tendencies; mirror the qv 1e-10 clip
         ! (water added by the clip goes to the tag at the pre-step vapor fraction)
         if (ltag) then
            tg_x = qv1d(k) + qvten(k)*DT
            tg_f(1) = 0.
            if (qv1d(k) .gt. 0.) tg_f(1) = tg1d(k,1)/qv1d(k)
            tg1d(k,:) = tg1d(k,:) + tg_ten(k,:)*DT
            if (tg_x .lt. 1.E-10) tg1d(k,1) = tg1d(k,1) + (1.E-10 - tg_x)*tg_f(1)
         endif
```
*Why:* must sit before the real line so `qv1d` is still the pre-step value. The line
`if (qv1d(k) .gt. 0.) tg_f(1) = ...` also occurs in B1; never edit this one by mistake.

**C2 -- final zeroing, directly after `if (qg1d(k) .le. R1) qg1d(k) = 0.0`.**
```fortran
         ! qv_tag MP tagging: zero a tag wherever its real species was zeroed
         if (ltag) then
            if (qc1d(k) .le. 0.) tg1d(k,2) = 0.
            if (qi1d(k) .le. 0.) tg1d(k,3) = 0.
            if (qr1d(k) .le. 0.) tg1d(k,4) = 0.
            if (qs1d(k) .le. 0.) tg1d(k,5) = 0.
            if (qg1d(k) .le. 0.) tg1d(k,6) = 0.
         endif
```
*Why:* after the real `<= R1` zeroing each species is either exactly 0 or > R1.

### 5c. `semi_lagrange_sedim`

**S1 -- signature.**
```fortran
   SUBROUTINE semi_lagrange_sedim(km,dzl,wwl,rql,precip,pfsan,dt,R1,rqt,precipt)
!   SUBROUTINE semi_lagrange_sedim(km,dzl,wwl,rql,precip,pfsan,dt,R1)
```

**S2 -- after `real(wp), intent(out)  :: pfsan(km)`.**
```fortran
      ! qv_tag MP tagging (optional): tag remapped with the real geometry,
      ! each piece weighted by its source cell's tag fraction tfr
      real(wp), intent(inout), optional :: rqt(km)
      real(wp), intent(out), optional :: precipt
      real(wp) :: tfr(km+1), qnt(km), qsumt
```

**S3 -- after `precip = 0.0` (before the early return).**
```fortran
      if (present(precipt)) precipt = 0.0
      tfr = 0.0
      qnt = 0.0
      if (present(rqt)) then
         do k = 1, km
            if (rql(k) .gt. 0.) tfr(k) = rqt(k)/rql(k)
         enddo
      endif
```
*Why:* source-cell tag fraction, taken before the remap. Defined also for cells holding
only R1 (`.gt. 0.`), which still carry no transported mass (real `qq = 0`), so S5 has a
fraction for floor cells.

**S4 -- seven one-liners, each directly after the line shown.**

| After | Inserted |
|---|---|
| `qn(k) = (qqh-qql)/(th-tl)` | `qnt(k) = tfr(kb)*qn(k)` |
| `qsum  = dql*dza(kb)` | `qsumt = tfr(kb)*dql*dza(kb)` |
| `qsum = qsum + qa(m) * dza(m)` | `qsumt = qsumt + tfr(m)*qa(m)*dza(m)` |
| `qsum  = qsum + dqh*dza(kt)` | `qsumt = qsumt + tfr(kt)*dqh*dza(kt)` |
| `qn(k) = qsum/zsum` | `qnt(k) = qsumt/zsum` |
| `precip = precip + qa(k)*dza(k)` | `if (present(precipt)) precipt = precipt + tfr(k)*qa(k)*dza(k)` |
| `precip = precip + qqh*dza(k)` | `if (present(precipt)) precipt = precipt + tfr(k)*qqh*dza(k)` |

*Why:* every mass piece moved from source cell `m` carries that cell's tag fraction.
Linear in the tag, conserves tag mass, reduces exactly to the real result when all
fractions are 1.

**S5 -- after `rql(:) = max(qn(:),R1)`.**
```fortran
      ! qv_tag: mirror the real floor max(qn,R1); floor-created water gets
      ! the cell's tag fraction (arrival fraction, or source fraction if empty)
      if (present(rqt)) then
         do k = 1, km
            if (qn(k) .lt. R1) then
               if (qn(k) .gt. 0.) then
                  rqt(k) = R1*(max(qnt(k), 0.0)/qn(k))
               else
                  rqt(k) = R1*tfr(k)
               endif
            else
               rqt(k) = max(qnt(k), 0.0)
            endif
         enddo
      endif
```
*Why:* the real result is floored at R1; the tag gets the same floor at the cell's
fraction (exactly R1 in mode 2). The real calls without the optional arguments and the
`nr` call are unchanged. `precipt` is computed but not yet passed or output.

---

## 6. Outside the MP files (needed for MP tagging)

**P1 -- `Interstitials/UFS_SCM_NEPTUNE/GFS_MP_generic_post.F90`, `case (1)`.**
Lines ~154-155 and ~159-164 commented out:
```bash
sed -i '154,155s/^/!/;159,164s/^/!/' GFS_MP_generic_post.F90
```
Removed: the `old_qv_val` / `old_qv_tag_val` captures and the ratio override
`gq0(i,k,nqvtag) = old_qv_tag_val * (gq0(i,k,ntqv) / old_qv_val)`.
Kept: `gq0(i,k,n) = gq0(i,k,n) + dtp*ten_q(i,k,n)` for all tracers, which applies MP's
tag tendencies. *Why:* MP now carries the tags itself; no post corrections.

**Suite XML -- `ccpp/suites/suite_SCM_GFS_v17_p8_ugwpv1.xml`.** Lines 75, 78, 79
(`mp_thompson`, `mp_thompson_post`, `GFS_MP_generic_post`) uncommented (they were off
from the PBL+convection isolation runs). Needs `cmake ../src`.

**PBL downdraft fix -- `PBL/SATMEDMF/mfscuq.f` (fixed form: code in column 7, `&` in
column 6, <= 72 columns).** Found while validating MP.

**Why:** with MP on, grid-scale cloud at the PBL top activates the stratocumulus
downdraft (`scuflg`). Its saturation step loses real total water
(`qtd = qs + qld` < mixed value), but the tags were only re-split by `frac_vap`, so
the tag missed the loss. In MP-off runs this code never ran. This produced the
mid-run qv/ql dipole (tag water too high below the cloud, too low in it; first seen
at output t=127, MP call 762, found with DBGM2 at MP entry). Same bug as updraft
fix 2 in `mfpbltq.f` (`qscl`); this is its downdraft counterpart.

- M1, after line 29: `      real(kind=kind_phys) qscd(im,km)`
- M2, saturated branch, after the second `qld = dq / (1. + gamma)`, before
  `qtd(i,k) = qs + qld`: `              qscd(i,k) = (qs + qld) / qtd(i,k)`
- M3, unsaturated branch, after `qcdo(i,k,ntcw) = 0.`: `              qscd(i,k) = 1.`
- M4, the old `frac_vap` split block replaced by:
```fortran
      if (nqvtagv > 0) then
      do k = kmscu, 1, -1
        do i = 1, im
          if (cnvflg(i) .and. k < krad(i)) then
            if(k >= mrad(i)) then
              dz = zl(i,k+1) - zl(i,k)
              tem  = 0.5 * xlamdeq(i,k) * dz
              factor = 1. + tem
              tag_total = ((1.-tem)*(qcdo(i,k+1,nqvtagv)
     &                  + qcdo(i,k+1,nqvtagv+1)) + tem*
     &                  (q1(i,k,nqvtagv) + q1(i,k,nqvtagv+1)
     &                  + q1(i,k+1,nqvtagv) + q1(i,k+1,nqvtagv+1)))
     &                  / factor
              tag_total = tag_total * qscd(i,k)
              qtu_total = qcdo(i,k,1) + qcdo(i,k,ntcw)
              if (qtu_total > 0.) then
                frac_vap = qcdo(i,k,1) / qtu_total
              else
                frac_vap = 1.
              endif
              qcdo(i,k,nqvtagv)   = tag_total * frac_vap
              qcdo(i,k,nqvtagv+1) = tag_total - qcdo(i,k,nqvtagv)
            endif
          endif
        enddo
      enddo
      endif
```

---

## 7. Validation history and check scripts

1. Plumbing build: cap passes `gq0` and `nqvtag`.
2. Rate block (DBGM1, mode 2): call 1 clean (every rate mirrored). Later calls
   differed only because other hooks were not yet in.
3. All hooks in, ratio block still on: rate-block differences dropped from ~1e-9 to
   ~1e-14 kg/kg/s. `output.nc`: qv/ql/qr exact until output t=127, then a qv/ql
   dipole at k=16-22.
4. DBGM2 (MP entry) vs DBGM3 (MP exit): first mismatch at MP **entry** (call 762),
   so created between MP calls -> traced to `mfscuq.f` (above). After the fix: qv, ql,
   qg exact over the whole run.
5. Ratio block removed: qv_tag 1.9e-6 max rel; qi/qs/qr up to ~4.5e-4 rel
   (<= 4e-10 kg/kg).
6. **Batch 10 (ice/snow floors):** qi/qs 4e-10 -> 4e-12 kg/kg; qr unchanged (4e-11 at
   t=130, k=8), so rain had its own source (not snow melt, as first assumed).
7. **DBGR1/DBGR2** (rain after evaporation / after sedimentation): mismatch first
   after rain sedimentation, size ~R1/rho -> "phantom R1".
8. **Audit + Batch 12a/12b** (all phantom-R1 gaps in one pass): ql 1.4e-20, qg 0,
   qr 1.9e-12, qi/qs ~1e-11, qv 1 float32 step.
9. **DBGST stage checks** (9 stages, all species, 1e-12 rel): first difference at
   stage 6 (ice sedimentation), levels 63-66; everything else carried from it. DBGI
   confirmed the round-off-leftover start at level 66 (`tg_fk = 0`, `ri = 1e-12`,
   fall speed 0.20).
10. **Batch 14** (start tests = real refresh): all six tags identical to real in
    `output.nc`; DBGST/DBGM2/DBGM3 show only round-off.
11. **3-day mode 2 run** (`run_scm.py ... --runtime 259200`, forcing off): identical
    over 0-72 h (table at the top).

Check script used (fill-value safe; prints valid time count, max abs/rel, location,
value at the end):
```bash
python -c "
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
"
```

Drift check (worst relative difference per tenth of the run):
```bash
python -c "
import netCDF4 as nc, numpy as np
d=nc.Dataset('output_twpice_SCM_GFS_v17_p8_ugwpv1/output.nc')
for v in ['qv_tag','ql_tag','qi_tag','qr_tag','qs_tag','qg_tag']:
  t=np.ma.filled(np.squeeze(d[v][:]).astype(float),np.nan); r=np.ma.filled(np.squeeze(d[v[:-4]][:]).astype(float),np.nan)
  ok=np.isfinite(t)&np.isfinite(r)&(np.abs(r)<1e30)&(np.abs(t)<1e30)
  df=np.where(ok,np.abs(t-r),0.); m=ok&(r>1e-8); rel=np.where(m,df/np.where(m,r,1.),0.)
  nt=rel.shape[0]; seg=[rel[i*nt//10:(i+1)*nt//10].max() for i in range(10)]
  print('%-7s nt=%d absmax=%.2e  rel by tenth:'%(v,nt,df.max()), ' '.join('%.1e'%s for s in seg))
"
```

Why qv shows exactly 0: `output.nc` is float32 (~7 digits; spacing ~2e-9 at surface
qv), while inside the model qv and qv_tag agree to better than 1e-12 relative (no
DBGM2/DBGM3 vapor lines). Both round to the same float32 value. ql/qi/qs show 1e-20
to 1e-26 only because float32 spacing is relative and those are round-off leftovers
where the real value is ~0.

---

---

## 8. Build and run notes, pitfalls
- `.meta` or suite XML changed -> `cmake ../src` (must finish with no prebuild error),
  then `make`. `.F90` only -> `make`. Fixed-form `.f` -> `touch` the file, then `make`.
- Cap check (from `scm/bin`):
  `grep -i -A40 "call mp_thompson_run" ccpp/physics/physics/ccpp_scm_gfs_v17_p8_ugwpv1_phys_ts_cap.F90 | grep -n -i "gq0=\|nqvtag="`
- Debug prints only show with `./scm` run directly. `qcmd` re-parses the command:
  use single quotes inside a double-quoted `bash -c`, and avoid `$` and nested `awk`.
  Filter example (species 1,2,4,6 only):
  `qcmd -l walltime=00:30:00 -- bash -c "cd $PWD && ./scm 2>&1 | grep -E 'DBGM[23] +[0-9]+ +[0-9]+ +[1246] ' | head -30"`
- Long runs: `./run_scm.py -c twpice -s SCM_GFS_v17_p8_ugwpv1 -n input_GFS_v17_p8_ugwpv1.nml -t tracers_GFS_v17_p8_ugwpv1.txt --runtime 259200 > /dev/null 2>&1`
  (hourly output by default). `qv_tag_init_mode` and `debug_disable_forcing` must be
  set in `scm/etc/case_config/twpice.nml`, since `run_scm.py` rebuilds the run
  directory from it.
- `if (ANY(L_qc .eqv. .true.)) then` (and L_qr/L_qi/L_qs/L_qg) appears **twice**: the
  first set is the fall-speed / `ksed1` blocks, the second set is sedimentation. G1 and
  DBGR2 were both first inserted at the wrong one; always check the next lines.
- Identical anchor text also occurs for `if (qv1d(k) .gt. 0.) tg_f(1) = ...` (B1 and
  C1) and `if (tg_x .gt. 0.) then` (E1 and the old sedimentation starts). Insert/replace
  by verified line number, never by the first text match.
- Bash `!` inside double quotes triggers history expansion; use single quotes.
- `./scm ... | head` kills the run early (SIGPIPE) and leaves `output.nc` mostly
  fill values (9.969e36). For `output.nc` checks run to completion:
  `./scm > /dev/null 2>&1`.

---

---

## 9. Debug code currently in (remove before real runs)

**DBGM1 -- end of B1, inside `if (ltag)`, after the rain-override mirror line.**
```fortran
            ! DEBUG DBGM1: in mode 2 tag and real rate tendencies must match here
            if (k .eq. kts) tg_ncall = tg_ncall + 1
            tg_x = abs(tg_ten(k,1)-qvten(k)) + abs(tg_ten(k,2)-qcten(k))      &
                 + abs(tg_ten(k,3)-qiten(k)) + abs(tg_ten(k,4)-qrten(k))      &
                 + abs(tg_ten(k,5)-qsten(k)) + abs(tg_ten(k,6)-qgten(k))
            if (tg_x .gt. 1.e-14) print '(a,2i5,10es11.3)', 'DBGM1', tg_ncall, &
                 k, tg_x, tg_ten(k,1)-qvten(k), tg_ten(k,2)-qcten(k),         &
                 tg_ten(k,3)-qiten(k), tg_ten(k,4)-qrten(k),                  &
                 tg_ten(k,5)-qsten(k), tg_ten(k,6)-qgten(k),                  &
                 tg_f(1)-1., tg_f(3)-1., tg_f(5)-1.
```
The `tg_ncall` increment here is used by DBGR and DBGST too; remove it (and the
`tg_ncall` declaration) last.

**DBGR1 -- directly after the E2 `endif`, inside the rain-evaporation loop.**
```fortran
            ! DEBUG DBGR1: rain tag vs real after rain evaporation (mode 2)
            if (ltag .and. abs(tg_ten(k,4)-qrten(k))*DT .gt. 1.e-14)          &
               print '(a,2i5,3es12.4)', 'DBGR1', tg_ncall, k, qrten(k)*DT,     &
                     tg_ten(k,4)*DT, (tg_ten(k,4)-qrten(k))*DT
```

**DBGR2 -- after rain sedimentation, directly before the SECOND
`if (ANY(L_qc .eqv. .true.)) then`.**
```fortran
      ! DEBUG DBGR2: rain tag vs real after rain sedimentation (mode 2)
      if (ltag) then
         do k = kts, kte
            if (abs(tg_ten(k,4)-qrten(k))*DT .gt. 1.e-14)                    &
               print '(a,2i5,3es12.4)', 'DBGR2', tg_ncall, k, qrten(k)*DT,     &
                     tg_ten(k,4)*DT, (tg_ten(k,4)-qrten(k))*DT
         enddo
      endif
```

**DBGST -- stage-check routine**, internal to `mp_thompson` (a `contains` + this routine
directly before `end subroutine mp_thompson`):
```fortran
   contains

!> DEBUG DBGST (qv_tag, remove later): compare tag and real provisional
!! state (q1d + ten*DT) for all six species at one MP stage; print any
!! relative difference above 1e-12 (mode 2: tag must equal real)
      subroutine tg_dbg_stage(istage)
         integer, intent(in) :: istage
         integer :: kk, nn
         real(wp) :: rr6(6), tt
         do kk = kts, kte
            rr6(1) = qv1d(kk) + qvten(kk)*DT
            rr6(2) = qc1d(kk) + qcten(kk)*DT
            rr6(3) = qi1d(kk) + qiten(kk)*DT
            rr6(4) = qr1d(kk) + qrten(kk)*DT
            rr6(5) = qs1d(kk) + qsten(kk)*DT
            rr6(6) = qg1d(kk) + qgten(kk)*DT
            do nn = 1, 6
               tt = tg1d(kk,nn) + tg_ten(kk,nn)*DT
               if (abs(rr6(nn)) .gt. 1.e-14) then
                  if (abs(tt-rr6(nn)) .gt. 1.e-12*abs(rr6(nn)))           &
                     print '(a,i3,i7,i5,i3,3es14.6)', 'DBGST', istage,    &
                           tg_ncall, kk, nn, rr6(nn), tt,                 &
                           (tt-rr6(nn))/rr6(nn)
               endif
            enddo
         enddo
      end subroutine tg_dbg_stage
```
and nine one-line calls `      if (ltag) call tg_dbg_stage(N)`, each directly after:

| N | After |
|---|---|
| 1 | the `enddo` closing the post-rate refresh loop |
| 2 | the `enddo` closing the `prw_vcd` loop |
| 3 | the `enddo` closing the rain-evaporation loop (before `#if ( WRF_CHEM == 1 )`) |
| 4 | the DBGR2 `endif` |
| 5 | the `endif` closing cloud sedimentation |
| 6 | the `endif` closing ice sedimentation |
| 7 | the `endif` closing snow sedimentation |
| 8 | the `endif` closing graupel sedimentation |
| 9 | the `endif` closing the `xri`/`xrc` block |

Worth keeping (commented out) to re-run after the isotope hooks go in.

**DBGM2 / DBGM3 -- in `mp_thompson.F90`.** Locals after `integer :: n6`:
```fortran
         integer, save   :: ndbgm = 0      ! DEBUG DBGM2/3 (remove later)
         integer         :: kdb
         real(kind_phys) :: rdb(6), tdb(6)
```
DBGM2 (MP entry) directly after `tg_q = 0.0_kind_phys`:
```fortran
         ! DEBUG DBGM2: tag vs real at MP entry (mode 2 must match)
         if (ltag) then
            ndbgm = ndbgm + 1
            do kdb = 1, nlev
               rdb = (/ spechum(1,kdb), qc(1,kdb), qi(1,kdb), qr(1,kdb), qs(1,kdb), qg(1,kdb) /)
               tdb = gq0(1,kdb,nqvtag:nqvtag+5)
               do n6 = 1, 6
                  if (rdb(n6) > 1.e-14_kind_phys) then
                     if (abs(tdb(n6)-rdb(n6)) > 1.e-12_kind_phys*rdb(n6))           &
                        print '(a,3i6,3es13.5)', 'DBGM2', ndbgm, kdb, n6,          &
                              rdb(n6), tdb(n6), (tdb(n6)-rdb(n6))/rdb(n6)
                  endif
               enddo
            enddo
         endif
```
DBGM3 (MP exit), directly after the `endif` closing the `ten_q` tag loop (T4b):
```fortran
         ! DEBUG DBGM3: tag vs real at MP exit (mode 2 must match)
         if (ltag) then
            do kdb = 1, nlev
               rdb = (/ new_spechum(1,kdb), new_qc(1,kdb), new_qi(1,kdb),         &
                        new_qr(1,kdb), new_qs(1,kdb), new_qg(1,kdb) /)
               tdb = tg_q(1,kdb,:)
               do n6 = 1, 6
                  if (rdb(n6) > 1.e-14_kind_phys) then
                     if (abs(tdb(n6)-rdb(n6)) > 1.e-12_kind_phys*rdb(n6))           &
                        print '(a,3i6,3es13.5)', 'DBGM3', ndbgm, kdb, n6,          &
                              rdb(n6), tdb(n6), (tdb(n6)-rdb(n6))/rdb(n6)
                  endif
               enddo
            enddo
         endif
```

### 9a. Removal checklist (all debug prints, incl. outside MP)
- `module_mp_thompson.F90`:
  - **DBGST**: the internal routine `tg_dbg_stage` (after `contains`, just before
    `end subroutine mp_thompson`; remove the `contains` line too) and its nine calls
    `if (ltag) call tg_dbg_stage(N)` (after the refresh loop, `prw_vcd` loop, rain
    evaporation loop, DBGR2 block, cloud/ice/snow/graupel sedimentation blocks, and the
    melt/freeze block).
  - **DBGR1** (after the E2 `endif`, inside the rain-evaporation loop) and **DBGR2**
    (after rain sedimentation, before the second `if (ANY(L_qc ...))`).
  - **DBGM1** block at the end of the B1 tag block (starts `! DEBUG DBGM1`).
  - `integer, save :: tg_ncall = 0` in the locals **last** (used by DBGM1, DBGR, DBGST).
  - (DBGI was a one-off print and has already been removed.)
- `mp_thompson.F90`: **DBGM2** block (after `tg_q = 0.0_kind_phys`), **DBGM3** block
  (after the `ten_q` tag loop), and the locals `ndbgm`, `kdb`, `rdb`, `tdb`. Thresholds
  are now 1e-12 relative, 1e-14 floor.
- `mfscuq.f`: **DBGD** block (`! DEBUG: downdraft real vs tag`).
- `satmedmfvdifq.F`: `ENTRY` prints (~432-433) and the `ndbgp` prints.
- Also still in from earlier work: DBGC/DBGS/DBGE/DBGT (convection), PHDBG
  (photochemistry).
- Always printing even with tagging off: `GFS_typedefs.F90` ~4537 (`print*,tagging`),
  `scm_output.F90` ~184, `scm_type_defs.F90` ~522.

---

## 10. Known residuals and open items
- **Residuals:** none above double-precision round-off in mode 2 (3-day run). The
  earlier ice/snow cloud-top residual, the rain residual and the qv float32 steps were
  all floor/phantom-R1 cases and are closed (Batches 10, 12, 14).
- **Mode 2 limitation:** mode 2 cannot detect a transfer that uses the wrong source's
  fraction (all fractions are 1). The rate map was checked line by line against the
  real code; a complementary-split additivity test (two runs with tags = real below /
  above a level, tagA + tagB must equal real) would test it directly. Not yet run.
- **Untagged paths:** the `sedi_semi = .false.` flux-form rain and graupel loops (not
  used by this suite). Needed for other configurations.
- **Also untagged:** the driver's `qv = max(1.E-7, ...)` fix-up after the column call
  (unreachable after the column's 1e-10 clip).
- **Tagged surface precipitation:** `semi_lagrange_sedim` already computes
  `precipt`; not yet passed or output.
- **Next:** 3-day mode 0 run with forcing on (tags >= 0, tag <= real, fractions <= 1,
  no crash at the 1e-10 floor, level 80-85 region), then debug-print removal, then the
  tagging on/off switch (default off = unchanged SCM, bit-for-bit test).

---

---

## 11. Isotope hooks (later)
Each is a plain transfer now; the isotope version replaces it at the same place.

| Process | Location | Isotope treatment (Nusbaumer et al. 2017) |
|---|---|---|
| Cloud condensation/evaporation | E1 (`prw_vcd`) | Eq 14-15 equilibrium, alpha_e liquid (Horita & Wesolowski 1994); use the erratum form of Eq 14. Full evaporation (cloud gone) stays non-fractionating |
| Vapor -> ice/snow/graupel (positive `pri_inu`, `pri_iha`, `pri_ide`, `prs_ide`, `prs_sde`, `prg_gde`) | B1 two-body terms 1-6 | Rayleigh + kinetic, Eq 16-18, S = 1 - 0.002(T - 273.16) (Eq 19), alpha_e ice (Majoube 1971 / Merlivat & Nief 1967) |
| Sublimation (negative parts of the same terms) | B1 terms 1-6, p < 0 | non-fractionating (as now) |
| Rain evaporation | E2 (`prv_rev`) | Eq 34 partial equilibration, fe from Eq 22-33 (drop radius from rain rate, `vtrk`, `diffu`, D/Di). Near-zero complete-evaporation branch stays non-fractionating |
| WBF | implicit (E1 evaporation + B1 deposition) | follows from the two hooks above |
| Autoconversion, accretion, riming, collection, freezing, melting, splintering, sedimentation, `xri`/`xrc` | B1, F2/F3, G1-G3, E3/E4 | non-fractionating (as now) |
| Water created by R1 floors / phantom R1 | G1-G3, F2/F3, S5, E1/E2 fallbacks | non-fractionating: takes the local ratio (vapor ratio if the level had none of that species) -- no spurious fractionation |
| Fractionation temperature | all hooks | mean of the temperature before and after the phase change |