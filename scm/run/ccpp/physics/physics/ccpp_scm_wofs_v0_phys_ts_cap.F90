
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
module ccpp_scm_wofs_v0_phys_ts_cap

   use gfs_photochemistry, only: gfs_photochemistry_init
   use mp_nssl, only: mp_nssl_init
   use gfs_photochemistry, only: gfs_photochemistry_run
   use gfs_photochemistry_post, only: gfs_photochemistry_post_run
   use get_phi_fv3, only: get_phi_fv3_run
   use mp_nssl, only: mp_nssl_run
   use gfs_mp_generic_post, only: gfs_mp_generic_post_run
   use maximum_hourly_diagnostics, only: maximum_hourly_diagnostics_run
   use gfs_physics_post, only: gfs_physics_post_run


   implicit none

   private
   public :: scm_wofs_v0_phys_ts_tsinit_cap, &
             scm_wofs_v0_phys_ts_tsfinal_cap, &
             scm_wofs_v0_phys_ts_init_cap, &
             scm_wofs_v0_phys_ts_run_cap, &
             scm_wofs_v0_phys_ts_final_cap

   logical, dimension(200), save :: initialized = .false.

   contains

   function scm_wofs_v0_phys_ts_tsinit_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_wofs_v0_phys_ts_tsinit_cap

   function scm_wofs_v0_phys_ts_tsfinal_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_wofs_v0_phys_ts_tsfinal_cap

   function scm_wofs_v0_phys_ts_init_cap(one,physics,cdata,con_g,con_rd,con_cp,con_rv,con_t0c,con_cliq,con_csol, &
                  con_eps) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t
      use machine, only: kind_phys

      implicit none

      ! Error handling
      integer :: ierr

      integer, intent(in), target :: one
      type(physics_type), intent(inout), target :: physics
      type(ccpp_t), intent(inout), target :: cdata
      real(kind_phys), intent(in), target :: con_g
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: con_cp
      real(kind_phys), intent(in), target :: con_rv
      real(kind_phys), intent(in), target :: con_t0c
      real(kind_phys), intent(in), target :: con_cliq
      real(kind_phys), intent(in), target :: con_csol
      real(kind_phys), intent(in), target :: con_eps
      
      ! Local variables/pointers for unit conversions, array transformations, ...
      type :: real_kind_phys_rank2_ptr_arr_type
         real(kind_phys), dimension(:,:), pointer :: p => null()
      end type real_kind_phys_rank2_ptr_arr_type
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ccw_1_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: vh_2_ptr_array

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

    
      

      if ((physics%model%ntlnc > 0)) then
        ccw_1_ptr_array(cdata%thrd_no)%p => physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntlnc)
      end if

      if (( physics%model%ntgv > 0 )) then
        vh_2_ptr_array(cdata%thrd_no)%p => physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntgv)
      end if

      call mp_nssl_init(ncol=physics%model%ncols,nlev=physics%model%levs,errmsg=cdata%errmsg,errflg=cdata%errflg, &
                  threads=physics%model%nthreads,restart=physics%model%restart,fn_nml=physics%model%fn_nml, &
                  input_nml_file=physics%model%input_nml_file(:),mpirank=physics%model%me, &
                  mpiroot=physics%model%master,mpicomm=physics%model%communicator,qc=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntcw), &
                  qr=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntrw), &
                  qi=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntiw), &
                  qs=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntsw), &
                  qh=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntgl), &
                  ccw=ccw_1_ptr_array(cdata%thrd_no)%p,crw=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntrnc), &
                  cci=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntinc), &
                  csw=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntsnc), &
                  chw=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntgnc), &
                  vh=vh_2_ptr_array(cdata%thrd_no)%p,con_g=con_g,con_rd=con_rd,con_cp=con_cp, &
                  con_rv=con_rv,con_t0c=con_t0c,con_cliq=con_cliq,con_csol=con_csol,con_eps=con_eps, &
                  imp_physics=physics%model%imp_physics,imp_physics_nssl=physics%model%imp_physics_nssl, &
                  nssl_cccn=physics%model%nssl_cccn,nssl_alphah=physics%model%nssl_alphah, &
                  nssl_alphahl=physics%model%nssl_alphahl,nssl_alphar=physics%model%nssl_alphar, &
                  nssl_ehw0=physics%model%nssl_ehw0,nssl_ehlw0=physics%model%nssl_ehlw0,nssl_ccn_on=physics%model%nssl_ccn_on, &
                  nssl_hail_on=physics%model%nssl_hail_on,nssl_invertccn=physics%model%nssl_invertccn, &
                  nssl_3moment=physics%model%nssl_3moment)


      if ((physics%model%ntlnc > 0)) then
        nullify(ccw_1_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntgv > 0 )) then
        nullify(vh_2_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in mp_nssl_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized(cdata%ccpp_instance) = .true.


   end function scm_wofs_v0_phys_ts_init_cap

   function scm_wofs_v0_phys_ts_run_cap(one,physics,cdata,con_1ovg,con_fvirt,con_g,con_rd,rainmin,rhowater,con_t0c) result(ierr)

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
      real(kind_phys), intent(in), target :: con_g
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: rainmin
      real(kind_phys), intent(in), target :: rhowater
      real(kind_phys), intent(in), target :: con_t0c
      
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
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qhl_7_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cccn_8_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cccna_9_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ccw_10_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: chl_11_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: vh_12_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: vhl_13_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: zrw_14_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: zhw_15_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: zhl_16_ptr_array
      type :: real_kind_phys_rank1_ptr_arr_type
         real(kind_phys), dimension(:), pointer :: p => null()
      end type real_kind_phys_rank1_ptr_arr_type
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rain_17_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: graupel_18_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ice_19_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snow_20_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: re_cloud_21_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: re_ice_22_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: re_snow_23_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: re_rain_24_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_qs_25_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_qh_26_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_qhl_27_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_cccn_28_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_ccw_29_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_crw_30_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_cci_31_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_csw_32_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_chw_33_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_chl_34_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_vh_35_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_vhl_36_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_zrw_37_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_zhw_38_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ten_zhl_39_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rain_cpl_40_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rainc_cpl_41_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snow_cpl_42_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: drain_cpl_43_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dsnow_cpl_44_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: raincprv_45_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rainncprv_46_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: iceprv_47_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snowprv_48_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: graupelprv_49_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: draincprv_50_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: drainncprv_51_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: diceprv_52_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dsnowprv_53_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dgraupelprv_54_ptr_array
      type :: real_kind_phys_rank3_ptr_arr_type
         real(kind_phys), dimension(:,:,:), pointer :: p => null()
      end type real_kind_phys_rank3_ptr_arr_type
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dfi_radar_tten_55_ptr_array
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtend_56_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqdt_qmicro_57_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: prevsq_58_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wgrs_59_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ltg1_max_60_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ltg2_max_61_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ltg3_max_62_ptr_array

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

    
      

      if (( physics%model%nthl > 0 )) then
        qhl_7_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nthl)
      end if

      if (( physics%model%ntccn > 0 )) then
        cccn_8_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntccn)
      end if

      if (( physics%model%ntccna > 0 )) then
        cccna_9_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntccna)
      end if

      if ((physics%model%ntlnc > 0)) then
        ccw_10_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntlnc)
      end if

      if (( physics%model%nthnc > 0 )) then
        chl_11_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nthnc)
      end if

      if (( physics%model%ntgv > 0 )) then
        vh_12_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgv)
      end if

      if (( physics%model%nthv > 0 )) then
        vhl_13_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nthv)
      end if

      if (( physics%model%ntrz > 0 )) then
        zrw_14_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntrz)
      end if

      if (( physics%model%ntgz > 0 )) then
        zhw_15_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgz)
      end if

      if (( physics%model%nthz > 0 )) then
        zhl_16_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nthz)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        rain_17_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%rainmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        graupel_18_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%graupelmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        ice_19_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%icemp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        snow_20_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%snowmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%nleffr > 0)) then
        re_cloud_21_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nleffr)
      end if

      if ((physics%model%nieffr > 0)) then
        re_ice_22_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nieffr)
      end if

      if ((physics%model%nseffr > 0)) then
        re_snow_23_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nseffr)
      end if

      if ((physics%model%nreffr > 0)) then
        re_rain_24_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nreffr)
      end if

      if ((physics%model%ntsw > 0)) then
        ten_qs_25_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsw)
      end if

      if ((physics%model%ntgl > 0)) then
        ten_qh_26_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgl)
      end if

      if ((physics%model%nthl > 0)) then
        ten_qhl_27_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nthl)
      end if

      if (( physics%model%ntccn > 0 )) then
        ten_cccn_28_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntccn)
      end if

      if ((physics%model%ntlnc > 0)) then
        ten_ccw_29_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntlnc)
      end if

      if ((physics%model%ntrnc > 0)) then
        ten_crw_30_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntrnc)
      end if

      if ((physics%model%ntinc > 0)) then
        ten_cci_31_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntinc)
      end if

      if ((physics%model%ntsnc > 0)) then
        ten_csw_32_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsnc)
      end if

      if ((physics%model%ntgnc > 0)) then
        ten_chw_33_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgnc)
      end if

      if (( physics%model%nthnc > 0 )) then
        ten_chl_34_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nthnc)
      end if

      if (( physics%model%ntgv > 0 )) then
        ten_vh_35_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgv)
      end if

      if (( physics%model%nthv > 0 )) then
        ten_vhl_36_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nthv)
      end if

      if (( physics%model%ntrz > 0 )) then
        ten_zrw_37_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntrz)
      end if

      if (( physics%model%ntgz > 0 )) then
        ten_zhw_38_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgz)
      end if

      if (( physics%model%nthz > 0 )) then
        ten_zhl_39_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nthz)
      end if

      call mp_nssl_run(ncol=physics%model%blksz(cdata%blk_no),nlev=physics%model%levs,con_g=con_g, &
                  con_rd=con_rd,mpirank=physics%model%me,spechum=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  qc=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntcw), &
                  qr=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntrw), &
                  qi=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  qs=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsw), &
                  qh=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgl), &
                  qhl=qhl_7_ptr_array(cdata%thrd_no)%p,cccn=cccn_8_ptr_array(cdata%thrd_no)%p, &
                  cccna=cccna_9_ptr_array(cdata%thrd_no)%p,ccw=ccw_10_ptr_array(cdata%thrd_no)%p, &
                  crw=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntrnc), &
                  cci=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntinc), &
                  csw=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsnc), &
                  chw=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgnc), &
                  chl=chl_11_ptr_array(cdata%thrd_no)%p,vh=vh_12_ptr_array(cdata%thrd_no)%p, &
                  vhl=vhl_13_ptr_array(cdata%thrd_no)%p,zrw=zrw_14_ptr_array(cdata%thrd_no)%p, &
                  zhw=zhw_15_ptr_array(cdata%thrd_no)%p,zhl=zhl_16_ptr_array(cdata%thrd_no)%p, &
                  tgrs=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prslk=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  omega=physics%statein%vvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtp=physics%model%dtp,prcp=physics%interstitial(cdata%thrd_no)%prcpmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rain=rain_17_ptr_array(cdata%thrd_no)%p,graupel=graupel_18_ptr_array(cdata%thrd_no)%p, &
                  ice=ice_19_ptr_array(cdata%thrd_no)%p,snow=snow_20_ptr_array(cdata%thrd_no)%p, &
                  sr=physics%diag%sr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  refl_10cm=physics%diag%refl_10cm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  do_radar_ref=physics%model%lradar,first_time_step=physics%model%first_time_step, &
                  restart=physics%model%restart,re_cloud=re_cloud_21_ptr_array(cdata%thrd_no)%p, &
                  re_ice=re_ice_22_ptr_array(cdata%thrd_no)%p,re_snow=re_snow_23_ptr_array(cdata%thrd_no)%p, &
                  re_rain=re_rain_24_ptr_array(cdata%thrd_no)%p,nleffr=physics%model%nleffr, &
                  nieffr=physics%model%nieffr,nreffr=physics%model%nreffr,nseffr=physics%model%nseffr, &
                  imp_physics=physics%model%imp_physics,convert_dry_rho=physics%model%convert_dry_rho, &
                  imp_physics_nssl=physics%model%imp_physics_nssl,nssl_ccn_on=physics%model%nssl_ccn_on, &
                  nssl_hail_on=physics%model%nssl_hail_on,nssl_invertccn=physics%model%nssl_invertccn, &
                  nssl_3moment=physics%model%nssl_3moment,ntccn=physics%model%ntccn,ntccna=physics%model%ntccna, &
                  ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_qv=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  ten_qc=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntcw), &
                  ten_qr=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntrw), &
                  ten_qi=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  ten_qs=ten_qs_25_ptr_array(cdata%thrd_no)%p,ten_qh=ten_qh_26_ptr_array(cdata%thrd_no)%p, &
                  ten_qhl=ten_qhl_27_ptr_array(cdata%thrd_no)%p,ten_cccn=ten_cccn_28_ptr_array(cdata%thrd_no)%p, &
                  ten_ccw=ten_ccw_29_ptr_array(cdata%thrd_no)%p,ten_crw=ten_crw_30_ptr_array(cdata%thrd_no)%p, &
                  ten_cci=ten_cci_31_ptr_array(cdata%thrd_no)%p,ten_csw=ten_csw_32_ptr_array(cdata%thrd_no)%p, &
                  ten_chw=ten_chw_33_ptr_array(cdata%thrd_no)%p,ten_chl=ten_chl_34_ptr_array(cdata%thrd_no)%p, &
                  ten_vh=ten_vh_35_ptr_array(cdata%thrd_no)%p,ten_vhl=ten_vhl_36_ptr_array(cdata%thrd_no)%p, &
                  ten_zrw=ten_zrw_37_ptr_array(cdata%thrd_no)%p,ten_zhw=ten_zhw_38_ptr_array(cdata%thrd_no)%p, &
                  ten_zhl=ten_zhl_39_ptr_array(cdata%thrd_no)%p,errflg=cdata%errflg,errmsg=cdata%errmsg)


      if (( physics%model%nthl > 0 )) then
        nullify(qhl_7_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntccn > 0 )) then
        nullify(cccn_8_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntccna > 0 )) then
        nullify(cccna_9_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntlnc > 0)) then
        nullify(ccw_10_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%nthnc > 0 )) then
        nullify(chl_11_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntgv > 0 )) then
        nullify(vh_12_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%nthv > 0 )) then
        nullify(vhl_13_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntrz > 0 )) then
        nullify(zrw_14_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntgz > 0 )) then
        nullify(zhw_15_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%nthz > 0 )) then
        nullify(zhl_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(rain_17_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(graupel_18_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(ice_19_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(snow_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nleffr > 0)) then
        nullify(re_cloud_21_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nieffr > 0)) then
        nullify(re_ice_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nseffr > 0)) then
        nullify(re_snow_23_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nreffr > 0)) then
        nullify(re_rain_24_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntsw > 0)) then
        nullify(ten_qs_25_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntgl > 0)) then
        nullify(ten_qh_26_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nthl > 0)) then
        nullify(ten_qhl_27_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntccn > 0 )) then
        nullify(ten_cccn_28_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntlnc > 0)) then
        nullify(ten_ccw_29_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntrnc > 0)) then
        nullify(ten_crw_30_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntinc > 0)) then
        nullify(ten_cci_31_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntsnc > 0)) then
        nullify(ten_csw_32_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntgnc > 0)) then
        nullify(ten_chw_33_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%nthnc > 0 )) then
        nullify(ten_chl_34_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntgv > 0 )) then
        nullify(ten_vh_35_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%nthv > 0 )) then
        nullify(ten_vhl_36_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntrz > 0 )) then
        nullify(ten_zrw_37_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%ntgz > 0 )) then
        nullify(ten_zhw_38_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%nthz > 0 )) then
        nullify(ten_zhl_39_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in mp_nssl_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        rain_17_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%rainmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        ice_19_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%icemp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        snow_20_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%snowmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        graupel_18_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%graupelmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%do_sppt .or. physics%model%cplchm .or. physics%model%ca_global .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        rain_cpl_40_ptr_array(cdata%thrd_no)%p => physics%coupling%rain_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        rainc_cpl_41_ptr_array(cdata%thrd_no)%p => physics%coupling%rainc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%do_sppt .or. physics%model%cplchm .or. physics%model%ca_global .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        snow_cpl_42_ptr_array(cdata%thrd_no)%p => physics%coupling%snow_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        drain_cpl_43_ptr_array(cdata%thrd_no)%p => physics%tbd%drain_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        dsnow_cpl_44_ptr_array(cdata%thrd_no)%p => physics%tbd%dsnow_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        raincprv_45_ptr_array(cdata%thrd_no)%p => physics%sfcprop%raincprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        rainncprv_46_ptr_array(cdata%thrd_no)%p => physics%sfcprop%rainncprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        iceprv_47_ptr_array(cdata%thrd_no)%p => physics%sfcprop%iceprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        snowprv_48_ptr_array(cdata%thrd_no)%p => physics%sfcprop%snowprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        graupelprv_49_ptr_array(cdata%thrd_no)%p => physics%sfcprop%graupelprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        draincprv_50_ptr_array(cdata%thrd_no)%p => physics%sfcprop%draincprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        drainncprv_51_ptr_array(cdata%thrd_no)%p => physics%sfcprop%drainncprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        diceprv_52_ptr_array(cdata%thrd_no)%p => physics%sfcprop%diceprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        dsnowprv_53_ptr_array(cdata%thrd_no)%p => physics%sfcprop%dsnowprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        dgraupelprv_54_ptr_array(cdata%thrd_no)%p => physics%sfcprop%dgraupelprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%num_dfi_radar>0)) then
        dfi_radar_tten_55_ptr_array(cdata%thrd_no)%p => physics%tbd%dfi_radar_tten(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%num_dfi_radar)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_56_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%progsigma)) then
        dqdt_qmicro_57_ptr_array(cdata%thrd_no)%p => physics%coupling%dqdt_qmicro(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        prevsq_58_ptr_array(cdata%thrd_no)%p => physics%tbd%prevsq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
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
                  exticeden=physics%model%exticeden,rain0=rain_17_ptr_array(cdata%thrd_no)%p, &
                  ice0=ice_19_ptr_array(cdata%thrd_no)%p,snow0=snow_20_ptr_array(cdata%thrd_no)%p, &
                  graupel0=graupel_18_ptr_array(cdata%thrd_no)%p,del=physics%interstitial(cdata%thrd_no)%del(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
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
                  rain_cpl=rain_cpl_40_ptr_array(cdata%thrd_no)%p,rainc_cpl=rainc_cpl_41_ptr_array(cdata%thrd_no)%p, &
                  snow_cpl=snow_cpl_42_ptr_array(cdata%thrd_no)%p,pwat=physics%diag%pwat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  drain_cpl=drain_cpl_43_ptr_array(cdata%thrd_no)%p,dsnow_cpl=dsnow_cpl_44_ptr_array(cdata%thrd_no)%p, &
                  lsm=physics%model%lsm,lsm_ruc=physics%model%lsm_ruc,lsm_noahmp=physics%model%lsm_noahmp, &
                  raincprv=raincprv_45_ptr_array(cdata%thrd_no)%p,rainncprv=rainncprv_46_ptr_array(cdata%thrd_no)%p, &
                  iceprv=iceprv_47_ptr_array(cdata%thrd_no)%p,snowprv=snowprv_48_ptr_array(cdata%thrd_no)%p, &
                  graupelprv=graupelprv_49_ptr_array(cdata%thrd_no)%p,draincprv=draincprv_50_ptr_array(cdata%thrd_no)%p, &
                  drainncprv=drainncprv_51_ptr_array(cdata%thrd_no)%p,diceprv=diceprv_52_ptr_array(cdata%thrd_no)%p, &
                  dsnowprv=dsnowprv_53_ptr_array(cdata%thrd_no)%p,dgraupelprv=dgraupelprv_54_ptr_array(cdata%thrd_no)%p, &
                  dtp=physics%model%dtp,num_diag_buckets=physics%model%n_diag_buckets,num_dfi_radar=physics%model%num_dfi_radar, &
                  fh_dfi_radar=physics%model%fh_dfi_radar(one:physics%model%dfi_radar_max_intervals_plus_one), &
                  ix_dfi_radar=physics%model%ix_dfi_radar(one:physics%model%dfi_radar_max_intervals), &
                  dfi_radar_tten=dfi_radar_tten_55_ptr_array(cdata%thrd_no)%p,fhour=physics%model%fhour, &
                  radar_tten_limits=physics%model%radar_tten_limits(one:2),index_of_process_dfi_radar=physics%model%index_of_process_dfi_radar, &
                  dtend=dtend_56_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_temperature=physics%model%index_of_temperature,index_of_process_mp=physics%model%index_of_process_mp, &
                  ldiag3d=physics%model%ldiag3d,qdiag3d=physics%model%qdiag3d,dqdt_qmicro=dqdt_qmicro_57_ptr_array(cdata%thrd_no)%p, &
                  prevsq=prevsq_58_ptr_array(cdata%thrd_no)%p,lssav=physics%model%lssav,lkm=physics%model%lkm, &
                  iopt_lake=physics%model%iopt_lake,iopt_lake_clm=physics%model%iopt_lake_clm, &
                  use_lake_model=physics%sfcprop%use_lake_model(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(rain_17_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(ice_19_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(snow_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(graupel_18_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%do_sppt .or. physics%model%cplchm .or. physics%model%ca_global .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        nullify(rain_cpl_40_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        nullify(rainc_cpl_41_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%do_sppt .or. physics%model%cplchm .or. physics%model%ca_global .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        nullify(snow_cpl_42_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        nullify(drain_cpl_43_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        nullify(dsnow_cpl_44_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        nullify(raincprv_45_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        nullify(rainncprv_46_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(iceprv_47_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(snowprv_48_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(graupelprv_49_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(draincprv_50_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(drainncprv_51_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(diceprv_52_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(dsnowprv_53_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(dgraupelprv_54_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%num_dfi_radar>0)) then
        nullify(dfi_radar_tten_55_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_56_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%progsigma)) then
        nullify(dqdt_qmicro_57_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        nullify(prevsq_58_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_mp_generic_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lightning_threat)) then
        wgrs_59_ptr_array(cdata%thrd_no)%p => physics%statein%wgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%lightning_threat)) then
        ltg1_max_60_ptr_array(cdata%thrd_no)%p => physics%diag%ltg1_max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lightning_threat)) then
        ltg2_max_61_ptr_array(cdata%thrd_no)%p => physics%diag%ltg2_max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lightning_threat)) then
        ltg3_max_62_ptr_array(cdata%thrd_no)%p => physics%diag%ltg3_max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
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
                  wgrs=wgrs_59_ptr_array(cdata%thrd_no)%p,qgraupel=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgl), &
                  qsnowwat=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsw), &
                  qicewat=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  con_rd=con_rd,tgrs=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  lightning_threat=physics%model%lightning_threat,ltg1_max=ltg1_max_60_ptr_array(cdata%thrd_no)%p, &
                  ltg2_max=ltg2_max_61_ptr_array(cdata%thrd_no)%p,ltg3_max=ltg3_max_62_ptr_array(cdata%thrd_no)%p, &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  kdt=physics%model%kdt,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lightning_threat)) then
        nullify(wgrs_59_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lightning_threat)) then
        nullify(ltg1_max_60_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lightning_threat)) then
        nullify(ltg2_max_61_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lightning_threat)) then
        nullify(ltg3_max_62_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in maximum_hourly_diagnostics_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ldiag3d)) then
        dtend_56_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
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

      call gfs_physics_post_run(ncol=physics%model%blksz(cdata%blk_no),nlev=physics%model%levs,dtend=dtend_56_ptr_array(cdata%thrd_no)%p, &
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
        nullify(dtend_56_ptr_array(cdata%thrd_no)%p)
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

    



   end function scm_wofs_v0_phys_ts_run_cap

   function scm_wofs_v0_phys_ts_final_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0






      initialized = .false.


   end function scm_wofs_v0_phys_ts_final_cap

end module ccpp_scm_wofs_v0_phys_ts_cap
