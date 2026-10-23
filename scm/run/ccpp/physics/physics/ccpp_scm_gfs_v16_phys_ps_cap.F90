
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
module ccpp_scm_gfs_v16_phys_ps_cap

   use gfs_surface_generic_pre, only: gfs_surface_generic_pre_init
   use lsm_noah, only: lsm_noah_init
   use gfs_surface_generic_post, only: gfs_surface_generic_post_init
   use satmedmfvdifq, only: satmedmfvdifq_init
   use canopy_driver, only: canopy_driver_init
   use cires_ugwp, only: cires_ugwp_init
   use get_prs_fv3, only: get_prs_fv3_run
   use gfs_suite_interstitial_1, only: gfs_suite_interstitial_1_run
   use gfs_surface_generic_pre, only: gfs_surface_generic_pre_run
   use gfs_surface_composites_pre, only: gfs_surface_composites_pre_run
   use dcyc2t3, only: dcyc2t3_run
   use gfs_surface_composites_inter, only: gfs_surface_composites_inter_run
   use gfs_suite_interstitial_2, only: gfs_suite_interstitial_2_run
   use sfc_diff, only: sfc_diff_run
   use gfs_surface_loop_control_part1, only: gfs_surface_loop_control_part1_run
   use sfc_nst_pre, only: sfc_nst_pre_run
   use sfc_nst, only: sfc_nst_run
   use sfc_nst_post, only: sfc_nst_post_run
   use lsm_noah, only: lsm_noah_run
   use sfc_sice, only: sfc_sice_run
   use gfs_surface_loop_control_part2, only: gfs_surface_loop_control_part2_run
   use gfs_surface_composites_post, only: gfs_surface_composites_post_run
   use sfc_diag, only: sfc_diag_run
   use sfc_diag_post, only: sfc_diag_post_run
   use gfs_surface_generic_post, only: gfs_surface_generic_post_run
   use gfs_pbl_generic_pre, only: gfs_pbl_generic_pre_run
   use satmedmfvdifq, only: satmedmfvdifq_run
   use canopy_driver, only: canopy_driver_run
   use gfs_pbl_generic_post, only: gfs_pbl_generic_post_run
   use gfs_gwd_generic_pre, only: gfs_gwd_generic_pre_run
   use cires_ugwp, only: cires_ugwp_run
   use cires_ugwp_post, only: cires_ugwp_post_run
   use gfs_gwd_generic_post, only: gfs_gwd_generic_post_run
   use lsm_noah, only: lsm_noah_finalize
   use cires_ugwp, only: cires_ugwp_finalize


   implicit none

   private
   public :: scm_gfs_v16_phys_ps_tsinit_cap, &
             scm_gfs_v16_phys_ps_tsfinal_cap, &
             scm_gfs_v16_phys_ps_init_cap, &
             scm_gfs_v16_phys_ps_run_cap, &
             scm_gfs_v16_phys_ps_final_cap

   logical, dimension(200), save :: initialized = .false.

   contains

   function scm_gfs_v16_phys_ps_tsinit_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_gfs_v16_phys_ps_tsinit_cap

   function scm_gfs_v16_phys_ps_tsfinal_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_gfs_v16_phys_ps_tsfinal_cap

   function scm_gfs_v16_phys_ps_init_cap(one,physics,cdata,con_p0) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t
      use machine, only: kind_phys

      implicit none

      ! Error handling
      integer :: ierr

      integer, intent(in), target :: one
      type(physics_type), intent(inout), target :: physics
      type(ccpp_t), intent(inout), target :: cdata
      real(kind_phys), intent(in), target :: con_p0

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

      


      call lsm_noah_init(lsm=physics%model%lsm,lsm_noah=physics%model%lsm_noah,me=physics%model%me, &
                  isot=physics%model%isot,ivegsrc=physics%model%ivegsrc,nlunit=physics%model%nlunit, &
                  pores=physics%model%pores(one:30),resid=physics%model%resid(one:30),errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in lsm_noah_init: " // trim(cdata%errmsg)
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

    
      


      call satmedmfvdifq_init(satmedmf=physics%model%satmedmf,isatmedmf=physics%model%isatmedmf,isatmedmf_vdifq=physics%model%isatmedmf_vdifq, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in satmedmfvdifq_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call canopy_driver_init(satmedmf=physics%model%satmedmf,isatmedmf=physics%model%isatmedmf,isatmedmf_vdifq=physics%model%isatmedmf_vdifq, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in canopy_driver_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call cires_ugwp_init(me=physics%model%me,master=physics%model%master,nlunit=physics%model%nlunit, &
                  input_nml_file=physics%model%input_nml_file(:),logunit=physics%model%logunit, &
                  fn_nml2=physics%model%fn_nml,lonr=physics%model%lonr,levs=physics%model%levs, &
                  ak=physics%model%ak(one:physics%model%levsp1),bk=physics%model%bk(one:physics%model%levsp1), &
                  dtp=physics%model%dtp,cdmbgwd=physics%model%cdmbgwd(one:4),cgwf=physics%model%cgwf(one:2), &
                  pa_rf_in=physics%model%prslrd0,tau_rf_in=physics%model%ral_ts,con_p0=con_p0, &
                  gwd_opt=physics%model%gwd_opt,do_ugwp=physics%model%do_ugwp,errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in cires_ugwp_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized(cdata%ccpp_instance) = .true.


   end function scm_gfs_v16_phys_ps_init_cap

   function scm_gfs_v16_phys_ps_run_cap(one,physics,cdata,con_fvirt,con_g,con_tice,con_cp,con_pi,con_sbc,con_hvap, &
                  con_eps,con_epsm1,con_hfus,con_jcal,con_rd,con_rhw0,rlapse,con_t0c,con_rocp, &
                  karman,con_rv,con_omega) result(ierr)

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
      real(kind_phys), intent(in), target :: con_eps
      real(kind_phys), intent(in), target :: con_epsm1
      real(kind_phys), intent(in), target :: con_hfus
      real(kind_phys), intent(in), target :: con_jcal
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: con_rhw0
      real(kind_phys), intent(in), target :: rlapse
      real(kind_phys), intent(in), target :: con_t0c
      real(kind_phys), intent(in), target :: con_rocp
      real(kind_phys), intent(in), target :: karman
      real(kind_phys), intent(in), target :: con_rv
      real(kind_phys), intent(in), target :: con_omega
      
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
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: xt_20_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: xz_21_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dt_cool_22_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: z_c_23_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tref_24_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: xs_25_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: xu_26_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: xv_27_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: zm_28_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: xtts_29_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: xzts_30_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: c_0_31_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: c_d_32_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: w_0_33_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: w_d_34_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: d_conv_35_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ifd_36_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qrain_37_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wet1_38_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lai_39_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rca_40_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: hflx_fire_41_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: evap_fire_42_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lake_t2m_43_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lake_q2m_44_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: t2mmp_45_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: q2mp_46_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: pahi_47_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dlwsfci_cpl_48_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dswsfci_cpl_49_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dlwsfc_cpl_50_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dswsfc_cpl_51_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnirbmi_cpl_52_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnirdfi_cpl_53_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvisbmi_cpl_54_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvisdfi_cpl_55_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnirbm_cpl_56_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnirdf_cpl_57_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvisbm_cpl_58_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvisdf_cpl_59_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nlwsfci_cpl_60_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nlwsfc_cpl_61_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: t2mi_cpl_62_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: q2mi_cpl_63_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: u10mi_cpl_64_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: v10mi_cpl_65_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tsfci_cpl_66_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: psurfi_cpl_67_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nnirbmi_cpl_68_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nnirdfi_cpl_69_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nvisbmi_cpl_70_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nvisdfi_cpl_71_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nswsfci_cpl_72_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nswsfc_cpl_73_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nnirbm_cpl_74_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nnirdf_cpl_75_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nvisbm_cpl_76_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nvisdf_cpl_77_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: paha_78_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: waxy_79_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: twa_80_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: claie_81_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cfch_82_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cfrt_83_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cclu_84_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cpopu_85_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dkt_can_86_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dku_can_87_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_cpl_88_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_cpl_89_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfc_cpl_90_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfc_cpl_91_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfci_cpl_92_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfci_cpl_93_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfci_cpl_94_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfci_cpl_95_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ushfsfci_96_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_cice_97_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_cice_98_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfc_cice_99_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfc_cice_100_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfc_med_101_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfc_med_102_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_med_103_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_med_104_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: varss_105_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ocss_106_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: oa4ss_107_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: clxss_108_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_ms_109_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_ms_110_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_bl_111_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_bl_112_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtauy2d_ms_113_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtaux2d_bl_114_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtauy2d_bl_115_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du3dt_mtb_116_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du3dt_ogw_117_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du3dt_tms_118_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: q_tke_119_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du3dt_ngw_120_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dv3dt_ngw_121_ptr_array

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


      


      call sfc_diff_run(im=physics%model%blksz(cdata%blk_no),rvrdm1=con_fvirt,eps=con_eps,epsm1=con_epsm1, &
                  grav=con_g,ps=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t1=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  q1=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1,physics%model%ntqv), &
                  z1=physics%diag%zlvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  garea=physics%grid%area(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zvfun=physics%interstitial(cdata%thrd_no)%zvfun(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsl1=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  prslki=physics%interstitial(cdata%thrd_no)%work3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsik1=physics%statein%prsik(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  prslk1=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  sigmaf=physics%interstitial(cdata%thrd_no)%sigmaf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lakefrac=physics%sfcprop%lakefrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fice=physics%sfcprop%fice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vegtype=physics%sfcprop%vtype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  shdmax=physics%sfcprop%shdmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ivegsrc=physics%model%ivegsrc,z0pert=physics%interstitial(cdata%thrd_no)%z01d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ztpert=physics%interstitial(cdata%thrd_no)%zt1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_iter=physics%interstitial(cdata%thrd_no)%flag_iter(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  redrag=physics%model%redrag,flag_lakefreeze=physics%interstitial(cdata%thrd_no)%flag_lakefreeze(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u10m=physics%diag%u10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10m=physics%diag%v10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u1=physics%statein%ugrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  v1=physics%statein%vgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  usfco=physics%sfcprop%usfco(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vsfco=physics%sfcprop%vsfco(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfc_z0_type=physics%model%sfc_z0_type,use_oceanuv=physics%model%use_oceanuv, &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  thsfc_loc=physics%model%thsfc_loc,tskin_wat=physics%interstitial(cdata%thrd_no)%tsfc_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tskin_lnd=physics%sfcprop%tsfcl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tskin_ice=physics%sfcprop%tisfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_wat=physics%interstitial(cdata%thrd_no)%tsurf_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_lnd=physics%interstitial(cdata%thrd_no)%tsurf_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_ice=physics%interstitial(cdata%thrd_no)%tsurf_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  z0rl_wat=physics%sfcprop%zorlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  z0rl_lnd=physics%sfcprop%zorll(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  z0rl_ice=physics%sfcprop%zorli(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  z0rl_wav=physics%sfcprop%zorlwav(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ustar_wat=physics%interstitial(cdata%thrd_no)%uustar_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ustar_lnd=physics%interstitial(cdata%thrd_no)%uustar_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ustar_ice=physics%interstitial(cdata%thrd_no)%uustar_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
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
                  ztmax_wat=physics%interstitial(cdata%thrd_no)%ztmax_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ztmax_lnd=physics%interstitial(cdata%thrd_no)%ztmax_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ztmax_ice=physics%interstitial(cdata%thrd_no)%ztmax_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in sfc_diff_run: " // trim(cdata%errmsg)
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

    
      

      if ((physics%model%nstf_name(1) > 0)) then
        xt_20_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        xz_21_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        dt_cool_22_ptr_array(cdata%thrd_no)%p => physics%sfcprop%dt_cool(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        z_c_23_ptr_array(cdata%thrd_no)%p => physics%sfcprop%z_c(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        tref_24_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tref(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call sfc_nst_pre_run(im=physics%model%blksz(cdata%blk_no),wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tgice=con_tice,tsfco=physics%sfcprop%tsfco(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_wat=physics%interstitial(cdata%thrd_no)%tsurf_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tseal=physics%interstitial(cdata%thrd_no)%tseal(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xt=xt_20_ptr_array(cdata%thrd_no)%p,xz=xz_21_ptr_array(cdata%thrd_no)%p, &
                  dt_cool=dt_cool_22_ptr_array(cdata%thrd_no)%p,z_c=z_c_23_ptr_array(cdata%thrd_no)%p, &
                  tref=tref_24_ptr_array(cdata%thrd_no)%p,cplflx=physics%model%cplflx,oceanfrac=physics%sfcprop%oceanfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  nthreads=physics%model%nthreads,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%nstf_name(1) > 0)) then
        nullify(xt_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(xz_21_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(dt_cool_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(z_c_23_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(tref_24_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in sfc_nst_pre_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%nstf_name(1) > 0)) then
        tref_24_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tref(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        xt_20_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        xs_25_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        xu_26_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        xv_27_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        xz_21_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        zm_28_ptr_array(cdata%thrd_no)%p => physics%sfcprop%zm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        xtts_29_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xtts(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        xzts_30_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xzts(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        dt_cool_22_ptr_array(cdata%thrd_no)%p => physics%sfcprop%dt_cool(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        z_c_23_ptr_array(cdata%thrd_no)%p => physics%sfcprop%z_c(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        c_0_31_ptr_array(cdata%thrd_no)%p => physics%sfcprop%c_0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        c_d_32_ptr_array(cdata%thrd_no)%p => physics%sfcprop%c_d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        w_0_33_ptr_array(cdata%thrd_no)%p => physics%sfcprop%w_0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        w_d_34_ptr_array(cdata%thrd_no)%p => physics%sfcprop%w_d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        d_conv_35_ptr_array(cdata%thrd_no)%p => physics%sfcprop%d_conv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        ifd_36_ptr_array(cdata%thrd_no)%p => physics%sfcprop%ifd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        qrain_37_ptr_array(cdata%thrd_no)%p => physics%sfcprop%qrain(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call sfc_nst_run(im=physics%model%blksz(cdata%blk_no),hvap=con_hvap,cp=con_cp,hfus=con_hfus, &
                  jcal=con_jcal,eps=con_eps,epsm1=con_epsm1,rvrdm1=con_fvirt,rd=con_rd,rhw0=con_rhw0, &
                  pi=con_pi,tgice=con_tice,sbc=con_sbc,ps=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u1=physics%statein%ugrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  v1=physics%statein%vgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  usfco=physics%sfcprop%usfco(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vsfco=physics%sfcprop%vsfco(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_oceanuv=physics%model%use_oceanuv,t1=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  q1=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1,physics%model%ntqv), &
                  tref=tref_24_ptr_array(cdata%thrd_no)%p,cm=physics%interstitial(cdata%thrd_no)%cd_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ch=physics%interstitial(cdata%thrd_no)%cdq_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lseaspray=physics%model%lseaspray,fm=physics%interstitial(cdata%thrd_no)%ffmm_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm10=physics%interstitial(cdata%thrd_no)%fm10_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsl1=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  prslki=physics%interstitial(cdata%thrd_no)%work3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsik1=physics%statein%prsik(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  prslk1=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_lake_model=physics%sfcprop%use_lake_model(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlon=physics%grid%xlon(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sinlat=physics%grid%sinlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress=physics%interstitial(cdata%thrd_no)%stress_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcemis=physics%sfcprop%emis_wat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dlwflx=physics%interstitial(cdata%thrd_no)%gabsbdlw_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcnsw=physics%diag%nswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rain=physics%interstitial(cdata%thrd_no)%tprcp_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  timestep=physics%model%dtf,kdt=physics%model%kdt,solhr=physics%model%solhr, &
                  xcosz=physics%interstitial(cdata%thrd_no)%xcosz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_iter=physics%interstitial(cdata%thrd_no)%flag_iter(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_guess=physics%interstitial(cdata%thrd_no)%flag_guess(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  nstf_name1=physics%model%nstf_name(1),nstf_name4=physics%model%nstf_name(4), &
                  nstf_name5=physics%model%nstf_name(5),lprnt=physics%model%lprnt,ipr=physics%model%ipr, &
                  thsfc_loc=physics%model%thsfc_loc,tskin=physics%interstitial(cdata%thrd_no)%tseal(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf=physics%interstitial(cdata%thrd_no)%tsurf_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xt=xt_20_ptr_array(cdata%thrd_no)%p,xs=xs_25_ptr_array(cdata%thrd_no)%p, &
                  xu=xu_26_ptr_array(cdata%thrd_no)%p,xv=xv_27_ptr_array(cdata%thrd_no)%p, &
                  xz=xz_21_ptr_array(cdata%thrd_no)%p,zm=zm_28_ptr_array(cdata%thrd_no)%p, &
                  xtts=xtts_29_ptr_array(cdata%thrd_no)%p,xzts=xzts_30_ptr_array(cdata%thrd_no)%p, &
                  dt_cool=dt_cool_22_ptr_array(cdata%thrd_no)%p,z_c=z_c_23_ptr_array(cdata%thrd_no)%p, &
                  c_0=c_0_31_ptr_array(cdata%thrd_no)%p,c_d=c_d_32_ptr_array(cdata%thrd_no)%p, &
                  w_0=w_0_33_ptr_array(cdata%thrd_no)%p,w_d=w_d_34_ptr_array(cdata%thrd_no)%p, &
                  d_conv=d_conv_35_ptr_array(cdata%thrd_no)%p,ifd=ifd_36_ptr_array(cdata%thrd_no)%p, &
                  qrain=qrain_37_ptr_array(cdata%thrd_no)%p,qsurf=physics%interstitial(cdata%thrd_no)%qss_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gflux=physics%interstitial(cdata%thrd_no)%gflx_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cmm=physics%interstitial(cdata%thrd_no)%cmm_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  chh=physics%interstitial(cdata%thrd_no)%chh_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap=physics%interstitial(cdata%thrd_no)%evap_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx=physics%interstitial(cdata%thrd_no)%hflx_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ep=physics%interstitial(cdata%thrd_no)%ep1d_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%nstf_name(1) > 0)) then
        nullify(tref_24_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(xt_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(xs_25_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(xu_26_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(xv_27_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(xz_21_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(zm_28_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(xtts_29_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(xzts_30_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(dt_cool_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(z_c_23_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(c_0_31_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(c_d_32_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(w_0_33_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(w_d_34_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(d_conv_35_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(ifd_36_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(qrain_37_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in sfc_nst_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%nstf_name(1) > 0)) then
        xt_20_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        xz_21_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        dt_cool_22_ptr_array(cdata%thrd_no)%p => physics%sfcprop%dt_cool(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        z_c_23_ptr_array(cdata%thrd_no)%p => physics%sfcprop%z_c(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        tref_24_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tref(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call sfc_nst_post_run(im=physics%model%blksz(cdata%blk_no),kdt=physics%model%kdt,rlapse=rlapse, &
                  tgice=con_tice,wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_lake_model=physics%sfcprop%use_lake_model(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oro=physics%sfcprop%oro(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oro_uf=physics%sfcprop%oro_uf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  nstf_name1=physics%model%nstf_name(1),nstf_name4=physics%model%nstf_name(4), &
                  nstf_name5=physics%model%nstf_name(5),xt=xt_20_ptr_array(cdata%thrd_no)%p, &
                  xz=xz_21_ptr_array(cdata%thrd_no)%p,dt_cool=dt_cool_22_ptr_array(cdata%thrd_no)%p, &
                  z_c=z_c_23_ptr_array(cdata%thrd_no)%p,tref=tref_24_ptr_array(cdata%thrd_no)%p, &
                  xlon=physics%grid%xlon(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf_wat=physics%interstitial(cdata%thrd_no)%tsurf_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc_wat=physics%interstitial(cdata%thrd_no)%tsfc_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  nthreads=physics%model%nthreads,dtzm=physics%interstitial(cdata%thrd_no)%dtzm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%nstf_name(1) > 0)) then
        nullify(xt_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(xz_21_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(dt_cool_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(z_c_23_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nstf_name(1) > 0)) then
        nullify(tref_24_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in sfc_nst_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((.not. physics%model%lsm == physics%model%lsm_ruc)) then
        wet1_38_ptr_array(cdata%thrd_no)%p => physics%diag%wet1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noah .or. physics%model%lsm == physics%model%lsm_noahmp .or. physics%model%lsm == physics%model%lsm_ruc)) then
        lai_39_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xlaixy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noah .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        rca_40_ptr_array(cdata%thrd_no)%p => physics%sfcprop%rca(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call lsm_noah_run(im=physics%model%blksz(cdata%blk_no),km=physics%model%lsoil,grav=con_g, &
                  cp=con_cp,hvap=con_hvap,rd=con_rd,eps=con_eps,epsm1=con_epsm1,rvrdm1=con_fvirt, &
                  ps=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t1=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  q1=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1,physics%model%ntqv), &
                  soiltyp=physics%sfcprop%stype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vegtype=physics%sfcprop%vtype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sigmaf=physics%interstitial(cdata%thrd_no)%sigmaf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcemis=physics%sfcprop%emis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dlwflx=physics%interstitial(cdata%thrd_no)%gabsbdlw_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dswsfc=physics%diag%dswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  delt=physics%model%dtf,tg3=physics%sfcprop%tg3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cm=physics%interstitial(cdata%thrd_no)%cd_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ch=physics%interstitial(cdata%thrd_no)%cdq_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsl1=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  prslki=physics%interstitial(cdata%thrd_no)%work3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zf=physics%diag%zlvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  land=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slopetyp=physics%sfcprop%slope(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  shdmin=physics%sfcprop%shdmin(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  shdmax=physics%sfcprop%shdmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snoalb=physics%sfcprop%snoalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfalb=physics%radtend%sfalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_iter=physics%interstitial(cdata%thrd_no)%flag_iter(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_guess=physics%interstitial(cdata%thrd_no)%flag_guess(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lheatstrg=physics%model%lheatstrg,isot=physics%model%isot,ivegsrc=physics%model%ivegsrc, &
                  bexppert=physics%interstitial(cdata%thrd_no)%bexp1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlaipert=physics%interstitial(cdata%thrd_no)%xlai1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vegfpert=physics%interstitial(cdata%thrd_no)%vegf1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  pertvegf=physics%interstitial(cdata%thrd_no)%lndp_vgf,albdvis_lnd=physics%sfcprop%albdirvis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albdnir_lnd=physics%sfcprop%albdirnir_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albivis_lnd=physics%sfcprop%albdifvis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albinir_lnd=physics%sfcprop%albdifnir_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjvisbmd=physics%interstitial(cdata%thrd_no)%adjvisbmd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjnirbmd=physics%interstitial(cdata%thrd_no)%adjnirbmd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjvisdfd=physics%interstitial(cdata%thrd_no)%adjvisdfd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  adjnirdfd=physics%interstitial(cdata%thrd_no)%adjnirdfd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rhonewsn1=physics%diag%rhonewsn1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  exticeden=physics%model%exticeden,weasd=physics%sfcprop%weasdl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snwdph=physics%sfcprop%snodl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tskin=physics%sfcprop%tsfcl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tprcp=physics%interstitial(cdata%thrd_no)%tprcp_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  srflag=physics%sfcprop%srflag(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  smc=physics%sfcprop%smc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil), &
                  stc=physics%sfcprop%stc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil), &
                  slc=physics%sfcprop%slc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil), &
                  canopy=physics%sfcprop%canopy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  trans=physics%diag%trans(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsurf=physics%interstitial(cdata%thrd_no)%tsurf_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorl=physics%sfcprop%zorll(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sncovr1=physics%sfcprop%sncovr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qsurf=physics%interstitial(cdata%thrd_no)%qss_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gflux=physics%interstitial(cdata%thrd_no)%gflx_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  drain=physics%interstitial(cdata%thrd_no)%drain(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap=physics%interstitial(cdata%thrd_no)%evap_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx=physics%interstitial(cdata%thrd_no)%hflx_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ep=physics%interstitial(cdata%thrd_no)%ep1d_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  runoff=physics%interstitial(cdata%thrd_no)%runoff(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cmm=physics%interstitial(cdata%thrd_no)%cmm_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  chh=physics%interstitial(cdata%thrd_no)%chh_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evbs=physics%diag%evbs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evcw=physics%diag%evcw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sbsno=physics%diag%sbsno(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowc=physics%interstitial(cdata%thrd_no)%snowc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stm=physics%diag%soilm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snohf=physics%interstitial(cdata%thrd_no)%snohf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  smcwlt2=physics%diag%smcwlt2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  smcref2=physics%diag%smcref2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wet1=wet1_38_ptr_array(cdata%thrd_no)%p,lai=lai_39_ptr_array(cdata%thrd_no)%p, &
                  rca=rca_40_ptr_array(cdata%thrd_no)%p,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((.not. physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(wet1_38_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noah .or. physics%model%lsm == physics%model%lsm_noahmp .or. physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(lai_39_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noah .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(rca_40_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in lsm_noah_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call sfc_sice_run(im=physics%model%blksz(cdata%blk_no),kice=physics%model%kice,sbc=con_sbc, &
                  hvap=con_hvap,tgice=con_tice,cp=con_cp,eps=con_eps,epsm1=con_epsm1,rvrdm1=con_fvirt, &
                  grav=con_g,t0c=con_t0c,rd=con_rd,ps=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t1=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  q1=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1,physics%model%ntqv), &
                  delt=physics%model%dtf,sfcemis=physics%sfcprop%emis_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dlwflx=physics%interstitial(cdata%thrd_no)%gabsbdlw_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcnsw=physics%diag%nswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcdsw=physics%diag%dswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  srflag=physics%sfcprop%srflag(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cm=physics%interstitial(cdata%thrd_no)%cd_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ch=physics%interstitial(cdata%thrd_no)%cdq_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsl1=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  prslki=physics%interstitial(cdata%thrd_no)%work3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsik1=physics%statein%prsik(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  prslk1=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_iter=physics%interstitial(cdata%thrd_no)%flag_iter(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_lake_model=physics%sfcprop%use_lake_model(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lprnt=physics%model%lprnt,ipr=physics%model%ipr,thsfc_loc=physics%model%thsfc_loc, &
                  hice=physics%sfcprop%hice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fice=physics%sfcprop%fice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tice=physics%sfcprop%tisfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  weasd=physics%sfcprop%weasdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc_wat=physics%interstitial(cdata%thrd_no)%tsfc_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tprcp=physics%interstitial(cdata%thrd_no)%tprcp_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tiice=physics%sfcprop%tiice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%kice), &
                  ep=physics%interstitial(cdata%thrd_no)%ep1d_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snwdph=physics%sfcprop%snodi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qss_i=physics%interstitial(cdata%thrd_no)%qss_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qss_w=physics%interstitial(cdata%thrd_no)%qss_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowmt=physics%interstitial(cdata%thrd_no)%snowmt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gflux=physics%interstitial(cdata%thrd_no)%gflx_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cmm=physics%interstitial(cdata%thrd_no)%cmm_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  chh=physics%interstitial(cdata%thrd_no)%chh_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evapi=physics%interstitial(cdata%thrd_no)%evap_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evapw=physics%interstitial(cdata%thrd_no)%evap_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflxi=physics%interstitial(cdata%thrd_no)%hflx_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflxw=physics%interstitial(cdata%thrd_no)%hflx_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  islmsk=physics%interstitial(cdata%thrd_no)%islmsk_cice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in sfc_sice_run: " // trim(cdata%errmsg)
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
        hflx_fire_41_ptr_array(cdata%thrd_no)%p => physics%sfcprop%hflx_fire(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cpl_fire)) then
        evap_fire_42_ptr_array(cdata%thrd_no)%p => physics%sfcprop%evap_fire(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
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
                  hflx_fire=hflx_fire_41_ptr_array(cdata%thrd_no)%p,evap_fire=evap_fire_42_ptr_array(cdata%thrd_no)%p, &
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
        nullify(hflx_fire_41_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cpl_fire)) then
        nullify(evap_fire_42_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_surface_composites_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        lake_t2m_43_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        lake_q2m_44_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_q2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
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
                  lake_t2m=lake_t2m_43_ptr_array(cdata%thrd_no)%p,diag_flux=physics%model%diag_flux, &
                  diag_log=physics%model%diag_log,shflx=physics%sfcprop%hflx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lake_q2m=lake_q2m_44_ptr_array(cdata%thrd_no)%p,cdq=physics%interstitial(cdata%thrd_no)%cdq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_lake2m=physics%model%use_lake2m,wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  f10m=physics%sfcprop%f10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u10m=physics%diag%u10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10m=physics%diag%v10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t2m=physics%sfcprop%t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  q2m=physics%sfcprop%q2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dpt2m=physics%diag%dpt2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        nullify(lake_t2m_43_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        nullify(lake_q2m_44_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in sfc_diag_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        t2mmp_45_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%t2mmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        q2mp_46_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%q2mp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call sfc_diag_post_run(im=physics%model%blksz(cdata%blk_no),lsm=physics%model%lsm,lsm_noahmp=physics%model%lsm_noahmp, &
                  opt_diag=physics%model%iopt_diag,dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lssav=physics%model%lssav,dtf=physics%model%dtf,con_eps=con_eps,con_epsm1=con_epsm1, &
                  pgr=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t2mmp=t2mmp_45_ptr_array(cdata%thrd_no)%p,q2mp=q2mp_46_ptr_array(cdata%thrd_no)%p, &
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
        nullify(t2mmp_45_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(q2mp_46_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in sfc_diag_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        pahi_47_ptr_array(cdata%thrd_no)%p => physics%diag%pahi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        dlwsfci_cpl_48_ptr_array(cdata%thrd_no)%p => physics%coupling%dlwsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        dswsfci_cpl_49_ptr_array(cdata%thrd_no)%p => physics%coupling%dswsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        dlwsfc_cpl_50_ptr_array(cdata%thrd_no)%p => physics%coupling%dlwsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        dswsfc_cpl_51_ptr_array(cdata%thrd_no)%p => physics%coupling%dswsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dnirbmi_cpl_52_ptr_array(cdata%thrd_no)%p => physics%coupling%dnirbmi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dnirdfi_cpl_53_ptr_array(cdata%thrd_no)%p => physics%coupling%dnirdfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvisbmi_cpl_54_ptr_array(cdata%thrd_no)%p => physics%coupling%dvisbmi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvisdfi_cpl_55_ptr_array(cdata%thrd_no)%p => physics%coupling%dvisdfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dnirbm_cpl_56_ptr_array(cdata%thrd_no)%p => physics%coupling%dnirbm_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dnirdf_cpl_57_ptr_array(cdata%thrd_no)%p => physics%coupling%dnirdf_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvisbm_cpl_58_ptr_array(cdata%thrd_no)%p => physics%coupling%dvisbm_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvisdf_cpl_59_ptr_array(cdata%thrd_no)%p => physics%coupling%dvisdf_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nlwsfci_cpl_60_ptr_array(cdata%thrd_no)%p => physics%coupling%nlwsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nlwsfc_cpl_61_ptr_array(cdata%thrd_no)%p => physics%coupling%nlwsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        t2mi_cpl_62_ptr_array(cdata%thrd_no)%p => physics%coupling%t2mi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        q2mi_cpl_63_ptr_array(cdata%thrd_no)%p => physics%coupling%q2mi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cplwav .or. physics%model%cpl_fire)) then
        u10mi_cpl_64_ptr_array(cdata%thrd_no)%p => physics%coupling%u10mi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cplwav .or. physics%model%cpl_fire)) then
        v10mi_cpl_65_ptr_array(cdata%thrd_no)%p => physics%coupling%v10mi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        tsfci_cpl_66_ptr_array(cdata%thrd_no)%p => physics%coupling%tsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        psurfi_cpl_67_ptr_array(cdata%thrd_no)%p => physics%coupling%psurfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nnirbmi_cpl_68_ptr_array(cdata%thrd_no)%p => physics%coupling%nnirbmi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nnirdfi_cpl_69_ptr_array(cdata%thrd_no)%p => physics%coupling%nnirdfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nvisbmi_cpl_70_ptr_array(cdata%thrd_no)%p => physics%coupling%nvisbmi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nvisdfi_cpl_71_ptr_array(cdata%thrd_no)%p => physics%coupling%nvisdfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nswsfci_cpl_72_ptr_array(cdata%thrd_no)%p => physics%coupling%nswsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nswsfc_cpl_73_ptr_array(cdata%thrd_no)%p => physics%coupling%nswsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nnirbm_cpl_74_ptr_array(cdata%thrd_no)%p => physics%coupling%nnirbm_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nnirdf_cpl_75_ptr_array(cdata%thrd_no)%p => physics%coupling%nnirdf_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nvisbm_cpl_76_ptr_array(cdata%thrd_no)%p => physics%coupling%nvisbm_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nvisdf_cpl_77_ptr_array(cdata%thrd_no)%p => physics%coupling%nvisdf_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        paha_78_ptr_array(cdata%thrd_no)%p => physics%diag%paha(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        waxy_79_ptr_array(cdata%thrd_no)%p => physics%sfcprop%waxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        twa_80_ptr_array(cdata%thrd_no)%p => physics%diag%twa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
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
                  pahi=pahi_47_ptr_array(cdata%thrd_no)%p,epi=physics%diag%epi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gfluxi=physics%diag%gfluxi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t1=physics%diag%t1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  q1=physics%diag%q1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u1=physics%diag%u1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v1=physics%diag%v1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dlwsfci_cpl=dlwsfci_cpl_48_ptr_array(cdata%thrd_no)%p,dswsfci_cpl=dswsfci_cpl_49_ptr_array(cdata%thrd_no)%p, &
                  dlwsfc_cpl=dlwsfc_cpl_50_ptr_array(cdata%thrd_no)%p,dswsfc_cpl=dswsfc_cpl_51_ptr_array(cdata%thrd_no)%p, &
                  dnirbmi_cpl=dnirbmi_cpl_52_ptr_array(cdata%thrd_no)%p,dnirdfi_cpl=dnirdfi_cpl_53_ptr_array(cdata%thrd_no)%p, &
                  dvisbmi_cpl=dvisbmi_cpl_54_ptr_array(cdata%thrd_no)%p,dvisdfi_cpl=dvisdfi_cpl_55_ptr_array(cdata%thrd_no)%p, &
                  dnirbm_cpl=dnirbm_cpl_56_ptr_array(cdata%thrd_no)%p,dnirdf_cpl=dnirdf_cpl_57_ptr_array(cdata%thrd_no)%p, &
                  dvisbm_cpl=dvisbm_cpl_58_ptr_array(cdata%thrd_no)%p,dvisdf_cpl=dvisdf_cpl_59_ptr_array(cdata%thrd_no)%p, &
                  nlwsfci_cpl=nlwsfci_cpl_60_ptr_array(cdata%thrd_no)%p,nlwsfc_cpl=nlwsfc_cpl_61_ptr_array(cdata%thrd_no)%p, &
                  t2mi_cpl=t2mi_cpl_62_ptr_array(cdata%thrd_no)%p,q2mi_cpl=q2mi_cpl_63_ptr_array(cdata%thrd_no)%p, &
                  u10mi_cpl=u10mi_cpl_64_ptr_array(cdata%thrd_no)%p,v10mi_cpl=v10mi_cpl_65_ptr_array(cdata%thrd_no)%p, &
                  tsfci_cpl=tsfci_cpl_66_ptr_array(cdata%thrd_no)%p,psurfi_cpl=psurfi_cpl_67_ptr_array(cdata%thrd_no)%p, &
                  nnirbmi_cpl=nnirbmi_cpl_68_ptr_array(cdata%thrd_no)%p,nnirdfi_cpl=nnirdfi_cpl_69_ptr_array(cdata%thrd_no)%p, &
                  nvisbmi_cpl=nvisbmi_cpl_70_ptr_array(cdata%thrd_no)%p,nvisdfi_cpl=nvisdfi_cpl_71_ptr_array(cdata%thrd_no)%p, &
                  nswsfci_cpl=nswsfci_cpl_72_ptr_array(cdata%thrd_no)%p,nswsfc_cpl=nswsfc_cpl_73_ptr_array(cdata%thrd_no)%p, &
                  nnirbm_cpl=nnirbm_cpl_74_ptr_array(cdata%thrd_no)%p,nnirdf_cpl=nnirdf_cpl_75_ptr_array(cdata%thrd_no)%p, &
                  nvisbm_cpl=nvisbm_cpl_76_ptr_array(cdata%thrd_no)%p,nvisdf_cpl=nvisdf_cpl_77_ptr_array(cdata%thrd_no)%p, &
                  gflux=physics%diag%gflux(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evbsa=physics%diag%evbsa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evcwa=physics%diag%evcwa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  transa=physics%diag%transa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sbsnoa=physics%diag%sbsnoa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowca=physics%diag%snowca(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snohfa=physics%diag%snohfa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  paha=paha_78_ptr_array(cdata%thrd_no)%p,ep=physics%diag%ep(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ecan=physics%interstitial(cdata%thrd_no)%ecan(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  etran=physics%interstitial(cdata%thrd_no)%etran(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  edir=physics%interstitial(cdata%thrd_no)%edir(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  waxy=waxy_79_ptr_array(cdata%thrd_no)%p,runoff=physics%diag%runoff(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  srunoff=physics%diag%srunoff(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  runof=physics%interstitial(cdata%thrd_no)%runoff(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  drain=physics%interstitial(cdata%thrd_no)%drain(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tecan=physics%diag%tecan(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tetran=physics%diag%tetran(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tedir=physics%diag%tedir(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  twa=twa_80_ptr_array(cdata%thrd_no)%p,lheatstrg=physics%model%lheatstrg, &
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
        nullify(pahi_47_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(dlwsfci_cpl_48_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(dswsfci_cpl_49_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(dlwsfc_cpl_50_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(dswsfc_cpl_51_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dnirbmi_cpl_52_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dnirdfi_cpl_53_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvisbmi_cpl_54_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvisdfi_cpl_55_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dnirbm_cpl_56_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dnirdf_cpl_57_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvisbm_cpl_58_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvisdf_cpl_59_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(nlwsfci_cpl_60_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(nlwsfc_cpl_61_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(t2mi_cpl_62_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(q2mi_cpl_63_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cplwav .or. physics%model%cpl_fire)) then
        nullify(u10mi_cpl_64_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cplwav .or. physics%model%cpl_fire)) then
        nullify(v10mi_cpl_65_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        nullify(tsfci_cpl_66_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(psurfi_cpl_67_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nnirbmi_cpl_68_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nnirdfi_cpl_69_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nvisbmi_cpl_70_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nvisdfi_cpl_71_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(nswsfci_cpl_72_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nswsfc_cpl_73_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nnirbm_cpl_74_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nnirdf_cpl_75_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nvisbm_cpl_76_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nvisdf_cpl_77_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(paha_78_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(waxy_79_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(twa_80_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_surface_generic_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call gfs_pbl_generic_pre_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,nvdiff=physics%interstitial(cdata%thrd_no)%nvdiff, &
                  ntrac=physics%model%ntrac,rtg_ozone_index=physics%interstitial(cdata%thrd_no)%rtg_ozone_index, &
                  ntqv=physics%model%ntqv,ntcw=physics%model%ntcw,ntiw=physics%model%ntiw, &
                  ntrw=physics%model%ntrw,ntsw=physics%model%ntsw,ntlnc=physics%model%ntlnc, &
                  ntinc=physics%model%ntinc,ntrnc=physics%model%ntrnc,ntsnc=physics%model%ntsnc, &
                  ntgnc=physics%model%ntgnc,ntwa=physics%model%ntwa,ntia=physics%model%ntia, &
                  ntgl=physics%model%ntgl,ntoz=physics%model%ntoz,ntke=physics%model%ntke, &
                  ntkev=physics%interstitial(cdata%thrd_no)%ntkev,nqvtag=physics%model%nqvtag, &
                  nqvtagv=physics%interstitial(cdata%thrd_no)%nqvtagv,nqrimef=physics%model%nqrimef, &
                  trans_aero=physics%interstitial(cdata%thrd_no)%trans_aero,ntchs=physics%model%ntchs, &
                  ntchm=physics%model%ntchm,ntccn=physics%model%ntccn,nthl=physics%model%nthl, &
                  nthnc=physics%model%nthnc,ntgv=physics%model%ntgv,nthv=physics%model%nthv, &
                  ntrz=physics%model%ntrz,ntgz=physics%model%ntgz,nthz=physics%model%nthz, &
                  imp_physics=physics%model%imp_physics,imp_physics_gfdl=physics%model%imp_physics_gfdl, &
                  imp_physics_thompson=physics%model%imp_physics_thompson,imp_physics_wsm6=physics%model%imp_physics_wsm6, &
                  imp_physics_mg=physics%model%imp_physics_mg,imp_physics_fer_hires=physics%model%imp_physics_fer_hires, &
                  imp_physics_nssl=physics%model%imp_physics_nssl,ltaerosol=physics%model%ltaerosol, &
                  mraerosol=physics%model%mraerosol,nssl_ccn_on=physics%model%nssl_ccn_on, &
                  nssl_hail_on=physics%model%nssl_hail_on,nssl_3moment=physics%model%nssl_3moment, &
                  hybedmf=physics%model%hybedmf,do_shoc=physics%model%do_shoc,satmedmf=physics%model%satmedmf, &
                  qgrs=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  vdftra=physics%interstitial(cdata%thrd_no)%vdftra(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nvdiff), &
                  ugrs=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  vgrs=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tgrs=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_pbl_generic_pre_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        claie_81_ptr_array(cdata%thrd_no)%p => physics%diag%claie(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        cfch_82_ptr_array(cdata%thrd_no)%p => physics%diag%cfch(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        cfrt_83_ptr_array(cdata%thrd_no)%p => physics%diag%cfrt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        cclu_84_ptr_array(cdata%thrd_no)%p => physics%diag%cclu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        cpopu_85_ptr_array(cdata%thrd_no)%p => physics%diag%cpopu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%ldiag3d)) then
        dtend_18_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      call satmedmfvdifq_run(im=physics%model%blksz(cdata%blk_no),km=physics%model%levs,ntrac=physics%interstitial(cdata%thrd_no)%nvdiff, &
                  ntcw=physics%interstitial(cdata%thrd_no)%ntcwx,ntrw=physics%interstitial(cdata%thrd_no)%ntrwx, &
                  ntiw=physics%interstitial(cdata%thrd_no)%ntiwx,ntke=physics%interstitial(cdata%thrd_no)%ntkev, &
                  grav=con_g,pi=con_pi,rd=con_rd,cp=con_cp,rv=con_rv,hvap=con_hvap,hfus=con_hfus, &
                  fv=con_fvirt,eps=con_eps,epsm1=con_epsm1,rtg=physics%interstitial(cdata%thrd_no)%dvdftra(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nvdiff), &
                  u1=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  v1=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  usfco=physics%sfcprop%usfco(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vsfco=physics%sfcprop%vsfco(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_oceanuv=physics%model%use_oceanuv,t1=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  q1=physics%interstitial(cdata%thrd_no)%vdftra(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nvdiff), &
                  def_1=physics%statein%def_1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  def_2=physics%statein%def_2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  def_3=physics%statein%def_3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  swh=physics%radtend%htrsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  hlw=physics%radtend%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  xmu=physics%interstitial(cdata%thrd_no)%xmu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  garea=physics%grid%area(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zvfun=physics%interstitial(cdata%thrd_no)%zvfun(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sigmaf=physics%interstitial(cdata%thrd_no)%sigmaf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  psk=physics%statein%prsik(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  rbsoil=physics%interstitial(cdata%thrd_no)%rb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorl=physics%sfcprop%zorl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u10m=physics%diag%u10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10m=physics%diag%v10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm=physics%sfcprop%ffmm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh=physics%sfcprop%ffhh(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsea=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  heat=physics%interstitial(cdata%thrd_no)%hflxq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap=physics%sfcprop%evap(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress=physics%interstitial(cdata%thrd_no)%stress(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  spd1=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kpbl=physics%interstitial(cdata%thrd_no)%kpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  del=physics%interstitial(cdata%thrd_no)%del(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prslk=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  phil=physics%statein%phil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  delt=physics%model%dtp,tte_edmf=physics%model%tte_edmf,dspheat=physics%model%dspheat, &
                  sa3dtke=physics%model%sa3dtke,dusfc=physics%interstitial(cdata%thrd_no)%dusfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvsfc=physics%interstitial(cdata%thrd_no)%dvsfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtsfc=physics%interstitial(cdata%thrd_no)%dtsfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dqsfc=physics%interstitial(cdata%thrd_no)%dqsfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hpbl=physics%tbd%hpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tkeh=physics%interstitial(cdata%thrd_no)%tkeh(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  dkt=physics%diag%dkt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dku=physics%diag%dku(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dku3d_h=physics%tbd%dku3d_h(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dku3d_e=physics%tbd%dku3d_e(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  kinver=physics%interstitial(cdata%thrd_no)%kinver(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xkzm_m=physics%model%xkzm_m,xkzm_h=physics%model%xkzm_h,xkzm_s=physics%model%xkzm_s, &
                  dspfac=physics%model%dspfac,bl_upfr=physics%model%bl_upfr,bl_dnfr=physics%model%bl_dnfr, &
                  rlmx=physics%model%rlmx,elmx=physics%model%elmx,do_canopy=physics%model%do_canopy, &
                  cplaqm=physics%model%cplaqm,claie=claie_81_ptr_array(cdata%thrd_no)%p,cfch=cfch_82_ptr_array(cdata%thrd_no)%p, &
                  cfrt=cfrt_83_ptr_array(cdata%thrd_no)%p,cclu=cclu_84_ptr_array(cdata%thrd_no)%p, &
                  cpopu=cpopu_85_ptr_array(cdata%thrd_no)%p,sfc_rlm=physics%model%sfc_rlm, &
                  tc_pbl=physics%model%tc_pbl,use_lpt=physics%model%use_lpt,ntqv=physics%model%ntqv, &
                  dtend=dtend_18_ptr_array(cdata%thrd_no)%p,nqvtag=physics%model%nqvtag,nqvtagv=physics%interstitial(cdata%thrd_no)%nqvtagv, &
                  dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_temperature=physics%model%index_of_temperature,index_of_x_wind=physics%model%index_of_x_wind, &
                  index_of_y_wind=physics%model%index_of_y_wind,index_of_process_pbl=physics%model%index_of_process_pbl, &
                  gen_tend=physics%model%flag_for_pbl_generic_tend,ldiag3d=physics%model%ldiag3d, &
                  ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(claie_81_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(cfch_82_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(cfrt_83_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(cclu_84_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(cpopu_85_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_18_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in satmedmfvdifq_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        dkt_can_86_ptr_array(cdata%thrd_no)%p => physics%diag%dkt_can(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        dku_can_87_ptr_array(cdata%thrd_no)%p => physics%diag%dku_can(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        claie_81_ptr_array(cdata%thrd_no)%p => physics%diag%claie(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        cfch_82_ptr_array(cdata%thrd_no)%p => physics%diag%cfch(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        cfrt_83_ptr_array(cdata%thrd_no)%p => physics%diag%cfrt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        cclu_84_ptr_array(cdata%thrd_no)%p => physics%diag%cclu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        cpopu_85_ptr_array(cdata%thrd_no)%p => physics%diag%cpopu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%ldiag3d)) then
        dtend_18_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      call canopy_driver_run(im=physics%model%blksz(cdata%blk_no),km=physics%model%levs,ntrac=physics%interstitial(cdata%thrd_no)%nvdiff, &
                  ntcw=physics%interstitial(cdata%thrd_no)%ntcwx,ntrw=physics%interstitial(cdata%thrd_no)%ntrwx, &
                  ntiw=physics%interstitial(cdata%thrd_no)%ntiwx,ntke=physics%interstitial(cdata%thrd_no)%ntkev, &
                  ntchm=physics%model%ntchm,ntchs=physics%model%ntchs,ntche=physics%model%ntche, &
                  ntoz=physics%model%ntoz,nto3=physics%model%nto3,ndtend=physics%model%ndtend, &
                  con_rocp=con_rocp,grav=con_g,pi=con_pi,rd=con_rd,cp=con_cp,rv=con_rv,hvap=con_hvap, &
                  hfus=con_hfus,fv=con_fvirt,eps=con_eps,epsm1=con_epsm1,dv=physics%interstitial(cdata%thrd_no)%dvdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  du=physics%interstitial(cdata%thrd_no)%dudt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tdt=physics%interstitial(cdata%thrd_no)%dtdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  rtg=physics%interstitial(cdata%thrd_no)%dvdftra(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nvdiff), &
                  u1=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  v1=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  usfco=physics%sfcprop%usfco(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vsfco=physics%sfcprop%vsfco(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_oceanuv=physics%model%use_oceanuv,t1=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  q1=physics%interstitial(cdata%thrd_no)%vdftra(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nvdiff), &
                  def_1=physics%statein%def_1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  def_2=physics%statein%def_2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  def_3=physics%statein%def_3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  swh=physics%radtend%htrsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  hlw=physics%radtend%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  xmu=physics%interstitial(cdata%thrd_no)%xmu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  garea=physics%grid%area(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zvfun=physics%interstitial(cdata%thrd_no)%zvfun(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sigmaf=physics%interstitial(cdata%thrd_no)%sigmaf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  psk=physics%statein%prsik(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  rbsoil=physics%interstitial(cdata%thrd_no)%rb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorl=physics%sfcprop%zorl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u10m=physics%diag%u10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10m=physics%diag%v10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t2m=physics%sfcprop%t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  q2m=physics%sfcprop%q2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm=physics%sfcprop%ffmm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh=physics%sfcprop%ffhh(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsea=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  heat=physics%interstitial(cdata%thrd_no)%hflxq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap=physics%sfcprop%evap(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress=physics%interstitial(cdata%thrd_no)%stress(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  spd1=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kpbl=physics%interstitial(cdata%thrd_no)%kpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  pgr=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  del=physics%interstitial(cdata%thrd_no)%del(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prslk=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  phil=physics%statein%phil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  delt=physics%model%dtp,tte_edmf=physics%model%tte_edmf,dspheat=physics%model%dspheat, &
                  sa3dtke=physics%model%sa3dtke,dusfc=physics%interstitial(cdata%thrd_no)%dusfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvsfc=physics%interstitial(cdata%thrd_no)%dvsfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtsfc=physics%interstitial(cdata%thrd_no)%dtsfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dqsfc=physics%interstitial(cdata%thrd_no)%dqsfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hpbl=physics%tbd%hpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tkeh=physics%interstitial(cdata%thrd_no)%tkeh(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  dkt=physics%diag%dkt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dku=physics%diag%dku(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dkt_can=dkt_can_86_ptr_array(cdata%thrd_no)%p,dku_can=dku_can_87_ptr_array(cdata%thrd_no)%p, &
                  dku3d_h=physics%tbd%dku3d_h(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dku3d_e=physics%tbd%dku3d_e(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  kinver=physics%interstitial(cdata%thrd_no)%kinver(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xkzm_m=physics%model%xkzm_m,xkzm_h=physics%model%xkzm_h,xkzm_s=physics%model%xkzm_s, &
                  dspfac=physics%model%dspfac,bl_upfr=physics%model%bl_upfr,bl_dnfr=physics%model%bl_dnfr, &
                  rlmx=physics%model%rlmx,elmx=physics%model%elmx,do_canopy=physics%model%do_canopy, &
                  cplaqm=physics%model%cplaqm,claie=claie_81_ptr_array(cdata%thrd_no)%p,cfch=cfch_82_ptr_array(cdata%thrd_no)%p, &
                  cfrt=cfrt_83_ptr_array(cdata%thrd_no)%p,cclu=cclu_84_ptr_array(cdata%thrd_no)%p, &
                  cpopu=cpopu_85_ptr_array(cdata%thrd_no)%p,sfc_rlm=physics%model%sfc_rlm, &
                  tc_pbl=physics%model%tc_pbl,use_lpt=physics%model%use_lpt,ntqv=physics%model%ntqv, &
                  dtend=dtend_18_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_temperature=physics%model%index_of_temperature,index_of_x_wind=physics%model%index_of_x_wind, &
                  index_of_y_wind=physics%model%index_of_y_wind,index_of_process_pbl=physics%model%index_of_process_pbl, &
                  gen_tend=physics%model%flag_for_pbl_generic_tend,ldiag3d=physics%model%ldiag3d, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(dkt_can_86_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(dku_can_87_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(claie_81_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(cfch_82_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(cfrt_83_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(cclu_84_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(cpopu_85_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_18_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in canopy_driver_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ldiag3d)) then
        dtend_18_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dusfc_cpl_88_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvsfc_cpl_89_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dtsfc_cpl_90_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dqsfc_cpl_91_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dusfci_cpl_92_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvsfci_cpl_93_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        dtsfci_cpl_94_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        dqsfci_cpl_95_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplchm)) then
        ushfsfci_96_ptr_array(cdata%thrd_no)%p => physics%coupling%ushfsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dusfc_cice_97_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvsfc_cice_98_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dtsfc_cice_99_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dqsfc_cice_100_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        dqsfc_med_101_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfcin_med(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        dtsfc_med_102_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfcin_med(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .and. physics%model%use_med_flux)) then
        dusfc_med_103_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfcin_med(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        dvsfc_med_104_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfcin_med(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call gfs_pbl_generic_post_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,nvdiff=physics%interstitial(cdata%thrd_no)%nvdiff, &
                  ntrac=physics%model%ntrac,ntqv=physics%model%ntqv,ntcw=physics%model%ntcw, &
                  ntiw=physics%model%ntiw,ntrw=physics%model%ntrw,ntsw=physics%model%ntsw, &
                  ntlnc=physics%model%ntlnc,ntinc=physics%model%ntinc,ntrnc=physics%model%ntrnc, &
                  ntsnc=physics%model%ntsnc,ntgnc=physics%model%ntgnc,ntwa=physics%model%ntwa, &
                  ntia=physics%model%ntia,ntgl=physics%model%ntgl,ntoz=physics%model%ntoz, &
                  ntke=physics%model%ntke,ntkev=physics%interstitial(cdata%thrd_no)%ntkev, &
                  nqvtag=physics%model%nqvtag,nqvtagv=physics%interstitial(cdata%thrd_no)%nqvtagv, &
                  nqrimef=physics%model%nqrimef,tend_opt_pbl=physics%model%tend_opt_pbl,trans_aero=physics%interstitial(cdata%thrd_no)%trans_aero, &
                  ntchs=physics%model%ntchs,ntchm=physics%model%ntchm,ntccn=physics%model%ntccn, &
                  nthl=physics%model%nthl,nthnc=physics%model%nthnc,ntgv=physics%model%ntgv, &
                  nthv=physics%model%nthv,ntrz=physics%model%ntrz,ntgz=physics%model%ntgz, &
                  nthz=physics%model%nthz,imp_physics=physics%model%imp_physics,imp_physics_gfdl=physics%model%imp_physics_gfdl, &
                  imp_physics_thompson=physics%model%imp_physics_thompson,imp_physics_wsm6=physics%model%imp_physics_wsm6, &
                  imp_physics_mg=physics%model%imp_physics_mg,imp_physics_fer_hires=physics%model%imp_physics_fer_hires, &
                  imp_physics_nssl=physics%model%imp_physics_nssl,ltaerosol=physics%model%ltaerosol, &
                  mraerosol=physics%model%mraerosol,nssl_ccn_on=physics%model%nssl_ccn_on, &
                  nssl_hail_on=physics%model%nssl_hail_on,nssl_3moment=physics%model%nssl_3moment, &
                  cplflx=physics%model%cplflx,cplaqm=physics%model%cplaqm,cplchm=physics%model%cplchm, &
                  lssav=physics%model%lssav,flag_for_pbl_generic_tend=physics%model%flag_for_pbl_generic_tend, &
                  ldiag3d=physics%model%ldiag3d,lsidea=physics%model%lsidea,hybedmf=physics%model%hybedmf, &
                  do_shoc=physics%model%do_shoc,satmedmf=physics%model%satmedmf,shinhong=physics%model%shinhong, &
                  do_ysu=physics%model%do_ysu,dvdftra=physics%interstitial(cdata%thrd_no)%dvdftra(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nvdiff), &
                  ten_t_pbl=physics%interstitial(cdata%thrd_no)%ten_t_pbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q_pbl=physics%interstitial(cdata%thrd_no)%ten_q_pbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dusfc1=physics%interstitial(cdata%thrd_no)%dusfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvsfc1=physics%interstitial(cdata%thrd_no)%dvsfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtsfc1=physics%interstitial(cdata%thrd_no)%dtsfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtend=dtend_18_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_temperature=physics%model%index_of_temperature,index_of_x_wind=physics%model%index_of_x_wind, &
                  index_of_y_wind=physics%model%index_of_y_wind,index_of_process_pbl=physics%model%index_of_process_pbl, &
                  dqsfc1=physics%interstitial(cdata%thrd_no)%dqsfc1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtf=physics%model%dtf,dtp=physics%model%dtp,dudt=physics%interstitial(cdata%thrd_no)%dudt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt=physics%interstitial(cdata%thrd_no)%dvdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtdt=physics%interstitial(cdata%thrd_no)%dtdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dqdt=physics%interstitial(cdata%thrd_no)%dqdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dusfc_cpl=dusfc_cpl_88_ptr_array(cdata%thrd_no)%p,dvsfc_cpl=dvsfc_cpl_89_ptr_array(cdata%thrd_no)%p, &
                  dtsfc_cpl=dtsfc_cpl_90_ptr_array(cdata%thrd_no)%p,dqsfc_cpl=dqsfc_cpl_91_ptr_array(cdata%thrd_no)%p, &
                  dusfci_cpl=dusfci_cpl_92_ptr_array(cdata%thrd_no)%p,dvsfci_cpl=dvsfci_cpl_93_ptr_array(cdata%thrd_no)%p, &
                  dtsfci_cpl=dtsfci_cpl_94_ptr_array(cdata%thrd_no)%p,dqsfci_cpl=dqsfci_cpl_95_ptr_array(cdata%thrd_no)%p, &
                  dusfc_diag=physics%diag%dusfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvsfc_diag=physics%diag%dvsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtsfc_diag=physics%diag%dtsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dqsfc_diag=physics%diag%dqsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dusfci_diag=physics%diag%dusfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvsfci_diag=physics%diag%dvsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtsfci_diag=physics%diag%dtsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dqsfci_diag=physics%diag%dqsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rd=con_rd,cp=con_cp,fvirt=con_fvirt,hvap=con_hvap,t1=physics%diag%t1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  q1=physics%diag%q1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  hflx=physics%sfcprop%hflx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ushfsfci=ushfsfci_96_ptr_array(cdata%thrd_no)%p,oceanfrac=physics%sfcprop%oceanfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kdt=physics%model%kdt,dusfc_cice=dusfc_cice_97_ptr_array(cdata%thrd_no)%p, &
                  dvsfc_cice=dvsfc_cice_98_ptr_array(cdata%thrd_no)%p,dtsfc_cice=dtsfc_cice_99_ptr_array(cdata%thrd_no)%p, &
                  dqsfc_cice=dqsfc_cice_100_ptr_array(cdata%thrd_no)%p,use_med_flux=physics%model%use_med_flux, &
                  dqsfc_med=dqsfc_med_101_ptr_array(cdata%thrd_no)%p,dtsfc_med=dtsfc_med_102_ptr_array(cdata%thrd_no)%p, &
                  dusfc_med=dusfc_med_103_ptr_array(cdata%thrd_no)%p,dvsfc_med=dvsfc_med_104_ptr_array(cdata%thrd_no)%p, &
                  wet=physics%interstitial(cdata%thrd_no)%wet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icy=physics%interstitial(cdata%thrd_no)%icy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress_wat=physics%interstitial(cdata%thrd_no)%stress_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hflx_wat=physics%interstitial(cdata%thrd_no)%hflx_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evap_wat=physics%interstitial(cdata%thrd_no)%evap_water(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ugrs1=physics%statein%ugrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  vgrs1=physics%statein%vgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  hffac=physics%interstitial(cdata%thrd_no)%hffac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ugrs=physics%statein%ugrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  vgrs=physics%statein%vgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tgrs=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  qgrs=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  huge=physics%model%huge,gt0=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  gu0=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gv0=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ldiag3d)) then
        nullify(dtend_18_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dusfc_cpl_88_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvsfc_cpl_89_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dtsfc_cpl_90_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dqsfc_cpl_91_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dusfci_cpl_92_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvsfci_cpl_93_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(dtsfci_cpl_94_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(dqsfci_cpl_95_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplchm)) then
        nullify(ushfsfci_96_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dusfc_cice_97_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvsfc_cice_98_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dtsfc_cice_99_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dqsfc_cice_100_ptr_array(cdata%thrd_no)%p)
      end if

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        nullify(dqsfc_med_101_ptr_array(cdata%thrd_no)%p)
      end if

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        nullify(dtsfc_med_102_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .and. physics%model%use_med_flux)) then
        nullify(dusfc_med_103_ptr_array(cdata%thrd_no)%p)
      end if

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        nullify(dvsfc_med_104_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_pbl_generic_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        varss_105_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%varss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        ocss_106_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ocss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        oa4ss_107_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%oa4ss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        clxss_108_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%clxss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      call gfs_gwd_generic_pre_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,nmtvr=physics%model%nmtvr, &
                  mntvar=physics%sfcprop%hprime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nmtvr), &
                  oc=physics%interstitial(cdata%thrd_no)%oc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oa4=physics%interstitial(cdata%thrd_no)%oa4(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  clx=physics%interstitial(cdata%thrd_no)%clx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  theta=physics%interstitial(cdata%thrd_no)%theta(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  varss=varss_105_ptr_array(cdata%thrd_no)%p,ocss=ocss_106_ptr_array(cdata%thrd_no)%p, &
                  oa4ss=oa4ss_107_ptr_array(cdata%thrd_no)%p,clxss=clxss_108_ptr_array(cdata%thrd_no)%p, &
                  sigma=physics%interstitial(cdata%thrd_no)%sigma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gamma=physics%interstitial(cdata%thrd_no)%gamma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  elvmax=physics%interstitial(cdata%thrd_no)%elvmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(varss_105_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(ocss_106_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(oa4ss_107_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(clxss_108_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_gwd_generic_pre_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dusfc_ms_109_ptr_array(cdata%thrd_no)%p => physics%diag%du_ogwcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvsfc_ms_110_ptr_array(cdata%thrd_no)%p => physics%diag%dv_ogwcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dusfc_bl_111_ptr_array(cdata%thrd_no)%p => physics%diag%du_oblcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvsfc_bl_112_ptr_array(cdata%thrd_no)%p => physics%diag%dv_oblcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtauy2d_ms_113_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtaux2d_bl_114_ptr_array(cdata%thrd_no)%p => physics%diag%dudt_obl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dtauy2d_bl_115_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_obl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        du3dt_mtb_116_ptr_array(cdata%thrd_no)%p => physics%diag%du3dt_mtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        du3dt_ogw_117_ptr_array(cdata%thrd_no)%p => physics%diag%du3dt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        du3dt_tms_118_ptr_array(cdata%thrd_no)%p => physics%diag%du3dt_tms(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if (( physics%model%ntke > 0 )) then
        q_tke_119_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntke)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_18_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      call cires_ugwp_run(do_ugwp=physics%model%do_ugwp,me=physics%model%me,master=physics%model%master, &
                  im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,ntrac=physics%model%ntrac, &
                  dtp=physics%model%dtp,kdt=physics%model%kdt,lonr=physics%model%lonr,oro=physics%sfcprop%oro(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oro_uf=physics%sfcprop%oro_uf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hprime=physics%sfcprop%hprime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  nmtvr=physics%model%nmtvr,oc=physics%interstitial(cdata%thrd_no)%oc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  theta=physics%interstitial(cdata%thrd_no)%theta(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sigma=physics%interstitial(cdata%thrd_no)%sigma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gamma=physics%interstitial(cdata%thrd_no)%gamma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  elvmax=physics%interstitial(cdata%thrd_no)%elvmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  clx=physics%interstitial(cdata%thrd_no)%clx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  oa4=physics%interstitial(cdata%thrd_no)%oa4(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  do_tofd=physics%model%do_tofd,ldiag_ugwp=physics%model%ldiag_ugwp,cdmbgwd=physics%model%cdmbgwd(one:4), &
                  xlat=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlat_d=physics%grid%xlat_d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sinlat=physics%grid%sinlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  coslat=physics%grid%coslat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  area=physics%grid%area(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ugrs=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  vgrs=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tgrs=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  qgrs=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prslk=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  phil=physics%statein%phil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  del=physics%interstitial(cdata%thrd_no)%del(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  kpbl=physics%interstitial(cdata%thrd_no)%kpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dusfcg=physics%interstitial(cdata%thrd_no)%dusfcg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvsfcg=physics%interstitial(cdata%thrd_no)%dvsfcg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gw_dudt=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gw_dvdt=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gw_dtdt=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gw_kdis=physics%diag%kdis_gw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tau_tofd=physics%interstitial(cdata%thrd_no)%tau_tofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tau_mtb=physics%interstitial(cdata%thrd_no)%tau_mtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tau_ogw=physics%interstitial(cdata%thrd_no)%tau_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tau_ngw=physics%interstitial(cdata%thrd_no)%tau_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zmtb=physics%interstitial(cdata%thrd_no)%zmtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zlwb=physics%interstitial(cdata%thrd_no)%zlwb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zogw=physics%interstitial(cdata%thrd_no)%zogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dusfc_ms=dusfc_ms_109_ptr_array(cdata%thrd_no)%p,dvsfc_ms=dvsfc_ms_110_ptr_array(cdata%thrd_no)%p, &
                  dusfc_bl=dusfc_bl_111_ptr_array(cdata%thrd_no)%p,dvsfc_bl=dvsfc_bl_112_ptr_array(cdata%thrd_no)%p, &
                  dudt_ogw=physics%diag%dudt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtauy2d_ms=dtauy2d_ms_113_ptr_array(cdata%thrd_no)%p,dtaux2d_bl=dtaux2d_bl_114_ptr_array(cdata%thrd_no)%p, &
                  dtauy2d_bl=dtauy2d_bl_115_ptr_array(cdata%thrd_no)%p,dudt_mtb=physics%interstitial(cdata%thrd_no)%dudt_mtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dudt_tms=physics%interstitial(cdata%thrd_no)%dudt_tms(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  du3dt_mtb=du3dt_mtb_116_ptr_array(cdata%thrd_no)%p,du3dt_ogw=du3dt_ogw_117_ptr_array(cdata%thrd_no)%p, &
                  du3dt_tms=du3dt_tms_118_ptr_array(cdata%thrd_no)%p,rdxzb=physics%diag%zmtnblck(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  con_g=con_g,con_pi=con_pi,con_cp=con_cp,con_rd=con_rd,con_rv=con_rv,con_fvirt=con_fvirt, &
                  con_omega=con_omega,rain=physics%diag%rain(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ntke=physics%model%ntke,q_tke=q_tke_119_ptr_array(cdata%thrd_no)%p,dqdt_tke=physics%interstitial(cdata%thrd_no)%dqdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntke), &
                  lprnt=physics%model%lprnt,ipr=physics%model%ipr,dtend=dtend_18_ptr_array(cdata%thrd_no)%p, &
                  dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_x_wind=physics%model%index_of_x_wind,index_of_y_wind=physics%model%index_of_y_wind, &
                  index_of_temperature=physics%model%index_of_temperature,index_of_process_orographic_gwd=physics%model%index_of_process_orographic_gwd, &
                  index_of_process_nonorographic_gwd=physics%model%index_of_process_nonorographic_gwd, &
                  ldiag3d=physics%model%ldiag3d,lssav=physics%model%lssav,flag_for_gwd_generic_tend=physics%model%flag_for_gwd_generic_tend, &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dusfc_ms_109_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvsfc_ms_110_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dusfc_bl_111_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvsfc_bl_112_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtauy2d_ms_113_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtaux2d_bl_114_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dtauy2d_bl_115_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(du3dt_mtb_116_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(du3dt_ogw_117_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(du3dt_tms_118_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntke > 0 )) then
        nullify(q_tke_119_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_18_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in cires_ugwp_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ldiag_ugwp)) then
        du3dt_mtb_116_ptr_array(cdata%thrd_no)%p => physics%diag%du3dt_mtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        du3dt_ogw_117_ptr_array(cdata%thrd_no)%p => physics%diag%du3dt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        du3dt_tms_118_ptr_array(cdata%thrd_no)%p => physics%diag%du3dt_tms(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        du3dt_ngw_120_ptr_array(cdata%thrd_no)%p => physics%diag%du3dt_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        dv3dt_ngw_121_ptr_array(cdata%thrd_no)%p => physics%diag%dv3dt_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call cires_ugwp_post_run(ldiag_ugwp=physics%model%ldiag_ugwp,dtf=physics%model%dtf,im=physics%model%blksz(cdata%blk_no), &
                  levs=physics%model%levs,gw_dudt=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gw_dvdt=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tau_tofd=physics%interstitial(cdata%thrd_no)%tau_tofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tau_mtb=physics%interstitial(cdata%thrd_no)%tau_mtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tau_ogw=physics%interstitial(cdata%thrd_no)%tau_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tau_ngw=physics%interstitial(cdata%thrd_no)%tau_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zmtb=physics%interstitial(cdata%thrd_no)%zmtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zlwb=physics%interstitial(cdata%thrd_no)%zlwb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zogw=physics%interstitial(cdata%thrd_no)%zogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dudt_mtb=physics%interstitial(cdata%thrd_no)%dudt_mtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dudt_ogw=physics%diag%dudt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dudt_tms=physics%interstitial(cdata%thrd_no)%dudt_tms(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tot_zmtb=physics%diag%zmtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tot_zlwb=physics%diag%zlwb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tot_zogw=physics%diag%zogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tot_tofd=physics%diag%tau_tofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tot_mtb=physics%diag%tau_mtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tot_ogw=physics%diag%tau_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tot_ngw=physics%diag%tau_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  du3dt_mtb=du3dt_mtb_116_ptr_array(cdata%thrd_no)%p,du3dt_ogw=du3dt_ogw_117_ptr_array(cdata%thrd_no)%p, &
                  du3dt_tms=du3dt_tms_118_ptr_array(cdata%thrd_no)%p,du3dt_ngw=du3dt_ngw_120_ptr_array(cdata%thrd_no)%p, &
                  dv3dt_ngw=dv3dt_ngw_121_ptr_array(cdata%thrd_no)%p,errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)


      if ((physics%model%ldiag_ugwp)) then
        nullify(du3dt_mtb_116_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(du3dt_ogw_117_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(du3dt_tms_118_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(du3dt_ngw_120_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(dv3dt_ngw_121_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in cires_ugwp_post_run: " // trim(cdata%errmsg)
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

    



   end function scm_gfs_v16_phys_ps_run_cap

   function scm_gfs_v16_phys_ps_final_cap(one,physics,cdata) result(ierr)

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

      


      call lsm_noah_finalize(errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in lsm_noah_finalize: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      


      call cires_ugwp_finalize(errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in cires_ugwp_finalize: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized = .false.


   end function scm_gfs_v16_phys_ps_final_cap

end module ccpp_scm_gfs_v16_phys_ps_cap
