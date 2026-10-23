
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
module ccpp_scm_hrrr_gf_ps_phys_ps_cap

   use gfs_surface_generic_pre, only: gfs_surface_generic_pre_init
   use scm_sfc_flux_spec, only: scm_sfc_flux_spec_init
   use rrfs_smoke_wrapper, only: rrfs_smoke_wrapper_init
   use mynnedmf_wrapper, only: mynnedmf_wrapper_init
   use drag_suite, only: drag_suite_init
   use get_prs_fv3, only: get_prs_fv3_run
   use gfs_suite_interstitial_1, only: gfs_suite_interstitial_1_run
   use gfs_surface_generic_pre, only: gfs_surface_generic_pre_run
   use scm_sfc_flux_spec, only: scm_sfc_flux_spec_run
   use dcyc2t3, only: dcyc2t3_run
   use gfs_suite_interstitial_2, only: gfs_suite_interstitial_2_run
   use rrfs_smoke_wrapper, only: rrfs_smoke_wrapper_run
   use mynnedmf_wrapper, only: mynnedmf_wrapper_run
   use mynnedmf_wrapper_post, only: mynnedmf_wrapper_post_run
   use rrfs_smoke_postpbl, only: rrfs_smoke_postpbl_run
   use gfs_gwd_generic_pre, only: gfs_gwd_generic_pre_run
   use drag_suite, only: drag_suite_run
   use gfs_gwd_generic_post, only: gfs_gwd_generic_post_run


   implicit none

   private
   public :: scm_hrrr_gf_ps_phys_ps_tsinit_cap, &
             scm_hrrr_gf_ps_phys_ps_tsfinal_cap, &
             scm_hrrr_gf_ps_phys_ps_init_cap, &
             scm_hrrr_gf_ps_phys_ps_run_cap, &
             scm_hrrr_gf_ps_phys_ps_final_cap

   logical, dimension(200), save :: initialized = .false.

   contains

   function scm_hrrr_gf_ps_phys_ps_tsinit_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_hrrr_gf_ps_phys_ps_tsinit_cap

   function scm_hrrr_gf_ps_phys_ps_tsfinal_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_hrrr_gf_ps_phys_ps_tsfinal_cap

   function scm_hrrr_gf_ps_phys_ps_init_cap(one,physics,cdata,con_cp,con_g,con_rd,con_rv,con_cvap,con_cliq,con_csol, &
                  con_rocp,con_hvap,con_hfus,con_fvirt,con_eps,karman,con_t0c) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t
      use machine, only: kind_phys

      implicit none

      ! Error handling
      integer :: ierr

      integer, intent(in), target :: one
      type(physics_type), intent(inout), target :: physics
      type(ccpp_t), intent(inout), target :: cdata
      real(kind_phys), intent(in), target :: con_cp
      real(kind_phys), intent(in), target :: con_g
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: con_rv
      real(kind_phys), intent(in), target :: con_cvap
      real(kind_phys), intent(in), target :: con_cliq
      real(kind_phys), intent(in), target :: con_csol
      real(kind_phys), intent(in), target :: con_rocp
      real(kind_phys), intent(in), target :: con_hvap
      real(kind_phys), intent(in), target :: con_hfus
      real(kind_phys), intent(in), target :: con_fvirt
      real(kind_phys), intent(in), target :: con_eps
      real(kind_phys), intent(in), target :: karman
      real(kind_phys), intent(in), target :: con_t0c

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

    
      


      call scm_sfc_flux_spec_init(lheatstrg=physics%model%lheatstrg,errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in scm_sfc_flux_spec_init: " // trim(cdata%errmsg)
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


   end function scm_hrrr_gf_ps_phys_ps_init_cap

   function scm_hrrr_gf_ps_phys_ps_run_cap(one,physics,cdata,con_fvirt,con_g,con_cp,con_hvap,con_rd,karman,con_tice, &
                  con_pi,con_sbc,con_rv) result(ierr)

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
      real(kind_phys), intent(in), target :: con_cp
      real(kind_phys), intent(in), target :: con_hvap
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: karman
      real(kind_phys), intent(in), target :: con_tice
      real(kind_phys), intent(in), target :: con_pi
      real(kind_phys), intent(in), target :: con_sbc
      real(kind_phys), intent(in), target :: con_rv
      
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
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sfculw_med_6_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxlwup_jac_7_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: flux2d_lwup_8_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: flux2d_lwdown_9_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tsfc_radtime_10_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtdtnp_11_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: htrlw_12_ptr_array
      type :: real_kind_phys_rank3_ptr_arr_type
         real(kind_phys), dimension(:,:,:), pointer :: p => null()
      end type real_kind_phys_rank3_ptr_arr_type
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtend_13_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ulwsfc_cice_14_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smc_15_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tslb_16_ptr_array
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dust12m_in_17_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: emi_ant_in_18_ptr_array
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smoke_rrfs_19_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smoke2d_rrfs_20_ptr_array
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: chem3d_21_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nwfa_22_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nifa_23_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: emanoc_24_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: emdust_25_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: emseas_26_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ebb_smoke_in_27_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: frp_output_28_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: coef_bb_29_ptr_array
      type :: integer_default_kind_rank1_ptr_arr_type
         integer, dimension(:), pointer :: p => null()
      end type integer_default_kind_rank1_ptr_arr_type
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fire_type_out_30_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ebu_smoke_31_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fhist_32_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: min_fplume_33_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: max_fplume_34_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rho_dry_35_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: uspdavg_36_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: hpbl_thetav_37_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: drydep_flux_out_38_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wetdpr_39_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: hwp_40_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: hwp_ave_41_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wetness_42_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddvel_inout_43_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: peak_hr_out_44_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lu_nofire_out_45_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lu_qfire_out_46_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fire_heat_flux_out_47_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: frac_grid_burned_out_48_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smoke_fire_49_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qgrs_cloud_droplet_num_conc_50_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qgrs_cccn_51_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_cice_52_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_cice_53_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfc_cice_54_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfc_cice_55_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfci_cpl_56_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfci_cpl_57_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfci_cpl_58_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfci_cpl_59_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_cpl_60_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_cpl_61_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfc_cpl_62_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfc_cpl_63_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qke_64_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qke_adv_65_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tsq_66_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qsq_67_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cov_68_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: el_pbl_69_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sh3d_70_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sm3d_71_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: exch_h_72_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: exch_m_73_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqke_74_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qwt_75_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qshear_76_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qbuoy_77_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qdiss_78_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qc_bl_79_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qi_bl_80_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cldfra_bl_81_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: edmf_a_82_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: edmf_w_83_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: edmf_qt_84_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: edmf_thl_85_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: edmf_ent_86_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: edmf_qc_87_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sub_thl_88_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sub_sqv_89_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: det_thl_90_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: det_sqv_91_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: maxwidth_92_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: maxmf_93_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ztop_plume_94_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ktop_plume_95_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_snow_96_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_ozone_97_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_cloud_droplet_num_conc_98_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_ice_num_conc_99_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_water_aer_num_conc_100_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_ice_aer_num_conc_101_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_cccn_102_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: spp_wts_pbl_103_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: varss_104_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ocss_105_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: oa4ss_106_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: clxss_107_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtauy2d_ms_108_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtaux2d_bl_109_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtauy2d_bl_110_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtaux2d_ss_111_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtauy2d_ss_112_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtaux2d_fd_113_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtauy2d_fd_114_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_ms_115_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_ms_116_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_bl_117_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_bl_118_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_ss_119_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_ss_120_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_fd_121_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_fd_122_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: spp_wts_gwd_123_ptr_array

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

    
      


      call scm_sfc_flux_spec_run(im=physics%model%blksz(cdata%blk_no),u1=physics%statein%ugrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  v1=physics%statein%vgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  z1=physics%diag%zlvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t1=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  q1=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1,physics%model%ntqv), &
                  p1=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  roughness_length=physics%sfcprop%zorl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  spec_sh_flux=physics%sfcprop%spec_sh_flux(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  spec_lh_flux=physics%sfcprop%spec_lh_flux(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  exner_inverse=physics%interstitial(cdata%thrd_no)%work3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t_surf=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cp=con_cp,grav=con_g,hvap=con_hvap,rd=con_rd,fvirt=con_fvirt,vonkarman=karman, &
                  tgice=con_tice,islmsk=physics%interstitial(cdata%thrd_no)%islmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  frland=physics%interstitial(cdata%thrd_no)%frland(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cice=physics%sfcprop%fice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tisfc=physics%sfcprop%tisfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oceanfrac=physics%sfcprop%oceanfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  min_seaice=physics%model%min_seaice,cplflx=physics%model%cplflx,cplice=physics%model%cplice, &
                  flag_cice=physics%interstitial(cdata%thrd_no)%flag_cice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  min_lakeice=physics%model%min_lakeice,tsfcl=physics%sfcprop%tsfcl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc_wat=physics%interstitial(cdata%thrd_no)%tsfc_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slmsk=physics%sfcprop%slmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lakefrac=physics%sfcprop%lakefrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lkm=physics%model%lkm,lakedepth=physics%sfcprop%lakedepth(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_lake_model=physics%sfcprop%use_lake_model(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sh_flux=physics%sfcprop%hflx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lh_flux=physics%sfcprop%evap(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sh_flux_chs=physics%interstitial(cdata%thrd_no)%hflxq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u_star=physics%sfcprop%uustar(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfc_stress=physics%interstitial(cdata%thrd_no)%stress(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cm=physics%interstitial(cdata%thrd_no)%cd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ch=physics%interstitial(cdata%thrd_no)%cdq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm=physics%sfcprop%ffmm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh=physics%sfcprop%ffhh(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rb=physics%interstitial(cdata%thrd_no)%rb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u10m=physics%diag%u10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10m=physics%diag%v10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wind1=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qss=physics%sfcprop%qss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t2m=physics%sfcprop%t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  q2m=physics%sfcprop%q2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in scm_sfc_flux_spec_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        sfculw_med_6_ptr_array(cdata%thrd_no)%p => physics%coupling%ulwsfcin_med(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_rrtmgp .and. physics%model%use_lw_jacobian)) then
        fluxlwup_jac_7_ptr_array(cdata%thrd_no)%p => physics%coupling%fluxlwup_jac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        flux2d_lwup_8_ptr_array(cdata%thrd_no)%p => physics%coupling%fluxlwup_radtime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        flux2d_lwdown_9_ptr_array(cdata%thrd_no)%p => physics%coupling%fluxlwdown_radtime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        tsfc_radtime_10_ptr_array(cdata%thrd_no)%p => physics%coupling%tsfc_radtime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_sppt .or. physics%model%ca_global)) then
        dtdtnp_11_ptr_array(cdata%thrd_no)%p => physics%tbd%dtdtnp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        htrlw_12_ptr_array(cdata%thrd_no)%p => physics%coupling%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_13_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
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
                  use_med_flux=physics%model%use_med_flux,sfculw_med=sfculw_med_6_ptr_array(cdata%thrd_no)%p, &
                  fluxlwup_jac=fluxlwup_jac_7_ptr_array(cdata%thrd_no)%p,p_lay=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  p_lev=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  flux2d_lwup=flux2d_lwup_8_ptr_array(cdata%thrd_no)%p,flux2d_lwdown=flux2d_lwdown_9_ptr_array(cdata%thrd_no)%p, &
                  pert_radtend=physics%model%pert_radtend,do_sppt=physics%model%do_sppt,ca_global=physics%model%ca_global, &
                  tsfc_radtime=tsfc_radtime_10_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_process_longwave=physics%model%index_of_process_longwave,index_of_process_shortwave=physics%model%index_of_process_shortwave, &
                  index_of_temperature=physics%model%index_of_temperature,dtdtnp=dtdtnp_11_ptr_array(cdata%thrd_no)%p, &
                  htrlw=htrlw_12_ptr_array(cdata%thrd_no)%p,dtend=dtend_13_ptr_array(cdata%thrd_no)%p, &
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
        nullify(sfculw_med_6_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp .and. physics%model%use_lw_jacobian)) then
        nullify(fluxlwup_jac_7_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(flux2d_lwup_8_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(flux2d_lwdown_9_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(tsfc_radtime_10_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_sppt .or. physics%model%ca_global)) then
        nullify(dtdtnp_11_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(htrlw_12_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_13_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in dcyc2t3_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        ulwsfc_cice_14_ptr_array(cdata%thrd_no)%p => physics%coupling%ulwsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_rrtmgp)) then
        htrlw_12_ptr_array(cdata%thrd_no)%p => physics%coupling%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_13_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
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
                  ulwsfc_cice=ulwsfc_cice_14_ptr_array(cdata%thrd_no)%p,lwhd=physics%radtend%lwhd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:6), &
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
                  use_lw_jacobian=physics%model%use_lw_jacobian,htrlwu=htrlw_12_ptr_array(cdata%thrd_no)%p, &
                  adjsfculw=physics%diag%ulwsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfculw_lnd=physics%interstitial(cdata%thrd_no)%adjsfculw_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfculw_ice=physics%interstitial(cdata%thrd_no)%adjsfculw_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjsfculw_wat=physics%interstitial(cdata%thrd_no)%adjsfculw_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dlwsfc=physics%diag%dlwsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ulwsfc=physics%diag%ulwsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  psmean=physics%diag%psmean(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtend=dtend_13_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
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
        nullify(ulwsfc_cice_14_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(htrlw_12_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_13_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_suite_interstitial_2_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        smc_15_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smois(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        tslb_16_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tslb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%rrfs_sd)) then
        dust12m_in_17_ptr_array(cdata%thrd_no)%p => physics%sfcprop%dust12m_in(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:12,one:5)
      end if

      if ((physics%model%rrfs_sd)) then
        emi_ant_in_18_ptr_array(cdata%thrd_no)%p => physics%sfcprop%emi_in(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:1)
      end if

      if ((physics%model%rrfs_sd)) then
        smoke_rrfs_19_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smoke_rrfs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:24,one:2)
      end if

      if ((physics%model%rrfs_sd)) then
        smoke2d_rrfs_20_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smoke2d_rrfs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:5)
      end if

      if ((physics%model%rrfs_sd)) then
        chem3d_21_ptr_array(cdata%thrd_no)%p => physics%coupling%chem3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nchem)
      end if

      if ((physics%model%ntwa > 0)) then
        nwfa_22_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntwa)
      end if

      if ((physics%model%ntia > 0)) then
        nifa_23_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntia)
      end if

      if ((physics%model%rrfs_sd)) then
        emanoc_24_ptr_array(cdata%thrd_no)%p => physics%sfcprop%emanoc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        emdust_25_ptr_array(cdata%thrd_no)%p => physics%sfcprop%emdust(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        emseas_26_ptr_array(cdata%thrd_no)%p => physics%sfcprop%emseas(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        ebb_smoke_in_27_ptr_array(cdata%thrd_no)%p => physics%sfcprop%ebb_smoke_in(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        frp_output_28_ptr_array(cdata%thrd_no)%p => physics%sfcprop%frp_output(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        coef_bb_29_ptr_array(cdata%thrd_no)%p => physics%sfcprop%coef_bb_dc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        fire_type_out_30_ptr_array(cdata%thrd_no)%p => physics%sfcprop%fire_type(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        ebu_smoke_31_ptr_array(cdata%thrd_no)%p => physics%coupling%ebu_smoke(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%rrfs_sd)) then
        fhist_32_ptr_array(cdata%thrd_no)%p => physics%sfcprop%fhist(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        min_fplume_33_ptr_array(cdata%thrd_no)%p => physics%coupling%min_fplume(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        max_fplume_34_ptr_array(cdata%thrd_no)%p => physics%coupling%max_fplume(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        rho_dry_35_ptr_array(cdata%thrd_no)%p => physics%coupling%rho_dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%rrfs_sd)) then
        uspdavg_36_ptr_array(cdata%thrd_no)%p => physics%coupling%uspdavg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        hpbl_thetav_37_ptr_array(cdata%thrd_no)%p => physics%coupling%hpbl_thetav(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        drydep_flux_out_38_ptr_array(cdata%thrd_no)%p => physics%coupling%drydep_flux(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%ndvel)
      end if

      if ((physics%model%rrfs_sd)) then
        wetdpr_39_ptr_array(cdata%thrd_no)%p => physics%coupling%wetdpr_flux(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nchem)
      end if

      if ((physics%model%rrfs_sd)) then
        hwp_40_ptr_array(cdata%thrd_no)%p => physics%coupling%rrfs_hwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        hwp_ave_41_ptr_array(cdata%thrd_no)%p => physics%coupling%rrfs_hwp_ave(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        wetness_42_ptr_array(cdata%thrd_no)%p => physics%sfcprop%wetness(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        ddvel_inout_43_ptr_array(cdata%thrd_no)%p => physics%coupling%ddvel(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%ndvel)
      end if

      if ((physics%model%rrfs_sd)) then
        peak_hr_out_44_ptr_array(cdata%thrd_no)%p => physics%sfcprop%peak_hr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        lu_nofire_out_45_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lu_nofire(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        lu_qfire_out_46_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lu_qfire(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        fire_heat_flux_out_47_ptr_array(cdata%thrd_no)%p => physics%sfcprop%fire_heat_flux(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        frac_grid_burned_out_48_ptr_array(cdata%thrd_no)%p => physics%sfcprop%frac_grid_burned(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cpl_fire)) then
        smoke_fire_49_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smoke_fire(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
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
                  nsoil=physics%model%lsoil_lsm,smc=smc_15_ptr_array(cdata%thrd_no)%p,tslb=tslb_16_ptr_array(cdata%thrd_no)%p, &
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
                  g=con_g,pi=con_pi,con_cp=con_cp,con_rd=con_rd,con_fv=con_fvirt,dust12m_in=dust12m_in_17_ptr_array(cdata%thrd_no)%p, &
                  emi_ant_in=emi_ant_in_18_ptr_array(cdata%thrd_no)%p,smoke_rrfs=smoke_rrfs_19_ptr_array(cdata%thrd_no)%p, &
                  smoke2d_rrfs=smoke2d_rrfs_20_ptr_array(cdata%thrd_no)%p,ntrac=physics%model%ntrac, &
                  qgrs=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  chem3d=chem3d_21_ptr_array(cdata%thrd_no)%p,tile_num=physics%model%tile_num, &
                  ntsmoke=physics%model%ntsmoke,ntfsmoke=physics%model%ntfsmoke,ntdust=physics%model%ntdust, &
                  ntcoarsepm=physics%model%ntcoarsepm,imp_physics=physics%model%imp_physics, &
                  imp_physics_thompson=physics%model%imp_physics_thompson,nwfa=nwfa_22_ptr_array(cdata%thrd_no)%p, &
                  nifa=nifa_23_ptr_array(cdata%thrd_no)%p,emanoc=emanoc_24_ptr_array(cdata%thrd_no)%p, &
                  emdust=emdust_25_ptr_array(cdata%thrd_no)%p,emseas=emseas_26_ptr_array(cdata%thrd_no)%p, &
                  ebb_smoke_in=ebb_smoke_in_27_ptr_array(cdata%thrd_no)%p,frp_output=frp_output_28_ptr_array(cdata%thrd_no)%p, &
                  coef_bb=coef_bb_29_ptr_array(cdata%thrd_no)%p,fire_type_out=fire_type_out_30_ptr_array(cdata%thrd_no)%p, &
                  ebu_smoke=ebu_smoke_31_ptr_array(cdata%thrd_no)%p,fhist=fhist_32_ptr_array(cdata%thrd_no)%p, &
                  min_fplume=min_fplume_33_ptr_array(cdata%thrd_no)%p,max_fplume=max_fplume_34_ptr_array(cdata%thrd_no)%p, &
                  mpicomm=physics%model%communicator,mpirank=physics%model%me,mpiroot=physics%model%master, &
                  rho_dry=rho_dry_35_ptr_array(cdata%thrd_no)%p,uspdavg=uspdavg_36_ptr_array(cdata%thrd_no)%p, &
                  hpbl_thetav=hpbl_thetav_37_ptr_array(cdata%thrd_no)%p,drydep_flux_out=drydep_flux_out_38_ptr_array(cdata%thrd_no)%p, &
                  wetdpr=wetdpr_39_ptr_array(cdata%thrd_no)%p,hwp=hwp_40_ptr_array(cdata%thrd_no)%p, &
                  hwp_ave=hwp_ave_41_ptr_array(cdata%thrd_no)%p,wetness=wetness_42_ptr_array(cdata%thrd_no)%p, &
                  ndvel=physics%model%ndvel,ddvel_inout=ddvel_inout_43_ptr_array(cdata%thrd_no)%p, &
                  peak_hr_out=peak_hr_out_44_ptr_array(cdata%thrd_no)%p,lu_nofire_out=lu_nofire_out_45_ptr_array(cdata%thrd_no)%p, &
                  lu_qfire_out=lu_qfire_out_46_ptr_array(cdata%thrd_no)%p,fire_heat_flux_out=fire_heat_flux_out_47_ptr_array(cdata%thrd_no)%p, &
                  frac_grid_burned_out=frac_grid_burned_out_48_ptr_array(cdata%thrd_no)%p, &
                  oro=physics%sfcprop%oro(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  smoke_fire=smoke_fire_49_ptr_array(cdata%thrd_no)%p,totprcp=physics%diag%totprcp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cpl_fire=physics%model%cpl_fire,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(smc_15_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(tslb_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(dust12m_in_17_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(emi_ant_in_18_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(smoke_rrfs_19_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(smoke2d_rrfs_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(chem3d_21_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntwa > 0)) then
        nullify(nwfa_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntia > 0)) then
        nullify(nifa_23_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(emanoc_24_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(emdust_25_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(emseas_26_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(ebb_smoke_in_27_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(frp_output_28_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(coef_bb_29_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(fire_type_out_30_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(ebu_smoke_31_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(fhist_32_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(min_fplume_33_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(max_fplume_34_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(rho_dry_35_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(uspdavg_36_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(hpbl_thetav_37_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(drydep_flux_out_38_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(wetdpr_39_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(hwp_40_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(hwp_ave_41_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(wetness_42_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(ddvel_inout_43_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(peak_hr_out_44_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(lu_nofire_out_45_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(lu_qfire_out_46_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(fire_heat_flux_out_47_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(frac_grid_burned_out_48_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cpl_fire)) then
        nullify(smoke_fire_49_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrfs_smoke_wrapper_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ntlnc > 0)) then
        qgrs_cloud_droplet_num_conc_50_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntlnc)
      end if

      if ((physics%model%ntwa > 0)) then
        nwfa_22_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntwa)
      end if

      if ((physics%model%ntia > 0)) then
        nifa_23_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntia)
      end if

      if (( physics%model%ntccn > 0 )) then
        qgrs_cccn_51_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntccn)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dusfc_cice_52_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvsfc_cice_53_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dtsfc_cice_54_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dqsfc_cice_55_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dusfci_cpl_56_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvsfci_cpl_57_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        dtsfci_cpl_58_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        dqsfci_cpl_59_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dusfc_cpl_60_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvsfc_cpl_61_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dtsfc_cpl_62_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dqsfc_cpl_63_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnedmf)) then
        qke_64_ptr_array(cdata%thrd_no)%p => physics%tbd%qke(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if (( physics%model%ntke > 0 )) then
        qke_adv_65_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntke)
      end if

      if ((physics%model%do_mynnedmf)) then
        tsq_66_ptr_array(cdata%thrd_no)%p => physics%tbd%tsq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        qsq_67_ptr_array(cdata%thrd_no)%p => physics%tbd%qsq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        cov_68_ptr_array(cdata%thrd_no)%p => physics%tbd%cov(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        el_pbl_69_ptr_array(cdata%thrd_no)%p => physics%tbd%el_pbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        sh3d_70_ptr_array(cdata%thrd_no)%p => physics%tbd%sh3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        sm3d_71_ptr_array(cdata%thrd_no)%p => physics%tbd%sm3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        exch_h_72_ptr_array(cdata%thrd_no)%p => physics%diag%exch_h(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        exch_m_73_ptr_array(cdata%thrd_no)%p => physics%diag%exch_m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        dqke_74_ptr_array(cdata%thrd_no)%p => physics%diag%dqke(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        qwt_75_ptr_array(cdata%thrd_no)%p => physics%diag%qwt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        qshear_76_ptr_array(cdata%thrd_no)%p => physics%diag%qshear(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        qbuoy_77_ptr_array(cdata%thrd_no)%p => physics%diag%qbuoy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        qdiss_78_ptr_array(cdata%thrd_no)%p => physics%diag%qdiss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        qc_bl_79_ptr_array(cdata%thrd_no)%p => physics%tbd%qc_bl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        qi_bl_80_ptr_array(cdata%thrd_no)%p => physics%tbd%qi_bl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        cldfra_bl_81_ptr_array(cdata%thrd_no)%p => physics%tbd%cldfra_bl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        edmf_a_82_ptr_array(cdata%thrd_no)%p => physics%diag%edmf_a(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        edmf_w_83_ptr_array(cdata%thrd_no)%p => physics%diag%edmf_w(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        edmf_qt_84_ptr_array(cdata%thrd_no)%p => physics%diag%edmf_qt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        edmf_thl_85_ptr_array(cdata%thrd_no)%p => physics%diag%edmf_thl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        edmf_ent_86_ptr_array(cdata%thrd_no)%p => physics%diag%edmf_ent(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        edmf_qc_87_ptr_array(cdata%thrd_no)%p => physics%diag%edmf_qc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        sub_thl_88_ptr_array(cdata%thrd_no)%p => physics%diag%sub_thl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        sub_sqv_89_ptr_array(cdata%thrd_no)%p => physics%diag%sub_sqv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        det_thl_90_ptr_array(cdata%thrd_no)%p => physics%diag%det_thl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        det_sqv_91_ptr_array(cdata%thrd_no)%p => physics%diag%det_sqv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        maxwidth_92_ptr_array(cdata%thrd_no)%p => physics%diag%maxwidth(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnedmf)) then
        maxmf_93_ptr_array(cdata%thrd_no)%p => physics%diag%maxmf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnedmf)) then
        ztop_plume_94_ptr_array(cdata%thrd_no)%p => physics%diag%ztop_plume(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnedmf)) then
        ktop_plume_95_ptr_array(cdata%thrd_no)%p => physics%diag%ktop_plume(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%ntsw > 0)) then
        dqdt_snow_96_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsw)
      end if

      if (( physics%model%ntoz > 0 )) then
        dqdt_ozone_97_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntoz)
      end if

      if ((physics%model%ntlnc > 0)) then
        dqdt_cloud_droplet_num_conc_98_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntlnc)
      end if

      if ((physics%model%ntinc > 0)) then
        dqdt_ice_num_conc_99_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntinc)
      end if

      if ((physics%model%ntwa > 0)) then
        dqdt_water_aer_num_conc_100_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntwa)
      end if

      if ((physics%model%ntia > 0)) then
        dqdt_ice_aer_num_conc_101_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntia)
      end if

      if (( physics%model%ntccn > 0 )) then
        dqdt_cccn_102_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntccn)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_13_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%rrfs_sd)) then
        chem3d_21_ptr_array(cdata%thrd_no)%p => physics%coupling%chem3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nchem)
      end if

      if ((physics%model%rrfs_sd)) then
        frp_output_28_ptr_array(cdata%thrd_no)%p => physics%sfcprop%frp_output(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        ddvel_inout_43_ptr_array(cdata%thrd_no)%p => physics%coupling%ddvel(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%ndvel)
      end if

      if ((physics%model%do_spp)) then
        spp_wts_pbl_103_ptr_array(cdata%thrd_no)%p => physics%coupling%spp_wts_pbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
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
                  qgrs_cloud_droplet_num_conc=qgrs_cloud_droplet_num_conc_50_ptr_array(cdata%thrd_no)%p, &
                  qgrs_cloud_ice_num_conc=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntinc), &
                  qgrs_ozone=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntoz), &
                  qgrs_water_aer_num_conc=nwfa_22_ptr_array(cdata%thrd_no)%p,qgrs_ice_aer_num_conc=nifa_23_ptr_array(cdata%thrd_no)%p, &
                  qgrs_cccn=qgrs_cccn_51_ptr_array(cdata%thrd_no)%p,prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
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
                  dusfc_cice=dusfc_cice_52_ptr_array(cdata%thrd_no)%p,dvsfc_cice=dvsfc_cice_53_ptr_array(cdata%thrd_no)%p, &
                  dtsfc_cice=dtsfc_cice_54_ptr_array(cdata%thrd_no)%p,dqsfc_cice=dqsfc_cice_55_ptr_array(cdata%thrd_no)%p, &
                  hflx_wat=physics%interstitial(cdata%thrd_no)%hflx_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qflx_wat=physics%interstitial(cdata%thrd_no)%evap_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress_wat=physics%interstitial(cdata%thrd_no)%stress_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oceanfrac=physics%sfcprop%oceanfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fice=physics%sfcprop%fice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dusfci_cpl=dusfci_cpl_56_ptr_array(cdata%thrd_no)%p,dvsfci_cpl=dvsfci_cpl_57_ptr_array(cdata%thrd_no)%p, &
                  dtsfci_cpl=dtsfci_cpl_58_ptr_array(cdata%thrd_no)%p,dqsfci_cpl=dqsfci_cpl_59_ptr_array(cdata%thrd_no)%p, &
                  dusfc_cpl=dusfc_cpl_60_ptr_array(cdata%thrd_no)%p,dvsfc_cpl=dvsfc_cpl_61_ptr_array(cdata%thrd_no)%p, &
                  dtsfc_cpl=dtsfc_cpl_62_ptr_array(cdata%thrd_no)%p,dqsfc_cpl=dqsfc_cpl_63_ptr_array(cdata%thrd_no)%p, &
                  recmol=physics%sfcprop%rmol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qke=qke_64_ptr_array(cdata%thrd_no)%p,qke_adv=qke_adv_65_ptr_array(cdata%thrd_no)%p, &
                  tsq=tsq_66_ptr_array(cdata%thrd_no)%p,qsq=qsq_67_ptr_array(cdata%thrd_no)%p, &
                  cov=cov_68_ptr_array(cdata%thrd_no)%p,el_pbl=el_pbl_69_ptr_array(cdata%thrd_no)%p, &
                  sh3d=sh3d_70_ptr_array(cdata%thrd_no)%p,sm3d=sm3d_71_ptr_array(cdata%thrd_no)%p, &
                  exch_h=exch_h_72_ptr_array(cdata%thrd_no)%p,exch_m=exch_m_73_ptr_array(cdata%thrd_no)%p, &
                  dqke=dqke_74_ptr_array(cdata%thrd_no)%p,qwt=qwt_75_ptr_array(cdata%thrd_no)%p, &
                  qshear=qshear_76_ptr_array(cdata%thrd_no)%p,qbuoy=qbuoy_77_ptr_array(cdata%thrd_no)%p, &
                  qdiss=qdiss_78_ptr_array(cdata%thrd_no)%p,pblh=physics%tbd%hpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kpbl=physics%interstitial(cdata%thrd_no)%kpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qc_bl=qc_bl_79_ptr_array(cdata%thrd_no)%p,qi_bl=qi_bl_80_ptr_array(cdata%thrd_no)%p, &
                  cldfra_bl=cldfra_bl_81_ptr_array(cdata%thrd_no)%p,edmf_a=edmf_a_82_ptr_array(cdata%thrd_no)%p, &
                  edmf_w=edmf_w_83_ptr_array(cdata%thrd_no)%p,edmf_qt=edmf_qt_84_ptr_array(cdata%thrd_no)%p, &
                  edmf_thl=edmf_thl_85_ptr_array(cdata%thrd_no)%p,edmf_ent=edmf_ent_86_ptr_array(cdata%thrd_no)%p, &
                  edmf_qc=edmf_qc_87_ptr_array(cdata%thrd_no)%p,sub_thl=sub_thl_88_ptr_array(cdata%thrd_no)%p, &
                  sub_sqv=sub_sqv_89_ptr_array(cdata%thrd_no)%p,det_thl=det_thl_90_ptr_array(cdata%thrd_no)%p, &
                  det_sqv=det_sqv_91_ptr_array(cdata%thrd_no)%p,maxwidth=maxwidth_92_ptr_array(cdata%thrd_no)%p, &
                  maxmf=maxmf_93_ptr_array(cdata%thrd_no)%p,ztop_plume=ztop_plume_94_ptr_array(cdata%thrd_no)%p, &
                  ktop_plume=ktop_plume_95_ptr_array(cdata%thrd_no)%p,dudt=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtdt=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dqdt_all=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dqdt_water_vapor=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  dqdt_liquid_cloud=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntcw), &
                  dqdt_ice=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  dqdt_snow=dqdt_snow_96_ptr_array(cdata%thrd_no)%p,dqdt_ozone=dqdt_ozone_97_ptr_array(cdata%thrd_no)%p, &
                  dqdt_cloud_droplet_num_conc=dqdt_cloud_droplet_num_conc_98_ptr_array(cdata%thrd_no)%p, &
                  dqdt_ice_num_conc=dqdt_ice_num_conc_99_ptr_array(cdata%thrd_no)%p,dqdt_water_aer_num_conc=dqdt_water_aer_num_conc_100_ptr_array(cdata%thrd_no)%p, &
                  dqdt_ice_aer_num_conc=dqdt_ice_aer_num_conc_101_ptr_array(cdata%thrd_no)%p, &
                  dqdt_cccn=dqdt_cccn_102_ptr_array(cdata%thrd_no)%p,tmf=physics%interstitial(cdata%thrd_no)%dvdftra(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nvdiff), &
                  flag_for_pbl_generic_tend=physics%model%flag_for_pbl_generic_tend,dtend=dtend_13_ptr_array(cdata%thrd_no)%p, &
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
                  nssl_ccn_on=physics%model%nssl_ccn_on,chem3d=chem3d_21_ptr_array(cdata%thrd_no)%p, &
                  frp=frp_output_28_ptr_array(cdata%thrd_no)%p,rrfs_sd=physics%model%rrfs_sd, &
                  mix_chem=physics%model%mix_chem,enh_mix=physics%model%enh_mix,nchem=physics%model%nchem, &
                  ndvel=physics%model%ndvel,vdep=ddvel_inout_43_ptr_array(cdata%thrd_no)%p, &
                  smoke_dbg=physics%model%rrfs_smoke_debug,ltaerosol=physics%model%ltaerosol, &
                  mraerosol=physics%model%mraerosol,spp_wts_pbl=spp_wts_pbl_103_ptr_array(cdata%thrd_no)%p, &
                  spp_pbl=physics%model%spp_pbl,lprnt=physics%model%lprnt,huge=physics%model%huge, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ntlnc > 0)) then
        nullify(qgrs_cloud_droplet_num_conc_50_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntwa > 0)) then
        nullify(nwfa_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntia > 0)) then
        nullify(nifa_23_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntccn > 0 )) then
        nullify(qgrs_cccn_51_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dusfc_cice_52_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvsfc_cice_53_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dtsfc_cice_54_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dqsfc_cice_55_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dusfci_cpl_56_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvsfci_cpl_57_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(dtsfci_cpl_58_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(dqsfci_cpl_59_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dusfc_cpl_60_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvsfc_cpl_61_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dtsfc_cpl_62_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dqsfc_cpl_63_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(qke_64_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntke > 0 )) then
        nullify(qke_adv_65_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(tsq_66_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(qsq_67_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(cov_68_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(el_pbl_69_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(sh3d_70_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(sm3d_71_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(exch_h_72_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(exch_m_73_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        nullify(dqke_74_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        nullify(qwt_75_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        nullify(qshear_76_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        nullify(qbuoy_77_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. physics%model%tke_budget > 0)) then
        nullify(qdiss_78_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(qc_bl_79_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(qi_bl_80_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(cldfra_bl_81_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(edmf_a_82_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(edmf_w_83_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(edmf_qt_84_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(edmf_thl_85_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(edmf_ent_86_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(edmf_qc_87_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(sub_thl_88_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(sub_sqv_89_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(det_thl_90_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf .and. (physics%model%bl_mynn_output .ne. 0))) then
        nullify(det_sqv_91_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(maxwidth_92_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(maxmf_93_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(ztop_plume_94_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(ktop_plume_95_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntsw > 0)) then
        nullify(dqdt_snow_96_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntoz > 0 )) then
        nullify(dqdt_ozone_97_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntlnc > 0)) then
        nullify(dqdt_cloud_droplet_num_conc_98_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntinc > 0)) then
        nullify(dqdt_ice_num_conc_99_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntwa > 0)) then
        nullify(dqdt_water_aer_num_conc_100_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntia > 0)) then
        nullify(dqdt_ice_aer_num_conc_101_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntccn > 0 )) then
        nullify(dqdt_cccn_102_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_13_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(chem3d_21_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(frp_output_28_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(ddvel_inout_43_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_spp)) then
        nullify(spp_wts_pbl_103_ptr_array(cdata%thrd_no)%p)
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
        chem3d_21_ptr_array(cdata%thrd_no)%p => physics%coupling%chem3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nchem)
      end if

      call rrfs_smoke_postpbl_run(ite=physics%model%blksz(cdata%blk_no),kte=physics%model%levs,ntsmoke=physics%model%ntsmoke, &
                  ntdust=physics%model%ntdust,ntcoarsepm=physics%model%ntcoarsepm,ntrac=physics%model%ntrac, &
                  qgrs=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  chem3d=chem3d_21_ptr_array(cdata%thrd_no)%p,rrfs_sd=physics%model%rrfs_sd, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%rrfs_sd)) then
        nullify(chem3d_21_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrfs_smoke_postpbl_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        varss_104_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%varss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        ocss_105_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ocss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        oa4ss_106_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%oa4ss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        clxss_107_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%clxss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      call gfs_gwd_generic_pre_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,nmtvr=physics%model%nmtvr, &
                  mntvar=physics%sfcprop%hprime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nmtvr), &
                  oc=physics%interstitial(cdata%thrd_no)%oc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oa4=physics%interstitial(cdata%thrd_no)%oa4(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  clx=physics%interstitial(cdata%thrd_no)%clx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  theta=physics%interstitial(cdata%thrd_no)%theta(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  varss=varss_104_ptr_array(cdata%thrd_no)%p,ocss=ocss_105_ptr_array(cdata%thrd_no)%p, &
                  oa4ss=oa4ss_106_ptr_array(cdata%thrd_no)%p,clxss=clxss_107_ptr_array(cdata%thrd_no)%p, &
                  sigma=physics%interstitial(cdata%thrd_no)%sigma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gamma=physics%interstitial(cdata%thrd_no)%gamma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  elvmax=physics%interstitial(cdata%thrd_no)%elvmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(varss_104_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(ocss_105_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(oa4ss_106_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(clxss_107_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_gwd_generic_pre_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        varss_104_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%varss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        ocss_105_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ocss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        oa4ss_106_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%oa4ss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        clxss_107_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%clxss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtauy2d_ms_108_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtaux2d_bl_109_ptr_array(cdata%thrd_no)%p => physics%diag%dudt_obl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtauy2d_bl_110_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_obl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtaux2d_ss_111_ptr_array(cdata%thrd_no)%p => physics%diag%dudt_oss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtauy2d_ss_112_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_oss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtaux2d_fd_113_ptr_array(cdata%thrd_no)%p => physics%diag%dudt_ofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtauy2d_fd_114_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_ofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dusfc_ms_115_ptr_array(cdata%thrd_no)%p => physics%diag%du_ogwcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvsfc_ms_116_ptr_array(cdata%thrd_no)%p => physics%diag%dv_ogwcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dusfc_bl_117_ptr_array(cdata%thrd_no)%p => physics%diag%du_oblcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvsfc_bl_118_ptr_array(cdata%thrd_no)%p => physics%diag%dv_oblcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dusfc_ss_119_ptr_array(cdata%thrd_no)%p => physics%diag%du_osscol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvsfc_ss_120_ptr_array(cdata%thrd_no)%p => physics%diag%dv_osscol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dusfc_fd_121_ptr_array(cdata%thrd_no)%p => physics%diag%du_ofdcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvsfc_fd_122_ptr_array(cdata%thrd_no)%p => physics%diag%dv_ofdcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%ldiag3d)) then
        dtend_13_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%do_spp)) then
        spp_wts_gwd_123_ptr_array(cdata%thrd_no)%p => physics%coupling%spp_wts_gwd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
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
                  varss=varss_104_ptr_array(cdata%thrd_no)%p,oc1ss=ocss_105_ptr_array(cdata%thrd_no)%p, &
                  oa4ss=oa4ss_106_ptr_array(cdata%thrd_no)%p,ol4ss=clxss_107_ptr_array(cdata%thrd_no)%p, &
                  theta=physics%interstitial(cdata%thrd_no)%theta(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sigma=physics%interstitial(cdata%thrd_no)%sigma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gamma=physics%interstitial(cdata%thrd_no)%gamma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  elvmax=physics%interstitial(cdata%thrd_no)%elvmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtaux2d_ms=physics%diag%dudt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtauy2d_ms=dtauy2d_ms_108_ptr_array(cdata%thrd_no)%p,dtaux2d_bl=dtaux2d_bl_109_ptr_array(cdata%thrd_no)%p, &
                  dtauy2d_bl=dtauy2d_bl_110_ptr_array(cdata%thrd_no)%p,dtaux2d_ss=dtaux2d_ss_111_ptr_array(cdata%thrd_no)%p, &
                  dtauy2d_ss=dtauy2d_ss_112_ptr_array(cdata%thrd_no)%p,dtaux2d_fd=dtaux2d_fd_113_ptr_array(cdata%thrd_no)%p, &
                  dtauy2d_fd=dtauy2d_fd_114_ptr_array(cdata%thrd_no)%p,dusfc=physics%interstitial(cdata%thrd_no)%dusfcg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvsfc=physics%interstitial(cdata%thrd_no)%dvsfcg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dusfc_ms=dusfc_ms_115_ptr_array(cdata%thrd_no)%p,dvsfc_ms=dvsfc_ms_116_ptr_array(cdata%thrd_no)%p, &
                  dusfc_bl=dusfc_bl_117_ptr_array(cdata%thrd_no)%p,dvsfc_bl=dvsfc_bl_118_ptr_array(cdata%thrd_no)%p, &
                  dusfc_ss=dusfc_ss_119_ptr_array(cdata%thrd_no)%p,dvsfc_ss=dvsfc_ss_120_ptr_array(cdata%thrd_no)%p, &
                  dusfc_fd=dusfc_fd_121_ptr_array(cdata%thrd_no)%p,dvsfc_fd=dvsfc_fd_122_ptr_array(cdata%thrd_no)%p, &
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
                  flag_for_gwd_generic_tend=physics%model%flag_for_gwd_generic_tend,dtend=dtend_13_ptr_array(cdata%thrd_no)%p, &
                  dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_process_orographic_gwd=physics%model%index_of_process_orographic_gwd, &
                  index_of_temperature=physics%model%index_of_temperature,index_of_x_wind=physics%model%index_of_x_wind, &
                  index_of_y_wind=physics%model%index_of_y_wind,ldiag3d=physics%model%ldiag3d, &
                  ldiag_ugwp=physics%model%ldiag_ugwp,ugwp_seq_update=physics%model%ugwp_seq_update, &
                  spp_wts_gwd=spp_wts_gwd_123_ptr_array(cdata%thrd_no)%p,spp_gwd=physics%model%spp_gwd, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(varss_104_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(ocss_105_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(oa4ss_106_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(clxss_107_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtauy2d_ms_108_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtaux2d_bl_109_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtauy2d_bl_110_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtaux2d_ss_111_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtauy2d_ss_112_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtaux2d_fd_113_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtauy2d_fd_114_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dusfc_ms_115_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvsfc_ms_116_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dusfc_bl_117_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvsfc_bl_118_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dusfc_ss_119_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvsfc_ss_120_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dusfc_fd_121_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvsfc_fd_122_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_13_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_spp)) then
        nullify(spp_wts_gwd_123_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in drag_suite_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ldiag3d)) then
        dtend_13_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
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
                  dtend=dtend_13_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_temperature=physics%model%index_of_temperature,index_of_x_wind=physics%model%index_of_x_wind, &
                  index_of_y_wind=physics%model%index_of_y_wind,index_of_process_orographic_gwd=physics%model%index_of_process_orographic_gwd, &
                  flag_for_gwd_generic_tend=physics%model%flag_for_gwd_generic_tend,errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)


      if ((physics%model%ldiag3d)) then
        nullify(dtend_13_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_gwd_generic_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    



   end function scm_hrrr_gf_ps_phys_ps_run_cap

   function scm_hrrr_gf_ps_phys_ps_final_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0






      initialized = .false.


   end function scm_hrrr_gf_ps_phys_ps_final_cap

end module ccpp_scm_hrrr_gf_ps_phys_ps_cap
