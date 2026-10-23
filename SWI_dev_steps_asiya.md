# qv_tag — All Code Changes So Far, By File

Repo: `/glade/work/asiyab/SWI_NCAR/UFS_versions_dev/ccpp-scm_dev`
Suite: `GFS_v17_p8_ugwpv1`. No physics-scheme files touched yet (PBL surface-flux work is drafted but not yet written).

================================================================
## FILE: scm/src/GFS_typedefs.F90
================================================================

**1) `tagging` flag — type component** (inside `GFS_control_type`):
```fortran
logical              :: tagging       !< flag to enable water tagging (dye-tracking) framework
```

**2) `tagging` flag — local namelist-read variable, with default:**
```fortran
logical              :: tagging        = .false.                  !< flag to enable water tagging
```

**3) `tagging` flag — copy into Model%:**
```fortran
Model%tagging           = tagging
```

**4) `tagging` flag — added to `NAMELIST /gfs_physics_nml/` list:**
```fortran
                           hybedmf, satmedmf, tagging, tte_edmf, sigmab_coldstart,      &
```

**5) `nqvtag` — tracer index, type component:**
```fortran
integer              :: nqvtag          !< tracer index for tagged water vapor (specific humidity); 0 if tagging disabled
```

**6) `nqvtag` — conditional resolution** (in the tracer-index-population section, near `Model%ntqv = get_tracer_index(...)`):
```fortran
if (Model%tagging) then
   Model%nqvtag = get_tracer_index(Model%tracer_names, 'qv_tag')
else
   Model%nqvtag = 0
end if
```

================================================================
## FILE: scm/src/GFS_typedefs.meta
================================================================

**1) `[tagging]` block** — added after `[satmedmf]`:
```
[tagging]
  standard_name = flag_for_water_tagging
  long_name = master flag to enable water tagging (dye-tracking) framework
  units = flag
  dimensions = ()
  type = logical
```

**2) `[nqvtag]` + `[qgrs(...)]` + `[gq0(...)]` blocks:**
```
[nqvtag]
     standard_name = index_of_tagged_water_vapor_in_tracer_concentration_array
     long_name = index of tagged water vapor in tracer concentration array
     units = index
     dimensions = ()
     type = integer

[qgrs(:,:,index_of_tagged_water_vapor_in_tracer_concentration_array)]
     standard_name = physics_timestep_initial_tagged_water_vapor_specific_humidity
     long_name = tagged water vapor specific humidity at the beginning of the physics timestep
     units = kg kg-1
     dimensions = (horizontal_dimension,vertical_layer_dimension)
     type = real
     kind = kind_phys

[gq0(:,:,index_of_tagged_water_vapor_in_tracer_concentration_array)]
     standard_name = tagged_water_vapor_specific_humidity_updated_by_physics
     long_name = tagged water vapor specific humidity updated by physics
     units = kg kg-1
     dimensions = (horizontal_dimension,vertical_layer_dimension)
     type = real
     kind = kind_phys
```

================================================================
## FILE: scm/etc/tracer_config/tracers_GFS_v17_p8_ugwpv1.txt
================================================================

Appended as 13th (last) tracer, unconditional (static text file, no namelist awareness):
```
"qv_tag","tagged_water_vapor_specific_humidity","kg kg-1"
```

================================================================
## FILE: ccpp/physics_namelists/input_GFS_v17_p8_ugwpv1.nml
## FILE: scm/run/input_GFS_v17_p8_ugwpv1.nml  (symlink to the above)
================================================================

Added inside `&gfs_physics_nml`:
```
tagging = .true.
```

================================================================
## FILE: scm/src/scm_type_defs.F90
================================================================

**1) Three new fields in `scm_state_type`** (~line 99-101):
```fortran
integer                           :: qv_tag_index
logical                           :: tagging
integer                           :: qv_tag_init_mode
```

**2) In `scm_state_create`** (~line 514-520) — resolves `qv_tag_index` and copies `tagging`. NOTE: this copy runs too early (before the real namelist read — see the scm.F90 timing fix below) so the `tagging` value here is stale; left in place as harmless dead-weight, superseded later:
```fortran
    if (physics%Model%tagging) then
       scm_state%qv_tag_index = get_tracer_index(scm_state%tracer_names,"qv_tag")
    else
       scm_state%qv_tag_index = 0
    end if
    scm_state%tagging = physics%Model%tagging
```

================================================================
## FILE: scm/src/scm_output.F90
================================================================

**1) `qv_tag` variable definition** — in `output_init_state` (~line 186). This subroutine receives `scm_state` but NOT `physics`, so the gate is `scm_state%tagging`:
```fortran
  if (scm_state%tagging) then
    call NetCDF_def_var(ncid, 'qv_tag', NF90_FLOAT, "tagged water vapor specific humidity", &
                         "kg kg-1", dummy_id, (/ hor_dim_id, vert_dim_id, time_inst_id /))
  end if
```

**2) Six `dqvtag_dt_*` tendency definitions** — in `output_init_diag` (~line 348-354), which DOES receive `physics`:
```fortran
  if (physics%Model%tagging) then
    call output_init_tendency(ncid, 'dqvtag_dt_pbl',      "tagged water vapor tendency due to PBL scheme",                       "kg kg-1 s-1", hor_dim_id, vert_dim_id, time_diag_id, physics%Model%dtidx(100+physics%Model%nqvtag,physics%Model%index_of_process_pbl))
    call output_init_tendency(ncid, 'dqvtag_dt_deepconv', "tagged water vapor tendency due to deep convection scheme",           "kg kg-1 s-1", hor_dim_id, vert_dim_id, time_diag_id, physics%Model%dtidx(100+physics%Model%nqvtag,physics%Model%index_of_process_dcnv))
    call output_init_tendency(ncid, 'dqvtag_dt_shalconv', "tagged water vapor tendency due to shallow convection scheme",        "kg kg-1 s-1", hor_dim_id, vert_dim_id, time_diag_id, physics%Model%dtidx(100+physics%Model%nqvtag,physics%Model%index_of_process_scnv))
    call output_init_tendency(ncid, 'dqvtag_dt_micro',    "tagged water vapor tendency due to microphysics scheme",              "kg kg-1 s-1", hor_dim_id, vert_dim_id, time_diag_id, physics%Model%dtidx(100+physics%Model%nqvtag,physics%Model%index_of_process_mp))
    call output_init_tendency(ncid, 'dqvtag_dt_phys',     "tagged water vapor tendency due to all physics schemes",              "kg kg-1 s-1", hor_dim_id, vert_dim_id, time_diag_id, physics%Model%dtidx(100+physics%Model%nqvtag,physics%Model%index_of_process_physics))
    call output_init_tendency(ncid, 'dqvtag_dt_nonphys',  "tagged water vapor tendency due to all processes other than physics", "kg kg-1 s-1", hor_dim_id, vert_dim_id, time_diag_id, physics%Model%dtidx(100+physics%Model%nqvtag,physics%Model%index_of_process_non_physics))
  end if
```

**3) `qv_tag` write** — in `output_append_state` (~line 515-516):
```fortran
  if (physics%Model%tagging) then
    call NetCDF_put_var(ncid, "qv_tag", scm_state%state_tracer(:,:,scm_state%qv_tag_index,1), scm_state%itt_out)
  end if
```

**4) Six `dqvtag_dt_*` writes** — in `output_append_diag_avg` (~line 780-786):
```fortran
    if (physics%Model%tagging) then
       call output_append_tendency(ncid, physics, physics%Model%dtidx(100+physics%Model%nqvtag,physics%Model%index_of_process_pbl),         "dqvtag_dt_pbl",      scm_state%itt_diag, inverse_n_diag*inverse_dt)
       call output_append_tendency(ncid, physics, physics%Model%dtidx(100+physics%Model%nqvtag,physics%Model%index_of_process_dcnv),        "dqvtag_dt_deepconv", scm_state%itt_diag, inverse_n_diag*inverse_dt)
       call output_append_tendency(ncid, physics, physics%Model%dtidx(100+physics%Model%nqvtag,physics%Model%index_of_process_scnv),        "dqvtag_dt_shalconv", scm_state%itt_diag, inverse_n_diag*inverse_dt)
       call output_append_tendency(ncid, physics, physics%Model%dtidx(100+physics%Model%nqvtag,physics%Model%index_of_process_mp),          "dqvtag_dt_micro",    scm_state%itt_diag, inverse_n_diag*inverse_dt)
       call output_append_tendency(ncid, physics, physics%Model%dtidx(100+physics%Model%nqvtag,physics%Model%index_of_process_physics),     "dqvtag_dt_phys",     scm_state%itt_diag, inverse_n_diag*inverse_dt)
       call output_append_tendency(ncid, physics, physics%Model%dtidx(100+physics%Model%nqvtag,physics%Model%index_of_process_non_physics), "dqvtag_dt_nonphys",  scm_state%itt_diag, inverse_n_diag*inverse_dt)
    end if
```

================================================================
## FILE: scm/src/scm.F90
================================================================

**CRITICAL TIMING FIX + qv_tag_init_mode — inserted right after `call physics%set(scm_input_instance, scm_state)` (line 186), before `ccpp_physics_init` (line 219):**

Why: `scm_state_create` (called via `get_case_init`, early in this file) runs BEFORE `GFS_suite_setup`/`physics%set` actually read the namelist into `physics%Model`. The `tagging`/`qv_tag_index` copy done inside `scm_state_create` is therefore always stale (`.false.`/`0`) regardless of the namelist. This block re-syncs both correctly, then applies the chosen initial condition:

```fortran
  call physics%set(scm_input_instance, scm_state)
  scm_state%tagging = physics%Model%tagging
  if (physics%Model%tagging) then
     scm_state%qv_tag_index = get_tracer_index(scm_state%tracer_names, "qv_tag")
  else
     scm_state%qv_tag_index = 0
  end if

  if (scm_state%tagging .and. scm_state%qv_tag_index > 0) then
     select case (scm_state%qv_tag_init_mode)
     case (0)
        scm_state%state_tracer(:,:,scm_state%qv_tag_index,1) = 0.0
     case (1)
        scm_state%state_tracer(:,:,scm_state%qv_tag_index,1) = 1.0
     case (2)
        scm_state%state_tracer(:,:,scm_state%qv_tag_index,1) = scm_state%state_tracer(:,:,scm_state%water_vapor_index,1)
     case default
        scm_state%state_tracer(:,:,scm_state%qv_tag_index,1) = 0.0
     end select
  end if
```
(`get_tracer_index` reachable here via the file's existing `use scm_type_defs` — no new `use` line needed, since `scm_type_defs` has no `private` statement and re-exports it)

================================================================
## FILE: scm/src/scm_input.F90
================================================================

**1) Local declaration** (~line 48):
```fortran
integer              :: qv_tag_init_mode !< qv_tag initial condition: 0=zero, 1=uniform 1.0, 2=qv(t=0)
```

**2) Added to `NAMELIST /case_config/` list** (~line 85-90, appended as last item):
```fortran
  NAMELIST /case_config/ npz_type, vert_coord_file, case_name, dt, runtime, runtime_mult, n_itt_out, n_itt_diag, &
    n_levels, output_dir, thermo_forcing_type, model_ics, &
    lsm_ics, do_spinup, do_sst_initialize_only, C_RES, spinup_timesteps, mom_forcing_type, relax_time, sfc_type, sfc_flux_spec, &
    sfc_roughness_length_cm, reference_profile_choice, year, month, day, hour, min, &
    column_area, input_type, qv_tag_init_mode
```

**3) Default value** (~line 132):
```fortran
qv_tag_init_mode = 0
```

**4) Copy into scm_state** (~line 174):
```fortran
scm_state%qv_tag_init_mode = qv_tag_init_mode
```

================================================================
## FILE: scm/run/input_experiment.nml  (or wherever case-level config is set)
================================================================

Added to `&case_config`:
```
qv_tag_init_mode = 0
```
(`0`=zero at t=0 [default/current], `1`=uniform 1.0, `2`=qv(t=0) — tagged fraction 1 at start)

================================================================
## Rebuild commands used
================================================================

After any `.meta` change (Steps touching `GFS_typedefs.meta` / tracer config):
```bash
cd /glade/work/asiyab/SWI_NCAR/UFS_versions_dev/ccpp-scm_dev
./ccpp/framework/scripts/ccpp_prebuild.py --config=./ccpp/config/ccpp_prebuild_config.py --builddir=./scm/bin
cd scm/bin && make -j
```
After `.F90`-only changes (scm_output.F90, scm.F90, scm_input.F90 edits):
```bash
cd /glade/work/asiyab/SWI_NCAR/UFS_versions_dev/ccpp-scm_dev/scm/bin
make -j
```

Run/verify (raw binary, NOT run_scm.py, which hides Fortran print output):
```bash
cd /glade/work/asiyab/SWI_NCAR/UFS_versions_dev/ccpp-scm_dev/scm/bin
./run_scm.py -c twpice -s SCM_GFS_v17_p8_ugwpv1   # generates input_experiment.nml (needs qcmd if on login node)
cd ../run
qcmd -A UALB0055 -l walltime=00:10:00 -l select=1:ncpus=1 -- ./scm > run.log 2>&1
```

================================================================
## Confirmed working (netCDF4 check on output.nc)
================================================================

`qv_tag`, `dqvtag_dt_pbl`, `dqvtag_dt_deepconv`, `dqvtag_dt_shalconv`, `dqvtag_dt_micro`, `dqvtag_dt_phys`, `dqvtag_dt_nonphys` — all present, all `min=0, max=0, nonzero_count=0` (expected: no scheme source term wired in yet).

================================================================
## NOT YET DONE / NOT YET WRITTEN
================================================================

PBL surface-evaporation source term for `qv_tag` (scheme edits now authorized for this specific piece, scope expanded from original "no scheme changes" restriction). Full patch across `CCPP_typedefs.F90`, `GFS_PBL_generic_pre.F90`, `satmedmfvdifq.F`, `GFS_PBL_generic_post.F90` + `.meta` files has been drafted (dynamic `Interstitial%nqvtagv` packed-slot design, mirroring `ntkev`) but NOT yet applied to any file.


# qv_tag — PBL Surface-Evaporation Coupling (new since last code-changes file)

Design: dynamic packed-slot `Interstitial%nqvtagv` (mirrors existing `ntkev` pattern)
instead of a hardcoded slot number — avoids the TKE-ordering bug from the first
project by construction. Gating uses `nqvtag>0 .and. nqvtagv>0` checks (both
correctly 0 when tagging is off) rather than threading `Model%tagging` through
every scheme file's argument list.

================================================================
## FILE: scm/src/CCPP_typedefs.F90
================================================================

**1) New type component** (near `ntkev`'s declaration, ~line 208):
```fortran
integer                             :: nqvtagv
```

**2) Init to 0** (~line 1148, next to `Interstitial%ntkev = 0`):
```fortran
Interstitial%nqvtagv          = 0
```

**3) Slot reservation — inside the Thompson/tempo branch, BEFORE `satmedmf`'s own +1**
(this ordering is what keeps TKE last, avoiding the original project's silent-exclusion bug):
```fortran
      if (Model%ltaerosol) then
        Interstitial%nvdiff = 12
     else if (Model%mraerosol) then
        Interstitial%nvdiff = 10
      else
        Interstitial%nvdiff = 9
      endif
      if (Model%tagging) then
        Interstitial%nvdiff = Interstitial%nvdiff + 1
        Interstitial%nqvtagv = Interstitial%nvdiff
      endif

      if (Model%satmedmf) Interstitial%nvdiff = Interstitial%nvdiff + 1
```
(only the 4-line `if (Model%tagging) ... endif` block is new)

================================================================
## FILE: scm/src/CCPP_typedefs.meta
================================================================

Added right after `[ntkev]`:
```
[nqvtagv]
  standard_name = index_for_tagged_water_vapor_vertical_diffusion_tracer
  long_name = index for tagged water vapor in the vertically diffused tracer array
  units = index
  dimensions = ()
  type = integer
```

================================================================
## FILE: ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_PBL_generic_pre.F90
================================================================

**1) Argument list** (line 14):
```fortran
ntwa, ntia, ntgl, ntoz, ntke, ntkev, nqvtag, nqvtagv, nqrimef, trans_aero, ntchs, ntchm,          &
```

**2) Declaration** (line 31):
```fortran
integer, intent(in) :: ntwa, ntia, ntgl, ntoz, ntke, ntkev, nqvtag, nqvtagv, nqrimef,ntchs, ntchm
```

**3) Fill block** — inserted right after the existing `ntke` block, still inside the same outer conditional:
```fortran
        if (ntke>0) then
          do k=1,levs
            do i=1,im
              vdftra(i,k,ntkev) = qgrs(i,k,ntke)
            enddo
          enddo
        endif
!
        if (nqvtag>0 .and. nqvtagv>0) then
          do k=1,levs
            do i=1,im
              vdftra(i,k,nqvtagv) = qgrs(i,k,nqvtag)
            enddo
          enddo
        endif
!
      endif
```
(only the new `if (nqvtag>0 ...) ... endif` block; outer `endif` unchanged/unmoved)

================================================================
## FILE: GFS_PBL_generic_pre.meta
================================================================

Added right after `[ntkev]`, before `[nqrimef]`:
```
[nqvtag]
  standard_name = index_of_tagged_water_vapor_in_tracer_concentration_array
  long_name = index of tagged water vapor in tracer concentration array
  units = index
  dimensions = ()
  type = integer
  intent = in
[nqvtagv]
  standard_name = index_for_tagged_water_vapor_vertical_diffusion_tracer
  long_name = index for tagged water vapor in the vertically diffused tracer array
  units = index
  dimensions = ()
  type = integer
  intent = in
```

================================================================
## FILE: ccpp/physics/physics/PBL/SATMEDMF/satmedmfvdifq.F  (fixed-form — column-72 applies)
================================================================

**1) Argument list** — new continuation line inserted before `ten_t, ten_u, ten_v,`:
```fortran
     &     ntqv,dtend,dtidx,index_of_temperature,index_of_x_wind,       &
     &     index_of_y_wind,index_of_process_pbl,gen_tend,ldiag3d,       &
     &     nqvtag,nqvtagv,                                              &
     &     ten_t, ten_u, ten_v,                                         &
     &     errmsg,errflg)
```

**2) Integer declaration:**
```fortran
      integer, intent(in)  :: im, km, ntrac, ntcw, ntrw, ntiw,          &
     &                        ntke, ntqv, nqvtag, nqvtagv
```

**3) Surface-flux write** — inserted after the existing zero-flux tracer loop, before `do k = 1,km1`:
```fortran
      if(ntrac1 >= 2) then
        do n = 2, ntrac1
          is = (n-1) * km
          do i = 1, im
            f2(i,1+is) = q1(i,1,n)
          enddo
        enddo
      endif
c
c  give tagged water vapor the same surface moisture flux as qv
c
      if (nqvtagv > 0) then
        is = (nqvtagv - 1) * km
        do i = 1, im
          f2(i,1+is) = q1(i,1,nqvtagv) + dtdz1(i) * evap(i)
        enddo
      endif
c
      do k = 1,km1
```

**4) Tendency diagnostic** — inserted right after the existing `ntqv` special-case block, still inside the outer `if(ldiag3d .and. .not. gen_tend)`:
```fortran
        ! Send tendencies just for QV; other tracers are below.
        idtend = dtidx(100+ntqv,index_of_process_pbl)
        if(idtend>=1) then
          do  k = 1,km
            do i = 1,im
              qtend      = (f2(i,k)-q1(i,k,1))*rdt
              dtend(i,k,idtend) = dtend(i,k,idtend)+qtend*delt
            enddo
          enddo
        endif
        if (nqvtagv > 0) then
          idtend = dtidx(100+nqvtag,index_of_process_pbl)
          if(idtend>=1) then
            is = (nqvtagv-1) * km
            do  k = 1,km
              do i = 1,im
                qtend      = (f2(i,k+is)-q1(i,k,nqvtagv))*rdt
                dtend(i,k,idtend) = dtend(i,k,idtend)+qtend*delt
              enddo
            enddo
          endif
        endif
      endif
```

**5) Exclude qv_tag's slot from the generic per-tracer dtend loop:**
```fortran
              if(n/=ntke .and. n/=nqvtagv) then
```
(was `if(n/=ntke) then`)

================================================================
## FILE: satmedmfvdifq.meta
================================================================

Added right after `[ntqv]`, before `[dtend]`:
```
[nqvtag]
  standard_name = index_of_tagged_water_vapor_in_tracer_concentration_array
  long_name = index of tagged water vapor in tracer concentration array
  units = index
  dimensions = ()
  type = integer
  intent = in
[nqvtagv]
  standard_name = index_for_tagged_water_vapor_vertical_diffusion_tracer
  long_name = index for tagged water vapor in the vertically diffused tracer array
  units = index
  dimensions = ()
  type = integer
  intent = in
```

================================================================
## FILE: ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_PBL_generic_post.F90
================================================================

**1) Argument list** — `nqvtag, nqvtagv` added (landed on a different continuation line than originally planned — fine, position within the list doesn't matter, only that it appears once and matches the declaration):
```fortran
tend_opt_pbl, trans_aero, ntchs, ntchm, ntccn, nthl, nthnc, ntgv, nthv, ntrz, ntgz, nthz, nqvtag, nqvtagv,             &
```

**2) Declaration:**
```fortran
integer, intent(in) :: ntqv, ntcw, ntiw, ntrw, ntsw, ntlnc, ntinc, ntrnc, ntsnc, ntgnc, ntwa, ntia, ntgl, ntoz, ntke, ntkev, nqvtag, nqvtagv, nqrimef
```

**3) Unpack block** — inserted right after the existing `ntke` block, inside the `elseif (nvdiff /= ntrac .and. .not. shinhong .and. .not. do_ysu)` branch (this branch applies regardless of MP scheme — confirmed not nested inside any MP-specific sub-branch):
```fortran
        if (ntke>0) then
          do k=1,levs
            do i=1,im
              ten_q(i,k,ntke)  = dvdftra(i,k,ntkev)
            enddo
          enddo
        endif
!
        if (nqvtag>0 .and. nqvtagv>0) then
          do k=1,levs
            do i=1,im
              ten_q(i,k,nqvtag) = dvdftra(i,k,nqvtagv)
            enddo
          enddo
        endif
!
        if (trans_aero) then
```
(only the new `if (nqvtag>0 ...) ... endif` block; note the final generic `do n = 1, ntrac / gq0(i,k,n) = gq0(i,k,n) + dtp*ten_q(i,k,n)` update loop is unmodified/untouched — it's already generic and picks up `ten_q(i,k,nqvtag)` automatically)

================================================================
## FILE: GFS_PBL_generic_post.meta
================================================================

Added right after `[ntkev]`, before `[nqrimef]`:
```
[nqvtag]
  standard_name = index_of_tagged_water_vapor_in_tracer_concentration_array
  long_name = index of tagged water vapor in tracer concentration array
  units = index
  dimensions = ()
  type = integer
  intent = in
[nqvtagv]
  standard_name = index_for_tagged_water_vapor_vertical_diffusion_tracer
  long_name = index for tagged water vapor in the vertically diffused tracer array
  units = index
  dimensions = ()
  type = integer
  intent = in
```

================================================================
## Rebuild required: cmake, not just make -j
================================================================

New CCPP-connected arguments were added to three scheme files with matching
`.meta` blocks. Per the first project's documented "critical build lesson,"
`make -j` alone can succeed with zero errors while silently NOT wiring a new
argument into the suite's generated cap file (confirmed the hard way via two
wasted rebuild-rerun cycles previously — output was byte-identical to
before the fix despite a clean build).

```bash
cd /glade/work/asiyab/SWI_NCAR/UFS_versions_dev/ccpp-scm_dev/scm/bin
cmake ..
make -j
```

**Post-build sanity check** (before even running the model) — confirm the new
arguments actually made it into the generated cap file:
```bash
find . -iname "*cap*" -exec grep -l "nqvtag" {} \;
```
Empty result despite a successful build = the silent-failure signature from
before.

## STATUS: build in progress, not yet confirmed. Not yet run/verified at runtime.

================================================================================
# UPDATE — Session 2 (today)
================================================================================

Scope this session: verified PBL qv_tag coupling end-to-end (confirmed correct),
built a reusable forcing-disable diagnostic switch, and started scoping
convection coupling (not yet written). No suite XML changes.

================================================================
## FILE: scm/src/scm_type_defs.F90
================================================================

**New field in `scm_state_type`** (~line 102, right after `qv_tag_init_mode`):
```fortran
logical                           :: debug_disable_forcing
```

================================================================
## FILE: scm/src/scm_input.F90
================================================================

**1) Local declaration** (~line 49, right after `qv_tag_init_mode`):
```fortran
logical               :: debug_disable_forcing
```

**2) Added to `NAMELIST /case_config/` list** (appended as last item):
```fortran
    column_area, input_type, qv_tag_init_mode, debug_disable_forcing
```

**3) Default value** (~line 134):
```fortran
debug_disable_forcing = .false.
```

**4) Copy into scm_state** (~line 177):
```fortran
scm_state%debug_disable_forcing = debug_disable_forcing
```

================================================================
## FILE: scm/src/scm.F90
================================================================

**Wrapped the initial-forcing-call block** (~line 269, the `input_type==0` if/else
choosing `apply_forcing_forward_Euler` vs `apply_forcing_DEPHY`) in an outer guard:
```fortran
    if (.not. scm_state%debug_disable_forcing) then
    if (scm_state%input_type == 0) then
      call apply_forcing_forward_Euler(scm_state, in_spinup)
    else
      call apply_forcing_DEPHY(scm_state, in_spinup)
    end if
    end if
```

================================================================
## FILE: scm/src/scm_time_integration.F90
================================================================

**Wrapped the entire main-loop `select case(scm_state%time_scheme)` block**
(handles all three time schemes' forcing calls) in the same outer guard:
```fortran
  if (.not. scm_state%debug_disable_forcing) then
  select case(scm_state%time_scheme)
    case(1)
      ...
    case(2)
      ...
    case default
      ...
  end select
  end if
```

================================================================
## Usage — debug_disable_forcing
================================================================

Purpose: isolate PBL (or any scheme) from forcing's per-timestep write to real
qv (`state_tracer(:,:,water_vapor_index,1)`), which has no qv_tag mirror by
design (forcing represents externally-advected water; mirroring it to qv_tag
would defeat the point of tagging). With forcing on, qv and qv_tag diverge
starting at the very first timestep — not a bug, but it means qv/qv_tag
tendency comparisons for any single scheme are invalid unless forcing (and
every other uncoupled scheme) is silenced first.

To disable: add to `&case_config` in the case's `.nml` (e.g. `twpice.nml`):
```fortran
debug_disable_forcing = .true.
```
Re-enable by setting `.false.` (or removing the line — default is `.false.`).
No rebuild needed to toggle. **Currently set to `.true.` in `twpice.nml`** —
must be reset to `.false.` before any non-diagnostic run.

================================================================
## FILE: ccpp/physics/physics/PBL/SATMEDMF/satmedmfvdifq.F  — TEMP DEBUG, NOT YET REMOVED
================================================================

Three bare `print*` statements added for runtime verification, all gated
`if (nqvtagv.gt.0)`. **Should be removed (or left — harmless, gated off when
tagging is off) before any production run; currently still in the file:**

**1) Right after `ntrac1 = ntrac - 1` (~line 429):**
```fortran
      if(nqvtagv.gt.0)print*,ntrac,ntrac1,nqvtagv
      if (nqvtagv.gt.0) print*,'ENTRY',q1(1,1,1),q1(1,1,nqvtagv)
```

**2) Right before the existing qv_tag diagnostic block (~line 2914, immediately
before `if (nqvtagv > 0) then` / `idtend = dtidx(100+nqvtag,...)`):**
```fortran
      if (nqvtagv.gt.0) print*,'SOLVE',f2(1,1),f2(1,1+(nqvtagv-1)*km)
```

Purpose confirmed: `ENTRY` compares `q1` (post-pack, pre-solve) for real qv
vs. qv_tag; `SOLVE` compares `f2` (post-solve, pre-diagnostic) for the same.
Used to localize whether any qv/qv_tag divergence originates inside the
diffusion solve itself (it doesn't — see Validation Result below).

================================================================
## FILE: scm/src/GFS_typedefs.F90 — TEMP DEBUG, NOT YET REMOVED
================================================================

Two bare `print*` statements added inside `GFS_namelist_read`'s
non-`INTERNAL_FILE_NML` branch, confirming the physics namelist file opens
correctly and `tagging` reads as expected:

**After the `open(unit=nlunit, file=fn_nml, ...)` call (~line 4533):**
```fortran
    print*,trim(fn_nml),ios
```

**After `read (nlunit, nml=gfs_physics_nml)` (~line 4537):**
```fortran
    print*,tagging
```

Note: `DEBUG scm_state_create: physics%Model%tagging = ...` (pre-existing
print in `scm_type_defs.F90` line 521) fires **before** this namelist read
happens — it always prints the type's default (`F`) regardless of the actual
namelist value, and is not a reliable signal. Do not use it to check whether
tagging is actually on; check `output.nc` for a `qv_tag` variable, or these
two new prints, instead.

================================================================
## Validation methodology — lessons learned this session
================================================================

Two non-obvious gotchas that invalidated early comparisons; both must be
respected in any future qv vs. qv_tag tendency check:

1. **Tendency-array index 0 is always a placeholder zero**, representing the
   initial condition before any physics has run. The first real tendency for
   a given process lives at **index 1**, not index 0. (State arrays like `qv`
   and `qv_tag` are fine to read at index 0 — that genuinely is the initial
   condition.)

2. **`dtend` accumulates across every physics sub-step between diagnostic
   resets** (`dtend(...) = dtend(...) + qtend*delt`, not an overwrite). With
   default `n_itt_diag` (6 sub-steps per output/diagnostic period for
   twpice/GFS_v17_p8_ugwpv1 at dt=600s, output every 3600s), a single
   `output.nc` tendency entry is the **sum of 6 physics timesteps**, not one.
   Comparing qv vs. qv_tag tendencies at this granularity mixes in whatever
   uncoupled schemes ran during those 6 sub-steps (convection/MP), producing
   a misleading, scattered mismatch even when the scheme under test is
   perfectly correct. **Always rerun with `--n_itt_diag 1 --n_itt_out 1`**
   (command-line flags to `run_scm.py`, no code change) when doing this kind
   of single-scheme isolation check.

Correct check recipe: `qv_tag_init_mode=2` (qv_tag(0)=qv(0)) +
`debug_disable_forcing=.true.` + `--n_itt_diag 1 --n_itt_out 1`, then compare
tendency arrays at **index 1**, run the compiled `./scm` binary directly
(not `run_scm.py`, which does not surface Fortran `print` output) if also
checking the `ENTRY`/`SOLVE` debug prints above.

================================================================
## Validation result: PBL — CONFIRMED CORRECT
================================================================

Using the recipe above, `dq_dt_pbl` and `dqvtag_dt_pbl` at t=1 are **bit-for-bit
identical** at every level checked (0–39), and the `ENTRY`/`SOLVE` runtime
prints confirmed `q1`/`f2` are identical for qv and qv_tag through the actual
packing and tridiagonal-solve steps on the first physics call. PBL's diffusion
coupling from Session 1 is validated — no bug found; earlier apparent
mismatches (see prior debugging in this session, not reproduced here) were
entirely explained by the two methodology gotchas above, not by any defect in
the PBL coupling code itself.

================================================================
## NOT YET DONE / NOT YET WRITTEN
================================================================

- **Convection coupling (samfdeepcnv / samfshalcnv)** — not started. File
  locations confirmed: `ccpp/physics/physics/CONV/SAMF/samfdeepcnv.f` and
  `samfshalcnv.f` (NOT the `CONV/SAS/` directory — that holds an older/
  different scheme). Suite order confirmed:
  `samfdeepcnv → GFS_DCNV_generic_post → samfshalcnv → GFS_SCNV_generic_post
  → cnvc90`. Zero `nqvtag` references currently in either `.f` file — clean
  slate. Tracer-loop structure (where mass-flux transport happens generically
  vs. where the `dellaq`-fused condensation/detrainment sink needs the
  proportional-scaling correction) not yet mapped.
- **MP (Thompson) coupling** — not started this session.
- **Remove temp debug prints** in `satmedmfvdifq.F` and `GFS_typedefs.F90`
  once convection/MP work is far enough along that they're no longer needed
  for cross-checking (harmless to leave — gated `if(nqvtagv>0)` / always-on
  but silent unless namelist read fails — but noisy in logs).
- **Reset `debug_disable_forcing` to `.false.`** in `twpice.nml` before any
  run that isn't an isolated single-scheme diagnostic.


# qv_tag Convection Coupling — Session README

## Status: code written and wired, NOT yet validated

Scheme: **SAMF** (Simplified Arakawa-Schubert with Mass Flux), deep + shallow
convection. Suite order: `samfdeepcnv -> GFS_DCNV_generic_post -> samfshalcnv
-> GFS_SCNV_generic_post -> cnvc90`.

================================================================
## Scoping / audit performed before writing anything
================================================================

Traced the full moisture path through the SAMF scheme source
(`ccpp/physics/physics/CONV/SAMF/samfdeepcnv.f`, `samfshalcnv.f`) before
touching any code:

- Real qv's convective tendency (`dellaq`) and the generic tracer tendency
  (`dellae`) are built in structurally parallel fashion — same
  entrainment/detrainment/subsidence/downdraft terms, same TVD
  flux-limiter treatment, same final `xmb(i)*dt2` mass-flux-timestep
  scaling applied to `ctr`/`new_qtr` as to `q1`/`new_q1`.
- `dellae` (and therefore `ctr`, the generic tracer array qv_tag rides in
  via its packed slot) **structurally omits** the condensation/evaporation
  sink terms real qv's `dellaq` carries (from `qrcdo`/`qcko`) — expected
  and correct for a passive tracer, but means transport-only coupling
  cannot capture convection's actual moisture removal.
- Tendency handoff to the tracer's tendency output (`dqtr = (new_qtr -
  qtr)/delt`, mapped to `dclw` at the CCPP interface via standard_name
  `tendency_of_convective_transportable_tracers`) confirmed correctly
  computed from the same validated `dellae`/`ctr` arrays.
- Packing/unpacking of the generic tracer array between `samfdeepcnv.f`'s
  `qtr`/`ctr` (via `kk=n+2` inside the scheme) and
  `GFS_DCNV_generic_post.F90`'s `ten_q` (via a separately-computed
  `otsptflag`-gated `tracers` counter) confirmed to use **identical
  counting logic on both ends** (traced to `GFS_suite_interstitial_3.F90`'s
  packing loop) — no index-scrambling risk, unlike the PBL `nvdiff`/TKE
  issue found earlier in this project.
- **Conclusion: no edit needed inside `samfdeepcnv.f`/`samfshalcnv.f`
  themselves.** Transport is already fully generic and correct. The only
  gap is the missing condensation-sink term, which belongs in the
  post-processing step as a proportional-scaling correction (same
  approach as the state-level, not diagnostic-level, coupling used
  elsewhere in this project).
- Confirmed `tend_opt_deep_conv`/`tend_opt_scnv` both default to `1`
  ("immediately apply tendencies") with no namelist override for this
  suite/case — so `case(1)` is the genuinely live branch. `case(2)`/`(3)`
  (accumulate-tendency variants) reachability was **not** checked this
  session; edits were only applied to `case(1)`.

================================================================
## Edits made
================================================================

### FILE: ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_DCNV_generic_post.F90
### FILE: ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_SCNV_generic_post.F90

Identical edit pattern applied to both files.

**1) Argument list** — `nqvtag` added right after `ntqv`:
```fortran
... ntqv, nqvtag, gq0, ...
```

**2) Declaration**:
```fortran
integer, intent(in), optional :: nqvtag
```

**3) Local variable**:
```fortran
real(kind=kind_phys) :: old_qv_val
```

**4) Inside `case(1)`** — capture pre-update qv before the generic tracer
loop runs, then proportionally scale qv_tag after:
```fortran
              old_qv_val = gq0(i,k,ntqv)
              do n = 1, ntrac
                gq0(i,k,n) = gq0(i,k,n) + delt*ten_q(i,k,n)
              end do
              if (present(nqvtag)) then
                if (old_qv_val > 0.0_kind_phys) then
                  gq0(i,k,nqvtag) = gq0(i,k,nqvtag) * (gq0(i,k,ntqv) / old_qv_val)
                end if
              end if
```
`nqvtag` kept `optional` deliberately — a non-optional required argument
here would break compilation of every other suite's cap file that doesn't
have qv_tag registered (lesson carried forward from this project's earlier
convection/MP coupling work).

### FILE: ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_DCNV_generic_post.meta
### FILE: ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_SCNV_generic_post.meta

Added right after each file's `[ntqv]` block:
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
`standard_name` confirmed character-identical to the existing `[nqvtag]`
block in `GFS_PBL_generic_pre.meta` (this is what CCPP actually matches on
for auto-wiring; `long_name` text differs cosmetically and doesn't matter).

================================================================
## Build / wiring verification (confirmed passing)
================================================================

- `cmake ..` + `make -j` from `scm/bin` completed without error.
- **cmake specifically required** (not just `make -j`) to regenerate the
  CCPP cap file with the new optional argument wired in — same lesson
  that bit this project's original convection and MP coupling attempts,
  both of which initially compiled clean but silently never executed the
  new code because `present(nqvtag)` was evaluating false the whole time.
- Directly confirmed via the generated cap file
  (`scm/bin/ccpp/physics/physics/ccpp_scm_gfs_v17_p8_ugwpv1_phys_ts_cap.F90`):
  both `call gfs_dcnv_generic_post_run(...)` and
  `call gfs_scnv_generic_post_run(...)` show `nqvtag=physics%model%nqvtag`
  in their argument lists — genuinely wired, not just compiling.

================================================================
## NOT YET DONE
================================================================

- **State-level validation blocked, not yet complete.** Attempted the same
  isolation-test recipe used to validate PBL (`qv_tag_init_mode=2` +
  `debug_disable_forcing=.true.` + `--n_itt_diag 1 --n_itt_out 1`), which
  makes the proportional-scaling formula algebraically exact (ratio should
  be exactly 1.0) **only at t=1**, since that's the one timestep where
  `qv_tag(0)=qv(0)` is guaranteed exact by construction. Found `dq_dt_micro`
  (real qv's microphysics tendency) is **already nonzero at t=1** (80
  nonzero points) for the twpice case — Thompson MP coupling has not been
  reapplied in this restart, so MP is silently pulling real qv and qv_tag
  apart at the same timestep needed for a clean convection-only check.
  Shallow convection confirmed silent at t=1 (`dq_dt_shalconv` nonzero
  count = 0), so only MP is the contaminating factor, not both.
- **Next step in progress when session ended:** adding a
  `debug_disable_microphysics` namelist switch, same reversible
  four-file pattern as the existing `debug_disable_forcing` switch
  (`scm_type_defs.F90` field, `scm_input.F90`
  declaration/namelist-list/default/scm_state-copy, wrap the MP call site
  in `scm_time_integration.F90` in the guard), to silence MP for this one
  isolation test without needing to actually finish MP coupling first.
  **Not yet started** — only scoped.
- **Tendency-diagnostic fields not yet fixed.** `dqvtag_dt_deepconv`/
  `dqvtag_dt_shalconv` in `output.nc` read directly from `ten_q`, which our
  fix never touches (we only modify `gq0` directly, inside `case(1)`,
  after `ten_q` was already set from `dclw`). This means these two
  diagnostic fields currently still show transport-only tendencies, not
  the state's actual (transport + proportional-scaling) change — same
  diagnostic-lag pattern already found and fixed for `dqvtag_dt_pbl` and
  `dqvtag_dt_micro` earlier in this project. Not yet fixed for convection;
  needs the same style of fix (write directly to `ten_q(i,k,nqvtag)`
  reflecting the actual applied change, likely requiring `ten_q`'s intent
  to allow a write here too, same as the MP fix did).
- **`case(2)`/`case(3)` reachability not checked.** If either accumulate-
  tendency branch is ever live for this suite/case combination, it would
  need the same correction added — not yet verified either way.
- `debug_disable_forcing` is still `.true.` in `twpice.nml` — needed for
  this isolation-test recipe, but must be reset to `.false.` before any
  non-diagnostic run.

================================================================================
# UPDATE — Session (today): convection formula bug found+fixed, MP coupling
# written from scratch, numerical stability guard added, forcing-coupling
# designed (not yet implemented), full-suite validation, one open item
================================================================================

Scope this session: found and fixed a real bug in the DCNV/SCNV proportional-
scaling formula written previously (the "Edits made" section above describes
the BUGGY version — see correction below); wrote MP's coupling fix from
scratch (did not exist before this session); validated PBL/DCNV/SCNV/MP both
in isolation and together in the full suite; found and fixed a numerical
stability crash; designed (but did not yet implement) forcing's coupling.
One unexplained artifact remains open (qv_tag spikes around level 80-85).

================================================================
## BUG FOUND in the convection formula described above — CORRECTED
================================================================

The formula in the "Edits made" section above (`GFS_DCNV_generic_post.F90`/
`GFS_SCNV_generic_post.F90`, `case(1)`) has a real bug:
```fortran
old_qv_val = gq0(i,k,ntqv)
do n = 1, ntrac
  gq0(i,k,n) = gq0(i,k,n) + delt*ten_q(i,k,n)
end do
if (present(nqvtag)) then
  if (old_qv_val > 0.0_kind_phys) then
    gq0(i,k,nqvtag) = gq0(i,k,nqvtag) * (gq0(i,k,ntqv) / old_qv_val)   ! BUG
  end if
end if
```
This multiplies the ALREADY-transported qv_tag value (post-loop) by the
ratio, double-counting transport (once via the generic tracer loop, once
again implicitly via the ratio, since the ratio's numerator already reflects
transport's effect on real qv). Confirmed via isolation testing (MP+shalconv
removed from suite XML via `ccpp/suites/suite_SCM_GFS_v17_p8_ugwpv1.xml` —
see "Scheme-isolation technique" below): qv_tag(1) vs qv(1) mismatch of 6e-4
to 5% relative error at ordinary (non-negligible) qv magnitudes, compounding
every time deep convection fired across a run.

**FIX (applied to both files, `case(1)` only):** capture
`old_qv_tag_val = gq0(i,k,nqvtag)` BEFORE the generic tracer loop runs
(guarded by `present(nqvtag)`), multiply THAT pre-loop value instead:
```fortran
old_qv_val = gq0(i,k,ntqv)
if (present(nqvtag)) old_qv_tag_val = gq0(i,k,nqvtag)
do n = 1, ntrac
  gq0(i,k,n) = gq0(i,k,n) + delt*ten_q(i,k,n)
end do
if (present(nqvtag)) then
  if (old_qv_val > 1.0e-9_kind_phys) then      ! threshold also hardened, see below
    gq0(i,k,nqvtag) = old_qv_tag_val * (gq0(i,k,ntqv) / old_qv_val)
  end if
end if
```
New local `old_qv_tag_val` declared alongside `old_qv_val`
(`real(kind=kind_phys) :: old_qv_val, old_qv_tag_val`). Real qv's own
computation is completely untouched (only ever read, never written) in
either the buggy or fixed version.

VALIDATED (deep conv, isolated — MP+shalconv removed from suite XML):
t=1 gap=6.4e-10 (matches PBL's own FP noise floor, down from buggy 6e-4);
full-run relative errors >5% occur ONLY at physically negligible qv
magnitudes (2.3e-6 to 3.5e-6 kg/kg, upper-stratosphere). VALIDATED
(shallow conv, isolated — added samfshalcnv/GFS_SCNV_generic_post back,
MP still out): same t=1 exactness (6.4e-10), same decay pattern, no
evidence of a distinct SCNV-specific bug — SCNV's own contribution beyond
DCNV+PBL is negligible.

================================================================
## FILE: ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_MP_generic_post.F90
## FILE: ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_MP_generic_post.meta
================================================================

MP coupling did NOT exist before this session (confirmed via
`grep -n "\bntqv\b"` / `grep "\[ntqv\]\|\[nqvtag\]"` on both files — both
completely empty going in). Unlike DCNV/SCNV, `ntqv` itself was not even an
existing argument here, so this needed one more piece than convection did.

Design question resolved by reading the actual scheme source
(`ccpp/physics/physics/MP/Thompson/mp_thompson.F90`): line 585 —
`ten_q = 0.0 ! Since this scheme is outputting tracer tendencies
individually` — confirms Thompson MP zeroes the whole `ten_q` array then
fills only the specific hydrometeor species it computes (qv, cloud water,
ice, rain, snow, graupel via `dspechum`/`dqc`/`dqr` etc.). qv_tag's slot is
NEVER touched by the scheme itself, by design (no cloud/rain/ice tag
counterpart exists for a single-phase passive tracer). So unlike convection
(where the correction only needed to patch a missing condensation-sink term
on top of otherwise-correct transport), for MP the proportional-scaling
correction has to represent the ENTIRE moisture change — there is no
transport-equivalent for qv_tag to ride through a phase-change scheme.

**1) Argument list** — added `ntqv, nqvtag` (positioned near `htop` in the
long argument list; CCPP wires by standard_name/keyword via the generated
cap file, not position, so exact placement doesn't matter):
```fortran
... gq0, prsl, prsi, phii, tsfc, ice, phil, htop, ntqv, nqvtag, &
```

**2) Declarations:**
```fortran
integer, intent(in) :: im, levs, kdt, tend_opt_mp, nrcm, nncl, ntcw, ntrac, ntqv, num_dfi_radar, index_of_process_dfi_radar
integer, intent(in), optional :: nqvtag
```
(`ntqv` required/non-optional — every suite has real qv; `nqvtag` optional,
same pattern as DCNV/SCNV)

**3) Local variable** — added right after `real(kind=kind_phys), dimension(im,levs) :: save_t`:
```fortran
real(kind=kind_phys) :: old_qv_val, old_qv_tag_val
```

**4) Inside `case(1)`** (`case_MP_ten: select case (tend_opt_mp)`) — same
pattern as DCNV/SCNV, written correctly (pre-loop capture) from the start
this time, no double-counting bug:
```fortran
        case (1) !immediately apply tendencies
          do k=1,levs
            do i=1,im
              gt0(i,k) = gt0(i,k) + dtp*ten_t(i,k)
              gu0(i,k) = gu0(i,k) + dtp*ten_u(i,k)
              gv0(i,k) = gv0(i,k) + dtp*ten_v(i,k)
              old_qv_val = gq0(i,k,ntqv)
              if (present(nqvtag)) old_qv_tag_val = gq0(i,k,nqvtag)
              do n = 1, ntrac
                gq0(i,k,n) = gq0(i,k,n) + dtp*ten_q(i,k,n)
              end do
              if (present(nqvtag)) then
                if (old_qv_val > 1.0e-9_kind_phys) then
                  gq0(i,k,nqvtag) = old_qv_tag_val * (gq0(i,k,ntqv) / old_qv_val)
                end if
              end if
            end do
          end do
```
(uses `dtp`, MP's own timestep variable name, not `delt`)

**`.meta` file** — added `[ntqv]` + `[nqvtag]` blocks right after the
existing `[ntrac]` block (no pre-existing `[ntqv]` block to anchor after,
unlike DCNV/SCNV, since the argument didn't exist here before):
```
[ntqv]
  standard_name = index_of_specific_humidity_in_tracer_concentration_array
  long_name = tracer index for water vapor (specific humidity)
  units = index
  dimensions = ()
  type = integer
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

Rebuilt (`cmake ..` + `make -j` from `scm/bin` — cmake specifically
required). Confirmed wired via generated cap file
(`scm/bin/ccpp/physics/physics/ccpp_scm_gfs_v17_p8_ugwpv1_phys_ts_cap.F90`):
`call gfs_mp_generic_post_run(...)` shows both `ntqv=` and `nqvtag=`
present with real values, not silently dropped.

================================================================
## NUMERICAL STABILITY GUARD — hardened in DCNV, SCNV, and MP
================================================================

**Crash found:** `qv_tag_init_mode=0` (qv_tag starts at zero, only grows
from wherever schemes inject tagged moisture) + a long run (~44h model time,
itt~264) → `NetCDF: Numeric conversion not representable qv_tag`, run dies.
Diagnosed: `min qv` in the failed run's output hit exactly `1e-10` (a
positivity-floor clip value baked into GFS physics somewhere) at level 81
(~85 hPa); `max qv_tag` before the crash reached `3.68e+20` — a real
floating-point blowup, not just imprecision.

**Root cause, confirmed by elimination:** initially suspected forcing (was
active when the crash first happened), but reran the exact same crashing
config with `debug_disable_forcing=.true.` — crashed at the identical
timestep with the identical error. Forcing is NOT the cause. The real cause
is `qv_tag_init_mode=0` itself: under `init_mode=2` (qv_tag(0)=qv(0)), the
proportional-scaling formula's stability implicitly depends on qv_tag and
qv staying roughly proportional throughout the run — true by construction
there. Under `init_mode=0`, qv_tag starts at zero and is NOT generally
proportional to qv, especially early/in regions the tagging source hasn't
reached — so when real qv independently gets driven toward the `1e-10`
floor by ordinary PBL/convection/MP activity (no forcing needed), the ratio
`new_qv/old_qv` can spike enormously while `old_qv_tag_val` is a normal,
unrelated magnitude, producing the blowup. The original guard
(`old_qv_val > 0.0_kind_phys`) let this through since `1e-10 > 0`.

**Fix applied (all three files: `GFS_DCNV_generic_post.F90`,
`GFS_SCNV_generic_post.F90`, `GFS_MP_generic_post.F90`):** tightened the
guard threshold:
```fortran
if (old_qv_val > 1.0e-9_kind_phys) then
```
(one order of magnitude above the observed `1e-10` floor; a pragmatic
safety margin, not derived from a principled threshold — worth revisiting
by grepping the actual floor constant in GFS physics and setting the guard
as some multiple of that, if more rigor is wanted later). When the guard
fails, `gq0(i,k,nqvtag)` simply holds its last value for that
timestep/level rather than blowing up — a safe fallback, not a physically
perfect answer.

**VALIDATED:** rebuilt with the guard fix; reran `init_mode=0` +
`debug_disable_forcing=.true.` → completed with no crash. Reran with
`debug_disable_forcing=.false.` (forcing ON) too → also completed with no
crash. So: the guard fix alone was sufficient; forcing does not introduce
any additional numerical stress once the guard is in place.

================================================================
## Scheme-isolation technique (new this session, reusable)
================================================================

To test one scheme's coupling exactly without other uncoupled/buggy schemes
contaminating the check: edit `ccpp/suites/suite_SCM_GFS_v17_p8_ugwpv1.xml`
directly to remove `<scheme>` lines for schemes not under test, then
`cmake ..` + `make -j` in `scm/bin` (cmake specifically regenerates the cap
file from the XML; `make -j` alone does not pick up the structural change).
ALWAYS back up first (`cp suite_....xml suite_....xml.bak`) and verify the
cut actually took effect via
`grep -n "call <scheme>_run" scm/bin/ccpp/physics/physics/ccpp_scm_gfs_v17_p8_ugwpv1_phys_ts_cap.F90 -i`
(should be absent) before trusting a run — the cap file is the only source
of truth for what's actually compiled in; the XML being edited doesn't
guarantee the binary reflects it until this check passes.

Used this session to isolate: PBL alone (removed MP + all convection +
`GFS_suite_interstitial_4` + `cnvc90`); PBL+DCNV (added
`samfdeepcnv`/`GFS_DCNV_generic_post` back); PBL+DCNV+SCNV (added
`samfshalcnv`/`GFS_SCNV_generic_post` back). `GFS_suite_interstitial_4`
checked directly and confirmed to only touch aerosol/cloud-number tracers
(`ntlnc`/`ntinc`/`ntccn`/`ntcw`/`ntiw`), never `ntqv`/`nqvtag` — safe,
unrelated to qv_tag. `cnvc90` was excluded defensively (computes convective
cloud fraction from convection's mass-flux output, would likely error with
convection removed) but never independently checked.

**By session end, full original suite XML fully restored** (diffed
visually against the original structure — matches, all groups/subcycles/
schemes present: `time_vary`, `radiation`, `phys_ps` with PBL/GWD,
`phys_ts` with full convection chain + `GFS_suite_interstitial_4` + `cnvc90`
+ both MP subcycles). No temporary exclusions remain in the live XML.

================================================================
## FULL-SUITE VALIDATION (all fixes together, real suite structure)
================================================================

With PBL (untouched/pre-validated) + DCNV + SCNV + MP all active together
(full restored suite), `qv_tag_init_mode=2`, `debug_disable_forcing=.true.`
(isolation-test config, not a real run): t=1 gap still exactly at noise
floor (6.4e-10), and across the FULL run (t=0 to t=3564) relative error
stays consistently small — mostly <0.1%, peaking ~0.5% at t=2, settling to
0.01-0.1% for the rest of the run. Confirms all three fixes work correctly
IN COMBINATION, not just individually (state from one scheme feeds into the
next, so this was a real integration risk, not guaranteed by the individual
validations alone).

**Caveat, still open:** this residual (~0.01-0.1% floor throughout the run)
is consistent with the still-unexplained PBL/stratosphere divergence found
earlier (see prior session's entry above — bounded oscillating pattern tied
to rapid PBL transitions + slow drift above ~level 90/~43hPa). The
`nvdiff==ntrac` branch question in `GFS_PBL_generic_post.F90` (whether this
suite takes the safe whole-array-copy path or the risky separately-indexed
`dvdftra(...,nqvtagv)` path) was proposed to check multiple times but NEVER
ACTUALLY RUN before the session moved to fixing convection/MP instead.
Genuinely still unresolved — worth revisiting:
```
grep -n "nvdiff\b" ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE/GFS_PBL_generic_pre.F90
```

================================================================
## Large-scale forcing / qv_tag coupling — DESIGNED, NOT YET IMPLEMENTED
================================================================

Traced `scm_forcing.F90` (`apply_forcing_forward_Euler`/`apply_forcing_DEPHY`,
subroutine locations confirmed via
`grep -rln "subroutine apply_forcing_forward_Euler\|subroutine apply_forcing_DEPHY" scm/src/*.F90`
→ both in `scm_forcing.F90`). Confirmed via source: forcing writes ONLY to
`scm_state%state_tracer(i,k,scm_state%water_vapor_index,1)`, never a
generic tracer loop, and has ZERO qv_tag/nqvtag references anywhere in the
file (expected — clean slate, nothing ported from anywhere). Three separate
code blocks compute `qv_force_tend` (`case(1)`/`case(2)`/`case(3)` of
`thermo_forcing_type`, roughly lines 773-922 / 956-1115 / 1148-1446):
horizontal+vertical advection of total water (`h_advec_qt`+`v_advec_qt`,
read directly from the case's driving dataset), vertical-omega-based
advection (upstream-differenced against the model's own moisture gradient
using prescribed large-scale `omega`), and nudging toward an observed
profile (`qt_nudge`) respectively. All three represent moisture entering or
leaving the column from OUTSIDE (prescribed from external
reanalysis/observations, standing in for resolved 3D transport a full GCM
would compute on its own) — structurally never a local process (no
evaporation/condensation rate anywhere in this file).

**Design conclusion (reasoned from CESM/iCESM's actual mechanism, confirmed
via web search of the water-tracer literature — tags are registered as
ordinary advected tracers in CAM's constituent array (`pcnst`) and moved by
the SAME dynamical-core transport operator as real water, automatically
proportional to local tagged fraction; NOT a special coded rule):**
- If tagged moisture = water evaporated from this column's own surface: 
  incoming advected/nudged moisture from OUTSIDE the column is genuinely
  untagged by definition — qv_tag should NOT be touched when forcing is
  net-moistening. This is correct, not an approximation.
- When forcing is net-DRYING (moisture leaving), a real 3D transport
  operator would remove tagged and untagged water together, proportional to
  local tagged fraction — CANNOT be replicated exactly in an SCM (no
  resolved 3D transport exists to act on; `h_advec_qt` etc. are a single
  external number with no internal tagged/untagged composition to split).
  Leaving qv_tag COMPLETELY untouched during drying is asymmetric and
  wrong: it implies advective outflow selectively spares all tagged water,
  which has no physical basis. Over a full run with real drying events,
  this asymmetry causes qv_tag's fraction of total qv to drift upward over
  time as a pure artifact (moistening correctly doesn't inflate it; drying
  incorrectly fails to deflate it — a one-directional bias, not neutral).

**Proposed fix (drafted, NOT yet written into the file):** proportional-
scaling correction, applied ONLY when `qv_force_tend(i,k) < 0` (net drying);
left alone when `>= 0` (net moistening):
```fortran
if (scm_state%tagging .and. scm_state%qv_tag_index > 0) then
  old_qv_tag_val = scm_state%state_tracer(i,k,scm_state%qv_tag_index,1)
end if

scm_state%state_tracer(i,k,scm_state%water_vapor_index,1) = scm_state%state_tracer(i,k,scm_state%water_vapor_index,1) + &
  2.0*scm_state%dt*(scm_state%qv_force_tend(i,k))

if (scm_state%tagging .and. scm_state%qv_tag_index > 0) then
  if (scm_state%qv_force_tend(i,k) < 0.0 .and. old_qv(i,k) > 0.0) then
    scm_state%state_tracer(i,k,scm_state%qv_tag_index,1) = old_qv_tag_val * &
      (scm_state%state_tracer(i,k,scm_state%water_vapor_index,1) / old_qv(i,k))
  end if
  ! net moistening: intentionally no code — incoming advected moisture is untagged by definition
end if
```
`old_qv(i,k)` already available (captured near top of each block before
`qv_force_tend` is computed). NOTE: this is driver code
(`scm_forcing.F90`), not a CCPP scheme — direct access to
`scm_state%qv_tag_index`/`scm_state%tagging`, no `nqvtag`/`present()`
argument-threading needed the way the CCPP interstitials required.
**Needs the same numerical guard as DCNV/SCNV/MP** (threshold above
`old_qv(i,k)`'s floor, not just `> 0.0`) given the exact same blowup
mechanism could apply here.

**NOT YET WRITTEN.** Since the three `qv_force_tend` computation blocks
correspond to different `thermo_forcing_type` namelist branches, the
capture/update/scale sequence likely needs to be added in all three
locations — each site's exact surrounding structure should be checked
individually before editing (same care applied everywhere else this
session), not assumed identical across all three.

================================================================
## OPEN / NOT YET EXPLAINED — qv_tag spikes around level 80-85
================================================================

With the guard fix in place, `qv_tag_init_mode=0`, forcing ON (the intended
real-use configuration): output "looks fine" visually overall (qv_tag
starts at zero, grows sensibly, concentrated at lower levels as expected)
BUT shows unexplained spikes in qv_tag specifically around vertical level
index ~80-85 (roughly 73-100 hPa per the case's pressure table — upper
troposphere/near tropopause for this tropical case). Not yet diagnosed.
Leading candidate hypotheses proposed but NOT YET CHECKED against data:
(1) this may be exactly where `ktcon` (deep convective cloud top) lands for
twpice — spikes here could be real, physically-expected convective
detrainment pulses rather than a bug; (2) the new `1.0e-9` guard may be
triggering at these levels/times, leaving qv_tag "stale" while real qv
moves on, producing an apparent discontinuity when they later reconcile.
Proposed but unrun diagnostic queries: check `dq_dt_deepconv` activity
concentration by level; check how many timesteps `qv < 1e-9` at levels
78/80/82/85 (guard-trigger frequency); pull raw qv/qv_tag values at the
exact spike timestep/level. **Session ended before any of these were run.**

================================================================
## STATUS SUMMARY / NEXT STEPS as of this session's end
================================================================

DONE this session: convection formula bug found+fixed+validated (DCNV,
SCNV, both isolated and combined); MP coupling written from scratch+wired+
validated in combination with PBL/DCNV/SCNV; numerical stability crash
found+fixed (guard hardening, all 3 files); full suite XML restored to
original; full-suite combined validation passing at isolation-test settings.

NOT YET DONE:
- Forcing/qv_tag coupling: designed, not implemented (see above) — needed
  before `debug_disable_forcing=.false.` + real init_mode produces a
  physically defensible qv_tag for drying periods.
- Level 80-85 qv_tag spike: unexplained, undiagnosed.
- PBL's `nvdiff==ntrac` branch question: still never actually checked,
  carried over from prior session, possibly explains part of the
  still-present ~0.01-0.1% full-run residual even with everything else
  fixed.
- `case(2)`/`case(3)` reachability (DCNV/SCNV/MP all have this same
  tend_opt branching) still not checked for any of the three schemes —
  edits only ever applied to `case(1)`.
- `dqvtag_dt_deepconv`/`dqvtag_dt_shalconv`/(likely also MP's diagnostic
  now, unchecked) tendency-diagnostic-lag issue from the previous entry
  above is STILL UNFIXED — diagnostics read `ten_q`, not `gq0`, so they
  don't reflect the proportional-scaling correction's actual effect on
  state. Not blocking (state-level checks are the reliable validation
  method used throughout), but means these specific output.nc fields
  remain misleading if read naively.
- Namelist state to double check before any future run: `twpice.nml`'s
  `qv_tag_init_mode` and `debug_disable_forcing` were toggled back and
  forth many times this session for testing — confirm both are set to the
  values actually intended (isolation-test values vs. real-run values are
  NOT the same) before trusting any new run's output.