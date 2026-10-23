# qv_tag Tagging Switch — Steps

No scheme files touched. Suite: `GFS_v17_p8_ugwpv1`.

## Step 1: `tagging` namelist switch

**`scm/src/GFS_typedefs.F90`**
```fortran
! in GFS_control_type:
logical :: tagging

! local namelist-read var:
logical :: tagging = .false.

! copy-in:
Model%tagging = tagging

! add to NAMELIST /gfs_physics_nml/ list:
hybedmf, satmedmf, tagging, tte_edmf, sigmab_coldstart, &
```

**`scm/src/GFS_typedefs.meta`** — add after `[satmedmf]`:
```
[tagging]
  standard_name = flag_for_water_tagging
  long_name = master flag to enable water tagging (dye-tracking) framework
  units = flag
  dimensions = ()
  type = logical
```

**Namelist files** — add `tagging = .true.` to:
- `ccpp/physics_namelists/input_GFS_v17_p8_ugwpv1.nml`
- `scm/run/input_GFS_v17_p8_ugwpv1.nml`

**Rebuild** (`.meta` changed):
```bash
cd /glade/u/home/asiyab/SWI_repos/ccpp-scm
./ccpp/framework/scripts/ccpp_prebuild.py --config=./ccpp/config/ccpp_prebuild_config.py --builddir=./scm/bin
cd scm/bin && make -j
```

**Verify:** debug print `Model%tagging` — reads `.true.`/`.false.` matching namelist.

---

## Step 2: `qv_tag` tracer index registration

**`scm/etc/tracer_config/tracers_GFS_v17_p8_ugwpv1.txt`** — append (13th tracer, unconditional):
```
"qv_tag","tagged_water_vapor_specific_humidity","kg kg-1"
```

**`scm/src/scm_type_defs.F90`**
```fortran
! in scm_state derived type:
integer :: qv_tag_index

! in scm_state_create:
if (physics%Model%tagging) then
  scm_state%qv_tag_index = get_tracer_index(scm_state%tracer_names,"qv_tag")
else
  scm_state%qv_tag_index = 0
end if
```

**`scm/src/GFS_typedefs.F90`**
```fortran
! in GFS_control_type:
integer :: nqvtag

! in tracer-index-population section:
if (Model%tagging) then
  Model%nqvtag = get_tracer_index(Model%tracer_names, 'qv_tag')
else
  Model%nqvtag = 0
end if
```

**`scm/src/GFS_typedefs.meta`** — add:
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

**Rebuild** (`.meta` changed): same 3 commands as Step 1.

**Verify:** debug print `nqvtag`/`qv_tag_index` — reads `13` when `tagging=.true.`, `0` when `.false.`.

---

## Step 3: Output registration — NOT YET DONE

Plan: gate `scm_output.F90` def/write calls behind `tagging` for:
`qv_tag`, `dqvtag_dt_pbl/deepconv/shalconv/micro/phys/nonphys`, `qv_tag_force_tend`
— using the generic `dtidx(100+nqvtag, index_of_process_*)` mechanism, no scheme edit needed.

---
