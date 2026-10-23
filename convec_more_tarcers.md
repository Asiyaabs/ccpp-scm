# Deep convection in-scheme tagging (samfdeepcnv), 2026-09-27

Every real water transfer in `samfdeepcnv` gets a matching tag transfer inside the scheme,
following Nusbaumer et al. (2017). The fractionation factor `tg_alpha` is explicit (1 for
tagged water). No real value is changed. This replaces the ratio correction in
`GFS_DCNV_generic_post.F90`. Shallow convection is not changed yet.

**Status:** all edits in and grep-checked. Not yet built or run.

Fixed-form Fortran: code starts in column 7, continuation `&` in column 6, and no new line
exceeds 72 columns. Line numbers are as of the end of the session.

**Backups:** `samfdeepcnv.f.pre_tag.bak`, `samfdeepcnv.meta.pre_tag.bak`,
`GFS_DCNV_generic_post.F90.pre_tag.bak`

---

## `ccpp/physics/physics/CONV/SAMF/samfdeepcnv.f`

### DD0: argument list, line 89
Why: the scheme needs the tag's tracer index and the packing flags to find qv_tag's slot.
```fortran
! before
     &    errmsg,errflg)
! after
     &    nqvtag,otsptflag,errmsg,errflg)
```

### DD1: declarations, line 318 (after `& new_q1(im,km),new_qtr(im,km,nn)`)
Why: new arguments and tag counterparts of every real water array; `tg_` prefix avoids
name clashes.
```fortran
      integer, intent(in), optional :: nqvtag
      logical, intent(in) :: otsptflag(:)
!  qv_tag in-scheme tagging: tag counterparts of real water
      integer tg_n, tg_j
      integer, save :: tg_ndbg = 0
      real(kind=kind_phys) tg_alpha, tg_gam, tg_den, tg_vap, tg_cnd,
     &     tg_rc, tg_rr, tg_rain, tg_qev, tg_tem, tg_tem1
      real(kind=kind_phys) tg_qv(im,km),    tg_qo(im,km),
     &     tg_qcko(im,km),  tg_qrcko(im,km), tg_qcdo(im,km),
     &     tg_qrcdo(im,km), tg_pwo(im,km),   tg_pwdo(im,km),
     &     tg_dellal(im,km),tg_dellaq(im,km),tg_newqv(im,km),
     &     tg_dql(im,km),   tg_dqi(im,km),   tg_flx(im,0:km)
      real(kind=kind_phys) tg_qlkt(im), tg_pwav(im), tg_rn(im)
```

### DD2: setup, after `new_qtr = qtr` (ends line 379)
Why: find qv_tag's slot in `qtr` using the same counting as `GFS_suite_interstitial_3`,
and start all tag arrays from zero.
```fortran
!  qv_tag: locate tag slot in qtr (same order as interstitial_3)
      tg_n = 0
      tg_j = 0
!  fractionation factor at condensation: 1 for tagged water
      tg_alpha = 1.0
      if (present(nqvtag)) tg_n = nqvtag
      if (hwrf_samfdeep) tg_n = 0
      if (tg_n > 0) then
        if (.not. otsptflag(tg_n)) then
          tg_n = 0
        else
          tg_j = 2
          do n = 2, tg_n
            if (otsptflag(n)) tg_j = tg_j + 1
          enddo
        endif
      endif
      tg_qv     = 0.
      tg_qo     = 0.
      tg_qcko   = 0.
      tg_qrcko  = 0.
      tg_qcdo   = 0.
      tg_qrcdo  = 0.
      tg_pwo    = 0.
      tg_pwdo   = 0.
      tg_dellal = 0.
      tg_dellaq = 0.
      tg_dql    = 0.
      tg_dqi    = 0.
      tg_flx    = 0.
      tg_qlkt   = 0.
      tg_pwav   = 0.
      tg_rn     = 0.
      if (tg_n > 0) tg_qv(:,:) = qtr(:,:,tg_j)
      tg_newqv = tg_qv
```

### DD3: environment tag, line 826 (after the interface loop ending `vo(i,k) = .5*(vo(i,k)+vo(i,k+1))`)
Why: the plumes entrain `qo` (an interface extrapolation), not `q1`, so the tag's
environment must be built the same way to track exactly.
```fortran
!  qv_tag: environment tag consistent with qo (interface extrapolation)
      if (tg_n > 0) then
      do k = 1, km
        do i = 1, im
          if (k <= kmax(i)-1) then
            tg_tem = max(q1(i,k+1), 1.e-10_kind_phys)
            tg_qo(i,k) = qo(i,k) * tg_qv(i,k+1) / tg_tem
          elseif (k == kmax(i)) then
            tg_tem = max(q1(i,k), 1.e-10_kind_phys)
            tg_qo(i,k) = qo(i,k) * tg_qv(i,k) / tg_tem
          endif
        enddo
      enddo
      endif
```

### DD4: updraft start, line 1633 (after `qrcko(i,kb(i)) = qo(i,kb(i))`)
Why: the tag updraft starts from the environment tag at `kb`, like the real one.
```fortran
          tg_qcko(i,kb(i))  = tg_qo(i,kb(i))
          tg_qrcko(i,kb(i)) = tg_qo(i,kb(i))
```

### DD5: updraft mixing, lines 1654 (main) and 1855 (overshoot), after `qrcko(i,k) = qcko(i,k)`
Why: entrainment mixes the tag with the same weights (`tem`, `factor`) as real water.
```fortran
              tg_qcko(i,k) = ((1.-tem)*tg_qcko(i,k-1)+tem*
     &                     (tg_qo(i,k)+tg_qo(i,k-1)))/factor
              tg_qrcko(i,k) = tg_qcko(i,k)
```

### DD6: updraft condensation, lines 1681 (main) and 1876 (overshoot), after `pwavo(i) = pwavo(i) + pwo(i,k)`
Why: Eq 14 splits the tag total into vapor and condensate. The condensate tag fraction then
scales the suspended water, rain and detrained water.
```fortran
!  qv_tag: Eq 14 (Nusbaumer 2017) split of updraft total water
              tg_gam = 0.
              if (qrcko(i,k) > 0.) tg_gam = qrch / qrcko(i,k)
              tg_den = tg_alpha * (1. - tg_gam) + tg_gam
              tg_vap = tg_qrcko(i,k) * tg_gam / tg_den
              tg_cnd = tg_qrcko(i,k) - tg_vap
              tg_rc  = tg_cnd / (qrcko(i,k) - qrch)
              tg_qcko(i,k)   = qlk * tg_rc + tg_vap
              tg_pwo(i,k)    = pwo(i,k) * tg_rc
              tg_dellal(i,k) = dellal(i,k) * tg_rc
              tg_pwav(i)     = tg_pwav(i) + tg_pwo(i,k)
```

### DD7: cloud top, line ~2078 (inside `if(dq > 0.) then`, before `qlko_ktcon(i) = dq`)
Why: the same Eq 14 split for the cloud-top liquid/vapor separation. It has to run before
`qcko` is overwritten.
```fortran
            tg_gam = 0.
            if (qcko(i,k) > 0.) tg_gam = qrch / qcko(i,k)
            tg_den = tg_alpha * (1. - tg_gam) + tg_gam
            tg_vap = tg_qcko(i,k) * tg_gam / tg_den
            tg_qlkt(i)   = tg_qcko(i,k) - tg_vap
            tg_qcko(i,k) = tg_vap
```

### DD8: downdraft start, line 2199 (after `qrcdo(i,jmn)= qo(i,jmn)`)
Why: the tag downdraft starts from the environment tag at `jmin`, like the real one.
```fortran
          tg_qcdo(i,jmn)  = tg_qo(i,jmn)
          tg_qrcdo(i,jmn) = tg_qo(i,jmn)
```

### DD9: downdraft, line 2286 (after `pwevo(i) = pwevo(i) + pwdo(i,k)`)
Why: evaporated rain carries the column rain tag fraction, with no fractionation (Kurita
2011). If the downdraft condenses instead, that goes through the Eq 14 hook.
```fortran
!  qv_tag: downdraft mixing; rain evaporation (no fractionation,
!  Kurita et al. 2011) or condensation (Eq 14 hook)
              tg_qcdo(i,k) = ((1.-tem)*tg_qrcdo(i,k+1)+tem*
     &                     (tg_qo(i,k)+tg_qo(i,k+1)))/factor
              if (qrcdo(i,k) >= qcdo(i,k)) then
                tg_rr = 0.
                if (pwavo(i) > 0.) tg_rr = tg_pwav(i) / pwavo(i)
                tg_qrcdo(i,k) = tg_qcdo(i,k)
     &                        + (qrcdo(i,k) - qcdo(i,k)) * tg_rr
              else
                tg_gam = 0.
                if (qcdo(i,k) > 0.) tg_gam = qrcdo(i,k) / qcdo(i,k)
                tg_den = tg_alpha * (1. - tg_gam) + tg_gam
                tg_qrcdo(i,k) = tg_qcdo(i,k) * tg_gam / tg_den
              endif
              tg_pwdo(i,k) = etad(i,k)
     &                     * (tg_qcdo(i,k) - tg_qrcdo(i,k))
```

### DD10: tag `dellaq`, lines 2605-2686 (after the real moisture TVD loop ending `(flxtvd(i,k) - flxtvd(i,k-1)) * grav/dp`)
Why: the environmental tag tendency uses the same flux form and order as real `dellaq`
(surface, flux, cloud top, TVD). The TVD limiter `phkp` is taken from real `q1`, so the
limiter is identical for real and tag.
```fortran
!  qv_tag: tag counterpart of dellaq; TVD limiter phkp from real q1
      do i = 1, im
        if (cnvflg(i)) then
          dp = 1000. * del(i,1)
          tg_tem = edto(i) * etad(i,1) * grav / dp
          tg_dellaq(i,1) = tg_tem * tg_qrcdo(i,1)
        endif
      enddo
      do k = 2, km1
        do i = 1, im
          if (cnvflg(i) .and. k < ktcon(i)) then
            aup = 1.
            if(k <= kb(i)) aup = 0.
            adw = 1.
            if(k > jmin(i)) adw = 0.
            dp = 1000. * del(i,k)
            tem1  = -eta(i,k) * tg_qrcko(i,k)
            tem2  = -eta(i,k-1) * tg_qcko(i,k-1)
            ptem1 = -etad(i,k) * tg_qrcdo(i,k)
            ptem2 = -etad(i,k-1) * tg_qcdo(i,k-1)
            tg_dellaq(i,k) = tg_dellaq(i,k) +
     &        (aup*(tem1-tem2)-adw*edto(i)*(ptem1-ptem2))*grav/dp
          endif
        enddo
      enddo
      do i = 1, im
        if(cnvflg(i)) then
          indx = ktcon(i)
          dp = 1000. * del(i,indx)
          tg_tem = eta(i,indx-1) * grav / dp
          tg_dellaq(i,indx) = tg_tem * tg_qcko(i,indx-1)
          tg_dellal(i,indx) = tg_tem * tg_qlkt(i)
        endif
      enddo
      tg_flx = 0.
      do k = 1, km1
        do i = 1, im
          if(cnvflg(i) .and. k < ktcon(i)) then
            tem = 0.
            if(k >= kb(i)) tem = eta(i,k)
            if(k <= jmin(i)) then
              tem = tem - edto(i) * etad(i,k)
            endif
            if(tem > 0.) then
              rrkp = 0.
              if(abs(q_diff(i,k)) > 1.e-22)
     &               rrkp = q_diff(i,k+1) / q_diff(i,k)
              phkp = (rrkp+abs(rrkp)) / (1.+abs(rrkp))
              tg_tem1 = tg_qv(i,k+1) +
     &                   phkp*(tg_qo(i,k)-tg_qv(i,k+1))
              tg_flx(i,k) = tem * tg_tem1
            elseif(tem < 0.) then
              rrkp = 0.
              if(abs(q_diff(i,k)) > 1.e-22)
     &               rrkp = q_diff(i,k-1) / q_diff(i,k)
              phkp = (rrkp+abs(rrkp)) / (1.+abs(rrkp))
              tg_tem1 = tg_qv(i,k) +
     &                  phkp*(tg_qo(i,k)-tg_qv(i,k))
              tg_flx(i,k) = tem * tg_tem1
            else
              tg_tem1 = tg_qo(i,k)
              tg_flx(i,k) = 0.
            endif
            if(k == jmin(i)) then
              dp = 1000. * del(i,k+1)
              tg_dellaq(i,k+1) = tg_dellaq(i,k+1) -
     &            edto(i) * etad(i,k) * tg_tem1 * grav/dp
            endif
            if(k == kb(i)) then
              dp = 1000. * del(i,k)
              tg_dellaq(i,k) = tg_dellaq(i,k) -
     &            eta(i,k) * tg_tem1 * grav/dp
            endif
          endif
        enddo
      enddo
      do k = 1, km1
        do i = 1, im
          if(cnvflg(i) .and. k <= ktcon(i)) then
             dp = 1000. * del(i,k)
             tg_dellaq(i,k) = tg_dellaq(i,k) +
     &           (tg_flx(i,k) - tg_flx(i,k-1)) * grav/dp
          endif
        enddo
      enddo
```

### DD11: apply, line 3410 (after the feedback loop ending `delvbar(i) = delvbar(i) + tem * dellav(i,k)`)
Why: apply the tag tendency with the same cloud-base mass flux and time step as `new_q1`.
```fortran
!  qv_tag: apply with the same cloud-base mass flux as new_q1
      do k = 1, km
        do i = 1, im
          if (cnvflg(i) .and. k <= kmax(i)) then
            if(k <= ktcon(i)) then
              tg_newqv(i,k) = tg_qv(i,k)
     &                      + xmb(i) * dt2 * tg_dellaq(i,k)
            endif
          endif
        enddo
      enddo
```

### DD12a: line 3613 (after `delq2(i) = 0.`)
Why: reset the tagged surface rain each call, like `rntot`/`delqev`.
```fortran
        tg_rn(i) = 0.
```

### DD12b: line 3647 (after `rn(i) = rn(i) + rain * xmb(i) * .001 * dt2`)
Why: accumulate tagged rain from the same updraft rain and downdraft evaporation terms as `rn`.
```fortran
              tg_rain = aup * tg_pwo(i,k)
     &                + adw * edto(i) * tg_pwdo(i,k)
              tg_rn(i) = tg_rn(i) + tg_rain * xmb(i) * .001 * dt2
```

### DD12c: line 3671 (inside `if(rn(i) > 0. .and. qevap(i) > 0.) then`, before `new_q1(i,k) = new_q1(i,k) + qevap(i)`)
Why: sub-cloud evaporation returns tag at the falling rain's tag fraction. This is the
Stewart (1975) hook for isotopes. It must run before `rn` is reduced.
```fortran
!  qv_tag: sub-cloud rain evaporation (Stewart 1975 hook; ratio now)
                tg_rr  = tg_rn(i) / rn(i)
                tg_qev = qevap(i) * tg_rr
                tg_newqv(i,k) = tg_newqv(i,k) + tg_qev
                tg_rn(i) = tg_rn(i) - .001 * tg_qev * tem1
```

### DD13: detrainment, line 3776 (after `tem1 = max(0.0, min(1.0, (tcr-new_t1(i,k))*tcrf))`, before the real `if (new_qtr(i,k,2) > -999.0)`)
Why: detrained tag condensate is split into qi_tag/ql_tag by the same temperature fraction as real ice/liquid.
```fortran
              tg_tem = tg_dellal(i,k) * xmb(i) * dt2
              if (new_qtr(i,k,2) > -999.0) then
                tg_dqi(i,k) = tg_tem * tem1
                tg_dql(i,k) = tg_tem * (1.0-tem1)
              else
                tg_dqi(i,k) = tg_tem
              endif
```

### DD14: no-rain reset, line 3803 (after `new_q1(i,k) = qo(i,k)`)
Why: when convective rain is zero, the real scheme undoes its changes; the tag does the same.
```fortran
              tg_newqv(i,k) = tg_qv(i,k)
```

### DD15: output, lines 3950-3962 (after `dqtr  = (new_qtr - qtr)/delt`, before `return`)
Why: the in-scheme tag tendencies replace the generic tracer result for qv_tag's slot and
fill ql_tag/qi_tag. DBGC is a temporary check.
```fortran
!  qv_tag: in-scheme tag tendencies replace the generic tracer path
      if (tg_n > 0) then
        dqtr(:,:,tg_j)    = (tg_newqv - tg_qv) / delt
        ten_q(:,:,tg_n+1) = tg_dql / delt
        ten_q(:,:,tg_n+2) = tg_dqi / delt
!  DEBUG DBGC (mode 2: all four ~0 if tags entered equal to real)
        if (tg_ndbg < 20) then
          tg_ndbg = tg_ndbg + 1
          print *, 'DBGC', maxval(abs(tg_newqv - new_q1)),
     &      maxval(abs(dqtr(:,:,tg_j) - ten_q(:,:,1))),
     &      maxval(abs(ten_q(:,:,tg_n+1) - dqtr(:,:,2))),
     &      maxval(abs(ten_q(:,:,tg_n+2) - dqtr(:,:,1)))
        endif
      endif
```
DBGC columns: qv_tag vs qv new state, qv_tag vs qv tendency, ql_tag vs ql tendency, qi_tag
vs qi tendency. **Remove before real runs.**

---

## `ccpp/physics/physics/CONV/SAMF/samfdeepcnv.meta`

### DM1: lines ~821-835, between `[cat_adj_deep]` and the run table's `[errmsg]`
Why: metadata for the two new arguments, in the same order as the Fortran argument list;
`optional = True` matches the post's entry and the Fortran `optional`.
```
[nqvtag]
  standard_name = index_of_tagged_water_vapor_in_tracer_concentration_array
  long_name = tracer index for tagged water vapor
  units = index
  dimensions = ()
  type = integer
  intent = in
  optional = True
[otsptflag]
  standard_name = flag_convective_tracer_transport_interstitial
  long_name = flag for interstitial tracer transport
  units = flag
  dimensions = (number_of_tracers)
  type = logical
  intent = in
```

---

## `ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_DCNV_generic_post.F90`

### DP1a: `case (1)`, ~lines 114-126, block before `do n = 1, ntrac`, commented out
Why: the ratio correction's saved values are no longer used.
```fortran
!              if (present(nqvtag)) then
!                old_qv_tag_val = gq0(i,k,nqvtag)
!                old_ql_val = gq0(i,k,ntcw)
!                ...
!                old_qg_tag = gq0(i,k,nqvtag+5)
!              end if
```

### DP1b: `case (1)`, ~lines 131-150, block after `do n = 1, ntrac ... end do`, commented out
Why: the ratio overwrite would discard the in-scheme tag tendencies, and it can never
create ql_tag/qi_tag from 0.
```fortran
!              if (present(nqvtag)) then
!                if (old_qv_val > 1.0e-9_kind_phys) then
!                  gq0(i,k,nqvtag) = old_qv_tag_val * (gq0(i,k,ntqv) / old_qv_val)
!                end if
!                ...
!              end if
```
Declarations are kept. Only lines 18 (argument) and 52 (declaration) still reference `nqvtag`.

## `GFS_DCNV_generic_post.meta`
Unchanged in the end. An accidental paste of `[nqvtag]` + `[otsptflag]` above `[errmsg]`
was removed; only the earlier `[nqvtag]` block (~319, before `[gq0]`) remains.

## `ccpp/suites/suite_SCM_GFS_v17_p8_ugwpv1.xml`

### S1: lines 67-68 uncommented
Why: turn on deep convection only, so it can be tested in isolation with shallow still off.
```xml
      <scheme>samfdeepcnv</scheme>
      <scheme>GFS_DCNV_generic_post</scheme>
      <!--<scheme>samfshalcnv</scheme>-->
      <!--<scheme>GFS_SCNV_generic_post</scheme>-->
```

---

## Next
1. `cmake ../src` (meta files changed) and `make`.
2. Test: PBL + DCNV, `qv_tag_init_mode=2`, `debug_disable_forcing=.true.`, run `./scm`
   directly, then `grep -A1 DBGC`.
3. Shallow (`samfshalcnv`): the same edits minus the downdraft (no DD8/DD9); rain is just
   `pwo`. Then comment out the ratio lines in `GFS_SCNV_generic_post.F90`.
4. Isotopes later: `tg_alpha` from temperature (Eq 14 liquid / Eq 16 ice), where to
   separate ice in the updraft, Stewart (Eq 22-34) at the sub-cloud hook, and a tagged
   convective-rain diagnostic from `tg_rn`.


# Photochemistry (h2ophys) in-scheme tagging, 2026-09-28

Stratospheric H2O photochemistry now updates qv_tag in the same implicit step as qv.
Tag rule: every in-column change to real water is reflected in the tag. Only water added
from outside the column (forcing/advection) stays untagged.
- The `-q/tau` loss uses the same denominator as qv.
- In-column production (positive parts of `c1` and `c3/tau`) is added to the tag in full.
  This is the source-ratio hook for isotopes.
- Sinks that don't scale with q (negative parts) remove the tag's fraction, via the
  `tg_alpha` hook.

**Status:** built and run. Mode 2, forcing off, `h2o_phys=.true.`: qv vs qv_tag gap = 0 at
all levels (float32). PHDBG tendencies are identical.

**Real formula** (`module_h2ophys.F90`, ~line 229, applied where p < 100 hPa and `pltc2 /= 0`):
`h2o = (h2oib + (c1 + c3/tau)*dt) / (1 + dt/tau)`, with `c1=pltc(:,1)`, `tau=pltc(:,2)`
(`temp=1/tau`), `c3=pltc(:,3)`.

**Backups:** `module_h2ophys.F90.pre_tag.bak`, `GFS_photochemistry.F90.pre_tag.bak`,
`GFS_photochemistry.meta.pre_tag.bak`

---

## `ccpp/physics/physics/photochem/module_h2ophys.F90`

**PH1 (line 152).** Optional tag argument, so existing calls stay valid.
```fortran
  subroutine run(this, dt, p, h2opltc, h2o, dqv_dt_prd, dqv_dt_qv, h2otag)
```

**PH2 + PH3a (lines 166-168, after the `dqv_dt_qv` declaration).**
```fortran
    real(kind_phys), intent(inout), dimension(:,:), optional :: &
         h2otag    ! tagged h2o, updated in step with h2o
    real(kind_phys) :: tg_sneg, tg_spos, tg_frac, tg_alpha
```

**PH3 + PH3b (lines ~234-249, directly after the real `h2o(iCol,iLev) = ...` update, inside
the same `if`).** Same implicit step and same `pltc`; uses `h2oib` (the old value).
```fortran
             if (present(h2otag)) then
!  tag: in-column production is tagged in full (source-ratio hook);
!  -q/tau loss via same denominator; q-independent sinks at tag
!  fraction (tg_alpha hook)
                tg_alpha = 1.0_kind_phys
                tg_spos  = max(pltc(iCol,1), 0.0_kind_phys) &
                         + max(pltc(iCol,3)*temp, 0.0_kind_phys)
                tg_sneg  = min(pltc(iCol,1), 0.0_kind_phys) &
                         + min(pltc(iCol,3)*temp, 0.0_kind_phys)
                tg_frac  = 0.0_kind_phys
                if (h2oib(iCol) > 0.0_kind_phys) &
                   tg_frac = h2otag(iCol,iLev) / h2oib(iCol)
                h2otag(iCol,iLev) = (h2otag(iCol,iLev)             &
                   + (tg_spos + tg_alpha*tg_frac*tg_sneg)*dt)      &
                   / (1.0 + temp*dt)
             endif
```
In mode 2 this is identical to the real update, because `spos + sneg = c1 + c3/tau` and
`tg_frac = 1`. PH3b replaced the first PH3 version, which left production untagged.

---

## `ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_photochemistry.F90`

**PH4 (line 50).** Argument list.
```fortran
       do3_dt_temp, do3_dt_ohoz, dqv_dt_prd, dqv_dt_qvmx, nqvtag, errmsg, errflg)
```

**PH5 (line 61, after `levs ! vertical dimension`).**
```fortran
    integer, intent(in), optional :: nqvtag   ! index of tagged water vapor
```

**PH6 (lines 104-105, after `init_h2o0, h2o0 ...`).**
```fortran
    real(kind=kind_phys), dimension(im,levs) :: tag0   ! updated local qv_tag
    logical :: ltag
```

**PH7 (inside `if (h2o_phys) then`).** Replaces the original single call. Pass the tag only
when `nqvtag` is present.
```fortran
       ltag = .false.
       if (present(nqvtag)) then
          if (nqvtag > 0) ltag = .true.
       endif
       if (ltag) then
          tag0 = gq0(:,:,nqvtag)
          call h2ophys%run(dtp, prsl, h2opl, h2o0, dqv_dt_prd, dqv_dt_qvmx, h2otag=tag0)
       else
          call h2ophys%run(dtp, prsl, h2opl, h2o0, dqv_dt_prd, dqv_dt_qvmx)
       endif
```
**Bug fixed:** the original `call h2ophys%run(...)` line (old line 142) had been left above
this block. That applied photochemistry to real qv twice per step (real tendency = 2x tag).
It is now deleted: `grep -n "call h2ophys%run"` shows only the two calls inside the if/else.
Earlier runs with `h2o_phys=.true.` from before this fix over-count photochemistry in qv.

**PH8 (line ~154, after `ten_q(i,k,ntqv) = ...` in the same loop).** Tag tendency. The post
applies `ten_q` for all `n`, so it needs no change.
```fortran
            if (ltag) ten_q(i,k,nqvtag) = (tag0(i,k) - gq0(i,k,nqvtag))/dtp
```

**PHD1/PHD2: temporary debug (remove before real runs).**
Declarations (after `logical :: ltag`):
```fortran
    integer, save :: ndbgph = 0
    integer :: kd
```
After the tendency loop, inside `if (h2o_phys)`:
```fortran
!  DEBUG PHDBG: tag vs real photochemistry at ~1 hPa, first 5 calls
       if (ndbgph < 5) then
          ndbgph = ndbgph + 1
          kd = minloc(abs(prsl(1,:) - 100.0_kind_phys), 1)
          if (ltag) then
             print '(a,i4,4es16.8)', 'PHDBG', kd, init_h2o0(1,kd), &
                  gq0(1,kd,nqvtag), ten_q(1,kd,ntqv), ten_q(1,kd,nqvtag)
          else
             print *, 'PHDBG ltag is FALSE'
          endif
       endif
```

---

## `ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_photochemistry.meta`

**PH9 (run table only, directly above the run table's `[errmsg]`, ~line 266).** A copy
accidentally pasted into the init table (~line 33) was removed; line 33 is now blank, which
is harmless.
```
[nqvtag]
  standard_name = index_of_tagged_water_vapor_in_tracer_concentration_array
  long_name = tracer index for tagged water vapor
  units = index
  dimensions = ()
  type = integer
  intent = in
  optional = True
```
A stray terminal escape (`11;rgb:0000/0000/0000`) got into line 1 during editing and broke
`ccpp_prebuild`. It was removed.

---

## `ccpp/physics_namelists/input_GFS_v17_p8_ugwpv1.nml`

**PH10 (line 3).**
```
  h2o_phys     = .true.
```

---

## Build and run notes
- The `.meta` changed, so run `cmake ../src` (it must finish with no prebuild error), then
  `make`. Check the cap: `grep -A30 "call gfs_photochemistry_run" <cap> | grep nqvtag`
  should show `nqvtag=physics%model%nqvtag`.
- Debug prints only show with `./scm` run directly:
  `qcmd -l walltime=00:30:00 -- bash -c "cd $PWD && ./scm 2>&1 | grep PHDBG"`.

## Isotope hooks (later)
- `tg_spos`: multiply by the isotope ratio of methane-oxidation water (prescribed; the
  scheme has no CH4 field).
- `tg_alpha`: photolysis fractionation on q-independent sinks (second order; check the
  literature for a value).

# Step: In-scheme tagging for shallow convection (samfshalcnv) + deep fixes -- convection (DCNV + SCNV) complete

Dates: 2026-09-28 / 2026-09-29

## Summary

- `samfshalcnv.f` now carries qv_tag through the scheme itself, the same way
  `samfdeepcnv.f` does (DD0-DD15). Every transfer of real water inside the
  scheme has a matching tag transfer.
- Design rule adopted: **every phase conversion has an explicit, named
  fractionation hook**, even where tagged water does not fractionate. Hooks are
  set to 1 now; isotope formulas (Nusbaumer et al. 2017) go in later.
  - `tg_a_cond` : vapor -> liquid condensation (updraft, overshoot, cloud top)
  - `tg_a_evap` : rain -> vapor (sub-cloud rain evaporation; Stewart 1975 later)
  - `tg_a_ice`  : detrained condensate -> ice (liquid/ice split)
  - Deep still uses a single `tg_alpha` (= 1) for all its condensation hooks.
- The SCNV post ratio correction was commented out (the in-scheme tendencies
  replace it), as was done for DCNV.
- Combined test (PBL + DCNV + SCNV, mode 2) found a bug in the **deep and
  shallow condensation-split guard** that appears only when an overshoot puts
  the cloud-top split level above the neutral-buoyancy level at a very cold
  level (negative `qcko` / `qrch`). Fixed in all 7 split blocks (3 shallow,
  4 deep).
- Two more deep leaks fixed: the qv negative-moisture borrowing had no tag
  mirror (DB2), and the no-rain reset set the tag to the layer value instead
  of `tg_qo` (DB1).
- Result: with PBL + DCNV + SCNV and `qv_tag_init_mode = 2`, the tag and real
  water match exactly inside both convection schemes (no DBGE/DBGT events).

## Files changed and backups

| File | Backup |
|---|---|
| `ccpp/physics/physics/CONV/SAMF/samfshalcnv.f` | `samfshalcnv.f.pre_tag.bak`, `samfshalcnv.f.pre_guardfix.bak` |
| `ccpp/physics/physics/CONV/SAMF/samfshalcnv.meta` | `samfshalcnv.meta.pre_tag.bak` |
| `ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_SCNV_generic_post.F90` | `GFS_SCNV_generic_post.F90.pre_tag.bak` |
| `ccpp/suites/suite_SCM_GFS_v17_p8_ugwpv1.xml` | `suite_SCM_GFS_v17_p8_ugwpv1.xml.pre_scnv_test.bak` (if made) |
| `ccpp/physics/physics/CONV/SAMF/samfdeepcnv.f` | `samfdeepcnv.f.pre_guardfix.bak`, `samfdeepcnv.f.pre_borrow.bak` |

All Fortran in `samf*.f` is fixed form: code from column 7, continuation `&`
in column 6, nothing past column 72.

---

## A. `samfshalcnv.f` (shallow in-scheme tagging)

Line numbers are approximate (as found at the time of each edit). Anchors are
given by text.

### SS0 - argument list (line 62)
```fortran
     &     cat_adj_shal,nqvtag,otsptflag,errmsg,errflg)
```
(was `cat_adj_shal,errmsg,errflg)`)

### SS1 - declarations (after `     & new_q1(im,km), new_qtr(im,km,nn)`)
```fortran
!  qv_tag in-scheme tagging: tag counterparts of real water
      integer, intent(in), optional :: nqvtag
      logical, intent(in) :: otsptflag(:)
      integer tg_n, tg_j
      integer, save :: tg_ndbg = 0
!  phase-conversion hooks (fractionation factors, 1 for tagged water)
      real(kind=kind_phys) tg_a_cond, tg_a_evap, tg_a_ice
      real(kind=kind_phys) tg_gam, tg_den, tg_vap, tg_cnd, tg_rc,
     &     tg_rr, tg_qev, tg_tem, tg_tem1
      real(kind=kind_phys) tg_qv(im,km),    tg_qo(im,km),
     &     tg_qcko(im,km),  tg_qrcko(im,km), tg_pwo(im,km),
     &     tg_dellal(im,km),tg_dellaq(im,km),tg_newqv(im,km),
     &     tg_dql(im,km),   tg_dqi(im,km),   tg_flx(im,0:km)
      real(kind=kind_phys) tg_qlkt(im), tg_rn(im),
     &     tg_sumn(im), tg_sump(im), tg_rtnp(im)
```

### SS2 - setup (after `      new_qtr = qtr`)
Locates qv_tag's slot `tg_j` in `qtr` (same counting as deep), sets hooks to 1,
zeroes all tag arrays.
```fortran
!  qv_tag: locate tag slot in qtr (same order as interstitial_3)
      tg_n = 0
      tg_j = 0
!  phase-conversion hooks: 1 for tagged water (isotopes later)
      tg_a_cond = 1.0_kind_phys
      tg_a_evap = 1.0_kind_phys
      tg_a_ice  = 1.0_kind_phys
      if (present(nqvtag)) tg_n = nqvtag
      if (hwrf_samfshal) tg_n = 0
      if (tg_n > 0) then
        if (.not. otsptflag(tg_n)) then
          tg_n = 0
        else
          tg_j = 2
          do n = 2, tg_n
            if (otsptflag(n)) tg_j = tg_j + 1
          enddo
        endif
      endif
      tg_qv     = 0.
      tg_qo     = 0.
      tg_qcko   = 0.
      tg_qrcko  = 0.
      tg_pwo    = 0.
      tg_dellal = 0.
      tg_dellaq = 0.
      tg_dql    = 0.
      tg_dqi    = 0.
      tg_flx    = 0.
      tg_qlkt   = 0.
      tg_rn     = 0.
      tg_sumn   = 0.
      tg_sump   = 0.
      tg_rtnp   = 1.
      if (tg_n > 0) tg_qv(:,:) = qtr(:,:,tg_j)
      tg_newqv = tg_qv
```

### SS3 - environment tag (after the `uo`/`vo` interface loop, before the `ctro` block)
Shallow's `qo` is a moist-adiabatic interface extrapolation clipped at 1e-10;
the tag environment is scaled from the source level the same way as deep DD3.
```fortran
!  qv_tag: environment tag consistent with qo (interface extrapolation)
      if (tg_n > 0) then
      do k = 1, km
        do i = 1, im
          if (cnvflg(i) .and. k <= kmax(i)-1) then
            tg_tem = max(q1(i,k+1), 1.e-10_kind_phys)
            tg_qo(i,k) = qo(i,k) * tg_qv(i,k+1) / tg_tem
          elseif (cnvflg(i) .and. k == kmax(i)) then
            tg_tem = max(q1(i,k), 1.e-10_kind_phys)
            tg_qo(i,k) = qo(i,k) * tg_qv(i,k) / tg_tem
          endif
        enddo
      enddo
      endif
```

### SS4 - updraft start (after `          qrcko(i,kb(i)) = qo(i,kb(i))`)
```fortran
          tg_qcko(i,kb(i))  = tg_qo(i,kb(i))
          tg_qrcko(i,kb(i)) = tg_qo(i,kb(i))
```

### SS5a / SS5b - updraft mixing (after each `qrcko(i,k) = qcko(i,k)`; main loop and overshoot loop)
```fortran
              tg_qcko(i,k) = ((1.-tem)*tg_qcko(i,k-1)+tem*
     &                     (tg_qo(i,k)+tg_qo(i,k-1)))/factor
              tg_qrcko(i,k) = tg_qcko(i,k)
```

### SS6a / SS6b - condensation hook (after each `zdqca(i,k)=dq/eta(i,k)`, inside the `dq > 0` branch; main loop and overshoot loop) - FINAL version with guard fix
```fortran
!  qv_tag: Eq 14 (Nusbaumer 2017) split of updraft total water;
!  tg_a_cond = liquid condensation fractionation hook
                tg_gam = 0.
                if (abs(qrcko(i,k)) > 1.e-30) tg_gam = qrch/qrcko(i,k)
                tg_den = 1.
                if (tg_gam >= 0. .and. tg_gam < 1.)
     &            tg_den = tg_a_cond * (1. - tg_gam) + tg_gam
                tg_vap = tg_qrcko(i,k) * tg_gam / tg_den
                tg_cnd = tg_qrcko(i,k) - tg_vap
                tg_rc  = tg_cnd / (qrcko(i,k) - qrch)
                tg_qcko(i,k)   = qlk * tg_rc + tg_vap
                tg_pwo(i,k)    = pwo(i,k) * tg_rc
                tg_dellal(i,k) = dellal(i,k) * tg_rc
```

### SS7 - cloud-top vapor/liquid split (inside `if(dq > 0.)`, before `qlko_ktcon(i) = dq`) - FINAL version with guard fix
Note: uses `qcko` (current updraft total), not `qrcko`.
```fortran
!  qv_tag: cloud-top vapor/liquid split (Eq 14, tg_a_cond hook)
            tg_gam = 0.
            if (abs(qcko(i,k)) > 1.e-30) tg_gam = qrch/qcko(i,k)
            tg_den = 1.
            if (tg_gam >= 0. .and. tg_gam < 1.)
     &        tg_den = tg_a_cond * (1. - tg_gam) + tg_gam
            tg_vap = tg_qcko(i,k) * tg_gam / tg_den
            tg_qlkt(i)   = tg_qcko(i,k) - tg_vap
            tg_qcko(i,k) = tg_vap
```

### SS8 - interior `dellaq` (after `dellaq(i,k) = dellaq(i,k) + (tem1-tem2) * factor`)
```fortran
              tg_dellaq(i,k) = tg_dellaq(i,k) + factor *
     &          (eta(i,k-1)*tg_qcko(i,k-1) - eta(i,k)*tg_qrcko(i,k))
```

### SS9 - cloud-top `dellaq`/`dellal` (after `dellal(i,indx) = tem * qlko_ktcon(i)`)
Real code overwrites (`=`) at cloud top, so the tag does too.
```fortran
          tg_dellaq(i,indx) = tem * tg_qcko(i,indx-1)
          tg_dellal(i,indx) = tem * tg_qlkt(i)
```

### SS10 - TVD subsidence/uplift flux (after the moisture TVD loop, before `!  for tracers including TKE & ozone`)
Limiter `phkp` is taken from the real `q_diff`, so it is identical for tag and real.
```fortran
!  qv_tag: TVD subsidence/uplift flux; limiter phkp from real q1
      tg_flx = 0.
      do k = 1, km1
        do i = 1, im
          if(cnvflg(i) .and.
     &      (k >= kb(i) .and. k < ktcon(i))) then
            if(eta(i,k) > 0.) then
              rrkp = 0.
              if(abs(q_diff(i,k)) > 1.e-22)
     &               rrkp = q_diff(i,k+1) / q_diff(i,k)
              phkp = (rrkp+abs(rrkp)) / (1.+abs(rrkp))
              tg_tem1 = tg_qv(i,k+1) +
     &                  phkp*(tg_qo(i,k)-tg_qv(i,k+1))
              tg_flx(i,k) = eta(i,k) * tg_tem1
            endif
          endif
        enddo
      enddo
      do k = 2, km1
        do i = 1, im
          if(cnvflg(i) .and.
     &      (k > kb(i) .and. k <= ktcon(i))) then
             dp = 1000. * del(i,k)
             tg_dellaq(i,k) = tg_dellaq(i,k) +
     &           (tg_flx(i,k) - tg_flx(i,k-1)) * grav/dp
          endif
        enddo
      enddo
```

### SS11 - apply (after `new_q1(i,k) = q1(i,k) + dellaq(i,k) * xmb(i) * dt2`)
```fortran
              tg_newqv(i,k) = tg_qv(i,k)
     &                      + tg_dellaq(i,k) * xmb(i) * dt2
```

### SS12 - negative-moisture borrowing mirror (after the real `new_q1` borrowing loop, before evaporation)
Option (b): same algorithm on the tag's own sums. Identical to real in mode 2;
conserves tag mass in mode 0.
```fortran
!  qv_tag: negative-moisture borrowing on the tag's own sums
      if (tg_n > 0) then
      do i = 1,im
        tg_sumn(i) = 0.
        tg_sump(i) = 0.
        tg_rtnp(i) = 1.
      enddo
      do k = 1,km1
        do i = 1,im
          if (cnvflg(i)) then
            if(k > kb(i) .and. k <= ktcon(i)) then
              tg_tem = tg_newqv(i,k) * delp(i,k) / grav
              if(tg_newqv(i,k) < 0.) tg_sumn(i) = tg_sumn(i)+tg_tem
              if(tg_newqv(i,k) > 0.) tg_sump(i) = tg_sump(i)+tg_tem
            endif
          endif
        enddo
      enddo
      do i = 1,im
        if(cnvflg(i)) then
          if(tg_sump(i) > 0. .and. tg_sumn(i) < 0.) then
            if(tg_sump(i) > abs(tg_sumn(i))) then
              tg_rtnp(i) = tg_sumn(i) / tg_sump(i)
            else
              tg_rtnp(i) = tg_sump(i) / tg_sumn(i)
            endif
          endif
        endif
      enddo
      do k = 1,km1
        do i = 1,im
          if (cnvflg(i)) then
            if(k > kb(i) .and. k <= ktcon(i)) then
              if(tg_rtnp(i) < 0.) then
                if(tg_sump(i) > abs(tg_sumn(i))) then
                  if(tg_newqv(i,k) < 0.) tg_newqv(i,k) = 0.
                  if(tg_newqv(i,k) > 0.) tg_newqv(i,k) =
     &                         (1.+tg_rtnp(i))*tg_newqv(i,k)
                else
                  if(tg_newqv(i,k) < 0.) tg_newqv(i,k) =
     &                         (1.+tg_rtnp(i))*tg_newqv(i,k)
                  if(tg_newqv(i,k) > 0.) tg_newqv(i,k) = 0.
                endif
              endif
            endif
          endif
        enddo
      enddo
      endif
```

### SS13 - tagged rain accumulation (after `rn(i) = rn(i) + pwo(i,k) * xmb(i) * .001 * dt2`)
```fortran
                tg_rn(i) = tg_rn(i)
     &                   + tg_pwo(i,k) * xmb(i) * .001 * dt2
```

### SS14a - tag rain fraction (first line inside `if(rn(i) > 0. .and. qevap(i) > 0.) then`, before `rn` is reduced)
```fortran
                tg_rr = tg_rn(i) / rn(i)
```

### SS14b - rain evaporation hook (before `new_q1(i,k) = new_q1(i,k) + qevap(i)`, after `qevap` is final)
```fortran
!  qv_tag: rain evaporation (tg_a_evap hook; Stewart 1975 later)
                tg_qev = min(qevap(i) * tg_rr * tg_a_evap,
     &                       tg_rn(i) / tem)
                tg_newqv(i,k) = tg_newqv(i,k) + tg_qev
                tg_rn(i) = tg_rn(i) - tg_qev * tem
```

### SS15 - detrained condensate liquid/ice split (after `tem1 = max(0.0, min(1.0, (tcr-new_t1(i,k))*tcrf))`)
```fortran
!  qv_tag: detrained tag condensate split (tg_a_ice hook: ice
!  formation; remainder stays liquid)
              tg_tem = tg_dellal(i,k) * xmb(i) * dt2
              if (new_qtr(i,k,2) > -999.0) then
                tg_dqi(i,k) = tg_tem * tem1 * tg_a_ice
                tg_dql(i,k) = tg_tem - tg_dqi(i,k)
              else
                tg_dqi(i,k) = tg_tem
              endif
```

### SS16 - output (after `dqtr  = (new_qtr - qtr)/delt`, before `return`)
```fortran
!  qv_tag: in-scheme tag tendencies replace the generic tracer path
      if (tg_n > 0) then
        dqtr(:,:,tg_j)    = (tg_newqv - tg_qv) / delt
        ten_q(:,:,tg_n+1) = tg_dql / delt
        ten_q(:,:,tg_n+2) = tg_dqi / delt
!  DEBUG DBGS (mode 2: all four ~0 if tags entered equal to real)
        if (tg_ndbg < 20) then
          tg_ndbg = tg_ndbg + 1
          print *, 'DBGS', maxval(abs(tg_newqv - new_q1)),
     &      maxval(abs(dqtr(:,:,tg_j) - ten_q(:,:,1))),
     &      maxval(abs(ten_q(:,:,tg_n+1) - dqtr(:,:,2))),
     &      maxval(abs(ten_q(:,:,tg_n+2) - dqtr(:,:,1)))
        endif
      endif
```

Shallow has no downdraft and no no-rain reset, so there are no DD8/DD9/DD14
equivalents.

---

## B. `samfshalcnv.meta`

### SM1 - new run arguments (after `[cat_adj_shal]`, before the run-table `[errmsg]`)
```
[nqvtag]
  standard_name = index_of_tagged_water_vapor_in_tracer_concentration_array
  long_name = tracer index for tagged water vapor
  units = index
  dimensions = ()
  type = integer
  intent = in
  optional = True
[otsptflag]
  standard_name = flag_convective_tracer_transport_interstitial
  long_name = flag for interstitial tracer transport
  units = flag
  dimensions = (number_of_tracers)
  type = logical
  intent = in
```

Note: the first `cmake` failed (`Invalid variable property name, 'e  dimensions'`
at `samfshalcnv.meta:406`) because of a stray `e` typed at the start of the
`[islimsk]` `dimensions` line. Fixed with
`sed -i '406s/^e  dimensions/  dimensions/' samfshalcnv.meta`.

---

## C. `GFS_SCNV_generic_post.F90`

### P1 - ratio correction commented out
Lines 106-118 (save block, `if (present(nqvtag))` ... `end if`) and lines
123-142 (overwrite block) prefixed with `!`. Line 105 (`old_qv_val = ...`),
the `do n = 1, ntrac` apply loop and the declarations are unchanged.
```bash
sed -i '106,118s/^/!/;123,142s/^/!/' GFS_SCNV_generic_post.F90
```
(The MP post ratio correction is still active.)

---

## D. Suite XML (`suite_SCM_GFS_v17_p8_ugwpv1.xml`, lines 67-70)

`samfshalcnv` and `GFS_SCNV_generic_post` uncommented. Current test runs have
both deep and shallow on:
```xml
      <scheme>samfdeepcnv</scheme>
      <scheme>GFS_DCNV_generic_post</scheme>
      <scheme>samfshalcnv</scheme>
      <scheme>GFS_SCNV_generic_post</scheme>
```

---

## E. `samfdeepcnv.f` - condensation-split guard fix (4 blocks)

### The bug
Combined run (PBL + DCNV + SCNV, mode 2, forcing off): state exact through
step 80; at step 81 a single level (python index 83, Fortran k = 84 =
`ktcon`) had qv_tag = qv + 5.931e-7 and qi_tag = qi - 5.931e-7 (qi_tag went
slightly negative). Tendency attribution: `shalconv` exact everywhere; only
`deepconv` mismatched (steps 80, 155, 244, 317, 389, ...). `pbl`/`phys`
mismatches were knock-ons or diagnostic bookkeeping.

Debug prints showed the cause at the cloud-top split (k = `ktcon`-1 = 83,
inside a 2-level overshoot, `ktcon1` = 82 -> `ktcon` = 84):
`qcko` = -2.04e-7 and `qrch` = -1.65e-6. Above the neutral-buoyancy level
`dbyo` < 0 and `qeso` is tiny, so `qrch` goes negative; `dq = qcko - qrch` is
still > 0, so the real scheme detrains -1.65e-6 as vapor and +1.45e-6 as
liquid (-> ice). The tag guard `if (qcko(i,k) > 0.)` failed, giving
`tg_gam = 0` and putting all of the tag's (negative) total into liquid.
Total water was conserved but the vapor/ice partition was wrong.

With `tg_alpha = 1` the split is purely proportional
(`tg_vap = tg_qcko * qrch/qcko`), which mirrors the real split for any sign
as long as `qcko /= 0`. Fix: nonzero guard, and use the Eq 14 hook only
where the split is physical (0 <= gam < 1); otherwise `tg_den = 1`
(proportional mirror).

### E-a / E-b - main updraft and overshoot condensation hooks
Replaced
```fortran
                if (qrcko(i,k) > 0.) tg_gam = qrch / qrcko(i,k)
                tg_den = tg_alpha * (1. - tg_gam) + tg_gam
```
with
```fortran
                if (abs(qrcko(i,k)) > 1.e-30) tg_gam = qrch/qrcko(i,k)
                tg_den = 1.
                if (tg_gam >= 0. .and. tg_gam < 1.)
     &            tg_den = tg_alpha * (1. - tg_gam) + tg_gam
```

### E-c - cloud-top split
Replaced
```fortran
            if (qcko(i,k) > 0.) tg_gam = qrch / qcko(i,k)
            tg_den = tg_alpha * (1. - tg_gam) + tg_gam
```
with
```fortran
            if (abs(qcko(i,k)) > 1.e-30) tg_gam = qrch / qcko(i,k)
            tg_den = 1.
            if (tg_gam >= 0. .and. tg_gam < 1.)
     &        tg_den = tg_alpha * (1. - tg_gam) + tg_gam
```

### E-d - downdraft condensation branch (DD9)
Replaced
```fortran
                if (qcdo(i,k) > 0.) tg_gam = qrcdo(i,k) / qcdo(i,k)
                tg_den = tg_alpha * (1. - tg_gam) + tg_gam
```
with
```fortran
                if (abs(qcdo(i,k)) > 1.e-30)
     &            tg_gam = qrcdo(i,k) / qcdo(i,k)
                tg_den = 1.
                if (tg_gam >= 0. .and. tg_gam < 1.)
     &            tg_den = tg_alpha * (1. - tg_gam) + tg_gam
```

The same guard fix is already included in shallow SS6a, SS6b and SS7 above.

### Verification commands
```bash
grep -n "> 0.) tg_gam" samfdeepcnv.f samfshalcnv.f      # expect nothing
grep -c "tg_den = 1\." samfdeepcnv.f samfshalcnv.f      # expect 4 and 3
grep -c "tg_alpha" samfshalcnv.f                        # expect 0
awk '/tg_/ && length > 72 {print FILENAME": "FNR": "length}' samfdeepcnv.f samfshalcnv.f   # expect nothing
```

---

## E2. `samfdeepcnv.f` - no-rain reset and borrowing mirror (DB1-DB3)

### Why
After the guard fix, a smooth, one-signed vapor mismatch remained (tag
slightly wetter at every level from k = 1 up, `dqv` ~1e-8 at the surface,
~5e-7 relative, decreasing with height like qv). That is the signature of a
column-wide fractional rescale applied to real qv but not to the tag: deep's
negative-moisture borrowing rescales `new_q1` by (1 + `rtnp`) over
`cnvflg .and. k <= ktcon` (which includes k = 1), and it had no tag mirror.

### DB1 - no-rain reset (in the `rn(i) <= 0.` block)
Real resets `new_q1(i,k) = qo(i,k)`; at that point `qo` holds the
interface-extrapolated values, not `q1`. The tag equivalent is `tg_qo`
(built by DD3 for k <= kmax, the same range as the reset).
```fortran
              tg_newqv(i,k) = tg_qo(i,k)
```
(was `tg_newqv(i,k) = tg_qv(i,k)`)
```bash
sed -i '3821s/tg_qv(i,k)/tg_qo(i,k)/' samfdeepcnv.f   # line number at the time
```

### DB2 - borrowing mirror (after the real qv borrowing block, before `if (.not.hwrf_samfdeep) then`)
Same algorithm as the real one, on the tag's own sums, with deep's own level
condition (`cnvflg .and. k <= ktcon`). Identical to real in mode 2; conserves
tag mass in mode 0.
```fortran
!  qv_tag: negative-moisture borrowing on the tag's own sums
      if (tg_n > 0) then
      do i = 1,im
        tg_sumn(i) = 0.
        tg_sump(i) = 0.
        tg_rtnp(i) = 1.
      enddo
      do k = 1,km1
        do i = 1,im
          if(cnvflg(i) .and. k <= ktcon(i)) then
            tg_tem = tg_newqv(i,k) * delp(i,k) / grav
            if(tg_newqv(i,k) < 0.) tg_sumn(i) = tg_sumn(i)+tg_tem
            if(tg_newqv(i,k) > 0.) tg_sump(i) = tg_sump(i)+tg_tem
          endif
        enddo
      enddo
      do i = 1,im
        if(cnvflg(i)) then
          if(tg_sump(i) > 0. .and. tg_sumn(i) < 0.) then
            if(tg_sump(i) > abs(tg_sumn(i))) then
              tg_rtnp(i) = tg_sumn(i) / tg_sump(i)
            else
              tg_rtnp(i) = tg_sump(i) / tg_sumn(i)
            endif
          endif
        endif
      enddo
      do k = 1,km1
        do i = 1,im
          if(cnvflg(i) .and. k <= ktcon(i)) then
            if(tg_rtnp(i) < 0.) then
              if(tg_sump(i) > abs(tg_sumn(i))) then
                if(tg_newqv(i,k) < 0.) tg_newqv(i,k) = 0.
                if(tg_newqv(i,k) > 0.) tg_newqv(i,k) =
     &            (1.+tg_rtnp(i))*tg_newqv(i,k)
              else
                if(tg_newqv(i,k) < 0.) tg_newqv(i,k) =
     &            (1.+tg_rtnp(i))*tg_newqv(i,k)
                if(tg_newqv(i,k) > 0.) tg_newqv(i,k) = 0.
              endif
            endif
          endif
        enddo
      enddo
      endif
```

### DB3 - declaration (after `real(kind=kind_phys) tg_qlkt(im), tg_pwav(im), tg_rn(im)`)
```fortran
      real(kind=kind_phys) tg_sumn(im), tg_sump(im), tg_rtnp(im)
```

### Verification commands
```bash
grep -n "tg_sumn\|tg_rtnp\|tg_newqv(i,k) = tg_qo" samfdeepcnv.f
awk '/tg_/ && length > 72 {print FNR": "length}' samfdeepcnv.f   # expect nothing
```

---

## F. `samfdeepcnv.f` - temporary debug prints (REMOVE before real runs)

### E1 - declaration (after `integer, save :: tg_ndbg = 0`)
```fortran
      integer, save :: tg_ndbge = 0
```

### E2 - DBGE (after the DD15/DBGC `endif`, before `return`)
Prints only where tag and real disagree at the end of deep.
```fortran
!  DEBUG DBGE: locate deep tag/real divergence (remove later)
      if (tg_n > 0) then
        do i = 1, im
          if (cnvflg(i)) then
          do k = 1, km
            tg_tem  = abs(tg_newqv(i,k) - new_q1(i,k))
            tg_tem1 = abs(tg_dqi(i,k)
     &              - (new_qtr(i,k,1) - qtr(i,k,1)))
            if ((tg_tem > 1.e-13 .or. tg_tem1 > 1.e-13)
     &          .and. tg_ndbge < 60) then
              tg_ndbge = tg_ndbge + 1
              print *, 'DBGE k',k,' kb',kb(i),' kbcon',kbcon(i),
     &          ' ktcon',ktcon(i),' ktcon1',ktcon1(i),' rn',rn(i)
              print *, 'DBGE   dqv',tg_newqv(i,k)-new_q1(i,k),
     &          ' dqi',tg_dqi(i,k)-(new_qtr(i,k,1)-qtr(i,k,1)),
     &          ' dal',tg_dellal(i,k)-dellal(i,k),
     &          ' dlkt',tg_qlkt(i)-qlko_ktcon(i),
     &          ' qi_detr',tg_dqi(i,k)
            endif
          enddo
          endif
        enddo
      endif
```

### E3 - DBGT (cloud-top split, after `tg_qlkt(i) = tg_qcko(i,k) - tg_vap`)
```fortran
!  DEBUG DBGT: split inputs/outputs at cloud top (remove later)
            if (abs(tg_qlkt(i) - dq) > 1.e-13
     &          .and. tg_ndbge < 60) then
              print *, 'DBGT k',k,' qcko',qcko(i,k),
     &          ' tgqcko',tg_qcko(i,k),' qrch',qrch
              print *, 'DBGT gam',tg_gam,' den',tg_den,
     &          ' vap',tg_vap,' dq',dq,' tgqlkt',tg_qlkt(i)
            endif
```

Debug prints now in the code: DBGC (deep), DBGS (shallow), DBGE and DBGT
(deep), plus PHDBG in `GFS_photochemistry.F90`.

---

## G. Test status

Combined run PBL + DCNV + SCNV, `qv_tag_init_mode = 2`, forcing off,
`./scm` run directly with debug prints:

| Stage | Result |
|---|---|
| Shallow only (before guard fix) | `dq_dt_shalconv` vs `dqvtag_dt_shalconv` exact on every step |
| Before any deep fix | deep mismatch at intermittent events (steps 80, 155, 244, ...), single level at cloud top, qv/qi equal and opposite |
| After guard fix | no DBGT lines; cloud-top split and ice detrainment exact; smooth whole-column vapor offset (~5e-7 relative) remained |
| After DB1-DB3 | **no DBGE lines**: tag and real identical inside deep at every level and every call |

Convection (deep + shallow) in-scheme tagging is therefore exact in mode 2.
Final confirmation still to record: full-run state plots (levels 0, 50, 75,
90) and the tendency script should show no deepconv/shalconv mismatch steps
and no pbl / level-90 qi knock-ons. The `phys` total-tendency diagnostics may
still differ (known bookkeeping issue, not a state error).

## H. Still to do

1. Record the final full-run state check (plots + tendency script).
2. Run `qv_tag_init_mode = 0` with deep + shallow together.
3. Remove debug prints before real runs: DBGC, DBGE, DBGT (deep), DBGS
   (shallow), PHDBG (`GFS_photochemistry.F90`), and the `tg_ndbge` declaration.
4. `phys` total tendency diagnostics for ql/qi (and qv at upper levels) do
   not add up the same contributions for real and tag - bookkeeping only.
5. Isotope hooks (later): deep still uses one shared `tg_alpha` and has no
   hooks yet at downdraft rain evaporation, sub-cloud rain evaporation
   (Stewart 1975) and ice formation; shallow has `tg_a_cond`, `tg_a_evap`,
   `tg_a_ice`.
6. Next scheme: Thompson microphysics in-scheme tagging (all six tags, every
   process rate mirrored, hooks at every phase change), then remove the
   `GFS_MP_generic_post` ratio correction - the last post-processing
   correction left. (The forcing scaling stays: it represents large-scale
   advection removing a proportional share of column water.)