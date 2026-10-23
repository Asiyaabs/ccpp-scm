
!
! This work (Common Community Physics Package), identified by NOAA, NCAR,
! CU/CIRES, is free of known copyright restrictions and is placed in the
! public domain.
!
! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
! THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
! IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
! CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
!

!>
!! @brief Auto-generated cap module for the CCPP phys_ps group
!!
!
module ccpp_scm_hrrr_gf_phys_ps_cap

   use gfs_surface_generic_pre, only: gfs_surface_generic_pre_init
   use module_sf_mynnsfc_driver, only: module_sf_mynnsfc_driver_init
   use lsm_ruc, only: lsm_ruc_init
   use clm_lake, only: clm_lake_init
   use gfs_surface_generic_post, only: gfs_surface_generic_post_init
   use rrfs_smoke_wrapper, only: rrfs_smoke_wrapper_init
   use mynnedmf_wrapper, only: mynnedmf_wrapper_init
   use drag_suite, only: drag_suite_init
   use get_prs_fv3, only: get_prs_fv3_run
   use gfs_suite_interstitial_1, only: gfs_suite_interstitial_1_run
   use gfs_surface_generic_pre, only: gfs_surface_generic_pre_run
   use gfs_surface_composites_pre, only: gfs_surface_composites_pre_run
   use dcyc2t3, only: dcyc2t3_run
   use gfs_surface_composites_inter, only: gfs_surface_composites_inter_run
   use gfs_suite_interstitial_2, only: gfs_suite_interstitial_2_run
   use module_sf_mynnsfc_driver, only: module_sf_mynnsfc_driver_run
   use gfs_surface_loop_control_part1, only: gfs_surface_loop_control_part1_run
   use lsm_ruc, only: lsm_ruc_run
   use clm_lake, only: clm_lake_run
   use gfs_surface_loop_control_part2, only: gfs_surface_loop_control_part2_run
   use gfs_surface_composites_post, only: gfs_surface_composites_post_run
   use sfc_diag, only: sfc_diag_run
   use sfc_diag_post, only: sfc_diag_post_run
   use gfs_surface_generic_post, only: gfs_surface_generic_post_run
   use rrfs_smoke_wrapper, only: rrfs_smoke_wrapper_run
   use mynnedmf_wrapper, only: mynnedmf_wrapper_run
   use mynnedmf_wrapper_post, only: mynnedmf_wrapper_post_run
   use rrfs_smoke_postpbl, only: rrfs_smoke_postpbl_run
   use gfs_gwd_generic_pre, only: gfs_gwd_generic_pre_run
   use drag_suite, only: drag_suite_run
   use gfs_gwd_generic_post, only: gfs_gwd_generic_post_run
   use lsm_ruc, only: lsm_ruc_finalize


   implicit none

   private
   public :: scm_hrrr_gf_phys_ps_tsinit_cap, &
             scm_hrrr_gf_phys_ps_tsfinal_cap, &
             scm_hrrr_gf_phys_ps_init_cap, &
             scm_hrrr_gf_phys_ps_run_cap, &
             scm_hrrr_gf_phys_ps_final_cap

   logical, dimension(200), save :: initialized = .false.

   contains

   function scm_hrrr_gf_phys_ps_tsinit_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_hrrr_gf_phys_ps_tsinit_cap

   function scm_hrrr_gf_phys_ps_tsfinal_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_hrrr_gf_phys_ps_tsfinal_cap

   function scm_hrrr_gf_phys_ps_init_cap(one,physics,cdata,con_fvirt,con_rd,con_pi,karman,con_g,con_sbc,con_t0c, &
                  rhowater,con_csol,con_cliq,con_hfus,con_hvap,con_eps,con_cp,rholakeice, &
                  con_rv,con_cvap,con_rocp) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t
      use machine, only: kind_phys

      implicit none

      ! Error handling
      integer :: ierr

      integer, intent(in), target :: one
      type(physics_type), intent(inout), target :: physics
      type(ccpp_t), intent(inout), target :: cdata
      real(kind_phys), intent(in), target :: con_fvirt
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: con_pi
      real(kind_phys), intent(in), target :: karman
      real(kind_phys), intent(in), target :: con_g
      real(kind_phys), intent(in), target :: con_sbc
      real(kind_phys), intent(in), target :: con_t0c
      real(kind_phys), intent(in), target :: rhowater
      real(kind_phys), intent(in), target :: con_csol
      real(kind_phys), intent(in), target :: con_cliq
      real(kind_phys), intent(in), target :: con_hfus
      real(kind_phys), intent(in), target :: con_hvap
      real(kind_phys), intent(in), target :: con_eps
      real(kind_phys), intent(in), target :: con_cp
      real(kind_phys), intent(in), target :: rholakeice
      real(kind_phys), intent(in), target :: con_rv
      real(kind_phys), intent(in), target :: con_cvap
      real(kind_phys), intent(in), target :: con_rocp
      
      ! Local variables/pointers for unit conversions, array transformations, ...
      type :: real_kind_phys_rank1_ptr_arr_type
         real(kind_phys), dimension(:), pointer :: p => null()
      end type real_kind_phys_rank1_ptr_arr_type
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sfcqv_lnd_1_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sfcqv_ice_2_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sfalb_lnd_bck_3_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albdvis_ice_4_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albdnir_ice_5_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albivis_ice_6_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albinir_ice_7_ptr_array
      type :: real_kind_phys_rank2_ptr_arr_type
         real(kind_phys), dimension(:,:), pointer :: p => null()
      end type real_kind_phys_rank2_ptr_arr_type
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sh2o_8_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smfrkeep_9_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tslb_10_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smois_11_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wetness_12_ptr_array

      ierr = 0


      if (initialized(cdata%ccpp_instance)) return



      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      


      call gfs_surface_generic_pre_init(nthreads=physics%model%nthreads,im=physics%model%ncols,slmsk=physics%sfcprop%slmsk(one:physics%model%ncols), &
                  isot=physics%model%isot,ivegsrc=physics%model%ivegsrc,stype=physics%sfcprop%stype(one:physics%model%ncols), &
                  scolor=physics%sfcprop%scolor(one:physics%model%ncols),vtype=physics%sfcprop%vtype(one:physics%model%ncols), &
                  slope=physics%sfcprop%slope(one:physics%model%ncols),stype_save=physics%sfcprop%stype_save(one:physics%model%ncols), &
                  scolor_save=physics%sfcprop%scolor_save(one:physics%model%ncols),vtype_save=physics%sfcprop%vtype_save(one:physics%model%ncols), &
                  slope_save=physics%sfcprop%slope_save(one:physics%model%ncols),errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_surface_generic_pre_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      


      call module_sf_mynnsfc_driver_init(do_mynnsfclay=physics%model%do_mynnsfclay,errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in module_sf_mynnsfc_driver_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        sfcqv_lnd_1_ptr_array(cdata%thrd_no)%p => physics%sfcprop%qwv_surf_land(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        sfcqv_ice_2_ptr_array(cdata%thrd_no)%p => physics%sfcprop%qwv_surf_ice(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        sfalb_lnd_bck_3_ptr_array(cdata%thrd_no)%p => physics%sfcprop%sfalb_lnd_bck(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albdvis_ice_4_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdirvis_ice(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albdnir_ice_5_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdirnir_ice(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albivis_ice_6_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdifvis_ice(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albinir_ice_7_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdifnir_ice(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        sh2o_8_ptr_array(cdata%thrd_no)%p => physics%sfcprop%sh2o(one:physics%model%ncols,one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        smfrkeep_9_ptr_array(cdata%thrd_no)%p => physics%sfcprop%keepsmfr(one:physics%model%ncols,one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        tslb_10_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tslb(one:physics%model%ncols,one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        smois_11_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smois(one:physics%model%ncols,one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        wetness_12_ptr_array(cdata%thrd_no)%p => physics%sfcprop%wetness(one:physics%model%ncols)
      end if

      call lsm_ruc_init(me=physics%model%me,master=physics%model%master,isot=physics%model%isot, &
                  ivegsrc=physics%model%ivegsrc,nlunit=physics%model%nlunit,lsm_cold_start=physics%model%lsm_cold_start, &
                  flag_init=physics%model%first_time_step,con_fvirt=con_fvirt,con_rd=con_rd, &
                  im=physics%model%ncols,lsoil_ruc=physics%model%lsoil_lsm,lsoil=physics%model%lsoil, &
                  kice=physics%model%kice,nlev=physics%model%levs,lsm_ruc=physics%model%lsm_ruc, &
                  lsm=physics%model%lsm,slmsk=physics%sfcprop%slmsk(one:physics%model%ncols), &
                  stype=physics%sfcprop%stype(one:physics%model%ncols),vtype=physics%sfcprop%vtype(one:physics%model%ncols), &
                  landfrac=physics%sfcprop%landfrac(one:physics%model%ncols),q1=physics%statein%qgrs(one:physics%model%ncols,1,physics%model%ntqv), &
                  prsl1=physics%statein%prsl(one:physics%model%ncols,1),tsfc_lnd=physics%sfcprop%tsfcl(one:physics%model%ncols), &
                  tsfc_ice=physics%sfcprop%tisfc(one:physics%model%ncols),tsfc_wat=physics%sfcprop%tsfco(one:physics%model%ncols), &
                  tg3=physics%sfcprop%tg3(one:physics%model%ncols),smc=physics%sfcprop%smc(one:physics%model%ncols,one:physics%model%lsoil), &
                  slc=physics%sfcprop%slc(one:physics%model%ncols,one:physics%model%lsoil), &
                  stc=physics%sfcprop%stc(one:physics%model%ncols,one:physics%model%lsoil), &
                  fice=physics%sfcprop%fice(one:physics%model%ncols),min_seaice=physics%model%min_seaice, &
                  sncovr_lnd=physics%sfcprop%sncovr(one:physics%model%ncols),sncovr_ice=physics%sfcprop%sncovr_ice(one:physics%model%ncols), &
                  snoalb=physics%sfcprop%snoalb(one:physics%model%ncols),facsf=physics%sfcprop%facsf(one:physics%model%ncols), &
                  facwf=physics%sfcprop%facwf(one:physics%model%ncols),alvsf=physics%sfcprop%alvsf(one:physics%model%ncols), &
                  alvwf=physics%sfcprop%alvwf(one:physics%model%ncols),alnsf=physics%sfcprop%alnsf(one:physics%model%ncols), &
                  alnwf=physics%sfcprop%alnwf(one:physics%model%ncols),sfcqv_lnd=sfcqv_lnd_1_ptr_array(cdata%thrd_no)%p, &
                  sfcqv_ice=sfcqv_ice_2_ptr_array(cdata%thrd_no)%p,sfalb_lnd_bck=sfalb_lnd_bck_3_ptr_array(cdata%thrd_no)%p, &
                  semisbase=physics%sfcprop%semisbase(one:physics%model%ncols),semis_lnd=physics%sfcprop%emis_lnd(one:physics%model%ncols), &
                  semis_ice=physics%sfcprop%emis_ice(one:physics%model%ncols),albdvis_lnd=physics%sfcprop%albdirvis_lnd(one:physics%model%ncols), &
                  albdnir_lnd=physics%sfcprop%albdirnir_lnd(one:physics%model%ncols),albivis_lnd=physics%sfcprop%albdifvis_lnd(one:physics%model%ncols), &
                  albinir_lnd=physics%sfcprop%albdifnir_lnd(one:physics%model%ncols),albdvis_ice=albdvis_ice_4_ptr_array(cdata%thrd_no)%p, &
                  albdnir_ice=albdnir_ice_5_ptr_array(cdata%thrd_no)%p,albivis_ice=albivis_ice_6_ptr_array(cdata%thrd_no)%p, &
                  albinir_ice=albinir_ice_7_ptr_array(cdata%thrd_no)%p,zs=physics%model%zs(one:physics%model%lsoil_lsm), &
                  sh2o=sh2o_8_ptr_array(cdata%thrd_no)%p,smfrkeep=smfrkeep_9_ptr_array(cdata%thrd_no)%p, &
                  tslb=tslb_10_ptr_array(cdata%thrd_no)%p,smois=smois_11_ptr_array(cdata%thrd_no)%p, &
                  wetness=wetness_12_ptr_array(cdata%thrd_no)%p,tsice=physics%sfcprop%tiice(one:physics%model%ncols,one:physics%model%kice), &
                  pores=physics%model%pores(one:30),resid=physics%model%resid(one:30),errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)


      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(sfcqv_lnd_1_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(sfcqv_ice_2_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(sfalb_lnd_bck_3_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albdvis_ice_4_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albdnir_ice_5_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albivis_ice_6_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albinir_ice_7_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(sh2o_8_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(smfrkeep_9_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(tslb_10_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(smois_11_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(wetness_12_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in lsm_ruc_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call clm_lake_init(con_pi=con_pi,karman=karman,con_g=con_g,con_sbc=con_sbc,con_t0c=con_t0c, &
                  rhowater=rhowater,con_csol=con_csol,con_cliq=con_cliq,con_hfus=con_hfus, &
                  con_hvap=con_hvap,con_rd=con_rd,con_eps_model=con_eps,con_fvirt_model=con_fvirt, &
                  con_cp=con_cp,rholakeice=rholakeice,clm_lake_debug=physics%model%clm_lake_debug, &
                  clm_debug_print=physics%model%clm_debug_print,errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in clm_lake_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      


      call gfs_surface_generic_post_init(vtype=physics%sfcprop%vtype(one:physics%model%ncols),stype=physics%sfcprop%stype(one:physics%model%ncols), &
                  scolor=physics%sfcprop%scolor(one:physics%model%ncols),slope=physics%sfcprop%slope(one:physics%model%ncols), &
                  vtype_save=physics%sfcprop%vtype_save(one:physics%model%ncols),stype_save=physics%sfcprop%stype_save(one:physics%model%ncols), &
                  scolor_save=physics%sfcprop%scolor_save(one:physics%model%ncols),slope_save=physics%sfcprop%slope_save(one:physics%model%ncols), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_surface_generic_post_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call rrfs_smoke_wrapper_init(seas_opt_in=physics%model%seas_opt,drydep_opt_in=physics%model%drydep_opt, &
                  pm_settling_in=physics%model%coarsepm_settling,wetdep_ls_opt_in=physics%model%wetdep_ls_opt, &
                  wetdep_ls_alpha_in=physics%model%wetdep_ls_alpha,rrfs_sd=physics%model%rrfs_sd, &
                  do_plumerise_in=physics%model%do_plumerise,plumerisefire_frq_in=physics%model%plumerisefire_frq, &
                  plume_wind_eff_in=physics%model%plume_wind_eff,add_fire_heat_flux_in=physics%model%add_fire_heat_flux, &
                  addsmoke_flag_in=physics%model%addsmoke_flag,ebb_dcycle_in=physics%model%ebb_dcycle, &
                  hwp_method_in=physics%model%hwp_method,add_fire_moist_flux_in=physics%model%add_fire_moist_flux, &
                  sc_factor_in=physics%model%sc_factor,plume_alpha_in=physics%model%plume_alpha, &
                  dust_opt_in=physics%model%dust_opt,dust_alpha_in=physics%model%dust_alpha, &
                  dust_gamma_in=physics%model%dust_gamma,dust_moist_opt_in=physics%model%dust_moist_opt, &
                  dust_moist_correction_in=physics%model%dust_moist_correction,dust_drylimit_factor_in=physics%model%dust_drylimit_factor, &
                  aero_ind_fdb_in=physics%model%aero_ind_fdb,extended_sd_diags_in=physics%model%extended_sd_diags, &
                  dbg_opt_in=physics%model%rrfs_smoke_debug,errmsg=cdata%errmsg,errflg=cdata%errflg, &
                  n_dbg_lines_in=physics%model%n_dbg_lines)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrfs_smoke_wrapper_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call mynnedmf_wrapper_init(con_cp=con_cp,con_grav=con_g,con_rd=con_rd,con_rv=con_rv,con_cpv=con_cvap, &
                  con_cliq=con_cliq,con_cice=con_csol,con_rcp=con_rocp,con_xlv=con_hvap,con_xlf=con_hfus, &
                  con_p608=con_fvirt,con_ep2=con_eps,con_karman=karman,con_t0c=con_t0c,do_mynnedmf=physics%model%do_mynnedmf, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in mynnedmf_wrapper_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call drag_suite_init(gwd_opt=physics%model%gwd_opt,errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in drag_suite_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized(cdata%ccpp_instance) = .true.


   end function scm_hrrr_gf_phys_ps_init_cap

   function scm_hrrr_gf_phys_ps_run_cap(one,physics,cdata,con_fvirt,con_g,con_tice,con_cp,con_pi,con_sbc,con_hvap, &
                  con_rd,con_rv,con_hfus,con_eps,con_epsm1,con_rocp,karman) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t
      use machine, only: kind_phys

      implicit none

      ! Error handling
      integer :: ierr

      integer, intent(in), target :: one
      type(physics_type), intent(inout), target :: physics
      type(ccpp_t), intent(inout), target :: cdata
      real(kind_phys), intent(in), target :: con_fvirt
      real(kind_phys), intent(in), target :: con_g
      real(kind_phys), intent(in), target :: con_tice
      real(kind_phys), intent(in), target :: con_cp
      real(kind_phys), intent(in), target :: con_pi
      real(kind_phys), intent(in), target :: con_sbc
      real(kind_phys), intent(in), target :: con_hvap
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: con_rv
      real(kind_phys), intent(in), target :: con_hfus
      real(kind_phys), intent(in), target :: con_eps
      real(kind_phys), intent(in), target :: con_epsm1
      real(kind_phys), intent(in), target :: con_rocp
      real(kind_phys), intent(in), target :: karman
      
      ! Local variables/pointers for unit conversions, array transformations, ...
      type :: real_kind_phys_rank2_ptr_arr_type
         real(kind_phys), dimension(:,:), pointer :: p => null()
      end type real_kind_phys_rank2_ptr_arr_type
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sfc_wts_1_ptr_array
      type :: character_len3_r1_ptr_arr_type
         character(len=3), dimension(:), pointer :: p => null()
      end type character_len3_r1_ptr_arr_type
      type(character_len3_r1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lndp_var_list_2_ptr_array
      type :: real_kind_phys_rank1_ptr_arr_type
         real(kind_phys), dimension(:), pointer :: p => null()
      end type real_kind_phys_rank1_ptr_arr_type
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lndp_prt_list_3_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: slimskin_cpl_4_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cnvwind_5_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: mask_dat_6_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tsfco_dat_7_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tice_dat_8_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: hice_dat_9_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fice_dat_10_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sfculw_med_11_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxlwup_jac_12_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: flux2d_lwup_13_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: flux2d_lwdown_14_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tsfc_radtime_15_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtdtnp_16_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: htrlw_17_ptr_array
      type :: real_kind_phys_rank3_ptr_arr_type
         real(kind_phys), dimension(:,:,:), pointer :: p => null()
      end type real_kind_phys_rank3_ptr_arr_type
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtend_18_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ulwsfc_cice_19_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qsfc_lnd_ruc_20_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qsfc_ice_ruc_21_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ustm_22_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: zol_23_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: mol_24_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lh_25_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: chs2_26_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cqs2_27_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: spp_wts_sfc_28_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: laixy_29_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rainnc_30_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rainc_31_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ice_32_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snow_33_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: graupel_34_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sfalb_lnd_bck_35_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sfalb_lnd_36_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sfalb_ice_37_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smois_38_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tslb_39_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sh2o_40_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: keepfr_41_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smfrkeep_42_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tsnow_lnd_43_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sfcqc_lnd_44_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wetness_45_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snowfallac_lnd_46_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: acsnow_lnd_47_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sfcqc_ice_48_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tsnow_ice_49_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snowfallac_ice_50_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: acsnow_ice_51_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albdvis_ice_52_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albdnir_ice_53_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albivis_ice_54_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albinir_ice_55_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rhosnf_56_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fire_heat_flux_out_57_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: frac_grid_burned_out_58_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: clm_lake_initialized_59_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: input_lakedepth_60_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lake_t_snow_61_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albedo_62_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lake_t2m_63_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lake_q2m_64_ptr_array
      type :: integer_default_kind_rank1_ptr_arr_type
         integer, dimension(:), pointer :: p => null()
      end type integer_default_kind_rank1_ptr_arr_type
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: salty_65_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cannot_freeze_66_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: savedtke12d_67_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snowdp2d_68_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: h2osno2d_69_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snl2d_70_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: t_grnd2d_71_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: t_lake3d_72_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lake_icefrac3d_73_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: t_soisno3d_74_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: h2osoi_ice3d_75_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: h2osoi_liq3d_76_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: h2osoi_vol3d_77_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: z3d_78_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dz3d_79_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: zi3d_80_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: clm_lakedepth_81_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: hflx_fire_82_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: evap_fire_83_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: t2mmp_84_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: q2mp_85_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: pahi_86_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dlwsfci_cpl_87_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dswsfci_cpl_88_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dlwsfc_cpl_89_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dswsfc_cpl_90_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnirbmi_cpl_91_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnirdfi_cpl_92_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvisbmi_cpl_93_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvisdfi_cpl_94_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnirbm_cpl_95_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnirdf_cpl_96_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvisbm_cpl_97_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvisdf_cpl_98_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nlwsfci_cpl_99_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nlwsfc_cpl_100_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: t2mi_cpl_101_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: q2mi_cpl_102_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: u10mi_cpl_103_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: v10mi_cpl_104_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tsfci_cpl_105_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: psurfi_cpl_106_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nnirbmi_cpl_107_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nnirdfi_cpl_108_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nvisbmi_cpl_109_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nvisdfi_cpl_110_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nswsfci_cpl_111_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nswsfc_cpl_112_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nnirbm_cpl_113_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nnirdf_cpl_114_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nvisbm_cpl_115_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nvisdf_cpl_116_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: paha_117_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: waxy_118_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: twa_119_ptr_array
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dust12m_in_120_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: emi_ant_in_121_ptr_array
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smoke_rrfs_122_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smoke2d_rrfs_123_ptr_array
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: chem3d_124_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nwfa_125_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nifa_126_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: emanoc_127_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: emdust_128_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: emseas_129_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ebb_smoke_in_130_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: frp_output_131_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: coef_bb_132_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fire_type_out_133_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ebu_smoke_134_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fhist_135_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: min_fplume_136_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: max_fplume_137_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rho_dry_138_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: uspdavg_139_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: hpbl_thetav_140_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: drydep_flux_out_141_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wetdpr_142_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: hwp_143_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: hwp_ave_144_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddvel_inout_145_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: peak_hr_out_146_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lu_nofire_out_147_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lu_qfire_out_148_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smoke_fire_149_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qgrs_cloud_droplet_num_conc_150_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qgrs_cccn_151_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_cice_152_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_cice_153_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfc_cice_154_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfc_cice_155_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfci_cpl_156_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfci_cpl_157_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfci_cpl_158_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfci_cpl_159_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_cpl_160_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_cpl_161_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfc_cpl_162_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfc_cpl_163_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qke_164_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qke_adv_165_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tsq_166_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qsq_167_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cov_168_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: el_pbl_169_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sh3d_170_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sm3d_171_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: exch_h_172_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: exch_m_173_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqke_174_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qwt_175_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qshear_176_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qbuoy_177_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qdiss_178_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qc_bl_179_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qi_bl_180_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cldfra_bl_181_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: edmf_a_182_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: edmf_w_183_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: edmf_qt_184_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: edmf_thl_185_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: edmf_ent_186_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: edmf_qc_187_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sub_thl_188_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sub_sqv_189_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: det_thl_190_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: det_sqv_191_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: maxwidth_192_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: maxmf_193_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ztop_plume_194_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ktop_plume_195_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_snow_196_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_ozone_197_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_cloud_droplet_num_conc_198_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_ice_num_conc_199_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_water_aer_num_conc_200_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_ice_aer_num_conc_201_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_cccn_202_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: spp_wts_pbl_203_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: varss_204_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ocss_205_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: oa4ss_206_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: clxss_207_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtauy2d_ms_208_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtaux2d_bl_209_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtauy2d_bl_210_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtaux2d_ss_211_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtauy2d_ss_212_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtaux2d_fd_213_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtauy2d_fd_214_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_ms_215_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_ms_216_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_bl_217_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_bl_218_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_ss_219_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_ss_220_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_fd_221_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_fd_222_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: spp_wts_gwd_223_ptr_array

      ierr = 0


      if (.not.initialized(cdata%ccpp_instance)) then
        write(cdata%errmsg,'(*(a))') 'phys_ps_run called before phys_ps_init'
        cdata%errflg = 1
        return
      end if



      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      


      call get_prs_fv3_run(ix=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,con_fvirt=con_fvirt, &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  tgrs=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  qgrs1=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  del=physics%interstitial(cdata%thrd_no)%del(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  del_gz=physics%interstitial(cdata%thrd_no)%del_gz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in get_prs_fv3_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call gfs_suite_interstitial_1_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,ntrac=physics%model%ntrac, &
                  dtf=physics%model%dtf,dtp=physics%model%dtp,slmsk=physics%sfcprop%slmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  area=physics%grid%area(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dxmin=physics%model%dxmin,dxinv=physics%model%dxinv,pgr=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  islmsk=physics%interstitial(cdata%thrd_no)%islmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  work1=physics%interstitial(cdata%thrd_no)%work1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  work2=physics%interstitial(cdata%thrd_no)%work2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  psurf=physics%diag%psurf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dudt=physics%interstitial(cdata%thrd_no)%dudt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt=physics%interstitial(cdata%thrd_no)%dvdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtdt=physics%interstitial(cdata%thrd_no)%dtdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dqdt=physics%interstitial(cdata%thrd_no)%dqdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_suite_interstitial_1_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lndp_type /= 0)) then
        sfc_wts_1_ptr_array(cdata%thrd_no)%p => physics%coupling%sfc_wts(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%n_var_lndp)
      end if

      if ((physics%model%lndp_type /= 0)) then
        lndp_var_list_2_ptr_array(cdata%thrd_no)%p => physics%model%lndp_var_list(:)
      end if

      if ((physics%model%lndp_type /= 0)) then
        lndp_prt_list_3_ptr_array(cdata%thrd_no)%p => physics%model%lndp_prt_list(one:physics%model%n_var_lndp)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        slimskin_cpl_4_ptr_array(cdata%thrd_no)%p => physics%coupling%slimskin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%ncnvwind > 0)) then
        cnvwind_5_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f2d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),physics%model%ncnvwind)
      end if

      call gfs_surface_generic_pre_run(nthreads=physics%model%nthreads,im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs, &
                  vfrac=physics%sfcprop%vfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  islmsk=physics%interstitial(cdata%thrd_no)%islmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  isot=physics%model%isot,ivegsrc=physics%model%ivegsrc,stype=physics%sfcprop%stype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  scolor=physics%sfcprop%scolor(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vtype=physics%sfcprop%vtype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slope=physics%sfcprop%slope(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vtype_save=physics%sfcprop%vtype_save(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stype_save=physics%sfcprop%stype_save(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  scolor_save=physics%sfcprop%scolor_save(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slope_save=physics%sfcprop%slope_save(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsik_1=physics%statein%prsik(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  prslk_1=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  tsfc=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  phil=physics%statein%phil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  con_g=con_g,sigmaf=physics%interstitial(cdata%thrd_no)%sigmaf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  work3=physics%interstitial(cdata%thrd_no)%work3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zlvl=physics%diag%zlvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lndp_type=physics%model%lndp_type,n_var_lndp=physics%model%n_var_lndp,sfc_wts=sfc_wts_1_ptr_array(cdata%thrd_no)%p, &
                  lndp_var_list=lndp_var_list_2_ptr_array(cdata%thrd_no)%p,lndp_prt_list=lndp_prt_list_3_ptr_array(cdata%thrd_no)%p, &
                  z01d=physics%interstitial(cdata%thrd_no)%z01d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zt1d=physics%interstitial(cdata%thrd_no)%zt1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  bexp1d=physics%interstitial(cdata%thrd_no)%bexp1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlai1d=physics%interstitial(cdata%thrd_no)%xlai1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vegf1d=physics%interstitial(cdata%thrd_no)%vegf1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lndp_vgf=physics%interstitial(cdata%thrd_no)%lndp_vgf,cplflx=physics%model%cplflx, &
                  flag_cice=physics%interstitial(cdata%thrd_no)%flag_cice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  islmsk_cice=physics%interstitial(cdata%thrd_no)%islmsk_cice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slimskin_cpl=slimskin_cpl_4_ptr_array(cdata%thrd_no)%p,wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u1=physics%statein%ugrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  v1=physics%statein%vgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  cnvwind=cnvwind_5_ptr_array(cdata%thrd_no)%p,smcwlt2=physics%diag%smcwlt2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  smcref2=physics%diag%smcref2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lndp_type /= 0)) then
        nullify(sfc_wts_1_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lndp_type /= 0)) then
        nullify(lndp_var_list_2_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lndp_type /= 0)) then
        nullify(lndp_prt_list_3_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(slimskin_cpl_4_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ncnvwind > 0)) then
        nullify(cnvwind_5_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_surface_generic_pre_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%use_cdeps_inline)) then
        mask_dat_6_ptr_array(cdata%thrd_no)%p => physics%coupling%mask_dat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%use_cdeps_inline)) then
        tsfco_dat_7_ptr_array(cdata%thrd_no)%p => physics%coupling%tsfco_dat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%use_cdeps_inline)) then
        tice_dat_8_ptr_array(cdata%thrd_no)%p => physics%coupling%tice_dat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%use_cdeps_inline)) then
        hice_dat_9_ptr_array(cdata%thrd_no)%p => physics%coupling%hice_dat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%use_cdeps_inline)) then
        fice_dat_10_ptr_array(cdata%thrd_no)%p => physics%coupling%fice_dat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call gfs_surface_composites_pre_run(im=physics%model%blksz(cdata%blk_no),lkm=physics%model%lkm,frac_grid=physics%model%frac_grid, &
                  flag_cice=physics%interstitial(cdata%thrd_no)%flag_cice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cplflx=physics%model%cplflx,cplice=physics%model%cplice,cplwav2atm=physics%model%cplwav2atm, &
                  lsm=physics%model%lsm,lsm_ruc=physics%model%lsm_ruc,use_cdeps_data=physics%model%use_cdeps_inline, &
                  mask_dat=mask_dat_6_ptr_array(cdata%thrd_no)%p,tsfco_dat=tsfco_dat_7_ptr_array(cdata%thrd_no)%p, &
                  tice_dat=tice_dat_8_ptr_array(cdata%thrd_no)%p,hice_dat=hice_dat_9_ptr_array(cdata%thrd_no)%p, &
                  fice_dat=fice_dat_10_ptr_array(cdata%thrd_no)%p,landfrac=physics%sfcprop%landfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lakefrac=physics%sfcprop%lakefrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lakedepth=physics%sfcprop%lakedepth(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oceanfrac=physics%sfcprop%oceanfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  frland=physics%interstitial(cdata%thrd_no)%frland(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lake=physics%interstitial(cdata%thrd_no)%lake(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_lake_model=physics%sfcprop%use_lake_model(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  iopt_lake=physics%model%iopt_lake,iopt_lake_clm=physics%model%iopt_lake_clm, &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hice=physics%sfcprop%hice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cice=physics%sfcprop%fice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorlo=physics%sfcprop%zorlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorll=physics%sfcprop%zorll(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorli=physics%sfcprop%zorli(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowd=physics%sfcprop%snowd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowd_lnd=physics%sfcprop%snodl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowd_ice=physics%sfcprop%snodi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tgrs1=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  tprcp=physics%sfcprop%tprcp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tprcp_wat=physics%interstitial(cdata%thrd_no)%tprcp_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tprcp_lnd=physics%interstitial(cdata%thrd_no)%tprcp_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tprcp_ice=physics%interstitial(cdata%thrd_no)%tprcp_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  uustar=physics%sfcprop%uustar(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  uustar_wat=physics%interstitial(cdata%thrd_no)%uustar_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  uustar_lnd=physics%interstitial(cdata%thrd_no)%uustar_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  uustar_ice=physics%interstitial(cdata%thrd_no)%uustar_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  weasd=physics%sfcprop%weasd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  weasd_lnd=physics%sfcprop%weasdl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  weasd_ice=physics%sfcprop%weasdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ep1d_ice=physics%interstitial(cdata%thrd_no)%ep1d_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfco=physics%sfcprop%tsfco(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfcl=physics%sfcprop%tsfcl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc_wat=physics%interstitial(cdata%thrd_no)%tsfc_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tisfc=physics%sfcprop%tisfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_wat=physics%interstitial(cdata%thrd_no)%tsurf_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_lnd=physics%interstitial(cdata%thrd_no)%tsurf_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_ice=physics%interstitial(cdata%thrd_no)%tsurf_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gflx_ice=physics%interstitial(cdata%thrd_no)%gflx_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tgice=con_tice,islmsk=physics%interstitial(cdata%thrd_no)%islmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  islmsk_cice=physics%interstitial(cdata%thrd_no)%islmsk_cice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slmsk=physics%sfcprop%slmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qss=physics%sfcprop%qss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qss_wat=physics%interstitial(cdata%thrd_no)%qss_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qss_lnd=physics%interstitial(cdata%thrd_no)%qss_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qss_ice=physics%interstitial(cdata%thrd_no)%qss_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  min_lakeice=physics%model%min_lakeice,min_seaice=physics%model%min_seaice, &
                  kdt=physics%model%kdt,huge=physics%model%huge,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%use_cdeps_inline)) then
        nullify(mask_dat_6_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%use_cdeps_inline)) then
        nullify(tsfco_dat_7_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%use_cdeps_inline)) then
        nullify(tice_dat_8_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%use_cdeps_inline)) then
        nullify(hice_dat_9_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%use_cdeps_inline)) then
        nullify(fice_dat_10_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_surface_composites_pre_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        sfculw_med_11_ptr_array(cdata%thrd_no)%p => physics%coupling%ulwsfcin_med(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_rrtmgp .and. physics%model%use_lw_jacobian)) then
        fluxlwup_jac_12_ptr_array(cdata%thrd_no)%p => physics%coupling%fluxlwup_jac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        flux2d_lwup_13_ptr_array(cdata%thrd_no)%p => physics%coupling%fluxlwup_radtime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        flux2d_lwdown_14_ptr_array(cdata%thrd_no)%p => physics%coupling%fluxlwdown_radtime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        tsfc_radtime_15_ptr_array(cdata%thrd_no)%p => physics%coupling%tsfc_radtime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_sppt .or. physics%model%ca_global)) then
        dtdtnp_16_ptr_array(cdata%thrd_no)%p => physics%tbd%dtdtnp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        htrlw_17_ptr_array(cdata%thrd_no)%p => physics%coupling%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_18_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      call dcyc2t3_run(lssav=physics%model%lssav,ldiag3d=physics%model%ldiag3d,lsidea=physics%model%lsidea, &
                  solhr=physics%model%solhr,slag=physics%model%slag,sdec=physics%model%sdec, &
                  cdec=physics%model%cdec,sinlat=physics%grid%sinlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  coslat=physics%grid%coslat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  con_g=con_g,con_cp=con_cp,con_pi=con_pi,con_sbc=con_sbc,xlon=physics%grid%xlon(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  coszen=physics%radtend%coszen(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc_lnd=physics%sfcprop%tsfcl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc_ice=physics%sfcprop%tisfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc_wat=physics%interstitial(cdata%thrd_no)%tsfc_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tf=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  tsflw=physics%radtend%tsflw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcemis_lnd=physics%sfcprop%emis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcemis_ice=physics%sfcprop%emis_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcemis_wat=physics%sfcprop%emis_wat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcdsw=physics%coupling%sfcdsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcnsw=physics%coupling%sfcnsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcdswc=physics%coupling%sfcdswc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcdlw=physics%coupling%sfcdlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  swh=physics%radtend%htrsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  swhc=physics%radtend%swhc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  hlw=physics%radtend%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  hlwc=physics%radtend%lwhc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  sfcnirbmu=physics%coupling%nirbmui(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcnirdfu=physics%coupling%nirdfui(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcvisbmu=physics%coupling%visbmui(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcvisdfu=physics%coupling%visdfui(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcnirbmd=physics%coupling%nirbmdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcnirdfd=physics%coupling%nirdfdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcvisbmd=physics%coupling%visbmdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcvisdfd=physics%coupling%visdfdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,ntrac=physics%model%ntrac, &
                  deltim=physics%model%dtf,delt=physics%model%dtp,tend_opt_rad_scaler=physics%model%tend_opt_rad_scaler, &
                  fhswr=physics%model%fhswr,dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  damp_lw_fluxadj=physics%model%damp_lw_fluxadj,lfnc_k=physics%model%lfnc_k, &
                  lfnc_p0=physics%model%lfnc_p0,use_lw_jacobian=physics%model%use_lw_jacobian, &
                  sfculw=physics%coupling%sfculw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_med_flux=physics%model%use_med_flux,sfculw_med=sfculw_med_11_ptr_array(cdata%thrd_no)%p, &
                  fluxlwup_jac=fluxlwup_jac_12_ptr_array(cdata%thrd_no)%p,p_lay=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  p_lev=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  flux2d_lwup=flux2d_lwup_13_ptr_array(cdata%thrd_no)%p,flux2d_lwdown=flux2d_lwdown_14_ptr_array(cdata%thrd_no)%p, &
                  pert_radtend=physics%model%pert_radtend,do_sppt=physics%model%do_sppt,ca_global=physics%model%ca_global, &
                  tsfc_radtime=tsfc_radtime_15_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_process_longwave=physics%model%index_of_process_longwave,index_of_process_shortwave=physics%model%index_of_process_shortwave, &
                  index_of_temperature=physics%model%index_of_temperature,dtdtnp=dtdtnp_16_ptr_array(cdata%thrd_no)%p, &
                  htrlw=htrlw_17_ptr_array(cdata%thrd_no)%p,dtend=dtend_18_ptr_array(cdata%thrd_no)%p, &
                  adjsfcdsw=physics%diag%dswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfcdswc=physics%diag%dswsfcci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfcnsw=physics%diag%nswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfcdlw=physics%diag%dlwsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfculw_lnd=physics%interstitial(cdata%thrd_no)%adjsfculw_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfculw_ice=physics%interstitial(cdata%thrd_no)%adjsfculw_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfculw_wat=physics%interstitial(cdata%thrd_no)%adjsfculw_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xmu=physics%interstitial(cdata%thrd_no)%xmu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xcosz=physics%interstitial(cdata%thrd_no)%xcosz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjnirbmu=physics%interstitial(cdata%thrd_no)%adjnirbmu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjnirdfu=physics%interstitial(cdata%thrd_no)%adjnirdfu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjvisbmu=physics%interstitial(cdata%thrd_no)%adjvisbmu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjvisdfu=physics%interstitial(cdata%thrd_no)%adjvisdfu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjnirbmd=physics%interstitial(cdata%thrd_no)%adjnirbmd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjnirdfd=physics%interstitial(cdata%thrd_no)%adjnirdfd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjvisbmd=physics%interstitial(cdata%thrd_no)%adjvisbmd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjvisdfd=physics%interstitial(cdata%thrd_no)%adjvisdfd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gu0=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gv0=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gt0=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dudt=physics%interstitial(cdata%thrd_no)%dudt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt=physics%interstitial(cdata%thrd_no)%dvdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtdt=physics%interstitial(cdata%thrd_no)%dtdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dqdt=physics%interstitial(cdata%thrd_no)%dqdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        nullify(sfculw_med_11_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp .and. physics%model%use_lw_jacobian)) then
        nullify(fluxlwup_jac_12_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(flux2d_lwup_13_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(flux2d_lwdown_14_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(tsfc_radtime_15_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_sppt .or. physics%model%ca_global)) then
        nullify(dtdtnp_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(htrlw_17_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_18_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in dcyc2t3_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call gfs_surface_composites_inter_run(im=physics%model%blksz(cdata%blk_no),dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  semis_wat=physics%sfcprop%emis_wat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  semis_lnd=physics%sfcprop%emis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  semis_ice=physics%sfcprop%emis_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfcdlw=physics%diag%dlwsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gabsbdlw_lnd=physics%interstitial(cdata%thrd_no)%gabsbdlw_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gabsbdlw_ice=physics%interstitial(cdata%thrd_no)%gabsbdlw_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gabsbdlw_wat=physics%interstitial(cdata%thrd_no)%gabsbdlw_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfcusw=physics%diag%uswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfcdsw=physics%diag%dswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfcnsw=physics%diag%nswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_surface_composites_inter_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        ulwsfc_cice_19_ptr_array(cdata%thrd_no)%p => physics%coupling%ulwsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_rrtmgp)) then
        htrlw_17_ptr_array(cdata%thrd_no)%p => physics%coupling%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_18_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      call gfs_suite_interstitial_2_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,lssav=physics%model%lssav, &
                  ldiag3d=physics%model%ldiag3d,lsidea=physics%model%lsidea,flag_cice=physics%interstitial(cdata%thrd_no)%flag_cice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  shal_cnv=physics%model%shal_cnv,old_monin=physics%model%old_monin,mstrat=physics%model%mstrat, &
                  do_shoc=physics%model%do_shoc,frac_grid=physics%model%frac_grid,imfshalcnv=physics%model%imfshalcnv, &
                  dtf=physics%model%dtf,xcosz=physics%interstitial(cdata%thrd_no)%xcosz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfcdsw=physics%diag%dswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfcdlw=physics%diag%dlwsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cice=physics%sfcprop%fice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  pgr=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ulwsfc_cice=ulwsfc_cice_19_ptr_array(cdata%thrd_no)%p,lwhd=physics%radtend%lwhd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:6), &
                  htrsw=physics%radtend%htrsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  htrlw=physics%radtend%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  xmu=physics%interstitial(cdata%thrd_no)%xmu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ctei_rm=physics%model%ctei_rm(one:2),work1=physics%interstitial(cdata%thrd_no)%work1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  work2=physics%interstitial(cdata%thrd_no)%work2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  tgrs=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  qgrs_water_vapor=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  qgrs_cloud_water=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntcw), &
                  cp=con_cp,hvap=con_hvap,prslk=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  suntim=physics%diag%suntim(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_lw_jacobian=physics%model%use_lw_jacobian,htrlwu=htrlw_17_ptr_array(cdata%thrd_no)%p, &
                  adjsfculw=physics%diag%ulwsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfculw_lnd=physics%interstitial(cdata%thrd_no)%adjsfculw_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfculw_ice=physics%interstitial(cdata%thrd_no)%adjsfculw_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfculw_wat=physics%interstitial(cdata%thrd_no)%adjsfculw_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dlwsfc=physics%diag%dlwsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ulwsfc=physics%diag%ulwsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  psmean=physics%diag%psmean(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtend=dtend_18_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_process_longwave=physics%model%index_of_process_longwave,index_of_process_shortwave=physics%model%index_of_process_shortwave, &
                  index_of_process_pbl=physics%model%index_of_process_pbl,index_of_process_dcnv=physics%model%index_of_process_dcnv, &
                  index_of_process_scnv=physics%model%index_of_process_scnv,index_of_process_mp=physics%model%index_of_process_mp, &
                  index_of_temperature=physics%model%index_of_temperature,ctei_rml=physics%interstitial(cdata%thrd_no)%ctei_rml(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ctei_r=physics%interstitial(cdata%thrd_no)%ctei_r(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kinver=physics%interstitial(cdata%thrd_no)%kinver(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  frland=physics%interstitial(cdata%thrd_no)%frland(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  huge=physics%model%huge,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(ulwsfc_cice_19_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(htrlw_17_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_18_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_suite_interstitial_2_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 2

      associate(cnt => cdata%loop_cnt)
      do cnt=1,2


      

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        qsfc_lnd_ruc_20_ptr_array(cdata%thrd_no)%p => physics%sfcprop%qwv_surf_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        qsfc_ice_ruc_21_ptr_array(cdata%thrd_no)%p => physics%sfcprop%qwv_surf_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnsfclay)) then
        ustm_22_ptr_array(cdata%thrd_no)%p => physics%sfcprop%ustm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnsfclay)) then
        zol_23_ptr_array(cdata%thrd_no)%p => physics%sfcprop%zol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnsfclay)) then
        mol_24_ptr_array(cdata%thrd_no)%p => physics%sfcprop%mol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnsfclay)) then
        lh_25_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lh(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%ncnvwind > 0)) then
        cnvwind_5_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f2d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),physics%model%ncnvwind)
      end if

      if ((physics%model%do_mynnsfclay)) then
        chs2_26_ptr_array(cdata%thrd_no)%p => physics%sfcprop%chs2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnsfclay)) then
        cqs2_27_ptr_array(cdata%thrd_no)%p => physics%sfcprop%cqs2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_spp)) then
        spp_wts_sfc_28_ptr_array(cdata%thrd_no)%p => physics%coupling%spp_wts_sfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call module_sf_mynnsfc_driver_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,itimestep=physics%model%kdt, &
                  iter=cdata%loop_cnt,flag_iter=physics%interstitial(cdata%thrd_no)%flag_iter(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_init=physics%model%first_time_step,flag_restart=physics%model%restart, &
                  lsm=physics%model%lsm,lsm_ruc=physics%model%lsm_ruc,sigmaf=physics%interstitial(cdata%thrd_no)%sigmaf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vegtype=physics%sfcprop%vtype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  shdmax=physics%sfcprop%shdmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ivegsrc=physics%model%ivegsrc,z0pert=physics%interstitial(cdata%thrd_no)%z01d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ztpert=physics%interstitial(cdata%thrd_no)%zt1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  redrag=physics%model%redrag,sfc_z0_type=physics%model%sfc_z0_type,isftcflx=physics%model%isftcflx, &
                  iz0tlnd=physics%model%iz0tlnd,sfclay_compute_flux=physics%model%sfclay_compute_flux, &
                  sfclay_compute_diag=physics%model%sfclay_compute_diag,delt=physics%model%dtp, &
                  dx=physics%grid%dx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u=physics%statein%ugrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  v=physics%statein%vgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  t3d=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  qvsh=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  qc=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntcw), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  exner=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ps=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  pblh=physics%tbd%hpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slmsk=physics%sfcprop%slmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tskin_wat=physics%interstitial(cdata%thrd_no)%tsfc_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tskin_lnd=physics%sfcprop%tsfcl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tskin_ice=physics%sfcprop%tisfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_wat=physics%interstitial(cdata%thrd_no)%tsurf_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_lnd=physics%interstitial(cdata%thrd_no)%tsurf_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_ice=physics%interstitial(cdata%thrd_no)%tsurf_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qsfc_wat=physics%interstitial(cdata%thrd_no)%qss_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qsfc_lnd=physics%interstitial(cdata%thrd_no)%qss_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qsfc_ice=physics%interstitial(cdata%thrd_no)%qss_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowh_lnd=physics%sfcprop%snodl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowh_ice=physics%sfcprop%snodi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  znt_wat=physics%sfcprop%zorlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  znt_lnd=physics%sfcprop%zorll(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  znt_ice=physics%sfcprop%zorli(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ust_wat=physics%interstitial(cdata%thrd_no)%uustar_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ust_lnd=physics%interstitial(cdata%thrd_no)%uustar_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ust_ice=physics%interstitial(cdata%thrd_no)%uustar_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cm_wat=physics%interstitial(cdata%thrd_no)%cd_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cm_lnd=physics%interstitial(cdata%thrd_no)%cd_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cm_ice=physics%interstitial(cdata%thrd_no)%cd_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ch_wat=physics%interstitial(cdata%thrd_no)%cdq_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ch_lnd=physics%interstitial(cdata%thrd_no)%cdq_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ch_ice=physics%interstitial(cdata%thrd_no)%cdq_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rb_wat=physics%interstitial(cdata%thrd_no)%rb_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rb_lnd=physics%interstitial(cdata%thrd_no)%rb_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rb_ice=physics%interstitial(cdata%thrd_no)%rb_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress_wat=physics%interstitial(cdata%thrd_no)%stress_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress_lnd=physics%interstitial(cdata%thrd_no)%stress_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress_ice=physics%interstitial(cdata%thrd_no)%stress_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm_wat=physics%interstitial(cdata%thrd_no)%ffmm_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm_lnd=physics%interstitial(cdata%thrd_no)%ffmm_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm_ice=physics%interstitial(cdata%thrd_no)%ffmm_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh_wat=physics%interstitial(cdata%thrd_no)%ffhh_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh_lnd=physics%interstitial(cdata%thrd_no)%ffhh_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh_ice=physics%interstitial(cdata%thrd_no)%ffhh_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm10_wat=physics%interstitial(cdata%thrd_no)%fm10_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm10_lnd=physics%interstitial(cdata%thrd_no)%fm10_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm10_ice=physics%interstitial(cdata%thrd_no)%fm10_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh2_wat=physics%interstitial(cdata%thrd_no)%fh2_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh2_lnd=physics%interstitial(cdata%thrd_no)%fh2_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh2_ice=physics%interstitial(cdata%thrd_no)%fh2_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx_wat=physics%interstitial(cdata%thrd_no)%hflx_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx_lnd=physics%interstitial(cdata%thrd_no)%hflx_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx_ice=physics%interstitial(cdata%thrd_no)%hflx_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qflx_wat=physics%interstitial(cdata%thrd_no)%evap_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qflx_lnd=physics%interstitial(cdata%thrd_no)%evap_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qflx_ice=physics%interstitial(cdata%thrd_no)%evap_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qsfc=physics%sfcprop%qss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qsfc_lnd_ruc=qsfc_lnd_ruc_20_ptr_array(cdata%thrd_no)%p,qsfc_ice_ruc=qsfc_ice_ruc_21_ptr_array(cdata%thrd_no)%p, &
                  ustm=ustm_22_ptr_array(cdata%thrd_no)%p,zol=zol_23_ptr_array(cdata%thrd_no)%p, &
                  mol=mol_24_ptr_array(cdata%thrd_no)%p,rmol=physics%sfcprop%rmol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wspd=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ch=physics%diag%cmm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx=physics%sfcprop%hflx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qflx=physics%sfcprop%evap(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lh=lh_25_ptr_array(cdata%thrd_no)%p,flhc=physics%sfcprop%flhc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flqc=physics%sfcprop%flqc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u10=physics%diag%u10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10=physics%diag%v10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  th2=physics%sfcprop%th2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t2=physics%sfcprop%t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  q2=physics%sfcprop%q2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wstar=cnvwind_5_ptr_array(cdata%thrd_no)%p,chs2=chs2_26_ptr_array(cdata%thrd_no)%p, &
                  cqs2=cqs2_27_ptr_array(cdata%thrd_no)%p,spp_wts_sfc=spp_wts_sfc_28_ptr_array(cdata%thrd_no)%p, &
                  spp_sfc=physics%model%spp_sfc,lprnt=physics%model%lprnt,errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)


      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(qsfc_lnd_ruc_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(qsfc_ice_ruc_21_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnsfclay)) then
        nullify(ustm_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnsfclay)) then
        nullify(zol_23_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnsfclay)) then
        nullify(mol_24_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnsfclay)) then
        nullify(lh_25_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ncnvwind > 0)) then
        nullify(cnvwind_5_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnsfclay)) then
        nullify(chs2_26_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnsfclay)) then
        nullify(cqs2_27_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_spp)) then
        nullify(spp_wts_sfc_28_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in module_sf_mynnsfc_driver_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call gfs_surface_loop_control_part1_run(im=physics%model%blksz(cdata%blk_no),iter=cdata%loop_cnt,wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_guess=physics%interstitial(cdata%thrd_no)%flag_guess(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_surface_loop_control_part1_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%use_cdeps_inline)) then
        mask_dat_6_ptr_array(cdata%thrd_no)%p => physics%coupling%mask_dat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noah .or. physics%model%lsm == physics%model%lsm_noahmp .or. physics%model%lsm == physics%model%lsm_ruc)) then
        laixy_29_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xlaixy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        rainnc_30_ptr_array(cdata%thrd_no)%p => physics%sfcprop%rainncprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        rainc_31_ptr_array(cdata%thrd_no)%p => physics%sfcprop%raincprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        ice_32_ptr_array(cdata%thrd_no)%p => physics%sfcprop%iceprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        snow_33_ptr_array(cdata%thrd_no)%p => physics%sfcprop%snowprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        graupel_34_ptr_array(cdata%thrd_no)%p => physics%sfcprop%graupelprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        sfalb_lnd_bck_35_ptr_array(cdata%thrd_no)%p => physics%sfcprop%sfalb_lnd_bck(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        sfalb_lnd_36_ptr_array(cdata%thrd_no)%p => physics%sfcprop%sfalb_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        sfalb_ice_37_ptr_array(cdata%thrd_no)%p => physics%sfcprop%sfalb_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        smois_38_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smois(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        tslb_39_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tslb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        sh2o_40_ptr_array(cdata%thrd_no)%p => physics%sfcprop%sh2o(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        keepfr_41_ptr_array(cdata%thrd_no)%p => physics%sfcprop%flag_frsoil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        smfrkeep_42_ptr_array(cdata%thrd_no)%p => physics%sfcprop%keepsmfr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        tsnow_lnd_43_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tsnow_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        sfcqc_lnd_44_ptr_array(cdata%thrd_no)%p => physics%sfcprop%clw_surf_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        qsfc_lnd_ruc_20_ptr_array(cdata%thrd_no)%p => physics%sfcprop%qwv_surf_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        wetness_45_ptr_array(cdata%thrd_no)%p => physics%sfcprop%wetness(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        snowfallac_lnd_46_ptr_array(cdata%thrd_no)%p => physics%sfcprop%snowfallac_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        acsnow_lnd_47_ptr_array(cdata%thrd_no)%p => physics%sfcprop%acsnow_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        sfcqc_ice_48_ptr_array(cdata%thrd_no)%p => physics%sfcprop%clw_surf_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        qsfc_ice_ruc_21_ptr_array(cdata%thrd_no)%p => physics%sfcprop%qwv_surf_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        tsnow_ice_49_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tsnow_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        snowfallac_ice_50_ptr_array(cdata%thrd_no)%p => physics%sfcprop%snowfallac_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        acsnow_ice_51_ptr_array(cdata%thrd_no)%p => physics%sfcprop%acsnow_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albdvis_ice_52_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdirvis_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albdnir_ice_53_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdirnir_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albivis_ice_54_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdifvis_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albinir_ice_55_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdifnir_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        rhosnf_56_ptr_array(cdata%thrd_no)%p => physics%sfcprop%rhofr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        fire_heat_flux_out_57_ptr_array(cdata%thrd_no)%p => physics%sfcprop%fire_heat_flux(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        frac_grid_burned_out_58_ptr_array(cdata%thrd_no)%p => physics%sfcprop%frac_grid_burned(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call lsm_ruc_run(iter=cdata%loop_cnt,me=physics%model%me,master=physics%model%master,delt=physics%model%dtf, &
                  kdt=physics%model%kdt,im=physics%model%blksz(cdata%blk_no),nlev=physics%model%levs, &
                  lsm_ruc=physics%model%lsm_ruc,lsm=physics%model%lsm,imp_physics=physics%model%imp_physics, &
                  imp_physics_gfdl=physics%model%imp_physics_gfdl,imp_physics_thompson=physics%model%imp_physics_thompson, &
                  imp_physics_nssl=physics%model%imp_physics_nssl,do_mynnsfclay=physics%model%do_mynnsfclay, &
                  use_cdeps_data=physics%model%use_cdeps_inline,mask_dat=mask_dat_6_ptr_array(cdata%thrd_no)%p, &
                  exticeden=physics%model%exticeden,lsoil_ruc=physics%model%lsoil_lsm,lsoil=physics%model%lsoil, &
                  mosaic_lu=physics%model%mosaic_lu,mosaic_soil=physics%model%mosaic_soil, &
                  isncond_opt=physics%model%isncond_opt,isncovr_opt=physics%model%isncovr_opt, &
                  nlcat=physics%model%nvegcat,nscat=physics%model%nsoilcat,rdlai=physics%model%rdlai, &
                  xlat_d=physics%grid%xlat_d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlon_d=physics%grid%xlon_d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oro=physics%sfcprop%oro(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sigma=physics%sfcprop%hprime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  zs=physics%model%zs(one:physics%model%lsoil_lsm),t1=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  q1=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1,physics%model%ntqv), &
                  qc=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1,physics%model%ntcw), &
                  stype=physics%sfcprop%stype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vtype=physics%sfcprop%vtype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vegtype_frac=physics%sfcprop%vegtype_frac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nvegcat), &
                  soiltype_frac=physics%sfcprop%soiltype_frac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nsoilcat), &
                  sigmaf=physics%sfcprop%vfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  laixy=laixy_29_ptr_array(cdata%thrd_no)%p,dlwflx=physics%diag%dlwsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dswsfc=physics%diag%dswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tg3=physics%sfcprop%tg3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  coszen=physics%interstitial(cdata%thrd_no)%xcosz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  land=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_lake=physics%sfcprop%use_lake_model(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rainnc=rainnc_30_ptr_array(cdata%thrd_no)%p,rainc=rainc_31_ptr_array(cdata%thrd_no)%p, &
                  ice=ice_32_ptr_array(cdata%thrd_no)%p,snow=snow_33_ptr_array(cdata%thrd_no)%p, &
                  graupel=graupel_34_ptr_array(cdata%thrd_no)%p,prsl1=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  zf=physics%diag%zlvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  shdmin=physics%sfcprop%shdmin(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  shdmax=physics%sfcprop%shdmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  srflag=physics%sfcprop%srflag(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfalb_lnd_bck=sfalb_lnd_bck_35_ptr_array(cdata%thrd_no)%p,snoalb=physics%sfcprop%snoalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  isot=physics%model%isot,ivegsrc=physics%model%ivegsrc,fice=physics%sfcprop%fice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  smcwlt2=physics%diag%smcwlt2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  smcref2=physics%diag%smcref2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  min_lakeice=physics%model%min_lakeice,min_seaice=physics%model%min_seaice, &
                  oceanfrac=physics%sfcprop%oceanfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rhonewsn1=physics%diag%rhonewsn1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  con_cp=con_cp,con_rd=con_rd,con_rv=con_rv,con_g=con_g,con_pi=con_pi,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_fvirt=con_fvirt,stbolt=con_sbc,rhoh2o=physics%model%rho_h2o, &
                  semisbase=physics%sfcprop%semisbase(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  semis_lnd=physics%sfcprop%emis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  semis_ice=physics%sfcprop%emis_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfalb_lnd=sfalb_lnd_36_ptr_array(cdata%thrd_no)%p,sfalb_ice=sfalb_ice_37_ptr_array(cdata%thrd_no)%p, &
                  sncovr1_lnd=physics%sfcprop%sncovr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  weasd_lnd=physics%sfcprop%weasdl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snwdph_lnd=physics%sfcprop%snodl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tskin_lnd=physics%sfcprop%tsfcl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sncovr1_ice=physics%sfcprop%sncovr_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  weasd_ice=physics%sfcprop%weasdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snwdph_ice=physics%sfcprop%snodi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tskin_ice=physics%sfcprop%tisfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  smois=smois_38_ptr_array(cdata%thrd_no)%p,tsice=physics%sfcprop%tiice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%kice), &
                  tslb=tslb_39_ptr_array(cdata%thrd_no)%p,sh2o=sh2o_40_ptr_array(cdata%thrd_no)%p, &
                  keepfr=keepfr_41_ptr_array(cdata%thrd_no)%p,smfrkeep=smfrkeep_42_ptr_array(cdata%thrd_no)%p, &
                  canopy=physics%sfcprop%canopy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  trans=physics%diag%trans(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_lnd=physics%interstitial(cdata%thrd_no)%tsurf_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsnow_lnd=tsnow_lnd_43_ptr_array(cdata%thrd_no)%p,z0rl_lnd=physics%sfcprop%zorll(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcqc_lnd=sfcqc_lnd_44_ptr_array(cdata%thrd_no)%p,sfcqv_lnd=qsfc_lnd_ruc_20_ptr_array(cdata%thrd_no)%p, &
                  qsurf_lnd=physics%interstitial(cdata%thrd_no)%qss_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gflux_lnd=physics%interstitial(cdata%thrd_no)%gflx_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap_lnd=physics%interstitial(cdata%thrd_no)%evap_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx_lnd=physics%interstitial(cdata%thrd_no)%hflx_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  runof=physics%interstitial(cdata%thrd_no)%runoff(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  runoff=physics%diag%runoff(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  srunoff=physics%diag%srunoff(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  drain=physics%interstitial(cdata%thrd_no)%drain(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cm_lnd=physics%interstitial(cdata%thrd_no)%cd_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ch_lnd=physics%interstitial(cdata%thrd_no)%cdq_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evbs=physics%diag%evbs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evcw=physics%diag%evcw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stm=physics%diag%soilm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wetness=wetness_45_ptr_array(cdata%thrd_no)%p,snowfallac_lnd=snowfallac_lnd_46_ptr_array(cdata%thrd_no)%p, &
                  acsnow_lnd=acsnow_lnd_47_ptr_array(cdata%thrd_no)%p,snowmt_lnd=physics%diag%snowmt_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snohf=physics%interstitial(cdata%thrd_no)%snohf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albdvis_lnd=physics%sfcprop%albdirvis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albdnir_lnd=physics%sfcprop%albdirnir_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albivis_lnd=physics%sfcprop%albdifvis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albinir_lnd=physics%sfcprop%albdifnir_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcqc_ice=sfcqc_ice_48_ptr_array(cdata%thrd_no)%p,sfcqv_ice=qsfc_ice_ruc_21_ptr_array(cdata%thrd_no)%p, &
                  tsurf_ice=physics%interstitial(cdata%thrd_no)%tsurf_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsnow_ice=tsnow_ice_49_ptr_array(cdata%thrd_no)%p,z0rl_ice=physics%sfcprop%zorli(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qsurf_ice=physics%interstitial(cdata%thrd_no)%qss_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gflux_ice=physics%interstitial(cdata%thrd_no)%gflx_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap_ice=physics%interstitial(cdata%thrd_no)%evap_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ep1d_ice=physics%interstitial(cdata%thrd_no)%ep1d_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx_ice=physics%interstitial(cdata%thrd_no)%hflx_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cm_ice=physics%interstitial(cdata%thrd_no)%cd_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ch_ice=physics%interstitial(cdata%thrd_no)%cdq_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowfallac_ice=snowfallac_ice_50_ptr_array(cdata%thrd_no)%p,acsnow_ice=acsnow_ice_51_ptr_array(cdata%thrd_no)%p, &
                  snowmt_ice=physics%diag%snowmt_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albdvis_ice=albdvis_ice_52_ptr_array(cdata%thrd_no)%p,albdnir_ice=albdnir_ice_53_ptr_array(cdata%thrd_no)%p, &
                  albivis_ice=albivis_ice_54_ptr_array(cdata%thrd_no)%p,albinir_ice=albinir_ice_55_ptr_array(cdata%thrd_no)%p, &
                  rhosnf=rhosnf_56_ptr_array(cdata%thrd_no)%p,sbsno=physics%diag%sbsno(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cmm_lnd=physics%interstitial(cdata%thrd_no)%cmm_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  chh_lnd=physics%interstitial(cdata%thrd_no)%chh_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cmm_ice=physics%interstitial(cdata%thrd_no)%cmm_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  chh_ice=physics%interstitial(cdata%thrd_no)%chh_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_iter=physics%interstitial(cdata%thrd_no)%flag_iter(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_guess=physics%interstitial(cdata%thrd_no)%flag_guess(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_init=physics%model%first_time_step,lsm_cold_start=physics%model%lsm_cold_start, &
                  flag_cice=physics%interstitial(cdata%thrd_no)%flag_cice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  frac_grid=physics%model%frac_grid,add_fire_heat_flux=physics%model%add_fire_heat_flux, &
                  fire_heat_flux_out=fire_heat_flux_out_57_ptr_array(cdata%thrd_no)%p,frac_grid_burned_out=frac_grid_burned_out_58_ptr_array(cdata%thrd_no)%p, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%use_cdeps_inline)) then
        nullify(mask_dat_6_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noah .or. physics%model%lsm == physics%model%lsm_noahmp .or. physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(laixy_29_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        nullify(rainnc_30_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        nullify(rainc_31_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(ice_32_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(snow_33_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(graupel_34_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(sfalb_lnd_bck_35_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(sfalb_lnd_36_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(sfalb_ice_37_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(smois_38_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(tslb_39_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(sh2o_40_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(keepfr_41_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(smfrkeep_42_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(tsnow_lnd_43_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(sfcqc_lnd_44_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(qsfc_lnd_ruc_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(wetness_45_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(snowfallac_lnd_46_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(acsnow_lnd_47_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(sfcqc_ice_48_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(qsfc_ice_ruc_21_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(tsnow_ice_49_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(snowfallac_ice_50_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(acsnow_ice_51_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albdvis_ice_52_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albdnir_ice_53_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albivis_ice_54_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albinir_ice_55_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(rhosnf_56_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(fire_heat_flux_out_57_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(frac_grid_burned_out_58_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in lsm_ruc_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%use_cdeps_inline)) then
        mask_dat_6_ptr_array(cdata%thrd_no)%p => physics%coupling%mask_dat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        clm_lake_initialized_59_ptr_array(cdata%thrd_no)%p => physics%sfcprop%clm_lake_initialized(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        rainc_31_ptr_array(cdata%thrd_no)%p => physics%sfcprop%raincprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        rainnc_30_ptr_array(cdata%thrd_no)%p => physics%sfcprop%rainncprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        input_lakedepth_60_ptr_array(cdata%thrd_no)%p => physics%sfcprop%input_lakedepth(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lkm > 0)) then
        lake_t_snow_61_ptr_array(cdata%thrd_no)%p => physics%sfcprop%t_snow(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        albedo_62_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_albedo(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        lake_t2m_63_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        lake_q2m_64_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_q2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        salty_65_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_is_salty(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        cannot_freeze_66_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_cannot_freeze(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        savedtke12d_67_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_savedtke12d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        snowdp2d_68_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_sndpth2d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        h2osno2d_69_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_h2osno2d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        snl2d_70_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_snl2d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        t_grnd2d_71_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        t_lake3d_72_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_t_lake3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nlevlake_clm_lake)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        lake_icefrac3d_73_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_icefrac3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nlevlake_clm_lake)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        t_soisno3d_74_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_t_soisno3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nlevsnowsoil1_clm_lake)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        h2osoi_ice3d_75_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_h2osoi_ice3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nlevsnowsoil1_clm_lake)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        h2osoi_liq3d_76_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_h2osoi_liq3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nlevsnowsoil1_clm_lake)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        h2osoi_vol3d_77_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_h2osoi_vol3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nlevsnowsoil1_clm_lake)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        z3d_78_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_snow_z3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nlevsnowsoil1_clm_lake)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        dz3d_79_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_snow_dz3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nlevsnowsoil1_clm_lake)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        zi3d_80_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_snow_zi3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nlevsnowsoil_clm_lake)
      end if

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        clm_lakedepth_81_ptr_array(cdata%thrd_no)%p => physics%sfcprop%clm_lakedepth(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call clm_lake_run(flag_restart=physics%model%restart,im=physics%model%blksz(cdata%blk_no), &
                  km=physics%model%levs,me=physics%model%me,master=physics%model%master,fhour=physics%model%fhour, &
                  idate=physics%model%idate(one:4),kdt=physics%model%kdt,iopt_lake=physics%model%iopt_lake, &
                  iopt_lake_clm=physics%model%iopt_lake_clm,min_lakeice=physics%model%min_lakeice, &
                  lakedepth_default=physics%model%clm_lake_depth_default,use_lakedepth=physics%model%clm_lake_use_lakedepth, &
                  use_cdeps_data=physics%model%use_cdeps_inline,mask_dat=mask_dat_6_ptr_array(cdata%thrd_no)%p, &
                  dtp=physics%model%dtp,use_lake_model=physics%sfcprop%use_lake_model(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  clm_lake_initialized=clm_lake_initialized_59_ptr_array(cdata%thrd_no)%p, &
                  frac_grid=physics%model%frac_grid,frac_ice=physics%model%frac_ice,lkm=physics%model%lkm, &
                  tg3=physics%sfcprop%tg3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  pgr=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zlvl=physics%diag%zlvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gt0=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  qvcurr=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1,physics%model%ntqv), &
                  gu0=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gv0=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  xlat_d=physics%grid%xlat_d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlon_d=physics%grid%xlon_d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ch=physics%interstitial(cdata%thrd_no)%cdq_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cm=physics%interstitial(cdata%thrd_no)%cd_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dlwsfci=physics%diag%dlwsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dswsfci=physics%diag%dswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  raincprv=rainc_31_ptr_array(cdata%thrd_no)%p,rainncprv=rainnc_30_ptr_array(cdata%thrd_no)%p, &
                  oro_lakedepth=physics%sfcprop%lakedepth(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  input_lakedepth=input_lakedepth_60_ptr_array(cdata%thrd_no)%p,wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_iter=physics%interstitial(cdata%thrd_no)%flag_iter(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_lakefreeze=physics%interstitial(cdata%thrd_no)%flag_lakefreeze(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  isltyp=physics%sfcprop%stype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap_wat=physics%interstitial(cdata%thrd_no)%evap_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap_ice=physics%interstitial(cdata%thrd_no)%evap_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx_wat=physics%interstitial(cdata%thrd_no)%hflx_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx_ice=physics%interstitial(cdata%thrd_no)%hflx_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gflx_wat=physics%interstitial(cdata%thrd_no)%gflx_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gflx_ice=physics%interstitial(cdata%thrd_no)%gflx_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ep1d_water=physics%interstitial(cdata%thrd_no)%ep1d_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ep1d_ice=physics%interstitial(cdata%thrd_no)%ep1d_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_water=physics%interstitial(cdata%thrd_no)%tsurf_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_ice=physics%interstitial(cdata%thrd_no)%tsurf_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc_wat=physics%interstitial(cdata%thrd_no)%tsfc_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tisfc=physics%sfcprop%tisfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  weasdi=physics%sfcprop%weasdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snodi=physics%sfcprop%snodi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hice=physics%sfcprop%hice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qss_water=physics%interstitial(cdata%thrd_no)%qss_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qss_ice=physics%interstitial(cdata%thrd_no)%qss_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cmm_water=physics%interstitial(cdata%thrd_no)%cmm_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cmm_ice=physics%interstitial(cdata%thrd_no)%cmm_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  chh_water=physics%interstitial(cdata%thrd_no)%chh_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  chh_ice=physics%interstitial(cdata%thrd_no)%chh_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  uustar_water=physics%interstitial(cdata%thrd_no)%uustar_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  uustar_ice=physics%interstitial(cdata%thrd_no)%uustar_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lake_t_snow=lake_t_snow_61_ptr_array(cdata%thrd_no)%p,albedo=albedo_62_ptr_array(cdata%thrd_no)%p, &
                  zorlw=physics%sfcprop%zorlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorli=physics%sfcprop%zorli(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lake_t2m=lake_t2m_63_ptr_array(cdata%thrd_no)%p,lake_q2m=lake_q2m_64_ptr_array(cdata%thrd_no)%p, &
                  weasd=physics%sfcprop%weasd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowd=physics%sfcprop%snowd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fice=physics%sfcprop%fice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  salty=salty_65_ptr_array(cdata%thrd_no)%p,cannot_freeze=cannot_freeze_66_ptr_array(cdata%thrd_no)%p, &
                  savedtke12d=savedtke12d_67_ptr_array(cdata%thrd_no)%p,snowdp2d=snowdp2d_68_ptr_array(cdata%thrd_no)%p, &
                  h2osno2d=h2osno2d_69_ptr_array(cdata%thrd_no)%p,snl2d=snl2d_70_ptr_array(cdata%thrd_no)%p, &
                  t_grnd2d=t_grnd2d_71_ptr_array(cdata%thrd_no)%p,t_lake3d=t_lake3d_72_ptr_array(cdata%thrd_no)%p, &
                  lake_icefrac3d=lake_icefrac3d_73_ptr_array(cdata%thrd_no)%p,t_soisno3d=t_soisno3d_74_ptr_array(cdata%thrd_no)%p, &
                  h2osoi_ice3d=h2osoi_ice3d_75_ptr_array(cdata%thrd_no)%p,h2osoi_liq3d=h2osoi_liq3d_76_ptr_array(cdata%thrd_no)%p, &
                  h2osoi_vol3d=h2osoi_vol3d_77_ptr_array(cdata%thrd_no)%p,z3d=z3d_78_ptr_array(cdata%thrd_no)%p, &
                  dz3d=dz3d_79_ptr_array(cdata%thrd_no)%p,zi3d=zi3d_80_ptr_array(cdata%thrd_no)%p, &
                  clm_lakedepth=clm_lakedepth_81_ptr_array(cdata%thrd_no)%p,t1=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  qv1=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1,physics%model%ntqv), &
                  prsl1=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%use_cdeps_inline)) then
        nullify(mask_dat_6_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(clm_lake_initialized_59_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        nullify(rainc_31_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        nullify(rainnc_30_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(input_lakedepth_60_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lkm > 0)) then
        nullify(lake_t_snow_61_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(albedo_62_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        nullify(lake_t2m_63_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        nullify(lake_q2m_64_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(salty_65_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(cannot_freeze_66_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(savedtke12d_67_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(snowdp2d_68_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(h2osno2d_69_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(snl2d_70_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(t_grnd2d_71_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(t_lake3d_72_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(lake_icefrac3d_73_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(t_soisno3d_74_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(h2osoi_ice3d_75_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(h2osoi_liq3d_76_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(h2osoi_vol3d_77_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(z3d_78_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(dz3d_79_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iopt_lake == physics%model%iopt_lake_clm .and. physics%model%lkm > 0)) then
        nullify(zi3d_80_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        nullify(clm_lakedepth_81_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in clm_lake_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call gfs_surface_loop_control_part2_run(im=physics%model%blksz(cdata%blk_no),lsm=physics%model%lsm,lsm_noahmp=physics%model%lsm_noahmp, &
                  iter=cdata%loop_cnt,wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_guess=physics%interstitial(cdata%thrd_no)%flag_guess(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_iter=physics%interstitial(cdata%thrd_no)%flag_iter(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  nstf_name1=physics%model%nstf_name(1),errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_surface_loop_control_part2_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      end do
      end associate

      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      

      if ((physics%model%use_cdeps_inline)) then
        mask_dat_6_ptr_array(cdata%thrd_no)%p => physics%coupling%mask_dat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cpl_fire)) then
        hflx_fire_82_ptr_array(cdata%thrd_no)%p => physics%sfcprop%hflx_fire(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cpl_fire)) then
        evap_fire_83_ptr_array(cdata%thrd_no)%p => physics%sfcprop%evap_fire(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call gfs_surface_composites_post_run(im=physics%model%blksz(cdata%blk_no),kice=physics%model%kice,km=physics%model%lsoil, &
                  lkm=physics%model%lkm,iopt_lake=physics%model%iopt_lake,iopt_lake_clm=physics%model%iopt_lake_clm, &
                  use_lake_model=physics%sfcprop%use_lake_model(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rd=con_rd,rvrdm1=con_fvirt,cplflx=physics%model%cplflx,cplwav2atm=physics%model%cplwav2atm, &
                  frac_grid=physics%model%frac_grid,frac_ice=physics%model%frac_ice,flag_cice=physics%interstitial(cdata%thrd_no)%flag_cice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  thsfc_loc=physics%model%thsfc_loc,islmsk=physics%interstitial(cdata%thrd_no)%islmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_cdeps_data=physics%model%use_cdeps_inline,mask_dat=mask_dat_6_ptr_array(cdata%thrd_no)%p, &
                  wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t1=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  q1=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1,physics%model%ntqv), &
                  prsl1=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  landfrac=physics%sfcprop%landfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lakefrac=physics%sfcprop%lakefrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oceanfrac=physics%sfcprop%oceanfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorl=physics%sfcprop%zorl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorlo=physics%sfcprop%zorlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorll=physics%sfcprop%zorll(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorli=physics%sfcprop%zorli(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cd=physics%interstitial(cdata%thrd_no)%cd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cd_wat=physics%interstitial(cdata%thrd_no)%cd_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cd_lnd=physics%interstitial(cdata%thrd_no)%cd_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cd_ice=physics%interstitial(cdata%thrd_no)%cd_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cdq=physics%interstitial(cdata%thrd_no)%cdq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cdq_wat=physics%interstitial(cdata%thrd_no)%cdq_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cdq_lnd=physics%interstitial(cdata%thrd_no)%cdq_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cdq_ice=physics%interstitial(cdata%thrd_no)%cdq_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rb=physics%interstitial(cdata%thrd_no)%rb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rb_wat=physics%interstitial(cdata%thrd_no)%rb_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rb_lnd=physics%interstitial(cdata%thrd_no)%rb_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rb_ice=physics%interstitial(cdata%thrd_no)%rb_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress=physics%interstitial(cdata%thrd_no)%stress(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress_wat=physics%interstitial(cdata%thrd_no)%stress_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress_lnd=physics%interstitial(cdata%thrd_no)%stress_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress_ice=physics%interstitial(cdata%thrd_no)%stress_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ffmm=physics%sfcprop%ffmm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ffmm_wat=physics%interstitial(cdata%thrd_no)%ffmm_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ffmm_lnd=physics%interstitial(cdata%thrd_no)%ffmm_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ffmm_ice=physics%interstitial(cdata%thrd_no)%ffmm_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ffhh=physics%sfcprop%ffhh(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ffhh_wat=physics%interstitial(cdata%thrd_no)%ffhh_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ffhh_lnd=physics%interstitial(cdata%thrd_no)%ffhh_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ffhh_ice=physics%interstitial(cdata%thrd_no)%ffhh_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  uustar=physics%sfcprop%uustar(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  uustar_wat=physics%interstitial(cdata%thrd_no)%uustar_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  uustar_lnd=physics%interstitial(cdata%thrd_no)%uustar_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  uustar_ice=physics%interstitial(cdata%thrd_no)%uustar_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm10=physics%interstitial(cdata%thrd_no)%fm10(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm10_wat=physics%interstitial(cdata%thrd_no)%fm10_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm10_lnd=physics%interstitial(cdata%thrd_no)%fm10_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm10_ice=physics%interstitial(cdata%thrd_no)%fm10_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh2=physics%interstitial(cdata%thrd_no)%fh2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh2_wat=physics%interstitial(cdata%thrd_no)%fh2_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh2_lnd=physics%interstitial(cdata%thrd_no)%fh2_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh2_ice=physics%interstitial(cdata%thrd_no)%fh2_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_wat=physics%interstitial(cdata%thrd_no)%tsurf_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_lnd=physics%interstitial(cdata%thrd_no)%tsurf_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_ice=physics%interstitial(cdata%thrd_no)%tsurf_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cmm=physics%diag%cmm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cmm_wat=physics%interstitial(cdata%thrd_no)%cmm_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cmm_lnd=physics%interstitial(cdata%thrd_no)%cmm_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cmm_ice=physics%interstitial(cdata%thrd_no)%cmm_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  chh=physics%diag%chh(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  chh_wat=physics%interstitial(cdata%thrd_no)%chh_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  chh_lnd=physics%interstitial(cdata%thrd_no)%chh_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  chh_ice=physics%interstitial(cdata%thrd_no)%chh_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gflx=physics%interstitial(cdata%thrd_no)%gflx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gflx_wat=physics%interstitial(cdata%thrd_no)%gflx_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gflx_lnd=physics%interstitial(cdata%thrd_no)%gflx_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gflx_ice=physics%interstitial(cdata%thrd_no)%gflx_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ep1d=physics%interstitial(cdata%thrd_no)%ep1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ep1d_wat=physics%interstitial(cdata%thrd_no)%ep1d_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ep1d_lnd=physics%interstitial(cdata%thrd_no)%ep1d_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ep1d_ice=physics%interstitial(cdata%thrd_no)%ep1d_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  weasd=physics%sfcprop%weasd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  weasd_lnd=physics%sfcprop%weasdl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  weasd_ice=physics%sfcprop%weasdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowd=physics%sfcprop%snowd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowd_lnd=physics%sfcprop%snodl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowd_ice=physics%sfcprop%snodi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tprcp=physics%sfcprop%tprcp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tprcp_wat=physics%interstitial(cdata%thrd_no)%tprcp_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tprcp_lnd=physics%interstitial(cdata%thrd_no)%tprcp_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tprcp_ice=physics%interstitial(cdata%thrd_no)%tprcp_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap=physics%sfcprop%evap(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap_wat=physics%interstitial(cdata%thrd_no)%evap_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap_lnd=physics%interstitial(cdata%thrd_no)%evap_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap_ice=physics%interstitial(cdata%thrd_no)%evap_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx=physics%sfcprop%hflx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx_wat=physics%interstitial(cdata%thrd_no)%hflx_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx_lnd=physics%interstitial(cdata%thrd_no)%hflx_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx_ice=physics%interstitial(cdata%thrd_no)%hflx_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx_fire=hflx_fire_82_ptr_array(cdata%thrd_no)%p,evap_fire=evap_fire_83_ptr_array(cdata%thrd_no)%p, &
                  cpl_fire=physics%model%cpl_fire,qss=physics%sfcprop%qss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qss_wat=physics%interstitial(cdata%thrd_no)%qss_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qss_lnd=physics%interstitial(cdata%thrd_no)%qss_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qss_ice=physics%interstitial(cdata%thrd_no)%qss_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfco=physics%sfcprop%tsfco(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfcl=physics%sfcprop%tsfcl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc_wat=physics%interstitial(cdata%thrd_no)%tsfc_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tisfc=physics%sfcprop%tisfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hice=physics%sfcprop%hice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cice=physics%sfcprop%fice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tiice=physics%sfcprop%tiice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%kice), &
                  stc=physics%sfcprop%stc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil), &
                  grav=con_g,prsik1=physics%statein%prsik(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  prslk1=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  prslki=physics%interstitial(cdata%thrd_no)%work3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  z1=physics%diag%zlvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  garea=physics%grid%area(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zvfun=physics%interstitial(cdata%thrd_no)%zvfun(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lheatstrg=physics%model%lheatstrg,h0facu=physics%model%h0facu,h0facs=physics%model%h0facs, &
                  hflxq=physics%interstitial(cdata%thrd_no)%hflxq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hffac=physics%interstitial(cdata%thrd_no)%hffac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sigmaf=physics%interstitial(cdata%thrd_no)%sigmaf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ztmax_wat=physics%interstitial(cdata%thrd_no)%ztmax_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ztmax_lnd=physics%interstitial(cdata%thrd_no)%ztmax_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ztmax_ice=physics%interstitial(cdata%thrd_no)%ztmax_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  huge=physics%model%huge,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%use_cdeps_inline)) then
        nullify(mask_dat_6_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cpl_fire)) then
        nullify(hflx_fire_82_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cpl_fire)) then
        nullify(evap_fire_83_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_surface_composites_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        lake_t2m_63_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        lake_q2m_64_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_q2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call sfc_diag_run(im=physics%model%blksz(cdata%blk_no),xlat_d=physics%grid%xlat_d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlon_d=physics%grid%xlon_d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lsm=physics%model%lsm,lsm_ruc=physics%model%lsm_ruc,grav=con_g,cp=con_cp, &
                  eps=con_eps,epsm1=con_epsm1,con_rocp=con_rocp,con_karman=karman,zf=physics%diag%zlvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ps=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u1=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  v1=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  usfco=physics%sfcprop%usfco(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vsfco=physics%sfcprop%vsfco(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_oceanuv=physics%model%use_oceanuv,t1=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  q1=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1,physics%model%ntqv), &
                  prslki=physics%interstitial(cdata%thrd_no)%work3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap=physics%sfcprop%evap(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm=physics%sfcprop%ffmm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh=physics%sfcprop%ffhh(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm10=physics%interstitial(cdata%thrd_no)%fm10(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh2=physics%interstitial(cdata%thrd_no)%fh2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ust=physics%sfcprop%uustar(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tskin=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qsurf=physics%sfcprop%qss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  thsfc_loc=physics%model%thsfc_loc,use_lake_model=physics%sfcprop%use_lake_model(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  iopt_lake=physics%model%iopt_lake,iopt_lake_clm=physics%model%iopt_lake_clm, &
                  lake_t2m=lake_t2m_63_ptr_array(cdata%thrd_no)%p,diag_flux=physics%model%diag_flux, &
                  diag_log=physics%model%diag_log,shflx=physics%sfcprop%hflx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lake_q2m=lake_q2m_64_ptr_array(cdata%thrd_no)%p,cdq=physics%interstitial(cdata%thrd_no)%cdq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_lake2m=physics%model%use_lake2m,wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  f10m=physics%sfcprop%f10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u10m=physics%diag%u10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10m=physics%diag%v10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t2m=physics%sfcprop%t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  q2m=physics%sfcprop%q2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dpt2m=physics%diag%dpt2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        nullify(lake_t2m_63_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        nullify(lake_q2m_64_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in sfc_diag_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        t2mmp_84_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%t2mmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        q2mp_85_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%q2mp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call sfc_diag_post_run(im=physics%model%blksz(cdata%blk_no),lsm=physics%model%lsm,lsm_noahmp=physics%model%lsm_noahmp, &
                  opt_diag=physics%model%iopt_diag,dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lssav=physics%model%lssav,dtf=physics%model%dtf,con_eps=con_eps,con_epsm1=con_epsm1, &
                  pgr=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t2mmp=t2mmp_84_ptr_array(cdata%thrd_no)%p,q2mp=q2mp_85_ptr_array(cdata%thrd_no)%p, &
                  t2m=physics%sfcprop%t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  q2m=physics%sfcprop%q2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u10m=physics%diag%u10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10m=physics%diag%v10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tmpmin=physics%diag%tmpmin(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tmpmax=physics%diag%tmpmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  spfhmin=physics%diag%spfhmin(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  spfhmax=physics%diag%spfhmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wind10mmax=physics%diag%wind10mmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u10mmax=physics%diag%u10mmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10mmax=physics%diag%v10mmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dpt2m=physics%diag%dpt2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(t2mmp_84_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(q2mp_85_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in sfc_diag_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        pahi_86_ptr_array(cdata%thrd_no)%p => physics%diag%pahi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        dlwsfci_cpl_87_ptr_array(cdata%thrd_no)%p => physics%coupling%dlwsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        dswsfci_cpl_88_ptr_array(cdata%thrd_no)%p => physics%coupling%dswsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        dlwsfc_cpl_89_ptr_array(cdata%thrd_no)%p => physics%coupling%dlwsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        dswsfc_cpl_90_ptr_array(cdata%thrd_no)%p => physics%coupling%dswsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dnirbmi_cpl_91_ptr_array(cdata%thrd_no)%p => physics%coupling%dnirbmi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dnirdfi_cpl_92_ptr_array(cdata%thrd_no)%p => physics%coupling%dnirdfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvisbmi_cpl_93_ptr_array(cdata%thrd_no)%p => physics%coupling%dvisbmi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvisdfi_cpl_94_ptr_array(cdata%thrd_no)%p => physics%coupling%dvisdfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dnirbm_cpl_95_ptr_array(cdata%thrd_no)%p => physics%coupling%dnirbm_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dnirdf_cpl_96_ptr_array(cdata%thrd_no)%p => physics%coupling%dnirdf_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvisbm_cpl_97_ptr_array(cdata%thrd_no)%p => physics%coupling%dvisbm_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvisdf_cpl_98_ptr_array(cdata%thrd_no)%p => physics%coupling%dvisdf_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nlwsfci_cpl_99_ptr_array(cdata%thrd_no)%p => physics%coupling%nlwsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nlwsfc_cpl_100_ptr_array(cdata%thrd_no)%p => physics%coupling%nlwsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        t2mi_cpl_101_ptr_array(cdata%thrd_no)%p => physics%coupling%t2mi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        q2mi_cpl_102_ptr_array(cdata%thrd_no)%p => physics%coupling%q2mi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cplwav .or. physics%model%cpl_fire)) then
        u10mi_cpl_103_ptr_array(cdata%thrd_no)%p => physics%coupling%u10mi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cplwav .or. physics%model%cpl_fire)) then
        v10mi_cpl_104_ptr_array(cdata%thrd_no)%p => physics%coupling%v10mi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        tsfci_cpl_105_ptr_array(cdata%thrd_no)%p => physics%coupling%tsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        psurfi_cpl_106_ptr_array(cdata%thrd_no)%p => physics%coupling%psurfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nnirbmi_cpl_107_ptr_array(cdata%thrd_no)%p => physics%coupling%nnirbmi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nnirdfi_cpl_108_ptr_array(cdata%thrd_no)%p => physics%coupling%nnirdfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nvisbmi_cpl_109_ptr_array(cdata%thrd_no)%p => physics%coupling%nvisbmi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nvisdfi_cpl_110_ptr_array(cdata%thrd_no)%p => physics%coupling%nvisdfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nswsfci_cpl_111_ptr_array(cdata%thrd_no)%p => physics%coupling%nswsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nswsfc_cpl_112_ptr_array(cdata%thrd_no)%p => physics%coupling%nswsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nnirbm_cpl_113_ptr_array(cdata%thrd_no)%p => physics%coupling%nnirbm_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nnirdf_cpl_114_ptr_array(cdata%thrd_no)%p => physics%coupling%nnirdf_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nvisbm_cpl_115_ptr_array(cdata%thrd_no)%p => physics%coupling%nvisbm_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nvisdf_cpl_116_ptr_array(cdata%thrd_no)%p => physics%coupling%nvisdf_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        paha_117_ptr_array(cdata%thrd_no)%p => physics%diag%paha(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        waxy_118_ptr_array(cdata%thrd_no)%p => physics%sfcprop%waxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        twa_119_ptr_array(cdata%thrd_no)%p => physics%diag%twa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call gfs_surface_generic_post_run(im=physics%model%blksz(cdata%blk_no),cplflx=physics%model%cplflx,cplaqm=physics%model%cplaqm, &
                  cplchm=physics%model%cplchm,cplwav=physics%model%cplwav,cpllnd=physics%model%cpllnd, &
                  cpl_fire=physics%model%cpl_fire,lssav=physics%model%lssav,dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lsm=physics%model%lsm,lsm_noahmp=physics%model%lsm_noahmp,dtf=physics%model%dtf, &
                  ep1d=physics%interstitial(cdata%thrd_no)%ep1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gflx=physics%interstitial(cdata%thrd_no)%gflx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tgrs_1=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  qgrs_1=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1,physics%model%ntqv), &
                  ugrs_1=physics%statein%ugrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  vgrs_1=physics%statein%vgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  adjsfcdlw=physics%diag%dlwsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfcdsw=physics%diag%dswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjnirbmd=physics%interstitial(cdata%thrd_no)%adjnirbmd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjnirdfd=physics%interstitial(cdata%thrd_no)%adjnirdfd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjvisbmd=physics%interstitial(cdata%thrd_no)%adjvisbmd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjvisdfd=physics%interstitial(cdata%thrd_no)%adjvisdfd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfculw=physics%diag%ulwsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfculw_wat=physics%interstitial(cdata%thrd_no)%adjsfculw_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjnirbmu=physics%interstitial(cdata%thrd_no)%adjnirbmu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjnirdfu=physics%interstitial(cdata%thrd_no)%adjnirdfu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjvisbmu=physics%interstitial(cdata%thrd_no)%adjvisbmu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjvisdfu=physics%interstitial(cdata%thrd_no)%adjvisdfu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t2m=physics%sfcprop%t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  q2m=physics%sfcprop%q2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u10m=physics%diag%u10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10m=physics%diag%v10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc_wat=physics%interstitial(cdata%thrd_no)%tsfc_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  pgr=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xcosz=physics%interstitial(cdata%thrd_no)%xcosz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evbs=physics%diag%evbs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evcw=physics%diag%evcw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  trans=physics%diag%trans(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sbsno=physics%diag%sbsno(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowc=physics%interstitial(cdata%thrd_no)%snowc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snohf=physics%interstitial(cdata%thrd_no)%snohf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  pah=physics%interstitial(cdata%thrd_no)%pah(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  pahi=pahi_86_ptr_array(cdata%thrd_no)%p,epi=physics%diag%epi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gfluxi=physics%diag%gfluxi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t1=physics%diag%t1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  q1=physics%diag%q1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u1=physics%diag%u1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v1=physics%diag%v1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dlwsfci_cpl=dlwsfci_cpl_87_ptr_array(cdata%thrd_no)%p,dswsfci_cpl=dswsfci_cpl_88_ptr_array(cdata%thrd_no)%p, &
                  dlwsfc_cpl=dlwsfc_cpl_89_ptr_array(cdata%thrd_no)%p,dswsfc_cpl=dswsfc_cpl_90_ptr_array(cdata%thrd_no)%p, &
                  dnirbmi_cpl=dnirbmi_cpl_91_ptr_array(cdata%thrd_no)%p,dnirdfi_cpl=dnirdfi_cpl_92_ptr_array(cdata%thrd_no)%p, &
                  dvisbmi_cpl=dvisbmi_cpl_93_ptr_array(cdata%thrd_no)%p,dvisdfi_cpl=dvisdfi_cpl_94_ptr_array(cdata%thrd_no)%p, &
                  dnirbm_cpl=dnirbm_cpl_95_ptr_array(cdata%thrd_no)%p,dnirdf_cpl=dnirdf_cpl_96_ptr_array(cdata%thrd_no)%p, &
                  dvisbm_cpl=dvisbm_cpl_97_ptr_array(cdata%thrd_no)%p,dvisdf_cpl=dvisdf_cpl_98_ptr_array(cdata%thrd_no)%p, &
                  nlwsfci_cpl=nlwsfci_cpl_99_ptr_array(cdata%thrd_no)%p,nlwsfc_cpl=nlwsfc_cpl_100_ptr_array(cdata%thrd_no)%p, &
                  t2mi_cpl=t2mi_cpl_101_ptr_array(cdata%thrd_no)%p,q2mi_cpl=q2mi_cpl_102_ptr_array(cdata%thrd_no)%p, &
                  u10mi_cpl=u10mi_cpl_103_ptr_array(cdata%thrd_no)%p,v10mi_cpl=v10mi_cpl_104_ptr_array(cdata%thrd_no)%p, &
                  tsfci_cpl=tsfci_cpl_105_ptr_array(cdata%thrd_no)%p,psurfi_cpl=psurfi_cpl_106_ptr_array(cdata%thrd_no)%p, &
                  nnirbmi_cpl=nnirbmi_cpl_107_ptr_array(cdata%thrd_no)%p,nnirdfi_cpl=nnirdfi_cpl_108_ptr_array(cdata%thrd_no)%p, &
                  nvisbmi_cpl=nvisbmi_cpl_109_ptr_array(cdata%thrd_no)%p,nvisdfi_cpl=nvisdfi_cpl_110_ptr_array(cdata%thrd_no)%p, &
                  nswsfci_cpl=nswsfci_cpl_111_ptr_array(cdata%thrd_no)%p,nswsfc_cpl=nswsfc_cpl_112_ptr_array(cdata%thrd_no)%p, &
                  nnirbm_cpl=nnirbm_cpl_113_ptr_array(cdata%thrd_no)%p,nnirdf_cpl=nnirdf_cpl_114_ptr_array(cdata%thrd_no)%p, &
                  nvisbm_cpl=nvisbm_cpl_115_ptr_array(cdata%thrd_no)%p,nvisdf_cpl=nvisdf_cpl_116_ptr_array(cdata%thrd_no)%p, &
                  gflux=physics%diag%gflux(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evbsa=physics%diag%evbsa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evcwa=physics%diag%evcwa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  transa=physics%diag%transa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sbsnoa=physics%diag%sbsnoa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowca=physics%diag%snowca(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snohfa=physics%diag%snohfa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  paha=paha_117_ptr_array(cdata%thrd_no)%p,ep=physics%diag%ep(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ecan=physics%interstitial(cdata%thrd_no)%ecan(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  etran=physics%interstitial(cdata%thrd_no)%etran(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  edir=physics%interstitial(cdata%thrd_no)%edir(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  waxy=waxy_118_ptr_array(cdata%thrd_no)%p,runoff=physics%diag%runoff(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  srunoff=physics%diag%srunoff(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  runof=physics%interstitial(cdata%thrd_no)%runoff(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  drain=physics%interstitial(cdata%thrd_no)%drain(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tecan=physics%diag%tecan(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tetran=physics%diag%tetran(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tedir=physics%diag%tedir(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  twa=twa_119_ptr_array(cdata%thrd_no)%p,lheatstrg=physics%model%lheatstrg, &
                  h0facu=physics%model%h0facu,h0facs=physics%model%h0facs,hflx=physics%sfcprop%hflx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap=physics%sfcprop%evap(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflxq=physics%interstitial(cdata%thrd_no)%hflxq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zvfun=physics%interstitial(cdata%thrd_no)%zvfun(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hffac=physics%interstitial(cdata%thrd_no)%hffac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  isot=physics%model%isot,ivegsrc=physics%model%ivegsrc,islmsk=physics%interstitial(cdata%thrd_no)%islmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vtype=physics%sfcprop%vtype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stype=physics%sfcprop%stype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  scolor=physics%sfcprop%scolor(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slope=physics%sfcprop%slope(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vtype_save=physics%sfcprop%vtype_save(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stype_save=physics%sfcprop%stype_save(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  scolor_save=physics%sfcprop%scolor_save(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slope_save=physics%sfcprop%slope_save(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(pahi_86_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(dlwsfci_cpl_87_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(dswsfci_cpl_88_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(dlwsfc_cpl_89_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(dswsfc_cpl_90_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dnirbmi_cpl_91_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dnirdfi_cpl_92_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvisbmi_cpl_93_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvisdfi_cpl_94_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dnirbm_cpl_95_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dnirdf_cpl_96_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvisbm_cpl_97_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvisdf_cpl_98_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(nlwsfci_cpl_99_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(nlwsfc_cpl_100_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(t2mi_cpl_101_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(q2mi_cpl_102_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cplwav .or. physics%model%cpl_fire)) then
        nullify(u10mi_cpl_103_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cplwav .or. physics%model%cpl_fire)) then
        nullify(v10mi_cpl_104_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        nullify(tsfci_cpl_105_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(psurfi_cpl_106_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nnirbmi_cpl_107_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nnirdfi_cpl_108_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nvisbmi_cpl_109_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nvisdfi_cpl_110_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(nswsfci_cpl_111_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nswsfc_cpl_112_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nnirbm_cpl_113_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nnirdf_cpl_114_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nvisbm_cpl_115_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nvisdf_cpl_116_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(paha_117_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(waxy_118_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(twa_119_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_surface_generic_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        smois_38_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smois(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        tslb_39_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tslb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%rrfs_sd)) then
        dust12m_in_120_ptr_array(cdata%thrd_no)%p => physics%sfcprop%dust12m_in(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:12,one:5)
      end if

      if ((physics%model%rrfs_sd)) then
        emi_ant_in_121_ptr_array(cdata%thrd_no)%p => physics%sfcprop%emi_in(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:1)
      end if

      if ((physics%model%rrfs_sd)) then
        smoke_rrfs_122_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smoke_rrfs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:24,one:2)
      end if

      if ((physics%model%rrfs_sd)) then
        smoke2d_rrfs_123_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smoke2d_rrfs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:5)
      end if

      if ((physics%model%rrfs_sd)) then
        chem3d_124_ptr_array(cdata%thrd_no)%p => physics%coupling%chem3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nchem)
      end if

      if ((physics%model%ntwa > 0)) then
        nwfa_125_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntwa)
      end if

      if ((physics%model%ntia > 0)) then
        nifa_126_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntia)
      end if

      if ((physics%model%rrfs_sd)) then
        emanoc_127_ptr_array(cdata%thrd_no)%p => physics%sfcprop%emanoc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        emdust_128_ptr_array(cdata%thrd_no)%p => physics%sfcprop%emdust(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        emseas_129_ptr_array(cdata%thrd_no)%p => physics%sfcprop%emseas(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        ebb_smoke_in_130_ptr_array(cdata%thrd_no)%p => physics%sfcprop%ebb_smoke_in(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        frp_output_131_ptr_array(cdata%thrd_no)%p => physics%sfcprop%frp_output(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        coef_bb_132_ptr_array(cdata%thrd_no)%p => physics%sfcprop%coef_bb_dc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        fire_type_out_133_ptr_array(cdata%thrd_no)%p => physics%sfcprop%fire_type(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        ebu_smoke_134_ptr_array(cdata%thrd_no)%p => physics%coupling%ebu_smoke(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%rrfs_sd)) then
        fhist_135_ptr_array(cdata%thrd_no)%p => physics%sfcprop%fhist(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        min_fplume_136_ptr_array(cdata%thrd_no)%p => physics%coupling%min_fplume(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        max_fplume_137_ptr_array(cdata%thrd_no)%p => physics%coupling%max_fplume(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        rho_dry_138_ptr_array(cdata%thrd_no)%p => physics%coupling%rho_dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%rrfs_sd)) then
        uspdavg_139_ptr_array(cdata%thrd_no)%p => physics%coupling%uspdavg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        hpbl_thetav_140_ptr_array(cdata%thrd_no)%p => physics%coupling%hpbl_thetav(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        drydep_flux_out_141_ptr_array(cdata%thrd_no)%p => physics%coupling%drydep_flux(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%ndvel)
      end if

      if ((physics%model%rrfs_sd)) then
        wetdpr_142_ptr_array(cdata%thrd_no)%p => physics%coupling%wetdpr_flux(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nchem)
      end if

      if ((physics%model%rrfs_sd)) then
        hwp_143_ptr_array(cdata%thrd_no)%p => physics%coupling%rrfs_hwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        hwp_ave_144_ptr_array(cdata%thrd_no)%p => physics%coupling%rrfs_hwp_ave(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        wetness_45_ptr_array(cdata%thrd_no)%p => physics%sfcprop%wetness(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        ddvel_inout_145_ptr_array(cdata%thrd_no)%p => physics%coupling%ddvel(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%ndvel)
      end if

      if ((physics%model%rrfs_sd)) then
        peak_hr_out_146_ptr_array(cdata%thrd_no)%p => physics%sfcprop%peak_hr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        lu_nofire_out_147_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lu_nofire(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        lu_qfire_out_148_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lu_qfire(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        fire_heat_flux_out_57_ptr_array(cdata%thrd_no)%p => physics%sfcprop%fire_heat_flux(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        frac_grid_burned_out_58_ptr_array(cdata%thrd_no)%p => physics%sfcprop%frac_grid_burned(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cpl_fire)) then
        smoke_fire_149_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smoke_fire(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call rrfs_smoke_wrapper_run(im=physics%model%blksz(cdata%blk_no),flag_init=physics%model%first_time_step, &
                  kte=physics%model%levs,kme=physics%model%levsp1,ktau=physics%model%kdt, &
                  dt=physics%model%dtp,garea=physics%grid%area(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  land=physics%interstitial(cdata%thrd_no)%islmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  jdate=physics%model%jdat(one:8),u10m=physics%diag%u10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10m=physics%diag%v10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ustar=physics%sfcprop%uustar(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rlat=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rlon=physics%grid%xlon(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tskin=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  pb2d=physics%tbd%hpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t2m=physics%sfcprop%t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dpt2m=physics%diag%dpt2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  pr3d=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  ph3d=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  phl3d=physics%statein%phil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prl3d=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tk3d=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  us3d=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  vs3d=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  spechum=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  w=physics%statein%vvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  nsoil=physics%model%lsoil_lsm,smc=smois_38_ptr_array(cdata%thrd_no)%p,tslb=tslb_39_ptr_array(cdata%thrd_no)%p, &
                  vegtype_dom=physics%sfcprop%vtype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  soiltyp=physics%sfcprop%stype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  nlcat=physics%model%nvegcat,vegtype_frac=physics%sfcprop%vegtype_frac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nvegcat), &
                  dswsfc=physics%diag%dswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorl=physics%sfcprop%zorl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snow=physics%sfcprop%snowd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  julian=physics%model%julian,recmol=physics%sfcprop%rmol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  idat=physics%model%idat(one:8),rain_cpl=physics%diag%rain(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rainc_cpl=physics%diag%rainc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hf2d=physics%interstitial(cdata%thrd_no)%dtsfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  g=con_g,pi=con_pi,con_cp=con_cp,con_rd=con_rd,con_fv=con_fvirt,dust12m_in=dust12m_in_120_ptr_array(cdata%thrd_no)%p, &
                  emi_ant_in=emi_ant_in_121_ptr_array(cdata%thrd_no)%p,smoke_rrfs=smoke_rrfs_122_ptr_array(cdata%thrd_no)%p, &
                  smoke2d_rrfs=smoke2d_rrfs_123_ptr_array(cdata%thrd_no)%p,ntrac=physics%model%ntrac, &
                  qgrs=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  chem3d=chem3d_124_ptr_array(cdata%thrd_no)%p,tile_num=physics%model%tile_num, &
                  ntsmoke=physics%model%ntsmoke,ntfsmoke=physics%model%ntfsmoke,ntdust=physics%model%ntdust, &
                  ntcoarsepm=physics%model%ntcoarsepm,imp_physics=physics%model%imp_physics, &
                  imp_physics_thompson=physics%model%imp_physics_thompson,nwfa=nwfa_125_ptr_array(cdata%thrd_no)%p, &
                  nifa=nifa_126_ptr_array(cdata%thrd_no)%p,emanoc=emanoc_127_ptr_array(cdata%thrd_no)%p, &
                  emdust=emdust_128_ptr_array(cdata%thrd_no)%p,emseas=emseas_129_ptr_array(cdata%thrd_no)%p, &
                  ebb_smoke_in=ebb_smoke_in_130_ptr_array(cdata%thrd_no)%p,frp_output=frp_output_131_ptr_array(cdata%thrd_no)%p, &
                  coef_bb=coef_bb_132_ptr_array(cdata%thrd_no)%p,fire_type_out=fire_type_out_133_ptr_array(cdata%thrd_no)%p, &
                  ebu_smoke=ebu_smoke_134_ptr_array(cdata%thrd_no)%p,fhist=fhist_135_ptr_array(cdata%thrd_no)%p, &
                  min_fplume=min_fplume_136_ptr_array(cdata%thrd_no)%p,max_fplume=max_fplume_137_ptr_array(cdata%thrd_no)%p, &
                  mpicomm=physics%model%communicator,mpirank=physics%model%me,mpiroot=physics%model%master, &
                  rho_dry=rho_dry_138_ptr_array(cdata%thrd_no)%p,uspdavg=uspdavg_139_ptr_array(cdata%thrd_no)%p, &
                  hpbl_thetav=hpbl_thetav_140_ptr_array(cdata%thrd_no)%p,drydep_flux_out=drydep_flux_out_141_ptr_array(cdata%thrd_no)%p, &
                  wetdpr=wetdpr_142_ptr_array(cdata%thrd_no)%p,hwp=hwp_143_ptr_array(cdata%thrd_no)%p, &
                  hwp_ave=hwp_ave_144_ptr_array(cdata%thrd_no)%p,wetness=wetness_45_ptr_array(cdata%thrd_no)%p, &
                  ndvel=physics%model%ndvel,ddvel_inout=ddvel_inout_145_ptr_array(cdata%thrd_no)%p, &
                  peak_hr_out=peak_hr_out_146_ptr_array(cdata%thrd_no)%p,lu_nofire_out=lu_nofire_out_147_ptr_array(cdata%thrd_no)%p, &
                  lu_qfire_out=lu_qfire_out_148_ptr_array(cdata%thrd_no)%p,fire_heat_flux_out=fire_heat_flux_out_57_ptr_array(cdata%thrd_no)%p, &
                  frac_grid_burned_out=frac_grid_burned_out_58_ptr_array(cdata%thrd_no)%p, &
                  oro=physics%sfcprop%oro(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  smoke_fire=smoke_fire_149_ptr_array(cdata%thrd_no)%p,totprcp=physics%diag%totprcp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cpl_fire=physics%model%cpl_fire,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(smois_38_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(tslb_39_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(dust12m_in_120_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(emi_ant_in_121_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(smoke_rrfs_122_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(smoke2d_rrfs_123_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(chem3d_124_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntwa > 0)) then
        nullify(nwfa_125_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntia > 0)) then
        nullify(nifa_126_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(emanoc_127_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(emdust_128_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(emseas_129_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(ebb_smoke_in_130_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(frp_output_131_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(coef_bb_132_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(fire_type_out_133_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(ebu_smoke_134_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(fhist_135_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(min_fplume_136_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(max_fplume_137_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(rho_dry_138_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(uspdavg_139_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(hpbl_thetav_140_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(drydep_flux_out_141_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(wetdpr_142_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(hwp_143_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(hwp_ave_144_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(wetness_45_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(ddvel_inout_145_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(peak_hr_out_146_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(lu_nofire_out_147_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(lu_qfire_out_148_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(fire_heat_flux_out_57_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(frac_grid_burned_out_58_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cpl_fire)) then
        nullify(smoke_fire_149_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrfs_smoke_wrapper_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ntlnc > 0)) then
        qgrs_cloud_droplet_num_conc_150_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntlnc)
      end if

      if ((physics%model%ntwa > 0)) then
        nwfa_125_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntwa)
      end if

      if ((physics%model%ntia > 0)) then
        nifa_126_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntia)
      end if

      if (( physics%model%ntccn > 0 )) then
        qgrs_cccn_151_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntccn)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dusfc_cice_152_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvsfc_cice_153_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dtsfc_cice_154_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dqsfc_cice_155_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dusfci_cpl_156_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvsfci_cpl_157_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        dtsfci_cpl_158_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        dqsfci_cpl_159_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dusfc_cpl_160_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvsfc_cpl_161_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dtsfc_cpl_162_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dqsfc_cpl_163_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnedmf)) then
        qke_164_ptr_array(cdata%thrd_no)%p => physics%tbd%qke(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if (( physics%model%ntke > 0 )) then
        qke_adv_165_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntke)
      end if

      if ((physics%model%do_mynnedmf)) then
        tsq_166_ptr_array(cdata%thrd_no)%p => physics%tbd%tsq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        qsq_167_ptr_array(cdata%thrd_no)%p => physics%tbd%qsq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        cov_168_ptr_array(cdata%thrd_no)%p => physics%tbd%cov(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        el_pbl_169_ptr_array(cdata%thrd_no)%p => physics%tbd%el_pbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        sh3d_170_ptr_array(cdata%thrd_no)%p => physics%tbd%sh3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        sm3d_171_ptr_array(cdata%thrd_no)%p => physics%tbd%sm3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        exch_h_172_ptr_array(cdata%thrd_no)%p => physics%diag%exch_h(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        exch_m_173_ptr_array(cdata%thrd_no)%p => physics%diag%exch_m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        dqke_174_ptr_array(cdata%thrd_no)%p => physics%diag%dqke(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        qwt_175_ptr_array(cdata%thrd_no)%p => physics%diag%qwt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        qshear_176_ptr_array(cdata%thrd_no)%p => physics%diag%qshear(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        qbuoy_177_ptr_array(cdata%thrd_no)%p => physics%diag%qbuoy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        qdiss_178_ptr_array(cdata%thrd_no)%p => physics%diag%qdiss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        qc_bl_179_ptr_array(cdata%thrd_no)%p => physics%tbd%qc_bl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        qi_bl_180_ptr_array(cdata%thrd_no)%p => physics%tbd%qi_bl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        cldfra_bl_181_ptr_array(cdata%thrd_no)%p => physics%tbd%cldfra_bl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        edmf_a_182_ptr_array(cdata%thrd_no)%p => physics%diag%edmf_a(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        edmf_w_183_ptr_array(cdata%thrd_no)%p => physics%diag%edmf_w(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        edmf_qt_184_ptr_array(cdata%thrd_no)%p => physics%diag%edmf_qt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        edmf_thl_185_ptr_array(cdata%thrd_no)%p => physics%diag%edmf_thl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        edmf_ent_186_ptr_array(cdata%thrd_no)%p => physics%diag%edmf_ent(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        edmf_qc_187_ptr_array(cdata%thrd_no)%p => physics%diag%edmf_qc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        sub_thl_188_ptr_array(cdata%thrd_no)%p => physics%diag%sub_thl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        sub_sqv_189_ptr_array(cdata%thrd_no)%p => physics%diag%sub_sqv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        det_thl_190_ptr_array(cdata%thrd_no)%p => physics%diag%det_thl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        det_sqv_191_ptr_array(cdata%thrd_no)%p => physics%diag%det_sqv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        maxwidth_192_ptr_array(cdata%thrd_no)%p => physics%diag%maxwidth(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnedmf)) then
        maxmf_193_ptr_array(cdata%thrd_no)%p => physics%diag%maxmf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnedmf)) then
        ztop_plume_194_ptr_array(cdata%thrd_no)%p => physics%diag%ztop_plume(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnedmf)) then
        ktop_plume_195_ptr_array(cdata%thrd_no)%p => physics%diag%ktop_plume(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%ntsw > 0)) then
        dqdt_snow_196_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsw)
      end if

      if (( physics%model%ntoz > 0 )) then
        dqdt_ozone_197_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntoz)
      end if

      if ((physics%model%ntlnc > 0)) then
        dqdt_cloud_droplet_num_conc_198_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntlnc)
      end if

      if ((physics%model%ntinc > 0)) then
        dqdt_ice_num_conc_199_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntinc)
      end if

      if ((physics%model%ntwa > 0)) then
        dqdt_water_aer_num_conc_200_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntwa)
      end if

      if ((physics%model%ntia > 0)) then
        dqdt_ice_aer_num_conc_201_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntia)
      end if

      if (( physics%model%ntccn > 0 )) then
        dqdt_cccn_202_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntccn)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_18_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%rrfs_sd)) then
        chem3d_124_ptr_array(cdata%thrd_no)%p => physics%coupling%chem3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nchem)
      end if

      if ((physics%model%rrfs_sd)) then
        frp_output_131_ptr_array(cdata%thrd_no)%p => physics%sfcprop%frp_output(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        ddvel_inout_145_ptr_array(cdata%thrd_no)%p => physics%coupling%ddvel(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%ndvel)
      end if

      if ((physics%model%do_spp)) then
        spp_wts_pbl_203_ptr_array(cdata%thrd_no)%p => physics%coupling%spp_wts_pbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call mynnedmf_wrapper_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,flag_init=physics%model%first_time_step, &
                  flag_restart=physics%model%restart,lssav=physics%model%lssav,ldiag3d=physics%model%ldiag3d, &
                  qdiag3d=physics%model%qdiag3d,lsidea=physics%model%lsidea,cplflx=physics%model%cplflx, &
                  delt=physics%model%dtp,dtf=physics%model%dtf,dx=physics%grid%dx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorl=physics%sfcprop%zorl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  u=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  v=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  omega=physics%statein%vvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  t3d=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  qgrs_water_vapor=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  qgrs_liquid_cloud=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntcw), &
                  qgrs_ice=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  qgrs_snow=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsw), &
                  qgrs_cloud_droplet_num_conc=qgrs_cloud_droplet_num_conc_150_ptr_array(cdata%thrd_no)%p, &
                  qgrs_cloud_ice_num_conc=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntinc), &
                  qgrs_ozone=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntoz), &
                  qgrs_water_aer_num_conc=nwfa_125_ptr_array(cdata%thrd_no)%p,qgrs_ice_aer_num_conc=nifa_126_ptr_array(cdata%thrd_no)%p, &
                  qgrs_cccn=qgrs_cccn_151_ptr_array(cdata%thrd_no)%p,prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  exner=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  slmsk=physics%sfcprop%slmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qsfc=physics%sfcprop%qss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ps=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ust=physics%sfcprop%uustar(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ch=physics%diag%cmm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx=physics%interstitial(cdata%thrd_no)%hflxq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qflx=physics%sfcprop%evap(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wspd=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rb=physics%interstitial(cdata%thrd_no)%rb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtsfc1=physics%interstitial(cdata%thrd_no)%dtsfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dqsfc1=physics%interstitial(cdata%thrd_no)%dqsfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dusfc1=physics%interstitial(cdata%thrd_no)%dusfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvsfc1=physics%interstitial(cdata%thrd_no)%dvsfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dusfci_diag=physics%diag%dusfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvsfci_diag=physics%diag%dvsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtsfci_diag=physics%diag%dtsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dqsfci_diag=physics%diag%dqsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dusfc_diag=physics%diag%dusfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvsfc_diag=physics%diag%dvsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtsfc_diag=physics%diag%dtsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dqsfc_diag=physics%diag%dqsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dusfc_cice=dusfc_cice_152_ptr_array(cdata%thrd_no)%p,dvsfc_cice=dvsfc_cice_153_ptr_array(cdata%thrd_no)%p, &
                  dtsfc_cice=dtsfc_cice_154_ptr_array(cdata%thrd_no)%p,dqsfc_cice=dqsfc_cice_155_ptr_array(cdata%thrd_no)%p, &
                  hflx_wat=physics%interstitial(cdata%thrd_no)%hflx_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qflx_wat=physics%interstitial(cdata%thrd_no)%evap_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress_wat=physics%interstitial(cdata%thrd_no)%stress_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oceanfrac=physics%sfcprop%oceanfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fice=physics%sfcprop%fice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dusfci_cpl=dusfci_cpl_156_ptr_array(cdata%thrd_no)%p,dvsfci_cpl=dvsfci_cpl_157_ptr_array(cdata%thrd_no)%p, &
                  dtsfci_cpl=dtsfci_cpl_158_ptr_array(cdata%thrd_no)%p,dqsfci_cpl=dqsfci_cpl_159_ptr_array(cdata%thrd_no)%p, &
                  dusfc_cpl=dusfc_cpl_160_ptr_array(cdata%thrd_no)%p,dvsfc_cpl=dvsfc_cpl_161_ptr_array(cdata%thrd_no)%p, &
                  dtsfc_cpl=dtsfc_cpl_162_ptr_array(cdata%thrd_no)%p,dqsfc_cpl=dqsfc_cpl_163_ptr_array(cdata%thrd_no)%p, &
                  recmol=physics%sfcprop%rmol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qke=qke_164_ptr_array(cdata%thrd_no)%p,qke_adv=qke_adv_165_ptr_array(cdata%thrd_no)%p, &
                  tsq=tsq_166_ptr_array(cdata%thrd_no)%p,qsq=qsq_167_ptr_array(cdata%thrd_no)%p, &
                  cov=cov_168_ptr_array(cdata%thrd_no)%p,el_pbl=el_pbl_169_ptr_array(cdata%thrd_no)%p, &
                  sh3d=sh3d_170_ptr_array(cdata%thrd_no)%p,sm3d=sm3d_171_ptr_array(cdata%thrd_no)%p, &
                  exch_h=exch_h_172_ptr_array(cdata%thrd_no)%p,exch_m=exch_m_173_ptr_array(cdata%thrd_no)%p, &
                  dqke=dqke_174_ptr_array(cdata%thrd_no)%p,qwt=qwt_175_ptr_array(cdata%thrd_no)%p, &
                  qshear=qshear_176_ptr_array(cdata%thrd_no)%p,qbuoy=qbuoy_177_ptr_array(cdata%thrd_no)%p, &
                  qdiss=qdiss_178_ptr_array(cdata%thrd_no)%p,pblh=physics%tbd%hpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kpbl=physics%interstitial(cdata%thrd_no)%kpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qc_bl=qc_bl_179_ptr_array(cdata%thrd_no)%p,qi_bl=qi_bl_180_ptr_array(cdata%thrd_no)%p, &
                  cldfra_bl=cldfra_bl_181_ptr_array(cdata%thrd_no)%p,edmf_a=edmf_a_182_ptr_array(cdata%thrd_no)%p, &
                  edmf_w=edmf_w_183_ptr_array(cdata%thrd_no)%p,edmf_qt=edmf_qt_184_ptr_array(cdata%thrd_no)%p, &
                  edmf_thl=edmf_thl_185_ptr_array(cdata%thrd_no)%p,edmf_ent=edmf_ent_186_ptr_array(cdata%thrd_no)%p, &
                  edmf_qc=edmf_qc_187_ptr_array(cdata%thrd_no)%p,sub_thl=sub_thl_188_ptr_array(cdata%thrd_no)%p, &
                  sub_sqv=sub_sqv_189_ptr_array(cdata%thrd_no)%p,det_thl=det_thl_190_ptr_array(cdata%thrd_no)%p, &
                  det_sqv=det_sqv_191_ptr_array(cdata%thrd_no)%p,maxwidth=maxwidth_192_ptr_array(cdata%thrd_no)%p, &
                  maxmf=maxmf_193_ptr_array(cdata%thrd_no)%p,ztop_plume=ztop_plume_194_ptr_array(cdata%thrd_no)%p, &
                  ktop_plume=ktop_plume_195_ptr_array(cdata%thrd_no)%p,dudt=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtdt=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dqdt_all=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dqdt_water_vapor=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  dqdt_liquid_cloud=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntcw), &
                  dqdt_ice=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  dqdt_snow=dqdt_snow_196_ptr_array(cdata%thrd_no)%p,dqdt_ozone=dqdt_ozone_197_ptr_array(cdata%thrd_no)%p, &
                  dqdt_cloud_droplet_num_conc=dqdt_cloud_droplet_num_conc_198_ptr_array(cdata%thrd_no)%p, &
                  dqdt_ice_num_conc=dqdt_ice_num_conc_199_ptr_array(cdata%thrd_no)%p,dqdt_water_aer_num_conc=dqdt_water_aer_num_conc_200_ptr_array(cdata%thrd_no)%p, &
                  dqdt_ice_aer_num_conc=dqdt_ice_aer_num_conc_201_ptr_array(cdata%thrd_no)%p, &
                  dqdt_cccn=dqdt_cccn_202_ptr_array(cdata%thrd_no)%p,tmf=physics%interstitial(cdata%thrd_no)%dvdftra(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nvdiff), &
                  flag_for_pbl_generic_tend=physics%model%flag_for_pbl_generic_tend,dtend=dtend_18_ptr_array(cdata%thrd_no)%p, &
                  dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_temperature=physics%model%index_of_temperature,index_of_x_wind=physics%model%index_of_x_wind, &
                  index_of_y_wind=physics%model%index_of_y_wind,ntke=physics%model%ntke,ntoz=physics%model%ntoz, &
                  ntqv=physics%model%ntqv,ntcw=physics%model%ntcw,ntiw=physics%model%ntiw, &
                  ntsw=physics%model%ntsw,ntlnc=physics%model%ntlnc,ntinc=physics%model%ntinc, &
                  ntwa=physics%model%ntwa,ntia=physics%model%ntia,index_of_process_pbl=physics%model%index_of_process_pbl, &
                  htrsw=physics%radtend%htrsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  htrlw=physics%radtend%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  xmu=physics%interstitial(cdata%thrd_no)%xmu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tke_budget=physics%model%tke_budget,bl_mynn_tkeadvect=physics%model%bl_mynn_tkeadvect, &
                  bl_mynn_cloudpdf=physics%model%bl_mynn_cloudpdf,bl_mynn_mixlength=physics%model%bl_mynn_mixlength, &
                  bl_mynn_edmf=physics%model%bl_mynn_edmf,bl_mynn_edmf_mom=physics%model%bl_mynn_edmf_mom, &
                  bl_mynn_edmf_tke=physics%model%bl_mynn_edmf_tke,bl_mynn_cloudmix=physics%model%bl_mynn_cloudmix, &
                  bl_mynn_mixqt=physics%model%bl_mynn_mixqt,bl_mynn_output=physics%model%bl_mynn_output, &
                  bl_mynn_closure=physics%model%bl_mynn_closure,icloud_bl=physics%model%icloud_bl, &
                  do_mynnsfclay=physics%model%do_mynnsfclay,imp_physics=physics%model%imp_physics, &
                  imp_physics_gfdl=physics%model%imp_physics_gfdl,imp_physics_thompson=physics%model%imp_physics_thompson, &
                  imp_physics_wsm6=physics%model%imp_physics_wsm6,imp_physics_fa=physics%model%imp_physics_fer_hires, &
                  imp_physics_nssl=physics%model%imp_physics_nssl,imfdeepcnv=physics%model%imfdeepcnv, &
                  imfdeepcnv_c3=physics%model%imfdeepcnv_c3,imfdeepcnv_samf=physics%model%imfdeepcnv_samf, &
                  nssl_ccn_on=physics%model%nssl_ccn_on,chem3d=chem3d_124_ptr_array(cdata%thrd_no)%p, &
                  frp=frp_output_131_ptr_array(cdata%thrd_no)%p,rrfs_sd=physics%model%rrfs_sd, &
                  mix_chem=physics%model%mix_chem,enh_mix=physics%model%enh_mix,nchem=physics%model%nchem, &
                  ndvel=physics%model%ndvel,vdep=ddvel_inout_145_ptr_array(cdata%thrd_no)%p, &
                  smoke_dbg=physics%model%rrfs_smoke_debug,ltaerosol=physics%model%ltaerosol, &
                  mraerosol=physics%model%mraerosol,spp_wts_pbl=spp_wts_pbl_203_ptr_array(cdata%thrd_no)%p, &
                  spp_pbl=physics%model%spp_pbl,lprnt=physics%model%lprnt,huge=physics%model%huge, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ntlnc > 0)) then
        nullify(qgrs_cloud_droplet_num_conc_150_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntwa > 0)) then
        nullify(nwfa_125_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntia > 0)) then
        nullify(nifa_126_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntccn > 0 )) then
        nullify(qgrs_cccn_151_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dusfc_cice_152_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvsfc_cice_153_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dtsfc_cice_154_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dqsfc_cice_155_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dusfci_cpl_156_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvsfci_cpl_157_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(dtsfci_cpl_158_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(dqsfci_cpl_159_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dusfc_cpl_160_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvsfc_cpl_161_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dtsfc_cpl_162_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dqsfc_cpl_163_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(qke_164_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntke > 0 )) then
        nullify(qke_adv_165_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(tsq_166_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(qsq_167_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(cov_168_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(el_pbl_169_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(sh3d_170_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(sm3d_171_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(exch_h_172_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(exch_m_173_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        nullify(dqke_174_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        nullify(qwt_175_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        nullify(qshear_176_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        nullify(qbuoy_177_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        nullify(qdiss_178_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(qc_bl_179_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(qi_bl_180_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(cldfra_bl_181_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(edmf_a_182_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(edmf_w_183_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(edmf_qt_184_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(edmf_thl_185_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(edmf_ent_186_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(edmf_qc_187_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(sub_thl_188_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(sub_sqv_189_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(det_thl_190_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(det_sqv_191_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(maxwidth_192_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(maxmf_193_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(ztop_plume_194_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(ktop_plume_195_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntsw > 0)) then
        nullify(dqdt_snow_196_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntoz > 0 )) then
        nullify(dqdt_ozone_197_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntlnc > 0)) then
        nullify(dqdt_cloud_droplet_num_conc_198_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntinc > 0)) then
        nullify(dqdt_ice_num_conc_199_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntwa > 0)) then
        nullify(dqdt_water_aer_num_conc_200_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntia > 0)) then
        nullify(dqdt_ice_aer_num_conc_201_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntccn > 0 )) then
        nullify(dqdt_cccn_202_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_18_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(chem3d_124_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(frp_output_131_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(ddvel_inout_145_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_spp)) then
        nullify(spp_wts_pbl_203_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in mynnedmf_wrapper_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call mynnedmf_wrapper_post_run(tend_opt_pbl=physics%model%tend_opt_pbl,im=physics%model%blksz(cdata%blk_no), &
                  levs=physics%model%levs,ntrac=physics%model%ntrac,dtp=physics%model%dtp, &
                  ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  ten_t_pbl=physics%interstitial(cdata%thrd_no)%ten_t_pbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q_pbl=physics%interstitial(cdata%thrd_no)%ten_q_pbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gt0=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gu0=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gv0=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dtdt=physics%interstitial(cdata%thrd_no)%dtdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dudt=physics%interstitial(cdata%thrd_no)%dudt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt=physics%interstitial(cdata%thrd_no)%dvdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dqdt=physics%interstitial(cdata%thrd_no)%dqdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in mynnedmf_wrapper_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%rrfs_sd)) then
        chem3d_124_ptr_array(cdata%thrd_no)%p => physics%coupling%chem3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nchem)
      end if

      call rrfs_smoke_postpbl_run(ite=physics%model%blksz(cdata%blk_no),kte=physics%model%levs,ntsmoke=physics%model%ntsmoke, &
                  ntdust=physics%model%ntdust,ntcoarsepm=physics%model%ntcoarsepm,ntrac=physics%model%ntrac, &
                  qgrs=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  chem3d=chem3d_124_ptr_array(cdata%thrd_no)%p,rrfs_sd=physics%model%rrfs_sd, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%rrfs_sd)) then
        nullify(chem3d_124_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrfs_smoke_postpbl_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        varss_204_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%varss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        ocss_205_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ocss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        oa4ss_206_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%oa4ss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        clxss_207_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%clxss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      call gfs_gwd_generic_pre_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,nmtvr=physics%model%nmtvr, &
                  mntvar=physics%sfcprop%hprime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nmtvr), &
                  oc=physics%interstitial(cdata%thrd_no)%oc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oa4=physics%interstitial(cdata%thrd_no)%oa4(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  clx=physics%interstitial(cdata%thrd_no)%clx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  theta=physics%interstitial(cdata%thrd_no)%theta(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  varss=varss_204_ptr_array(cdata%thrd_no)%p,ocss=ocss_205_ptr_array(cdata%thrd_no)%p, &
                  oa4ss=oa4ss_206_ptr_array(cdata%thrd_no)%p,clxss=clxss_207_ptr_array(cdata%thrd_no)%p, &
                  sigma=physics%interstitial(cdata%thrd_no)%sigma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gamma=physics%interstitial(cdata%thrd_no)%gamma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  elvmax=physics%interstitial(cdata%thrd_no)%elvmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(varss_204_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(ocss_205_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(oa4ss_206_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(clxss_207_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_gwd_generic_pre_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        varss_204_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%varss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        ocss_205_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ocss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        oa4ss_206_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%oa4ss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        clxss_207_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%clxss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtauy2d_ms_208_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtaux2d_bl_209_ptr_array(cdata%thrd_no)%p => physics%diag%dudt_obl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtauy2d_bl_210_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_obl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtaux2d_ss_211_ptr_array(cdata%thrd_no)%p => physics%diag%dudt_oss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtauy2d_ss_212_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_oss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtaux2d_fd_213_ptr_array(cdata%thrd_no)%p => physics%diag%dudt_ofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtauy2d_fd_214_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_ofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dusfc_ms_215_ptr_array(cdata%thrd_no)%p => physics%diag%du_ogwcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvsfc_ms_216_ptr_array(cdata%thrd_no)%p => physics%diag%dv_ogwcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dusfc_bl_217_ptr_array(cdata%thrd_no)%p => physics%diag%du_oblcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvsfc_bl_218_ptr_array(cdata%thrd_no)%p => physics%diag%dv_oblcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dusfc_ss_219_ptr_array(cdata%thrd_no)%p => physics%diag%du_osscol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvsfc_ss_220_ptr_array(cdata%thrd_no)%p => physics%diag%dv_osscol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dusfc_fd_221_ptr_array(cdata%thrd_no)%p => physics%diag%du_ofdcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvsfc_fd_222_ptr_array(cdata%thrd_no)%p => physics%diag%dv_ofdcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%ldiag3d)) then
        dtend_18_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%do_spp)) then
        spp_wts_gwd_223_ptr_array(cdata%thrd_no)%p => physics%coupling%spp_wts_gwd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call drag_suite_run(im=physics%model%blksz(cdata%blk_no),km=physics%model%levs,dvdt=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dudt=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtdt=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dqdt=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  u1=physics%statein%ugrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  v1=physics%statein%vgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  t1=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  q1=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  kpbl=physics%interstitial(cdata%thrd_no)%kpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  del=physics%interstitial(cdata%thrd_no)%del(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prslk=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  phil=physics%statein%phil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  deltim=physics%model%dtp,kdt=physics%model%kdt,var=physics%sfcprop%hprime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  oc1=physics%interstitial(cdata%thrd_no)%oc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oa4=physics%interstitial(cdata%thrd_no)%oa4(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  ol4=physics%interstitial(cdata%thrd_no)%clx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  varss=varss_204_ptr_array(cdata%thrd_no)%p,oc1ss=ocss_205_ptr_array(cdata%thrd_no)%p, &
                  oa4ss=oa4ss_206_ptr_array(cdata%thrd_no)%p,ol4ss=clxss_207_ptr_array(cdata%thrd_no)%p, &
                  theta=physics%interstitial(cdata%thrd_no)%theta(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sigma=physics%interstitial(cdata%thrd_no)%sigma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gamma=physics%interstitial(cdata%thrd_no)%gamma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  elvmax=physics%interstitial(cdata%thrd_no)%elvmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtaux2d_ms=physics%diag%dudt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtauy2d_ms=dtauy2d_ms_208_ptr_array(cdata%thrd_no)%p,dtaux2d_bl=dtaux2d_bl_209_ptr_array(cdata%thrd_no)%p, &
                  dtauy2d_bl=dtauy2d_bl_210_ptr_array(cdata%thrd_no)%p,dtaux2d_ss=dtaux2d_ss_211_ptr_array(cdata%thrd_no)%p, &
                  dtauy2d_ss=dtauy2d_ss_212_ptr_array(cdata%thrd_no)%p,dtaux2d_fd=dtaux2d_fd_213_ptr_array(cdata%thrd_no)%p, &
                  dtauy2d_fd=dtauy2d_fd_214_ptr_array(cdata%thrd_no)%p,dusfc=physics%interstitial(cdata%thrd_no)%dusfcg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvsfc=physics%interstitial(cdata%thrd_no)%dvsfcg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dusfc_ms=dusfc_ms_215_ptr_array(cdata%thrd_no)%p,dvsfc_ms=dvsfc_ms_216_ptr_array(cdata%thrd_no)%p, &
                  dusfc_bl=dusfc_bl_217_ptr_array(cdata%thrd_no)%p,dvsfc_bl=dvsfc_bl_218_ptr_array(cdata%thrd_no)%p, &
                  dusfc_ss=dusfc_ss_219_ptr_array(cdata%thrd_no)%p,dvsfc_ss=dvsfc_ss_220_ptr_array(cdata%thrd_no)%p, &
                  dusfc_fd=dusfc_fd_221_ptr_array(cdata%thrd_no)%p,dvsfc_fd=dvsfc_fd_222_ptr_array(cdata%thrd_no)%p, &
                  slmsk=physics%sfcprop%slmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  br1=physics%interstitial(cdata%thrd_no)%rb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hpbl=physics%tbd%hpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  g=con_g,cp=con_cp,rd=con_rd,rv=con_rv,fv=con_fvirt,pi=con_pi,imx=physics%model%lonr, &
                  cdmbgwd=physics%model%cdmbgwd(one:4),alpha_fd=physics%model%alpha_fd,me=physics%model%me, &
                  master=physics%model%master,lprnt=physics%model%lprnt,ipr=physics%model%ipr, &
                  rdxzb=physics%diag%zmtnblck(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dx=physics%grid%dx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gwd_opt=physics%model%gwd_opt,do_gsl_drag_ls_bl=physics%model%do_gsl_drag_ls_bl, &
                  do_gsl_drag_ss=physics%model%do_gsl_drag_ss,do_gsl_drag_tofd=physics%model%do_gsl_drag_tofd, &
                  flag_for_gwd_generic_tend=physics%model%flag_for_gwd_generic_tend,dtend=dtend_18_ptr_array(cdata%thrd_no)%p, &
                  dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_process_orographic_gwd=physics%model%index_of_process_orographic_gwd, &
                  index_of_temperature=physics%model%index_of_temperature,index_of_x_wind=physics%model%index_of_x_wind, &
                  index_of_y_wind=physics%model%index_of_y_wind,ldiag3d=physics%model%ldiag3d, &
                  ldiag_ugwp=physics%model%ldiag_ugwp,ugwp_seq_update=physics%model%ugwp_seq_update, &
                  spp_wts_gwd=spp_wts_gwd_223_ptr_array(cdata%thrd_no)%p,spp_gwd=physics%model%spp_gwd, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(varss_204_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(ocss_205_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(oa4ss_206_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(clxss_207_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtauy2d_ms_208_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtaux2d_bl_209_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtauy2d_bl_210_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtaux2d_ss_211_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtauy2d_ss_212_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtaux2d_fd_213_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtauy2d_fd_214_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dusfc_ms_215_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvsfc_ms_216_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dusfc_bl_217_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvsfc_bl_218_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dusfc_ss_219_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvsfc_ss_220_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dusfc_fd_221_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvsfc_fd_222_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_18_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_spp)) then
        nullify(spp_wts_gwd_223_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in drag_suite_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ldiag3d)) then
        dtend_18_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      call gfs_gwd_generic_post_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,ntrac=physics%model%ntrac, &
                  tend_opt_gwd=physics%model%tend_opt_gwd,lssav=physics%model%lssav,ldiag3d=physics%model%ldiag3d, &
                  dtf=physics%model%dtf,dtp=physics%model%dtp,dusfcg=physics%interstitial(cdata%thrd_no)%dusfcg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvsfcg=physics%interstitial(cdata%thrd_no)%dvsfcg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dudt=physics%interstitial(cdata%thrd_no)%dudt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt=physics%interstitial(cdata%thrd_no)%dvdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtdt=physics%interstitial(cdata%thrd_no)%dtdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dqdt=physics%interstitial(cdata%thrd_no)%dqdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dugwd=physics%diag%dugwd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvgwd=physics%diag%dvgwd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gt0=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  gu0=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gv0=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtend=dtend_18_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_temperature=physics%model%index_of_temperature,index_of_x_wind=physics%model%index_of_x_wind, &
                  index_of_y_wind=physics%model%index_of_y_wind,index_of_process_orographic_gwd=physics%model%index_of_process_orographic_gwd, &
                  flag_for_gwd_generic_tend=physics%model%flag_for_gwd_generic_tend,errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)


      if ((physics%model%ldiag3d)) then
        nullify(dtend_18_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_gwd_generic_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    



   end function scm_hrrr_gf_phys_ps_run_cap

   function scm_hrrr_gf_phys_ps_final_cap(one,physics,cdata) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t

      implicit none

      ! Error handling
      integer :: ierr

      integer, intent(in), target :: one
      type(physics_type), intent(in), target :: physics
      type(ccpp_t), intent(inout), target :: cdata

      ierr = 0


      if (.not.initialized(cdata%ccpp_instance)) return



      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      


      call lsm_ruc_finalize(errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in lsm_ruc_finalize: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized = .false.


   end function scm_hrrr_gf_phys_ps_final_cap

end module ccpp_scm_hrrr_gf_phys_ps_cap
