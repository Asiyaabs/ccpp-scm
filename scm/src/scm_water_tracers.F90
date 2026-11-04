!> \file scm_water_tracers.F90
!! Water tracers (tagging, later isotopes): the host side of the SCM.
!!
!! Everything here is called only when tagging is on (physics%Model%tagging):
!!  - wtr_host_init:     initial values, once after ccpp_physics_init
!!  - wtr_host_forcing:  large-scale forcing of the vapour tracers, after apply_forcing_DEPHY
!!  - wtr_host_clip:     0 <= tag <= bulk, after the physics of each time step
!!  - wtr_output_init / wtr_output_append: water tracer fields in output.nc
!! The namelist choices are kept in wtr_host_cfg (read in scm_input, add_water_tracers).
module scm_water_tracers

  use scm_kinds,            only: dp
  use water_tracers_config, only: wtr_config_type, wtr_kind_bulk, wtr_kind_tag
  use water_tracers_utils,  only: wtr_transfer

  implicit none
  private

  public :: wtr_host_cfg, wtr_host_init, wtr_host_forcing, wtr_host_clip
  public :: wtr_output_init, wtr_output_append

  type(wtr_config_type), save :: wtr_host_cfg  !< namelist choices, set in scm_input

  real(dp), parameter :: tfreeze = 273.15_dp   !< convective rain/snow split, as in GFS_MP_generic_post

contains

  !> Initial values: bulk sets = model water; tags = 0, model water, or a fraction of it
  !! (wtr_init_tags). Called after ccpp_physics_init, so that the model water is the one
  !! the physics starts from.
  subroutine wtr_host_init(scm_state, Model)
    use scm_type_defs, only: scm_state_type
    use GFS_typedefs,  only: GFS_control_type

    type(scm_state_type),   intent(inout) :: scm_state
    type(GFS_control_type), intent(in)    :: Model

    integer  :: s, p, itrc, imod
    real(dp) :: frac

    do s = 1, Model%wtr_nset
      if (Model%wtr_kind(s) == wtr_kind_bulk) then
        frac = 1.0_dp
      else
        select case (trim(wtr_host_cfg%init_tags))
        case ('bulk')
          frac = 1.0_dp
        case ('fraction')
          frac = wtr_host_cfg%init_frac
        case default
          frac = 0.0_dp
        end select
      end if
      do p = 1, Model%wtr_nphase
        itrc = Model%wtr_idx(s,p)
        imod = Model%wtr_model_idx(p)
        if (imod > 0) then
          scm_state%state_tracer(:,:,itrc,:) = frac*scm_state%state_tracer(:,:,imod,:)
        else
          scm_state%state_tracer(:,:,itrc,:) = 0.0_dp
        end if
      end do
    end do
  end subroutine wtr_host_init

  !> Large-scale forcing of the vapour tracers, with the same increment dqv = dt*qv_force_tend
  !! that apply_forcing_DEPHY gave the model vapour:
  !!  - bulk sets: + dqv (stay equal to the model vapour)
  !!  - tags: drying (dqv < 0) removes vapour at the tag ratio; moistening adds nothing,
  !!    because advected vapour did not evaporate in the column.
  !!    Test mode wtr_tag_moisten = .true.: tags get + dqv like the bulk set.
  subroutine wtr_host_forcing(scm_state, Model)
    use scm_type_defs, only: scm_state_type
    use GFS_typedefs,  only: GFS_control_type

    type(scm_state_type),   intent(inout) :: scm_state
    type(GFS_control_type), intent(in)    :: Model

    integer  :: s, i, k, iv, iwv
    real(dp) :: dqv, qv_old

    iwv = scm_state%water_vapor_index
    do s = 1, Model%wtr_nset
      iv = Model%wtr_idx(s,1)
      do k = 1, scm_state%n_levels
        do i = 1, scm_state%n_cols
          dqv = scm_state%dt*scm_state%qv_force_tend(i,k)
          if (Model%wtr_kind(s) == wtr_kind_bulk .or. wtr_host_cfg%tag_moisten) then
            scm_state%state_tracer(i,k,iv,1) = scm_state%state_tracer(i,k,iv,1) + dqv
          else if (dqv < 0.0_dp) then
            qv_old = scm_state%state_tracer(i,k,iwv,1) - dqv
            call wtr_transfer(qv_old, scm_state%state_tracer(i,k,iv,1), -dqv)
          end if
        end do
      end do
    end do
  end subroutine wtr_host_forcing

  !> After the physics: 0 <= tag <= its bulk (the bulk set, or the model water if there is
  !! no bulk set), phase by phase. Bulk sets are not clipped: they are the check.
  subroutine wtr_host_clip(scm_state, Model)
    use scm_type_defs, only: scm_state_type
    use GFS_typedefs,  only: GFS_control_type

    type(scm_state_type),   intent(inout) :: scm_state
    type(GFS_control_type), intent(in)    :: Model

    integer :: s, p, itrc, iref

    do s = 1, Model%wtr_nset
      if (Model%wtr_kind(s) /= wtr_kind_tag) cycle
      do p = 1, Model%wtr_nphase
        itrc = Model%wtr_idx(s,p)
        if (Model%wtr_bulk(s) > 0) then
          iref = Model%wtr_idx(Model%wtr_bulk(s),p)
        else
          iref = Model%wtr_model_idx(p)
        end if
        if (iref > 0) then
          scm_state%state_tracer(:,:,itrc,1) = max(0.0_dp, min(scm_state%state_tracer(:,:,itrc,1), &
                                                               max(scm_state%state_tracer(:,:,iref,1), 0.0_dp)))
        else
          scm_state%state_tracer(:,:,itrc,1) = 0.0_dp
        end if
      end do
    end do
  end subroutine wtr_host_clip

  !> Set name of set s (e.g. H2O, H2O_COL): its vapour tracer name without 'qv_'
  function set_name(Model, s)
    use GFS_typedefs, only: GFS_control_type
    type(GFS_control_type), intent(in) :: Model
    integer,                intent(in) :: s
    character(len=32) :: set_name
    set_name = Model%tracer_names(Model%wtr_idx(s,1))(4:)
  end function set_name

  !> Define the water tracer fields in output.nc:
  !! model precipitation and surface water flux (CAM names), and per water tracer set its
  !! 6 phases and its precipitation and surface flux (iCESM names: r/s convective rain/snow,
  !! R/S large-scale rain/snow).
  subroutine wtr_output_init(ncid, time_inst_id, hor_dim_id, vert_dim_id, Model)
    use netcdf,       only: NF90_FLOAT
    use NetCDF_def,   only: NetCDF_def_var
    use GFS_typedefs, only: GFS_control_type

    integer,                intent(in) :: ncid, time_inst_id, hor_dim_id, vert_dim_id
    type(GFS_control_type), intent(in) :: Model

    integer           :: dummy_id, s, p
    character(len=32) :: sn

    call NetCDF_def_var(ncid, 'PRECC',  NF90_FLOAT, "convective precipitation rate (deep + shallow)",                  "m s-1",      dummy_id, (/ hor_dim_id, time_inst_id /))
    call NetCDF_def_var(ncid, 'PRECSC', NF90_FLOAT, "convective snow rate (PRECC where tsfc < 273.15 K)",            "m s-1",      dummy_id, (/ hor_dim_id, time_inst_id /))
    call NetCDF_def_var(ncid, 'PRECL',  NF90_FLOAT, "large-scale (microphysics) precipitation rate",                  "m s-1",      dummy_id, (/ hor_dim_id, time_inst_id /))
    call NetCDF_def_var(ncid, 'PRECSL', NF90_FLOAT, "large-scale snow + ice + graupel rate",                          "m s-1",      dummy_id, (/ hor_dim_id, time_inst_id /))
    call NetCDF_def_var(ncid, 'PRECT',  NF90_FLOAT, "total precipitation rate",                                       "m s-1",      dummy_id, (/ hor_dim_id, time_inst_id /))
    call NetCDF_def_var(ncid, 'QFLX',   NF90_FLOAT, "surface upward water flux",                                      "kg m-2 s-1", dummy_id, (/ hor_dim_id, time_inst_id /))

    do s = 1, Model%wtr_nset
      sn = set_name(Model, s)
      do p = 1, Model%wtr_nphase
        call NetCDF_def_var(ncid, trim(Model%tracer_names(Model%wtr_idx(s,p))), NF90_FLOAT, &
                            "water tracer "//trim(Model%tracer_names(Model%wtr_idx(s,p))), "kg kg-1", dummy_id, &
                            (/ hor_dim_id, vert_dim_id, time_inst_id /))
      end do
      call NetCDF_def_var(ncid, 'PRECRC_'//trim(sn)//'r', NF90_FLOAT, "convective rain rate of water tracer set "//trim(sn),            "m s-1",      dummy_id, (/ hor_dim_id, time_inst_id /))
      call NetCDF_def_var(ncid, 'PRECSC_'//trim(sn)//'s', NF90_FLOAT, "convective snow rate of water tracer set "//trim(sn),            "m s-1",      dummy_id, (/ hor_dim_id, time_inst_id /))
      call NetCDF_def_var(ncid, 'PRECRL_'//trim(sn)//'R', NF90_FLOAT, "large-scale rain rate of water tracer set "//trim(sn),           "m s-1",      dummy_id, (/ hor_dim_id, time_inst_id /))
      call NetCDF_def_var(ncid, 'PRECSL_'//trim(sn)//'S', NF90_FLOAT, "large-scale snow + ice + graupel rate of water tracer set "//trim(sn), "m s-1", dummy_id, (/ hor_dim_id, time_inst_id /))
      call NetCDF_def_var(ncid, 'QFLX_'//trim(sn),        NF90_FLOAT, "surface upward water flux of water tracer set "//trim(sn),      "kg m-2 s-1", dummy_id, (/ hor_dim_id, time_inst_id /))
    end do
  end subroutine wtr_output_init

  !> Write the water tracer fields (instantaneous: precipitation of the last time step / dt)
  subroutine wtr_output_append(ncid, scm_state, physics)
    use NetCDF_put,             only: NetCDF_put_var
    use scm_type_defs,          only: scm_state_type, physics_type
    use scm_physical_constants, only: con_rd, con_fvirt

    integer,              intent(in) :: ncid
    type(scm_state_type), intent(in) :: scm_state
    type(physics_type),   intent(in) :: physics

    integer           :: s, p, itrc
    real(dp)          :: inv_dt
    real(dp), dimension(scm_state%n_cols) :: rho, cnv, frozen_mp
    logical,  dimension(scm_state%n_cols) :: cold
    character(len=32) :: sn

    associate (Model => physics%Model, Sfcprop => physics%Sfcprop, Diag => physics%Diag, &
               Statein => physics%Statein, Int => physics%Interstitial(1))

      inv_dt = 1.0_dp/scm_state%dt
      cold   = Sfcprop%tsfc(:) < tfreeze
      rho    = Statein%pgr(:)/(con_rd*Statein%tgrs(:,1)*(1.0_dp + con_fvirt*Statein%qgrs(:,1,Model%ntqv)))
      if (associated(Int%snowmp)) then
        frozen_mp = Int%snowmp(:) + Int%icemp(:) + Int%graupelmp(:)
      else
        frozen_mp = 0.0_dp
      end if

      call NetCDF_put_var(ncid, 'PRECC',  Diag%rainc(:)*inv_dt,                        scm_state%itt_out)
      call NetCDF_put_var(ncid, 'PRECSC', merge(Diag%rainc(:), 0.0_dp, cold)*inv_dt,  scm_state%itt_out)
      call NetCDF_put_var(ncid, 'PRECL',  Int%prcpmp(:)*inv_dt,                        scm_state%itt_out)
      call NetCDF_put_var(ncid, 'PRECSL', frozen_mp*inv_dt,                            scm_state%itt_out)
      call NetCDF_put_var(ncid, 'PRECT',  Sfcprop%tprcp(:)*inv_dt,                     scm_state%itt_out)
      call NetCDF_put_var(ncid, 'QFLX',   rho*Sfcprop%evap(:),                         scm_state%itt_out)

      do s = 1, Model%wtr_nset
        sn = set_name(Model, s)
        do p = 1, Model%wtr_nphase
          itrc = Model%wtr_idx(s,p)
          call NetCDF_put_var(ncid, trim(Model%tracer_names(itrc)), scm_state%state_tracer(:,:,itrc,1), scm_state%itt_out)
        end do
        cnv = Int%wtr_raincd(:,s) + Int%wtr_raincs(:,s)
        call NetCDF_put_var(ncid, 'PRECRC_'//trim(sn)//'r', merge(0.0_dp, cnv, cold)*inv_dt, scm_state%itt_out)
        call NetCDF_put_var(ncid, 'PRECSC_'//trim(sn)//'s', merge(cnv, 0.0_dp, cold)*inv_dt, scm_state%itt_out)
        call NetCDF_put_var(ncid, 'PRECRL_'//trim(sn)//'R', Int%wtr_rainmp(:,s)*inv_dt,      scm_state%itt_out)
        call NetCDF_put_var(ncid, 'PRECSL_'//trim(sn)//'S', Int%wtr_snowmp(:,s)*inv_dt,      scm_state%itt_out)
        call NetCDF_put_var(ncid, 'QFLX_'//trim(sn),        Int%wtr_qflx(:,s),               scm_state%itt_out)
      end do

    end associate
  end subroutine wtr_output_append

end module scm_water_tracers
