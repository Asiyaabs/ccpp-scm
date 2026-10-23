
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
!! @brief Auto-generated cap module for the CCPP phys_ts group
!!
!
module ccpp_scm_gfs_v16_phys_ts_cap

   use gfs_photochemistry, only: gfs_photochemistry_init
   use gfdl_cloud_microphys, only: gfdl_cloud_microphys_init
   use gfs_photochemistry, only: gfs_photochemistry_run
   use gfs_photochemistry_post, only: gfs_photochemistry_post_run
   use get_phi_fv3, only: get_phi_fv3_run
   use gfs_suite_interstitial_3, only: gfs_suite_interstitial_3_run
   use samfdeepcnv, only: samfdeepcnv_run
   use gfs_dcnv_generic_post, only: gfs_dcnv_generic_post_run
   use samfshalcnv, only: samfshalcnv_run
   use gfs_scnv_generic_post, only: gfs_scnv_generic_post_run
   use gfs_suite_interstitial_4, only: gfs_suite_interstitial_4_run
   use cnvc90, only: cnvc90_run
   use gfdl_cloud_microphys, only: gfdl_cloud_microphys_run
   use gfs_mp_generic_post, only: gfs_mp_generic_post_run
   use maximum_hourly_diagnostics, only: maximum_hourly_diagnostics_run
   use gfs_physics_post, only: gfs_physics_post_run
   use gfdl_cloud_microphys, only: gfdl_cloud_microphys_finalize


   implicit none

   private
   public :: scm_gfs_v16_phys_ts_tsinit_cap, &
             scm_gfs_v16_phys_ts_tsfinal_cap, &
             scm_gfs_v16_phys_ts_init_cap, &
             scm_gfs_v16_phys_ts_run_cap, &
             scm_gfs_v16_phys_ts_final_cap

   logical, dimension(200), save :: initialized = .false.

   contains

   function scm_gfs_v16_phys_ts_tsinit_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_gfs_v16_phys_ts_tsinit_cap

   function scm_gfs_v16_phys_ts_tsfinal_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_gfs_v16_phys_ts_tsfinal_cap

   function scm_gfs_v16_phys_ts_init_cap(one,physics,cdata) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t

      implicit none

      ! Error handling
      integer :: ierr

      integer, intent(in), target :: one
      type(physics_type), intent(in), target :: physics
      type(ccpp_t), intent(inout), target :: cdata

      ierr = 0


      if (initialized(cdata%ccpp_instance)) return



      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      


      call gfs_photochemistry_init(oz_phys_2006=physics%model%oz_phys,oz_phys_2015=physics%model%oz_phys_2015, &
                  h2o_phys=physics%model%h2o_phys,errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_photochemistry_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call gfdl_cloud_microphys_init(me=physics%model%me,master=physics%model%master,nlunit=physics%model%nlunit, &
                  input_nml_file=physics%model%input_nml_file(:),logunit=physics%model%logunit, &
                  fn_nml=physics%model%fn_nml,imp_physics=physics%model%imp_physics,imp_physics_gfdl=physics%model%imp_physics_gfdl, &
                  do_shoc=physics%model%do_shoc,errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfdl_cloud_microphys_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized(cdata%ccpp_instance) = .true.


   end function scm_gfs_v16_phys_ts_init_cap

   function scm_gfs_v16_phys_ts_run_cap(one,physics,cdata,con_1ovg,con_fvirt,con_cliq,con_cp,con_cvap,con_eps,con_epsm1, &
                  con_g,con_hvap,con_rd,con_rv,con_t0c,con_pi,rainmin,rhowater) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t
      use machine, only: kind_phys

      implicit none

      ! Error handling
      integer :: ierr

      integer, intent(in), target :: one
      type(physics_type), intent(inout), target :: physics
      type(ccpp_t), intent(inout), target :: cdata
      real(kind_phys), intent(in), target :: con_1ovg
      real(kind_phys), intent(in), target :: con_fvirt
      real(kind_phys), intent(in), target :: con_cliq
      real(kind_phys), intent(in), target :: con_cp
      real(kind_phys), intent(in), target :: con_cvap
      real(kind_phys), intent(in), target :: con_eps
      real(kind_phys), intent(in), target :: con_epsm1
      real(kind_phys), intent(in), target :: con_g
      real(kind_phys), intent(in), target :: con_hvap
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: con_rv
      real(kind_phys), intent(in), target :: con_t0c
      real(kind_phys), intent(in), target :: con_pi
      real(kind_phys), intent(in), target :: rainmin
      real(kind_phys), intent(in), target :: rhowater
      
      ! Local variables/pointers for unit conversions, array transformations, ...
      type :: real_kind_phys_rank2_ptr_arr_type
         real(kind_phys), dimension(:,:), pointer :: p => null()
      end type real_kind_phys_rank2_ptr_arr_type
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: do3_dt_prd_1_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: do3_dt_ozmx_2_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: do3_dt_temp_3_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: do3_dt_ohoz_4_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqv_dt_prd_5_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqv_dt_qvmx_6_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sigmain_7_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sigmaout_8_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qmicro_9_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: omegain_10_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: omegaout_11_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: prevsq_12_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ud_mf_13_ptr_array
      type :: real_kind_phys_rank1_ptr_arr_type
         real(kind_phys), dimension(:), pointer :: p => null()
      end type real_kind_phys_rank1_ptr_arr_type
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: maxmf_14_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qlcn_15_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qicn_16_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: w_upi_17_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cf_upi_18_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cnv_mfd_19_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cnv_dqldt_20_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: clcn_21_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cnv_fice_22_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cnv_ndrop_23_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cnv_nice_24_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ca_deep_25_ptr_array
      type :: real_kind_phys_rank3_ptr_arr_type
         real(kind_phys), dimension(:,:,:), pointer :: p => null()
      end type real_kind_phys_rank3_ptr_arr_type
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtend_26_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: upd_mf_27_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dwn_mf_28_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: det_mf_29_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cnvw_phy_f3d_30_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cnvc_phy_f3d_31_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nwfa_32_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rain0_33_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ice0_34_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snow0_35_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: graupel0_36_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rew_37_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rei_38_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rer_39_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: res_40_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: reg_41_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: pfi_lsan_42_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: pfl_lsan_43_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_qs_44_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_qg_45_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_cldfrc_46_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rain_cpl_47_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rainc_cpl_48_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snow_cpl_49_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: drain_cpl_50_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dsnow_cpl_51_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: raincprv_52_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rainncprv_53_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: iceprv_54_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snowprv_55_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: graupelprv_56_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: draincprv_57_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: drainncprv_58_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: diceprv_59_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dsnowprv_60_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dgraupelprv_61_ptr_array
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dfi_radar_tten_62_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wgrs_63_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ltg1_max_64_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ltg2_max_65_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ltg3_max_66_ptr_array

      ierr = 0


      if (.not.initialized(cdata%ccpp_instance)) then
        write(cdata%errmsg,'(*(a))') 'phys_ts_run called before phys_ts_init'
        cdata%errflg = 1
        return
      end if



      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        do3_dt_prd_1_ptr_array(cdata%thrd_no)%p => physics%diag%do3_dt_prd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        do3_dt_ozmx_2_ptr_array(cdata%thrd_no)%p => physics%diag%do3_dt_ozmx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        do3_dt_temp_3_ptr_array(cdata%thrd_no)%p => physics%diag%do3_dt_temp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        do3_dt_ohoz_4_ptr_array(cdata%thrd_no)%p => physics%diag%do3_dt_ohoz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%h2o_phys)) then
        dqv_dt_prd_5_ptr_array(cdata%thrd_no)%p => physics%diag%dqv_dt_prd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%h2o_phys)) then
        dqv_dt_qvmx_6_ptr_array(cdata%thrd_no)%p => physics%diag%dqv_dt_qvmx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call gfs_photochemistry_run(dtp=physics%model%dtp,ntqv=physics%model%ntqv,ntoz=physics%model%ntoz,im=physics%model%blksz(cdata%blk_no), &
                  levs=physics%model%levs,ozphys=physics%model%ozphys,oz_phys_2015=physics%model%oz_phys_2015, &
                  oz_phys_2006=physics%model%oz_phys,con_1ovg=con_1ovg,prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dp=physics%interstitial(cdata%thrd_no)%del(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ozpl=physics%tbd%ozpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levozp,one:physics%model%oz_coeff), &
                  h2o_phys=physics%model%h2o_phys,h2ophys=physics%model%h2ophys,h2opl=physics%tbd%h2opl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levh2o,one:physics%model%h2o_coeff), &
                  gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  gt0=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  do3_dt_prd=do3_dt_prd_1_ptr_array(cdata%thrd_no)%p,do3_dt_ozmx=do3_dt_ozmx_2_ptr_array(cdata%thrd_no)%p, &
                  do3_dt_temp=do3_dt_temp_3_ptr_array(cdata%thrd_no)%p,do3_dt_ohoz=do3_dt_ohoz_4_ptr_array(cdata%thrd_no)%p, &
                  dqv_dt_prd=dqv_dt_prd_5_ptr_array(cdata%thrd_no)%p,dqv_dt_qvmx=dqv_dt_qvmx_6_ptr_array(cdata%thrd_no)%p, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        nullify(do3_dt_prd_1_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        nullify(do3_dt_ozmx_2_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        nullify(do3_dt_temp_3_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        nullify(do3_dt_ohoz_4_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%h2o_phys)) then
        nullify(dqv_dt_prd_5_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%h2o_phys)) then
        nullify(dqv_dt_qvmx_6_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_photochemistry_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call gfs_photochemistry_post_run(tend_opt_photochem=physics%model%tend_opt_photochem,im=physics%model%blksz(cdata%blk_no), &
                  levs=physics%model%levs,ntrac=physics%model%ntrac,dtp=physics%model%dtp, &
                  ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
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
        cdata%errmsg = "An error occured in gfs_photochemistry_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call get_phi_fv3_run(ix=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,con_fvirt=con_fvirt, &
                  gt0=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gq01=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  del_gz=physics%interstitial(cdata%thrd_no)%del_gz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  phil=physics%statein%phil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in get_phi_fv3_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ntsigma > 0 )) then
        sigmain_7_ptr_array(cdata%thrd_no)%p => physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsigma)
      end if

      if (( physics%model%ntsigma > 0 )) then
        sigmaout_8_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsigma)
      end if

      if ((physics%model%progsigma)) then
        qmicro_9_ptr_array(cdata%thrd_no)%p => physics%coupling%dqdt_qmicro(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ntomega > 0 )) then
        omegain_10_ptr_array(cdata%thrd_no)%p => physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntomega)
      end if

      if (( physics%model%ntomega > 0 )) then
        omegaout_11_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntomega)
      end if

      call gfs_suite_interstitial_3_run(otsptflag=physics%interstitial(cdata%thrd_no)%otsptflag(one:physics%model%ntrac), &
                  im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,nn=physics%interstitial(cdata%thrd_no)%nn, &
                  cscnv=physics%model%cscnv,imfdeepcnv=physics%model%imfdeepcnv,imfdeepcnv_samf=physics%model%imfdeepcnv_samf, &
                  imfdeepcnv_c3=physics%model%imfdeepcnv_c3,imfshalcnv=physics%model%imfshalcnv, &
                  imfshalcnv_samf=physics%model%imfshalcnv_samf,imfshalcnv_c3=physics%model%imfshalcnv_c3, &
                  progsigma=physics%model%progsigma,progomega=physics%model%progomega,first_time_step=physics%model%first_time_step, &
                  restart=physics%model%restart,satmedmf=physics%model%satmedmf,trans_trac=physics%model%trans_trac, &
                  do_shoc=physics%model%do_shoc,ltaerosol=physics%model%ltaerosol,ntrac=physics%model%ntrac, &
                  ntcw=physics%model%ntcw,ntiw=physics%model%ntiw,ntclamt=physics%model%ntclamt, &
                  ntrw=physics%model%ntrw,ntsw=physics%model%ntsw,ntrnc=physics%model%ntrnc, &
                  ntsnc=physics%model%ntsnc,ntgl=physics%model%ntgl,ntgnc=physics%model%ntgnc, &
                  xlon=physics%grid%xlon(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlat=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gt0=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  sigmain=sigmain_7_ptr_array(cdata%thrd_no)%p,sigmaout=sigmaout_8_ptr_array(cdata%thrd_no)%p, &
                  qmicro=qmicro_9_ptr_array(cdata%thrd_no)%p,omegain=omegain_10_ptr_array(cdata%thrd_no)%p, &
                  omegaout=omegaout_11_ptr_array(cdata%thrd_no)%p,imp_physics=physics%model%imp_physics, &
                  imp_physics_mg=physics%model%imp_physics_mg,imp_physics_gfdl=physics%model%imp_physics_gfdl, &
                  imp_physics_thompson=physics%model%imp_physics_thompson,imp_physics_tempo=physics%model%imp_physics_tempo, &
                  imp_physics_wsm6=physics%model%imp_physics_wsm6,imp_physics_fer_hires=physics%model%imp_physics_fer_hires, &
                  imp_physics_nssl=physics%model%imp_physics_nssl,prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prslk=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  rhcbot=physics%model%crtrh(1),rhcpbl=physics%model%crtrh(2),rhctop=physics%model%crtrh(3), &
                  rhcmax=physics%model%rhcmax,islmsk=physics%interstitial(cdata%thrd_no)%islmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  work1=physics%interstitial(cdata%thrd_no)%work1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  work2=physics%interstitial(cdata%thrd_no)%work2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kpbl=physics%interstitial(cdata%thrd_no)%kpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kinver=physics%interstitial(cdata%thrd_no)%kinver(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ras=physics%model%ras,me=physics%model%me,clw=physics%interstitial(cdata%thrd_no)%clw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nn), &
                  rhc=physics%interstitial(cdata%thrd_no)%rhc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  save_qc=physics%interstitial(cdata%thrd_no)%save_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntcw), &
                  save_qi=physics%interstitial(cdata%thrd_no)%save_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  save_tcp=physics%interstitial(cdata%thrd_no)%save_tcp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ntsigma > 0 )) then
        nullify(sigmain_7_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntsigma > 0 )) then
        nullify(sigmaout_8_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%progsigma)) then
        nullify(qmicro_9_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntomega > 0 )) then
        nullify(omegain_10_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntomega > 0 )) then
        nullify(omegaout_11_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_suite_interstitial_3_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%progsigma)) then
        qmicro_9_ptr_array(cdata%thrd_no)%p => physics%coupling%dqdt_qmicro(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        prevsq_12_ptr_array(cdata%thrd_no)%p => physics%tbd%prevsq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if (( physics%model%imfdeepcnv .ge. 0 .or. physics%model%imfshalcnv .ge. 0 )) then
        ud_mf_13_ptr_array(cdata%thrd_no)%p => physics%tbd%ud_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ntsigma > 0 )) then
        sigmain_7_ptr_array(cdata%thrd_no)%p => physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsigma)
      end if

      if (( physics%model%ntsigma > 0 )) then
        sigmaout_8_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsigma)
      end if

      if ((physics%model%ntomega > 0 )) then
        omegain_10_ptr_array(cdata%thrd_no)%p => physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntomega)
      end if

      if (( physics%model%ntomega > 0 )) then
        omegaout_11_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntomega)
      end if

      if ((physics%model%do_mynnedmf)) then
        maxmf_14_ptr_array(cdata%thrd_no)%p => physics%diag%maxmf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        qlcn_15_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%qlcn(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        qicn_16_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%qicn(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        w_upi_17_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%w_upi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        cf_upi_18_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cf_upi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        cnv_mfd_19_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cnv_mfd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        cnv_dqldt_20_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cnv_dqldt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        clcn_21_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%clcn(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        cnv_fice_22_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cnv_fice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        cnv_ndrop_23_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cnv_ndrop(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        cnv_nice_24_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cnv_nice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ca)) then
        ca_deep_25_ptr_array(cdata%thrd_no)%p => physics%coupling%ca_deep(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call samfdeepcnv_run(im=physics%model%blksz(cdata%blk_no),km=physics%model%levs,nn=physics%interstitial(cdata%thrd_no)%nn, &
                  first_time_step=physics%model%first_time_step,restart=physics%model%restart, &
                  tmf=physics%interstitial(cdata%thrd_no)%dvdftra(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nvdiff), &
                  qmicro=qmicro_9_ptr_array(cdata%thrd_no)%p,itc=physics%interstitial(cdata%thrd_no)%itc, &
                  ntc=physics%model%ntchm,cliq=con_cliq,cp=con_cp,cvap=con_cvap,eps=con_eps, &
                  epsm1=con_epsm1,fv=con_fvirt,grav=con_g,hvap=con_hvap,rd=con_rd,rv=con_rv, &
                  t0c=con_t0c,cscale=physics%model%cscale,delt=physics%model%dtp,ntk=physics%interstitial(cdata%thrd_no)%ntk, &
                  ntr=physics%interstitial(cdata%thrd_no)%nsamftrac,delp=physics%interstitial(cdata%thrd_no)%del(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prslp=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  psp=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  phil=physics%statein%phil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tkeh=physics%interstitial(cdata%thrd_no)%tkeh(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  qtr=physics%interstitial(cdata%thrd_no)%clw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nn), &
                  dqtr=physics%interstitial(cdata%thrd_no)%dclw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nn), &
                  prevsq=prevsq_12_ptr_array(cdata%thrd_no)%p,q=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  q1=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  t1=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  u1=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  v1=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  fscav=physics%model%fscav(one:physics%model%ntchm),hwrf_samfdeep=physics%model%hwrf_samfdeep, &
                  progsigma=physics%model%progsigma,progomega=physics%model%progomega,cldwrk=physics%interstitial(cdata%thrd_no)%cld1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rn=physics%interstitial(cdata%thrd_no)%raincd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kbot=physics%interstitial(cdata%thrd_no)%kbot(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ktop=physics%interstitial(cdata%thrd_no)%ktop(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kcnv=physics%interstitial(cdata%thrd_no)%kcnv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  islimsk=physics%interstitial(cdata%thrd_no)%islmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  garea=physics%grid%area(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dot=physics%statein%vvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ncloud=physics%model%ncnd,hpbl=physics%tbd%hpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ud_mf=ud_mf_13_ptr_array(cdata%thrd_no)%p,dd_mf=physics%interstitial(cdata%thrd_no)%dd_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dt_mf=physics%interstitial(cdata%thrd_no)%dt_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  cnvw=physics%cldprop%cnvw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  cnvc=physics%interstitial(cdata%thrd_no)%cnvc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  sigmain=sigmain_7_ptr_array(cdata%thrd_no)%p,sigmaout=sigmaout_8_ptr_array(cdata%thrd_no)%p, &
                  omegain=omegain_10_ptr_array(cdata%thrd_no)%p,omegaout=omegaout_11_ptr_array(cdata%thrd_no)%p, &
                  betascu=physics%model%betascu,betamcu=physics%model%betamcu,betadcu=physics%model%betadcu, &
                  maxmf=maxmf_14_ptr_array(cdata%thrd_no)%p,do_mynnedmf=physics%model%do_mynnedmf, &
                  sigmab_coldstart=physics%model%sigmab_coldstart,qlcn=qlcn_15_ptr_array(cdata%thrd_no)%p, &
                  qicn=qicn_16_ptr_array(cdata%thrd_no)%p,w_upi=w_upi_17_ptr_array(cdata%thrd_no)%p, &
                  cf_upi=cf_upi_18_ptr_array(cdata%thrd_no)%p,cnv_mfd=cnv_mfd_19_ptr_array(cdata%thrd_no)%p, &
                  cnv_dqldt=cnv_dqldt_20_ptr_array(cdata%thrd_no)%p,clcn=clcn_21_ptr_array(cdata%thrd_no)%p, &
                  cnv_fice=cnv_fice_22_ptr_array(cdata%thrd_no)%p,cnv_ndrop=cnv_ndrop_23_ptr_array(cdata%thrd_no)%p, &
                  cnv_nice=cnv_nice_24_ptr_array(cdata%thrd_no)%p,mp_phys=physics%model%imp_physics, &
                  mp_phys_mg=physics%model%imp_physics_mg,clam=physics%model%clam_deep,c0s=physics%model%c0s_deep, &
                  c1=physics%model%c1_deep,betal=physics%model%betal_deep,betas=physics%model%betas_deep, &
                  evef=physics%model%evef,pgcon=physics%model%pgcon_deep,asolfac=physics%model%asolfac_deep, &
                  do_ca=physics%model%do_ca,ca_closure=physics%model%ca_closure,ca_entr=physics%model%ca_entr, &
                  ca_trigger=physics%model%ca_trigger,nthresh=physics%model%nthresh,ca_deep=ca_deep_25_ptr_array(cdata%thrd_no)%p, &
                  rainevap=physics%coupling%condition(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cat_adj_deep=physics%model%cat_adj_deep,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%progsigma)) then
        nullify(qmicro_9_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        nullify(prevsq_12_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%imfdeepcnv .ge. 0 .or. physics%model%imfshalcnv .ge. 0 )) then
        nullify(ud_mf_13_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntsigma > 0 )) then
        nullify(sigmain_7_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntsigma > 0 )) then
        nullify(sigmaout_8_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntomega > 0 )) then
        nullify(omegain_10_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntomega > 0 )) then
        nullify(omegaout_11_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(maxmf_14_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        nullify(qlcn_15_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        nullify(qicn_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        nullify(w_upi_17_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        nullify(cf_upi_18_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        nullify(cnv_mfd_19_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        nullify(cnv_dqldt_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        nullify(clcn_21_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        nullify(cnv_fice_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        nullify(cnv_ndrop_23_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_mg)) then
        nullify(cnv_nice_24_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ca)) then
        nullify(ca_deep_25_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in samfdeepcnv_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if (( physics%model%imfdeepcnv .ge. 0 .or. physics%model%imfshalcnv .ge. 0 )) then
        ud_mf_13_ptr_array(cdata%thrd_no)%p => physics%tbd%ud_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_26_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%ldiag3d .and. physics%model%qdiag3d)) then
        upd_mf_27_ptr_array(cdata%thrd_no)%p => physics%diag%upd_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%qdiag3d)) then
        dwn_mf_28_ptr_array(cdata%thrd_no)%p => physics%diag%dwn_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%qdiag3d)) then
        det_mf_29_ptr_array(cdata%thrd_no)%p => physics%diag%det_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ncnvw > 0)) then
        cnvw_phy_f3d_30_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ncnvw)
      end if

      if ((physics%model%ncnvc > 0)) then
        cnvc_phy_f3d_31_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ncnvc)
      end if

      call gfs_dcnv_generic_post_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,tracers_total=physics%interstitial(cdata%thrd_no)%tracers_total, &
                  otsptflag=physics%interstitial(cdata%thrd_no)%otsptflag(one:physics%model%ntrac), &
                  imp_physics=physics%model%imp_physics,imp_physics_gfdl=physics%model%imp_physics_gfdl, &
                  imp_physics_thompson=physics%model%imp_physics_thompson,imp_physics_nssl=physics%model%imp_physics_nssl, &
                  imp_physics_wsm6=physics%model%imp_physics_wsm6,imp_physics_mg=physics%model%imp_physics_mg, &
                  imp_physics_fer_hires=physics%model%imp_physics_fer_hires,tend_opt_dcnv=physics%model%tend_opt_deep_conv, &
                  lssav=physics%model%lssav,ldiag3d=physics%model%ldiag3d,qdiag3d=physics%model%qdiag3d, &
                  ras=physics%model%ras,frain=physics%model%frain,rain1=physics%interstitial(cdata%thrd_no)%raincd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtf=physics%model%dtf,cld1d=physics%interstitial(cdata%thrd_no)%cld1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gu0=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gv0=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gt0=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dudt=physics%interstitial(cdata%thrd_no)%dudt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt=physics%interstitial(cdata%thrd_no)%dvdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtdt=physics%interstitial(cdata%thrd_no)%dtdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dqdt=physics%interstitial(cdata%thrd_no)%dqdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  ud_mf=ud_mf_13_ptr_array(cdata%thrd_no)%p,dd_mf=physics%interstitial(cdata%thrd_no)%dd_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dt_mf=physics%interstitial(cdata%thrd_no)%dt_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtend=dtend_26_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_process_dcnv=physics%model%index_of_process_dcnv,index_of_temperature=physics%model%index_of_temperature, &
                  index_of_x_wind=physics%model%index_of_x_wind,index_of_y_wind=physics%model%index_of_y_wind, &
                  ntqv=physics%model%ntqv,nqvtag=physics%model%nqvtag,gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  delt=physics%model%dtp,con_g=con_g,npdf3d=physics%model%npdf3d,num_p3d=physics%model%num_p3d, &
                  ncnvcld3d=physics%model%ncnvcld3d,nsamftrac=physics%interstitial(cdata%thrd_no)%nsamftrac, &
                  rainc=physics%diag%rainc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cldwrk=physics%diag%cldwrk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  upd_mf=upd_mf_27_ptr_array(cdata%thrd_no)%p,dwn_mf=dwn_mf_28_ptr_array(cdata%thrd_no)%p, &
                  det_mf=det_mf_29_ptr_array(cdata%thrd_no)%p,cnvw=physics%cldprop%cnvw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  cnvc=physics%interstitial(cdata%thrd_no)%cnvc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  cnvw_phy_f3d=cnvw_phy_f3d_30_ptr_array(cdata%thrd_no)%p,cnvc_phy_f3d=cnvc_phy_f3d_31_ptr_array(cdata%thrd_no)%p, &
                  flag_for_dcnv_generic_tend=physics%model%flag_for_dcnv_generic_tend,cscnv=physics%model%cscnv, &
                  satmedmf=physics%model%satmedmf,trans_trac=physics%model%trans_trac,ntsigma=physics%model%ntsigma, &
                  ntomega=physics%model%ntomega,ntcw=physics%model%ntcw,ntiw=physics%model%ntiw, &
                  ntclamt=physics%model%ntclamt,ntrw=physics%model%ntrw,ntsw=physics%model%ntsw, &
                  ntrnc=physics%model%ntrnc,ntsnc=physics%model%ntsnc,ntgl=physics%model%ntgl, &
                  ntgnc=physics%model%ntgnc,nthl=physics%model%nthl,nthnc=physics%model%nthnc, &
                  ntgv=physics%model%ntgv,nthv=physics%model%nthv,ntrz=physics%model%ntrz, &
                  ntgz=physics%model%ntgz,nthz=physics%model%nthz,clw=physics%interstitial(cdata%thrd_no)%clw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nn), &
                  dclw=physics%interstitial(cdata%thrd_no)%dclw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nn), &
                  ntrac=physics%model%ntrac,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if (( physics%model%imfdeepcnv .ge. 0 .or. physics%model%imfshalcnv .ge. 0 )) then
        nullify(ud_mf_13_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_26_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%qdiag3d)) then
        nullify(upd_mf_27_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%qdiag3d)) then
        nullify(dwn_mf_28_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%qdiag3d)) then
        nullify(det_mf_29_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ncnvw > 0)) then
        nullify(cnvw_phy_f3d_30_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ncnvc > 0)) then
        nullify(cnvc_phy_f3d_31_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_dcnv_generic_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%progsigma)) then
        qmicro_9_ptr_array(cdata%thrd_no)%p => physics%coupling%dqdt_qmicro(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        prevsq_12_ptr_array(cdata%thrd_no)%p => physics%tbd%prevsq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if (( physics%model%imfdeepcnv .ge. 0 .or. physics%model%imfshalcnv .ge. 0 )) then
        ud_mf_13_ptr_array(cdata%thrd_no)%p => physics%tbd%ud_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ntsigma > 0 )) then
        sigmain_7_ptr_array(cdata%thrd_no)%p => physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsigma)
      end if

      if (( physics%model%ntsigma > 0 )) then
        sigmaout_8_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsigma)
      end if

      if ((physics%model%ntomega > 0 )) then
        omegain_10_ptr_array(cdata%thrd_no)%p => physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntomega)
      end if

      if (( physics%model%ntomega > 0 )) then
        omegaout_11_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntomega)
      end if

      call samfshalcnv_run(im=physics%model%blksz(cdata%blk_no),km=physics%model%levs,nn=physics%interstitial(cdata%thrd_no)%nn, &
                  first_time_step=physics%model%first_time_step,restart=physics%model%restart, &
                  tmf=physics%interstitial(cdata%thrd_no)%dvdftra(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nvdiff), &
                  qmicro=qmicro_9_ptr_array(cdata%thrd_no)%p,itc=physics%interstitial(cdata%thrd_no)%itc, &
                  ntc=physics%model%ntchm,cliq=con_cliq,cp=con_cp,cvap=con_cvap,eps=con_eps, &
                  epsm1=con_epsm1,fv=con_fvirt,grav=con_g,hvap=con_hvap,rd=con_rd,rv=con_rv, &
                  t0c=con_t0c,cscale=physics%model%cscale,delt=physics%model%dtp,ntk=physics%interstitial(cdata%thrd_no)%ntk, &
                  ntr=physics%interstitial(cdata%thrd_no)%nsamftrac,delp=physics%interstitial(cdata%thrd_no)%del(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prslp=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  psp=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  phil=physics%statein%phil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tkeh=physics%interstitial(cdata%thrd_no)%tkeh(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  qtr=physics%interstitial(cdata%thrd_no)%clw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nn), &
                  dqtr=physics%interstitial(cdata%thrd_no)%dclw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nn), &
                  prevsq=prevsq_12_ptr_array(cdata%thrd_no)%p,q=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  q1=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  t1=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  u1=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  v1=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  fscav=physics%model%fscav(one:physics%model%ntchm),rn=physics%interstitial(cdata%thrd_no)%raincs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kbot=physics%interstitial(cdata%thrd_no)%kbot(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ktop=physics%interstitial(cdata%thrd_no)%ktop(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kcnv=physics%interstitial(cdata%thrd_no)%kcnv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  islimsk=physics%interstitial(cdata%thrd_no)%islmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  garea=physics%grid%area(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dot=physics%statein%vvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ncloud=physics%model%ncnd,hpbl=physics%tbd%hpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ud_mf=ud_mf_13_ptr_array(cdata%thrd_no)%p,dt_mf=physics%interstitial(cdata%thrd_no)%dt_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  cnvw=physics%cldprop%cnvw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  cnvc=physics%interstitial(cdata%thrd_no)%cnvc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  clam=physics%model%clam_shal,c0s=physics%model%c0s_shal,c1=physics%model%c1_shal, &
                  evef=physics%model%evef,pgcon=physics%model%pgcon_shal,asolfac=physics%model%asolfac_shal, &
                  hwrf_samfshal=physics%model%hwrf_samfshal,progsigma=physics%model%progsigma, &
                  progomega=physics%model%progomega,sigmain=sigmain_7_ptr_array(cdata%thrd_no)%p, &
                  sigmaout=sigmaout_8_ptr_array(cdata%thrd_no)%p,omegain=omegain_10_ptr_array(cdata%thrd_no)%p, &
                  omegaout=omegaout_11_ptr_array(cdata%thrd_no)%p,betascu=physics%model%betascu, &
                  betamcu=physics%model%betamcu,betadcu=physics%model%betadcu,cat_adj_shal=physics%model%cat_adj_shal, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%progsigma)) then
        nullify(qmicro_9_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        nullify(prevsq_12_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%imfdeepcnv .ge. 0 .or. physics%model%imfshalcnv .ge. 0 )) then
        nullify(ud_mf_13_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntsigma > 0 )) then
        nullify(sigmain_7_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntsigma > 0 )) then
        nullify(sigmaout_8_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntomega > 0 )) then
        nullify(omegain_10_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntomega > 0 )) then
        nullify(omegaout_11_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in samfshalcnv_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ldiag3d)) then
        dtend_26_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%ncnvw > 0)) then
        cnvw_phy_f3d_30_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ncnvw)
      end if

      if ((physics%model%ncnvc > 0)) then
        cnvc_phy_f3d_31_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ncnvc)
      end if

      call gfs_scnv_generic_post_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,tracers_total=physics%interstitial(cdata%thrd_no)%tracers_total, &
                  otsptflag=physics%interstitial(cdata%thrd_no)%otsptflag(one:physics%model%ntrac), &
                  imp_physics=physics%model%imp_physics,imp_physics_gfdl=physics%model%imp_physics_gfdl, &
                  tend_opt_scnv=physics%model%tend_opt_shal_conv,lssav=physics%model%lssav, &
                  ldiag3d=physics%model%ldiag3d,qdiag3d=physics%model%qdiag3d,frain=physics%model%frain, &
                  delt=physics%model%dtp,ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  gu0=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gv0=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gt0=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dudt=physics%interstitial(cdata%thrd_no)%dudt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt=physics%interstitial(cdata%thrd_no)%dvdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtdt=physics%interstitial(cdata%thrd_no)%dtdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dqdt=physics%interstitial(cdata%thrd_no)%dqdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dtend=dtend_26_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_temperature=physics%model%index_of_temperature,index_of_x_wind=physics%model%index_of_x_wind, &
                  index_of_y_wind=physics%model%index_of_y_wind,index_of_process_scnv=physics%model%index_of_process_scnv, &
                  ntqv=physics%model%ntqv,nqvtag=physics%model%nqvtag,clw=physics%interstitial(cdata%thrd_no)%clw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nn), &
                  dclw=physics%interstitial(cdata%thrd_no)%dclw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nn), &
                  shcnvcw=physics%model%shcnvcw,rain1=physics%interstitial(cdata%thrd_no)%raincs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  npdf3d=physics%model%npdf3d,num_p3d=physics%model%num_p3d,ncnvcld3d=physics%model%ncnvcld3d, &
                  cnvc=physics%interstitial(cdata%thrd_no)%cnvc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  cnvw=physics%cldprop%cnvw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  nsamftrac=physics%interstitial(cdata%thrd_no)%nsamftrac,rainc=physics%diag%rainc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cnvprcp=physics%diag%cnvprcp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cnvw_phy_f3d=cnvw_phy_f3d_30_ptr_array(cdata%thrd_no)%p,cnvc_phy_f3d=cnvc_phy_f3d_31_ptr_array(cdata%thrd_no)%p, &
                  flag_for_scnv_generic_tend=physics%model%flag_for_scnv_generic_tend,imfshalcnv=physics%model%imfshalcnv, &
                  imfshalcnv_sas=physics%model%imfshalcnv_sas,imfshalcnv_samf=physics%model%imfshalcnv_samf, &
                  cscnv=physics%model%cscnv,satmedmf=physics%model%satmedmf,trans_trac=physics%model%trans_trac, &
                  ras=physics%model%ras,ntsigma=physics%model%ntsigma,ntcw=physics%model%ntcw, &
                  ntiw=physics%model%ntiw,ntclamt=physics%model%ntclamt,ntrw=physics%model%ntrw, &
                  ntsw=physics%model%ntsw,ntrnc=physics%model%ntrnc,ntsnc=physics%model%ntsnc, &
                  ntgl=physics%model%ntgl,ntgnc=physics%model%ntgnc,ntrac=physics%model%ntrac, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ldiag3d)) then
        nullify(dtend_26_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ncnvw > 0)) then
        nullify(cnvw_phy_f3d_30_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ncnvc > 0)) then
        nullify(cnvc_phy_f3d_31_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_scnv_generic_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ntwa > 0)) then
        nwfa_32_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntwa)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_26_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      call gfs_suite_interstitial_4_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,ltaerosol=physics%model%ltaerosol, &
                  tracers_total=physics%interstitial(cdata%thrd_no)%tracers_total,ntrac=physics%model%ntrac, &
                  ntcw=physics%model%ntcw,ntiw=physics%model%ntiw,ntclamt=physics%model%ntclamt, &
                  ntrw=physics%model%ntrw,ntsw=physics%model%ntsw,ntrnc=physics%model%ntrnc, &
                  ntsnc=physics%model%ntsnc,ntgl=physics%model%ntgl,ntgnc=physics%model%ntgnc, &
                  ntlnc=physics%model%ntlnc,ntinc=physics%model%ntinc,nn=physics%interstitial(cdata%thrd_no)%nn, &
                  ntccn=physics%model%ntccn,imp_physics=physics%model%imp_physics,imp_physics_gfdl=physics%model%imp_physics_gfdl, &
                  imp_physics_thompson=physics%model%imp_physics_thompson,imp_physics_tempo=physics%model%imp_physics_tempo, &
                  convert_dry_rho=physics%model%convert_dry_rho,imp_physics_nssl=physics%model%imp_physics_nssl, &
                  nssl_ccn_on=physics%model%nssl_ccn_on,nssl_invertccn=physics%model%nssl_invertccn, &
                  dtf=physics%model%dtf,save_qc=physics%interstitial(cdata%thrd_no)%save_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntcw), &
                  save_qi=physics%interstitial(cdata%thrd_no)%save_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  con_pi=con_pi,gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  clw=physics%interstitial(cdata%thrd_no)%clw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%interstitial(cdata%thrd_no)%nn), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  save_tcp=physics%interstitial(cdata%thrd_no)%save_tcp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  con_rd=con_rd,con_eps=con_eps,nssl_cccn=physics%model%nssl_cccn,nwfa=nwfa_32_ptr_array(cdata%thrd_no)%p, &
                  spechum=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  dtend=dtend_26_ptr_array(cdata%thrd_no)%p,ntk=physics%interstitial(cdata%thrd_no)%ntk, &
                  ntke=physics%model%ntke,ldiag3d=physics%model%ldiag3d,qdiag3d=physics%model%qdiag3d, &
                  index_of_process_conv_trans=physics%model%index_of_process_conv_trans,index_of_process_dcnv=physics%model%index_of_process_dcnv, &
                  index_of_process_scnv=physics%model%index_of_process_scnv,otsptflag=physics%interstitial(cdata%thrd_no)%otsptflag(one:physics%model%ntrac), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ntwa > 0)) then
        nullify(nwfa_32_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_26_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_suite_interstitial_4_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call cnvc90_run(clstp=physics%model%clstp,im=physics%model%blksz(cdata%blk_no),rn=physics%diag%rainc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kbot=physics%interstitial(cdata%thrd_no)%kbot(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ktop=physics%interstitial(cdata%thrd_no)%ktop(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  km=physics%model%levs,prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  acv=physics%tbd%acv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  acvb=physics%tbd%acvb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  acvt=physics%tbd%acvt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cv=physics%cldprop%cv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cvb=physics%cldprop%cvb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cvt=physics%cldprop%cvt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in cnvc90_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        rain0_33_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%rainmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        ice0_34_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%icemp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        snow0_35_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%snowmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        graupel0_36_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%graupelmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nleffr > 0)) then
        rew_37_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nleffr)
      end if

      if ((physics%model%nieffr > 0)) then
        rei_38_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nieffr)
      end if

      if ((physics%model%nreffr > 0)) then
        rer_39_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nreffr)
      end if

      if ((physics%model%nseffr > 0)) then
        res_40_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nseffr)
      end if

      if ((physics%model%ngeffr > 0)) then
        reg_41_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ngeffr)
      end if

      if ((physics%model%cplchm)) then
        pfi_lsan_42_ptr_array(cdata%thrd_no)%p => physics%coupling%pfi_lsan(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%cplchm)) then
        pfl_lsan_43_ptr_array(cdata%thrd_no)%p => physics%coupling%pfl_lsan(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ntsw > 0)) then
        ten_qs_44_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsw)
      end if

      if ((physics%model%ntgl > 0)) then
        ten_qg_45_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgl)
      end if

      if ((physics%model%ntclamt > 0)) then
        ten_cldfrc_46_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntclamt)
      end if

      call gfdl_cloud_microphys_run(levs=physics%model%levs,im=physics%model%blksz(cdata%blk_no),rainmin=rainmin, &
                  con_g=con_g,con_fvirt=con_fvirt,con_rd=con_rd,con_eps=con_eps,frland=physics%interstitial(cdata%thrd_no)%frland(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  garea=physics%grid%area(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  islmsk=physics%interstitial(cdata%thrd_no)%islmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  gq0_ntcw=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntcw), &
                  gq0_ntrw=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntrw), &
                  gq0_ntiw=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  gq0_ntsw=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsw), &
                  gq0_ntgl=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgl), &
                  gq0_ntclamt=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntclamt), &
                  gt0=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gu0=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gv0=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  vvl=physics%statein%vvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  del=physics%interstitial(cdata%thrd_no)%del(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  rain0=rain0_33_ptr_array(cdata%thrd_no)%p,ice0=ice0_34_ptr_array(cdata%thrd_no)%p, &
                  snow0=snow0_35_ptr_array(cdata%thrd_no)%p,graupel0=graupel0_36_ptr_array(cdata%thrd_no)%p, &
                  prcp0=physics%interstitial(cdata%thrd_no)%prcpmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sr=physics%diag%sr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtp=physics%model%dtp,hydrostatic=physics%model%hydrostatic,phys_hydrostatic=physics%model%phys_hydrostatic, &
                  lradar=physics%model%lradar,refl_10cm=physics%diag%refl_10cm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  reset=physics%interstitial(cdata%thrd_no)%max_hourly_reset,effr_in=physics%model%effr_in, &
                  rew=rew_37_ptr_array(cdata%thrd_no)%p,rei=rei_38_ptr_array(cdata%thrd_no)%p, &
                  rer=rer_39_ptr_array(cdata%thrd_no)%p,res=res_40_ptr_array(cdata%thrd_no)%p, &
                  reg=reg_41_ptr_array(cdata%thrd_no)%p,cplchm=physics%model%cplchm,pfi_lsan=pfi_lsan_42_ptr_array(cdata%thrd_no)%p, &
                  pfl_lsan=pfl_lsan_43_ptr_array(cdata%thrd_no)%p,ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_qv=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  ten_ql=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntcw), &
                  ten_qr=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntrw), &
                  ten_qi=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  ten_qs=ten_qs_44_ptr_array(cdata%thrd_no)%p,ten_qg=ten_qg_45_ptr_array(cdata%thrd_no)%p, &
                  ten_cldfrc=ten_cldfrc_46_ptr_array(cdata%thrd_no)%p,ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(rain0_33_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(ice0_34_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(snow0_35_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(graupel0_36_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nleffr > 0)) then
        nullify(rew_37_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nieffr > 0)) then
        nullify(rei_38_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nreffr > 0)) then
        nullify(rer_39_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nseffr > 0)) then
        nullify(res_40_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ngeffr > 0)) then
        nullify(reg_41_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplchm)) then
        nullify(pfi_lsan_42_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplchm)) then
        nullify(pfl_lsan_43_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntsw > 0)) then
        nullify(ten_qs_44_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntgl > 0)) then
        nullify(ten_qg_45_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntclamt > 0)) then
        nullify(ten_cldfrc_46_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfdl_cloud_microphys_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        rain0_33_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%rainmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        ice0_34_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%icemp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        snow0_35_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%snowmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        graupel0_36_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%graupelmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%do_sppt .or. physics%model%cplchm .or. physics%model%ca_global .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        rain_cpl_47_ptr_array(cdata%thrd_no)%p => physics%coupling%rain_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        rainc_cpl_48_ptr_array(cdata%thrd_no)%p => physics%coupling%rainc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%do_sppt .or. physics%model%cplchm .or. physics%model%ca_global .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        snow_cpl_49_ptr_array(cdata%thrd_no)%p => physics%coupling%snow_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        drain_cpl_50_ptr_array(cdata%thrd_no)%p => physics%tbd%drain_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        dsnow_cpl_51_ptr_array(cdata%thrd_no)%p => physics%tbd%dsnow_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        raincprv_52_ptr_array(cdata%thrd_no)%p => physics%sfcprop%raincprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        rainncprv_53_ptr_array(cdata%thrd_no)%p => physics%sfcprop%rainncprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        iceprv_54_ptr_array(cdata%thrd_no)%p => physics%sfcprop%iceprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        snowprv_55_ptr_array(cdata%thrd_no)%p => physics%sfcprop%snowprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        graupelprv_56_ptr_array(cdata%thrd_no)%p => physics%sfcprop%graupelprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        draincprv_57_ptr_array(cdata%thrd_no)%p => physics%sfcprop%draincprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        drainncprv_58_ptr_array(cdata%thrd_no)%p => physics%sfcprop%drainncprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        diceprv_59_ptr_array(cdata%thrd_no)%p => physics%sfcprop%diceprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        dsnowprv_60_ptr_array(cdata%thrd_no)%p => physics%sfcprop%dsnowprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        dgraupelprv_61_ptr_array(cdata%thrd_no)%p => physics%sfcprop%dgraupelprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%num_dfi_radar>0)) then
        dfi_radar_tten_62_ptr_array(cdata%thrd_no)%p => physics%tbd%dfi_radar_tten(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%num_dfi_radar)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_26_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%progsigma)) then
        qmicro_9_ptr_array(cdata%thrd_no)%p => physics%coupling%dqdt_qmicro(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        prevsq_12_ptr_array(cdata%thrd_no)%p => physics%tbd%prevsq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call gfs_mp_generic_post_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,kdt=physics%model%kdt, &
                  tend_opt_mp=physics%model%tend_opt_mp,rainmin=rainmin,nrcm=physics%model%nrcm, &
                  nncl=physics%model%ncnd,ntcw=physics%model%ntcw,ntrac=physics%model%ntrac, &
                  ntqv=physics%model%ntqv,nqvtag=physics%model%nqvtag,imp_physics=physics%model%imp_physics, &
                  imp_physics_gfdl=physics%model%imp_physics_gfdl,imp_physics_thompson=physics%model%imp_physics_thompson, &
                  imp_physics_tempo=physics%model%imp_physics_tempo,imp_physics_mg=physics%model%imp_physics_mg, &
                  imp_physics_fer_hires=physics%model%imp_physics_fer_hires,imp_physics_nssl=physics%model%imp_physics_nssl, &
                  cal_pre=physics%model%cal_pre,cplflx=physics%model%cplflx,cplchm=physics%model%cplchm, &
                  cpllnd=physics%model%cpllnd,progsigma=physics%model%progsigma,con_g=con_g, &
                  rhowater=rhowater,dtf=physics%model%dtf,frain=physics%model%frain,rainc=physics%diag%rainc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rain1=physics%interstitial(cdata%thrd_no)%prcpmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rann=physics%tbd%rann(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nrcm), &
                  xlat=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlon=physics%grid%xlon(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dudt=physics%interstitial(cdata%thrd_no)%dudt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt=physics%interstitial(cdata%thrd_no)%dvdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtdt=physics%interstitial(cdata%thrd_no)%dtdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dqdt=physics%interstitial(cdata%thrd_no)%dqdt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  gt0=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gu0=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gv0=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  phil=physics%statein%phil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  htop=physics%interstitial(cdata%thrd_no)%ktop(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  refl_10cm=physics%diag%refl_10cm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  imfshalcnv=physics%model%imfshalcnv,imfshalcnv_gf=physics%model%imfshalcnv_gf, &
                  imfdeepcnv=physics%model%imfdeepcnv,imfdeepcnv_gf=physics%model%imfdeepcnv_gf, &
                  imfdeepcnv_samf=physics%model%imfdeepcnv_samf,con_t0c=con_t0c,tsfc=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ice=physics%diag%ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snow=physics%diag%snow(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  graupel=physics%diag%graupel(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  frzr=physics%diag%frzr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  frzrb=physics%diag%frzrb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  frozr=physics%diag%frozr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  frozrb=physics%diag%frozrb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsnowp=physics%diag%tsnowp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsnowpb=physics%diag%tsnowpb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rhonewsn1=physics%diag%rhonewsn1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  exticeden=physics%model%exticeden,rain0=rain0_33_ptr_array(cdata%thrd_no)%p, &
                  ice0=ice0_34_ptr_array(cdata%thrd_no)%p,snow0=snow0_35_ptr_array(cdata%thrd_no)%p, &
                  graupel0=graupel0_36_ptr_array(cdata%thrd_no)%p,del=physics%interstitial(cdata%thrd_no)%del(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  rain=physics%diag%rain(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  domr_diag=physics%diag%tdomr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  domzr_diag=physics%diag%tdomzr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  domip_diag=physics%diag%tdomip(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  doms_diag=physics%diag%tdoms(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tprcp=physics%sfcprop%tprcp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  srflag=physics%sfcprop%srflag(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sr=physics%diag%sr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cnvprcp=physics%diag%cnvprcp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  totprcp=physics%diag%totprcp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  totice=physics%diag%totice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  totsnw=physics%diag%totsnw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  totgrp=physics%diag%totgrp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cnvprcpb=physics%diag%cnvprcpb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%n_diag_buckets), &
                  totprcpb=physics%diag%totprcpb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%n_diag_buckets), &
                  toticeb=physics%diag%toticeb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  totsnwb=physics%diag%totsnwb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  totgrpb=physics%diag%totgrpb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rain_cpl=rain_cpl_47_ptr_array(cdata%thrd_no)%p,rainc_cpl=rainc_cpl_48_ptr_array(cdata%thrd_no)%p, &
                  snow_cpl=snow_cpl_49_ptr_array(cdata%thrd_no)%p,pwat=physics%diag%pwat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  drain_cpl=drain_cpl_50_ptr_array(cdata%thrd_no)%p,dsnow_cpl=dsnow_cpl_51_ptr_array(cdata%thrd_no)%p, &
                  lsm=physics%model%lsm,lsm_ruc=physics%model%lsm_ruc,lsm_noahmp=physics%model%lsm_noahmp, &
                  raincprv=raincprv_52_ptr_array(cdata%thrd_no)%p,rainncprv=rainncprv_53_ptr_array(cdata%thrd_no)%p, &
                  iceprv=iceprv_54_ptr_array(cdata%thrd_no)%p,snowprv=snowprv_55_ptr_array(cdata%thrd_no)%p, &
                  graupelprv=graupelprv_56_ptr_array(cdata%thrd_no)%p,draincprv=draincprv_57_ptr_array(cdata%thrd_no)%p, &
                  drainncprv=drainncprv_58_ptr_array(cdata%thrd_no)%p,diceprv=diceprv_59_ptr_array(cdata%thrd_no)%p, &
                  dsnowprv=dsnowprv_60_ptr_array(cdata%thrd_no)%p,dgraupelprv=dgraupelprv_61_ptr_array(cdata%thrd_no)%p, &
                  dtp=physics%model%dtp,num_diag_buckets=physics%model%n_diag_buckets,num_dfi_radar=physics%model%num_dfi_radar, &
                  fh_dfi_radar=physics%model%fh_dfi_radar(one:physics%model%dfi_radar_max_intervals_plus_one), &
                  ix_dfi_radar=physics%model%ix_dfi_radar(one:physics%model%dfi_radar_max_intervals), &
                  dfi_radar_tten=dfi_radar_tten_62_ptr_array(cdata%thrd_no)%p,fhour=physics%model%fhour, &
                  radar_tten_limits=physics%model%radar_tten_limits(one:2),index_of_process_dfi_radar=physics%model%index_of_process_dfi_radar, &
                  dtend=dtend_26_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_temperature=physics%model%index_of_temperature,index_of_process_mp=physics%model%index_of_process_mp, &
                  ldiag3d=physics%model%ldiag3d,qdiag3d=physics%model%qdiag3d,dqdt_qmicro=qmicro_9_ptr_array(cdata%thrd_no)%p, &
                  prevsq=prevsq_12_ptr_array(cdata%thrd_no)%p,lssav=physics%model%lssav,lkm=physics%model%lkm, &
                  iopt_lake=physics%model%iopt_lake,iopt_lake_clm=physics%model%iopt_lake_clm, &
                  use_lake_model=physics%sfcprop%use_lake_model(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(rain0_33_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(ice0_34_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(snow0_35_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(graupel0_36_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%do_sppt .or. physics%model%cplchm .or. physics%model%ca_global .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        nullify(rain_cpl_47_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        nullify(rainc_cpl_48_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%do_sppt .or. physics%model%cplchm .or. physics%model%ca_global .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        nullify(snow_cpl_49_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        nullify(drain_cpl_50_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        nullify(dsnow_cpl_51_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        nullify(raincprv_52_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        nullify(rainncprv_53_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(iceprv_54_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(snowprv_55_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(graupelprv_56_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(draincprv_57_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(drainncprv_58_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(diceprv_59_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(dsnowprv_60_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(dgraupelprv_61_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%num_dfi_radar>0)) then
        nullify(dfi_radar_tten_62_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_26_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%progsigma)) then
        nullify(qmicro_9_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        nullify(prevsq_12_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_mp_generic_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lightning_threat)) then
        wgrs_63_ptr_array(cdata%thrd_no)%p => physics%statein%wgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%lightning_threat)) then
        ltg1_max_64_ptr_array(cdata%thrd_no)%p => physics%diag%ltg1_max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lightning_threat)) then
        ltg2_max_65_ptr_array(cdata%thrd_no)%p => physics%diag%ltg2_max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lightning_threat)) then
        ltg3_max_66_ptr_array(cdata%thrd_no)%p => physics%diag%ltg3_max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call maximum_hourly_diagnostics_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,reset=physics%interstitial(cdata%thrd_no)%max_hourly_reset, &
                  lradar=physics%model%lradar,imp_physics=physics%model%imp_physics,imp_physics_gfdl=physics%model%imp_physics_gfdl, &
                  imp_physics_thompson=physics%model%imp_physics_thompson,imp_physics_fer_hires=physics%model%imp_physics_fer_hires, &
                  imp_physics_nssl=physics%model%imp_physics_nssl,con_g=con_g,phil=physics%statein%phil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  gt0=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  refl_10cm=physics%diag%refl_10cm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  refdmax=physics%diag%refdmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  refdmax263k=physics%diag%refdmax263k(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u10m=physics%diag%u10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10m=physics%diag%v10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u10max=physics%diag%u10max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10max=physics%diag%v10max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  spd10max=physics%diag%spd10max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  pgr=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t2m=physics%sfcprop%t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  q2m=physics%sfcprop%q2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t02max=physics%diag%t02max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t02min=physics%diag%t02min(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rh02max=physics%diag%rh02max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rh02min=physics%diag%rh02min(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtp=physics%model%dtp,rain=physics%diag%rain(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  pratemax=physics%diag%pratemax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wgrs=wgrs_63_ptr_array(cdata%thrd_no)%p,qgraupel=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgl), &
                  qsnowwat=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsw), &
                  qicewat=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  con_rd=con_rd,tgrs=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  lightning_threat=physics%model%lightning_threat,ltg1_max=ltg1_max_64_ptr_array(cdata%thrd_no)%p, &
                  ltg2_max=ltg2_max_65_ptr_array(cdata%thrd_no)%p,ltg3_max=ltg3_max_66_ptr_array(cdata%thrd_no)%p, &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  kdt=physics%model%kdt,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lightning_threat)) then
        nullify(wgrs_63_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lightning_threat)) then
        nullify(ltg1_max_64_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lightning_threat)) then
        nullify(ltg2_max_65_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lightning_threat)) then
        nullify(ltg3_max_66_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in maximum_hourly_diagnostics_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ldiag3d)) then
        dtend_26_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        do3_dt_prd_1_ptr_array(cdata%thrd_no)%p => physics%diag%do3_dt_prd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        do3_dt_ozmx_2_ptr_array(cdata%thrd_no)%p => physics%diag%do3_dt_ozmx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        do3_dt_temp_3_ptr_array(cdata%thrd_no)%p => physics%diag%do3_dt_temp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        do3_dt_ohoz_4_ptr_array(cdata%thrd_no)%p => physics%diag%do3_dt_ohoz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%h2o_phys)) then
        dqv_dt_prd_5_ptr_array(cdata%thrd_no)%p => physics%diag%dqv_dt_prd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%h2o_phys)) then
        dqv_dt_qvmx_6_ptr_array(cdata%thrd_no)%p => physics%diag%dqv_dt_qvmx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call gfs_physics_post_run(ncol=physics%model%blksz(cdata%blk_no),nlev=physics%model%levs,dtend=dtend_26_ptr_array(cdata%thrd_no)%p, &
                  dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  ntoz=physics%model%ntoz,ntracp100=physics%model%ntracp100,nprocess=physics%model%nprocess, &
                  nprocess_summed=physics%model%nprocess_summed,ip_physics=physics%model%index_of_process_physics, &
                  ip_photochem=physics%model%index_of_process_photochem,is_photochem=physics%model%is_photochem(one:physics%model%nprocess), &
                  ldiag3d=physics%model%ldiag3d,ip_prod_loss=physics%model%index_of_process_prod_loss, &
                  ip_ozmix=physics%model%index_of_process_ozmix,ip_temp=physics%model%index_of_process_temp, &
                  ip_overhead_ozone=physics%model%index_of_process_overhead_ozone,do3_dt_prd=do3_dt_prd_1_ptr_array(cdata%thrd_no)%p, &
                  do3_dt_ozmx=do3_dt_ozmx_2_ptr_array(cdata%thrd_no)%p,do3_dt_temp=do3_dt_temp_3_ptr_array(cdata%thrd_no)%p, &
                  do3_dt_ohoz=do3_dt_ohoz_4_ptr_array(cdata%thrd_no)%p,ntqv=physics%model%ntqv, &
                  dqv_dt_prd=dqv_dt_prd_5_ptr_array(cdata%thrd_no)%p,dqv_dt_qvmx=dqv_dt_qvmx_6_ptr_array(cdata%thrd_no)%p, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ldiag3d)) then
        nullify(dtend_26_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        nullify(do3_dt_prd_1_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        nullify(do3_dt_ozmx_2_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        nullify(do3_dt_temp_3_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%oz_phys_2015)) then
        nullify(do3_dt_ohoz_4_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%h2o_phys)) then
        nullify(dqv_dt_prd_5_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%h2o_phys)) then
        nullify(dqv_dt_qvmx_6_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_physics_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    



   end function scm_gfs_v16_phys_ts_run_cap

   function scm_gfs_v16_phys_ts_final_cap(one,physics,cdata) result(ierr)

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

      


      call gfdl_cloud_microphys_finalize(errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfdl_cloud_microphys_finalize: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized = .false.


   end function scm_gfs_v16_phys_ts_final_cap

end module ccpp_scm_gfs_v16_phys_ts_cap
