
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
module ccpp_scm_hrrr_gf_ps_phys_ts_cap

   use gfs_photochemistry, only: gfs_photochemistry_init
   use cu_gf_driver, only: cu_gf_driver_init
   use mp_thompson, only: mp_thompson_init
   use mp_thompson_post, only: mp_thompson_post_init
   use gfs_photochemistry, only: gfs_photochemistry_run
   use gfs_photochemistry_post, only: gfs_photochemistry_post_run
   use get_phi_fv3, only: get_phi_fv3_run
   use gfs_suite_interstitial_3, only: gfs_suite_interstitial_3_run
   use cu_gf_driver_pre, only: cu_gf_driver_pre_run
   use cu_gf_driver, only: cu_gf_driver_run
   use gfs_dcnv_generic_post, only: gfs_dcnv_generic_post_run
   use gfs_suite_interstitial_4, only: gfs_suite_interstitial_4_run
   use cnvc90, only: cnvc90_run
   use mp_thompson, only: mp_thompson_run
   use mp_thompson_post, only: mp_thompson_post_run
   use gfs_mp_generic_post, only: gfs_mp_generic_post_run
   use cu_gf_driver_post, only: cu_gf_driver_post_run
   use maximum_hourly_diagnostics, only: maximum_hourly_diagnostics_run
   use gfs_physics_post, only: gfs_physics_post_run
   use mp_thompson, only: mp_thompson_finalize
   use mp_thompson_post, only: mp_thompson_post_finalize


   implicit none

   private
   public :: scm_hrrr_gf_ps_phys_ts_tsinit_cap, &
             scm_hrrr_gf_ps_phys_ts_tsfinal_cap, &
             scm_hrrr_gf_ps_phys_ts_init_cap, &
             scm_hrrr_gf_ps_phys_ts_run_cap, &
             scm_hrrr_gf_ps_phys_ts_final_cap

   logical, dimension(200), save :: initialized = .false.

   contains

   function scm_hrrr_gf_ps_phys_ts_tsinit_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_hrrr_gf_ps_phys_ts_tsinit_cap

   function scm_hrrr_gf_ps_phys_ts_tsfinal_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_hrrr_gf_ps_phys_ts_tsfinal_cap

   function scm_hrrr_gf_ps_phys_ts_init_cap(one,physics,cdata,con_pi,con_t0c,con_rv,con_cp,con_rgas,con_boltz,con_amd, &
                  con_amw,con_avgd,con_hvap,con_hfus,con_g,con_rd,con_eps) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t
      use machine, only: kind_phys

      implicit none

      ! Error handling
      integer :: ierr

      integer, intent(in), target :: one
      type(physics_type), intent(inout), target :: physics
      type(ccpp_t), intent(inout), target :: cdata
      real(kind_phys), intent(in), target :: con_pi
      real(kind_phys), intent(in), target :: con_t0c
      real(kind_phys), intent(in), target :: con_rv
      real(kind_phys), intent(in), target :: con_cp
      real(kind_phys), intent(in), target :: con_rgas
      real(kind_phys), intent(in), target :: con_boltz
      real(kind_phys), intent(in), target :: con_amd
      real(kind_phys), intent(in), target :: con_amw
      real(kind_phys), intent(in), target :: con_avgd
      real(kind_phys), intent(in), target :: con_hvap
      real(kind_phys), intent(in), target :: con_hfus
      real(kind_phys), intent(in), target :: con_g
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: con_eps
      
      ! Local variables/pointers for unit conversions, array transformations, ...
      type :: real_kind_phys_rank2_ptr_arr_type
         real(kind_phys), dimension(:,:), pointer :: p => null()
      end type real_kind_phys_rank2_ptr_arr_type
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nc_1_ptr_array
      type :: real_kind_phys_rank1_ptr_arr_type
         real(kind_phys), dimension(:), pointer :: p => null()
      end type real_kind_phys_rank1_ptr_arr_type
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nwfa2d_2_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nifa2d_3_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nwfa_4_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nifa_5_ptr_array
      type :: real_kind_phys_rank3_ptr_arr_type
         real(kind_phys), dimension(:,:,:), pointer :: p => null()
      end type real_kind_phys_rank3_ptr_arr_type
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: diag3d_6_ptr_array

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

    
      


      call cu_gf_driver_init(imfshalcnv=physics%model%imfshalcnv,imfshalcnv_gf=physics%model%imfshalcnv_gf, &
                  imfdeepcnv=physics%model%imfdeepcnv,imfdeepcnv_gf=physics%model%imfdeepcnv_gf, &
                  mpirank=physics%model%me,mpiroot=physics%model%master,errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in cu_gf_driver_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ntlnc > 0)) then
        nc_1_ptr_array(cdata%thrd_no)%p => physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntlnc)
      end if

      if (((physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_tempo) .and. (physics%model%ltaerosol .or. physics%model%mraerosol))) then
        nwfa2d_2_ptr_array(cdata%thrd_no)%p => physics%coupling%nwfa2d(one:physics%model%ncols)
      end if

      if (((physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_tempo) .and. (physics%model%ltaerosol .or. physics%model%mraerosol))) then
        nifa2d_3_ptr_array(cdata%thrd_no)%p => physics%coupling%nifa2d(one:physics%model%ncols)
      end if

      if ((physics%model%ntwa > 0)) then
        nwfa_4_ptr_array(cdata%thrd_no)%p => physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntwa)
      end if

      if ((physics%model%ntia > 0)) then
        nifa_5_ptr_array(cdata%thrd_no)%p => physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntia)
      end if

      if ((physics%model%ext_diag_thompson)) then
        diag3d_6_ptr_array(cdata%thrd_no)%p => physics%diag%thompson_ext_diag3d(one:physics%model%ncols,one:physics%model%levs,one:physics%model%thompson_ext_ndiag3d)
      end if

      call mp_thompson_init(ncol=physics%model%ncols,nlev=physics%model%levs,con_pi=con_pi,con_t0c=con_t0c, &
                  con_rv=con_rv,con_cp=con_cp,con_rgas=con_rgas,con_boltz=con_boltz,con_amd=con_amd, &
                  con_amw=con_amw,con_avgd=con_avgd,con_hvap=con_hvap,con_hfus=con_hfus,con_g=con_g, &
                  con_rd=con_rd,con_eps=con_eps,con_nt_c_l=physics%model%nt_c_l,con_nt_c_o=physics%model%nt_c_o, &
                  con_av_i=physics%model%av_i,con_xnc_max=physics%model%xnc_max,con_ssati_min=physics%model%ssati_min, &
                  con_nt_i_max=physics%model%nt_i_max,con_rr_min=physics%model%rr_min,restart=physics%model%restart, &
                  imp_physics=physics%model%imp_physics,imp_physics_thompson=physics%model%imp_physics_thompson, &
                  convert_dry_rho=physics%model%convert_dry_rho,spechum=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntqv), &
                  qc=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntcw), &
                  qr=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntrw), &
                  qi=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntiw), &
                  qs=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntsw), &
                  qg=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntgl), &
                  ni=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntinc), &
                  nr=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntrnc), &
                  is_aerosol_aware=physics%model%ltaerosol,merra2_aerosol_aware=physics%model%mraerosol, &
                  nc=nc_1_ptr_array(cdata%thrd_no)%p,nwfa2d=nwfa2d_2_ptr_array(cdata%thrd_no)%p, &
                  nifa2d=nifa2d_3_ptr_array(cdata%thrd_no)%p,nwfa=nwfa_4_ptr_array(cdata%thrd_no)%p, &
                  nifa=nifa_5_ptr_array(cdata%thrd_no)%p,tgrs=physics%statein%tgrs(one:physics%model%ncols,one:physics%model%levs), &
                  prsl=physics%statein%prsl(one:physics%model%ncols,one:physics%model%levs), &
                  phil=physics%statein%phil(one:physics%model%ncols,one:physics%model%levs), &
                  area=physics%grid%area(one:physics%model%ncols),aerfld=physics%tbd%aer_nm(one:physics%model%ncols,one:physics%model%levs,one:physics%model%ntrcaer), &
                  mpicomm=physics%model%communicator,mpirank=physics%model%me,mpiroot=physics%model%master, &
                  threads=physics%model%nthreads,ext_diag=physics%model%ext_diag_thompson, &
                  diag3d=diag3d_6_ptr_array(cdata%thrd_no)%p,is_initialized=physics%model%thompson_mp_is_init, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ntlnc > 0)) then
        nullify(nc_1_ptr_array(cdata%thrd_no)%p)
      end if

      if (((physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_tempo) .and. (physics%model%ltaerosol .or. physics%model%mraerosol))) then
        nullify(nwfa2d_2_ptr_array(cdata%thrd_no)%p)
      end if

      if (((physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_tempo) .and. (physics%model%ltaerosol .or. physics%model%mraerosol))) then
        nullify(nifa2d_3_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntwa > 0)) then
        nullify(nwfa_4_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntia > 0)) then
        nullify(nifa_5_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ext_diag_thompson)) then
        nullify(diag3d_6_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in mp_thompson_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call mp_thompson_post_init(ttendlim=physics%model%ttendlim,errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in mp_thompson_post_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized(cdata%ccpp_instance) = .true.


   end function scm_hrrr_gf_ps_phys_ts_init_cap

   function scm_hrrr_gf_ps_phys_ts_run_cap(one,physics,cdata,con_1ovg,con_fvirt,con_g,con_cp,con_hvap,con_rv,con_pi, &
                  con_rd,con_eps,rainmin,rhowater,con_t0c) result(ierr)

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
      real(kind_phys), intent(in), target :: con_cp
      real(kind_phys), intent(in), target :: con_hvap
      real(kind_phys), intent(in), target :: con_rv
      real(kind_phys), intent(in), target :: con_pi
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: con_eps
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
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sigmain_7_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sigmaout_8_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qmicro_9_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: omegain_10_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: omegaout_11_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: prevst_12_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: prevsq_13_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: forcet_14_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: forceq_15_ptr_array
      type :: integer_default_kind_rank1_ptr_arr_type
         integer, dimension(:), pointer :: p => null()
      end type integer_default_kind_rank1_ptr_arr_type
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cactiv_16_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cactiv_m_17_ptr_array
      type :: real_kind_phys_rank1_ptr_arr_type
         real(kind_phys), dimension(:), pointer :: p => null()
      end type real_kind_phys_rank1_ptr_arr_type
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: conv_act_18_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: conv_act_m_19_ptr_array
      type :: real_kind_phys_rank3_ptr_arr_type
         real(kind_phys), dimension(:,:,:), pointer :: p => null()
      end type real_kind_phys_rank3_ptr_arr_type
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: chem3d_20_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: aod_gf_21_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ud_mf_22_ptr_array
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtend_23_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qci_conv_24_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cap_suppress_25_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: maxupmf_26_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: maxmf_27_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: spp_wts_cu_deep_28_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wetdpc_deep_29_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: upd_mf_30_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dwn_mf_31_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: det_mf_32_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cnvw_phy_f3d_33_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cnvc_phy_f3d_34_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nwfa_35_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nc_36_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nifa_37_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nwfa2d_38_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nifa2d_39_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rain_40_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: graupel_41_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ice_42_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snow_43_ptr_array
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: diag3d_44_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: spp_wts_mp_45_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: spp_prt_list_46_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: spp_stddev_cutoff_47_ptr_array
      type :: character_len10_r1_ptr_arr_type
         character(len=10), dimension(:), pointer :: p => null()
      end type character_len10_r1_ptr_arr_type
      type(character_len10_r1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: spp_var_list_48_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: pfi_lsan_49_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: pfl_lsan_50_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqs_51_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqg_52_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dni_53_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnr_54_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnc_55_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnwfa_56_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnifa_57_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rain_cpl_58_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rainc_cpl_59_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snow_cpl_60_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: drain_cpl_61_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dsnow_cpl_62_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: raincprv_63_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rainncprv_64_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: iceprv_65_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snowprv_66_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: graupelprv_67_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: draincprv_68_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: drainncprv_69_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: diceprv_70_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dsnowprv_71_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dgraupelprv_72_ptr_array
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dfi_radar_tten_73_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wgrs_74_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ltg1_max_75_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ltg2_max_76_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ltg3_max_77_ptr_array

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

    
      

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke)) then
        prevst_12_ptr_array(cdata%thrd_no)%p => physics%tbd%prevst(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        prevsq_13_ptr_array(cdata%thrd_no)%p => physics%tbd%prevsq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke)) then
        forcet_14_ptr_array(cdata%thrd_no)%p => physics%tbd%forcet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke)) then
        forceq_15_ptr_array(cdata%thrd_no)%p => physics%tbd%forceq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        cactiv_16_ptr_array(cdata%thrd_no)%p => physics%tbd%cactiv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        cactiv_m_17_ptr_array(cdata%thrd_no)%p => physics%tbd%cactiv_m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        conv_act_18_ptr_array(cdata%thrd_no)%p => physics%sfcprop%conv_act(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        conv_act_m_19_ptr_array(cdata%thrd_no)%p => physics%sfcprop%conv_act_m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        chem3d_20_ptr_array(cdata%thrd_no)%p => physics%coupling%chem3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nchem)
      end if

      call cu_gf_driver_pre_run(flag_init=physics%model%first_time_step,flag_restart=physics%model%restart, &
                  kdt=physics%model%kdt,fhour=physics%model%fhour,dtp=physics%model%dtp,t=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  q=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  prevst=prevst_12_ptr_array(cdata%thrd_no)%p,prevsq=prevsq_13_ptr_array(cdata%thrd_no)%p, &
                  forcet=forcet_14_ptr_array(cdata%thrd_no)%p,forceq=forceq_15_ptr_array(cdata%thrd_no)%p, &
                  cactiv=cactiv_16_ptr_array(cdata%thrd_no)%p,cactiv_m=cactiv_m_17_ptr_array(cdata%thrd_no)%p, &
                  conv_act=conv_act_18_ptr_array(cdata%thrd_no)%p,conv_act_m=conv_act_m_19_ptr_array(cdata%thrd_no)%p, &
                  gf_coldstart=physics%model%gf_coldstart,ntsmoke=physics%model%ntsmoke,ntdust=physics%model%ntdust, &
                  ntcoarsepm=physics%model%ntcoarsepm,chem3d=chem3d_20_ptr_array(cdata%thrd_no)%p, &
                  gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke)) then
        nullify(prevst_12_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        nullify(prevsq_13_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke)) then
        nullify(forcet_14_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke)) then
        nullify(forceq_15_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(cactiv_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(cactiv_m_17_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(conv_act_18_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(conv_act_m_19_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(chem3d_20_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in cu_gf_driver_pre_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        cactiv_16_ptr_array(cdata%thrd_no)%p => physics%tbd%cactiv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        cactiv_m_17_ptr_array(cdata%thrd_no)%p => physics%tbd%cactiv_m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke)) then
        forcet_14_ptr_array(cdata%thrd_no)%p => physics%tbd%forcet(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke)) then
        forceq_15_ptr_array(cdata%thrd_no)%p => physics%tbd%forceq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        aod_gf_21_ptr_array(cdata%thrd_no)%p => physics%tbd%aod_gf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if (( physics%model%imfdeepcnv .ge. 0 .or. physics%model%imfshalcnv .ge. 0 )) then
        ud_mf_22_ptr_array(cdata%thrd_no)%p => physics%tbd%ud_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_23_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        qci_conv_24_ptr_array(cdata%thrd_no)%p => physics%coupling%qci_conv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%num_dfi_radar>0 .and. physics%model%do_cap_suppress)) then
        cap_suppress_25_ptr_array(cdata%thrd_no)%p => physics%tbd%cap_suppress(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%num_dfi_radar)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        maxupmf_26_ptr_array(cdata%thrd_no)%p => physics%sfcprop%maxupmf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_mynnedmf)) then
        maxmf_27_ptr_array(cdata%thrd_no)%p => physics%diag%maxmf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_spp)) then
        spp_wts_cu_deep_28_ptr_array(cdata%thrd_no)%p => physics%coupling%spp_wts_cu_deep(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%rrfs_sd)) then
        chem3d_20_ptr_array(cdata%thrd_no)%p => physics%coupling%chem3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nchem)
      end if

      if ((physics%model%rrfs_sd)) then
        wetdpc_deep_29_ptr_array(cdata%thrd_no)%p => physics%coupling%wetdpc_flux(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nchem)
      end if

      call cu_gf_driver_run(ntracer=physics%model%ntrac,garea=physics%grid%area(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  im=physics%model%blksz(cdata%blk_no),km=physics%model%levs,dt=physics%model%dtp, &
                  flag_init=physics%model%first_time_step,flag_restart=physics%model%restart, &
                  cactiv=cactiv_16_ptr_array(cdata%thrd_no)%p,cactiv_m=cactiv_m_17_ptr_array(cdata%thrd_no)%p, &
                  g=con_g,cp=con_cp,xlv=con_hvap,r_v=con_rv,forcet=forcet_14_ptr_array(cdata%thrd_no)%p, &
                  forceqv_spechum=forceq_15_ptr_array(cdata%thrd_no)%p,phil=physics%statein%phil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  raincv=physics%interstitial(cdata%thrd_no)%raincd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qv_spechum=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  t=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  cld1d=physics%interstitial(cdata%thrd_no)%cld1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  us=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  vs=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  t2di=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  w=physics%statein%vvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  qv2di_spechum=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  p2di=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  psuri=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hbot=physics%interstitial(cdata%thrd_no)%kbot(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  htop=physics%interstitial(cdata%thrd_no)%ktop(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kcnv=physics%interstitial(cdata%thrd_no)%kcnv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xland=physics%interstitial(cdata%thrd_no)%islmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hfx2=physics%interstitial(cdata%thrd_no)%hflxq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  qfx2=physics%sfcprop%evap(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  aod_gf=aod_gf_21_ptr_array(cdata%thrd_no)%p,cliw=physics%interstitial(cdata%thrd_no)%clw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,1), &
                  clcw=physics%interstitial(cdata%thrd_no)%clw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,2), &
                  pbl=physics%tbd%hpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ud_mf=ud_mf_22_ptr_array(cdata%thrd_no)%p,dd_mf=physics%interstitial(cdata%thrd_no)%dd_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dt_mf=physics%interstitial(cdata%thrd_no)%dt_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  cnvw_moist=physics%cldprop%cnvw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  cnvc=physics%interstitial(cdata%thrd_no)%cnvc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  imfshalcnv=physics%model%imfshalcnv,flag_for_scnv_generic_tend=physics%model%flag_for_scnv_generic_tend, &
                  flag_for_dcnv_generic_tend=physics%model%flag_for_dcnv_generic_tend,dtend=dtend_23_ptr_array(cdata%thrd_no)%p, &
                  dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  ntqv=physics%model%ntqv,ntcw=physics%model%ntcw,ntiw=physics%model%ntiw, &
                  index_of_temperature=physics%model%index_of_temperature,index_of_x_wind=physics%model%index_of_x_wind, &
                  index_of_y_wind=physics%model%index_of_y_wind,index_of_process_scnv=physics%model%index_of_process_scnv, &
                  index_of_process_dcnv=physics%model%index_of_process_dcnv,dfi_radar_max_intervals=physics%model%dfi_radar_max_intervals, &
                  ldiag3d=physics%model%ldiag3d,qci_conv=qci_conv_24_ptr_array(cdata%thrd_no)%p, &
                  fhour=physics%model%fhour,do_cap_suppress=physics%model%do_cap_suppress, &
                  fh_dfi_radar=physics%model%fh_dfi_radar(one:physics%model%dfi_radar_max_intervals_plus_one), &
                  ix_dfi_radar=physics%model%ix_dfi_radar(one:physics%model%dfi_radar_max_intervals), &
                  num_dfi_radar=physics%model%num_dfi_radar,cap_suppress=cap_suppress_25_ptr_array(cdata%thrd_no)%p, &
                  maxupmf=maxupmf_26_ptr_array(cdata%thrd_no)%p,maxmf=maxmf_27_ptr_array(cdata%thrd_no)%p, &
                  do_mynnedmf=physics%model%do_mynnedmf,gf_coldstart=physics%model%gf_coldstart, &
                  ichoice_in=physics%model%ichoice,ichoicem_in=physics%model%ichoicem,ichoice_s_in=physics%model%ichoice_s, &
                  spp_wts_cu_deep=spp_wts_cu_deep_28_ptr_array(cdata%thrd_no)%p,spp_cu_deep=physics%model%spp_cu_deep, &
                  nchem=physics%model%nchem,chem3d=chem3d_20_ptr_array(cdata%thrd_no)%p,fscav=physics%model%smoke_conv_wet_coef(one:3), &
                  do_smoke_transport=physics%model%do_smoke_transport,wetdpc_deep=wetdpc_deep_29_ptr_array(cdata%thrd_no)%p, &
                  kdt=physics%model%kdt,ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dcliw=physics%interstitial(cdata%thrd_no)%dclw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,1), &
                  dclcw=physics%interstitial(cdata%thrd_no)%dclw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,2), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(cactiv_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(cactiv_m_17_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke)) then
        nullify(forcet_14_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke)) then
        nullify(forceq_15_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(aod_gf_21_ptr_array(cdata%thrd_no)%p)
      end if

      if (( physics%model%imfdeepcnv .ge. 0 .or. physics%model%imfshalcnv .ge. 0 )) then
        nullify(ud_mf_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_23_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(qci_conv_24_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%num_dfi_radar>0 .and. physics%model%do_cap_suppress)) then
        nullify(cap_suppress_25_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(maxupmf_26_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(maxmf_27_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_spp)) then
        nullify(spp_wts_cu_deep_28_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(chem3d_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(wetdpc_deep_29_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in cu_gf_driver_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if (( physics%model%imfdeepcnv .ge. 0 .or. physics%model%imfshalcnv .ge. 0 )) then
        ud_mf_22_ptr_array(cdata%thrd_no)%p => physics%tbd%ud_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_23_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%ldiag3d .and. physics%model%qdiag3d)) then
        upd_mf_30_ptr_array(cdata%thrd_no)%p => physics%diag%upd_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%qdiag3d)) then
        dwn_mf_31_ptr_array(cdata%thrd_no)%p => physics%diag%dwn_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d .and. physics%model%qdiag3d)) then
        det_mf_32_ptr_array(cdata%thrd_no)%p => physics%diag%det_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ncnvw > 0)) then
        cnvw_phy_f3d_33_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ncnvw)
      end if

      if ((physics%model%ncnvc > 0)) then
        cnvc_phy_f3d_34_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ncnvc)
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
                  ud_mf=ud_mf_22_ptr_array(cdata%thrd_no)%p,dd_mf=physics%interstitial(cdata%thrd_no)%dd_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dt_mf=physics%interstitial(cdata%thrd_no)%dt_mf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtend=dtend_23_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_process_dcnv=physics%model%index_of_process_dcnv,index_of_temperature=physics%model%index_of_temperature, &
                  index_of_x_wind=physics%model%index_of_x_wind,index_of_y_wind=physics%model%index_of_y_wind, &
                  ntqv=physics%model%ntqv,nqvtag=physics%model%nqvtag,gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  delt=physics%model%dtp,con_g=con_g,npdf3d=physics%model%npdf3d,num_p3d=physics%model%num_p3d, &
                  ncnvcld3d=physics%model%ncnvcld3d,nsamftrac=physics%interstitial(cdata%thrd_no)%nsamftrac, &
                  rainc=physics%diag%rainc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cldwrk=physics%diag%cldwrk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  upd_mf=upd_mf_30_ptr_array(cdata%thrd_no)%p,dwn_mf=dwn_mf_31_ptr_array(cdata%thrd_no)%p, &
                  det_mf=det_mf_32_ptr_array(cdata%thrd_no)%p,cnvw=physics%cldprop%cnvw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  cnvc=physics%interstitial(cdata%thrd_no)%cnvc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  cnvw_phy_f3d=cnvw_phy_f3d_33_ptr_array(cdata%thrd_no)%p,cnvc_phy_f3d=cnvc_phy_f3d_34_ptr_array(cdata%thrd_no)%p, &
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
        nullify(ud_mf_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_23_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%qdiag3d)) then
        nullify(upd_mf_30_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%qdiag3d)) then
        nullify(dwn_mf_31_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d .and. physics%model%qdiag3d)) then
        nullify(det_mf_32_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ncnvw > 0)) then
        nullify(cnvw_phy_f3d_33_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ncnvc > 0)) then
        nullify(cnvc_phy_f3d_34_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_dcnv_generic_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ntwa > 0)) then
        nwfa_35_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntwa)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_23_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
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
                  con_rd=con_rd,con_eps=con_eps,nssl_cccn=physics%model%nssl_cccn,nwfa=nwfa_35_ptr_array(cdata%thrd_no)%p, &
                  spechum=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  dtend=dtend_23_ptr_array(cdata%thrd_no)%p,ntk=physics%interstitial(cdata%thrd_no)%ntk, &
                  ntke=physics%model%ntke,ldiag3d=physics%model%ldiag3d,qdiag3d=physics%model%qdiag3d, &
                  index_of_process_conv_trans=physics%model%index_of_process_conv_trans,index_of_process_dcnv=physics%model%index_of_process_dcnv, &
                  index_of_process_scnv=physics%model%index_of_process_scnv,otsptflag=physics%interstitial(cdata%thrd_no)%otsptflag(one:physics%model%ntrac), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ntwa > 0)) then
        nullify(nwfa_35_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_23_ptr_array(cdata%thrd_no)%p)
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

    
      

      if ((physics%model%ntlnc > 0)) then
        nc_36_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntlnc)
      end if

      if ((physics%model%ntwa > 0)) then
        nwfa_35_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntwa)
      end if

      if ((physics%model%ntia > 0)) then
        nifa_37_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntia)
      end if

      if (((physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_tempo) .and. (physics%model%ltaerosol .or. physics%model%mraerosol))) then
        nwfa2d_38_ptr_array(cdata%thrd_no)%p => physics%coupling%nwfa2d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if (((physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_tempo) .and. (physics%model%ltaerosol .or. physics%model%mraerosol))) then
        nifa2d_39_ptr_array(cdata%thrd_no)%p => physics%coupling%nifa2d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        rain_40_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%rainmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        graupel_41_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%graupelmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        ice_42_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%icemp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        snow_43_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%snowmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%ext_diag_thompson)) then
        diag3d_44_ptr_array(cdata%thrd_no)%p => physics%diag%thompson_ext_diag3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%thompson_ext_ndiag3d)
      end if

      if ((physics%model%do_spp)) then
        spp_wts_mp_45_ptr_array(cdata%thrd_no)%p => physics%coupling%spp_wts_mp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_spp)) then
        spp_prt_list_46_ptr_array(cdata%thrd_no)%p => physics%model%spp_prt_list(one:physics%model%n_var_spp)
      end if

      if ((physics%model%do_spp)) then
        spp_stddev_cutoff_47_ptr_array(cdata%thrd_no)%p => physics%model%spp_stddev_cutoff(one:physics%model%n_var_spp)
      end if

      if ((physics%model%do_spp)) then
        spp_var_list_48_ptr_array(cdata%thrd_no)%p => physics%model%spp_var_list(:)
      end if

      if ((physics%model%cplchm)) then
        pfi_lsan_49_ptr_array(cdata%thrd_no)%p => physics%coupling%pfi_lsan(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%cplchm)) then
        pfl_lsan_50_ptr_array(cdata%thrd_no)%p => physics%coupling%pfl_lsan(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ntsw > 0)) then
        dqs_51_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsw)
      end if

      if ((physics%model%ntgl > 0)) then
        dqg_52_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgl)
      end if

      if ((physics%model%ntinc > 0)) then
        dni_53_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntinc)
      end if

      if ((physics%model%ntrnc > 0)) then
        dnr_54_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntrnc)
      end if

      if ((physics%model%ntlnc > 0)) then
        dnc_55_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntlnc)
      end if

      if ((physics%model%ntwa > 0)) then
        dnwfa_56_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntwa)
      end if

      if ((physics%model%ntia > 0)) then
        dnifa_57_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntia)
      end if

      call mp_thompson_run(ncol=physics%model%blksz(cdata%blk_no),nlev=physics%model%levs,con_g=con_g, &
                  con_rd=con_rd,con_eps=con_eps,convert_dry_rho=physics%model%convert_dry_rho, &
                  spechum=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  qc=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntcw), &
                  qr=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntrw), &
                  qi=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  qs=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsw), &
                  qg=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgl), &
                  ni=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntinc), &
                  nr=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntrnc), &
                  is_aerosol_aware=physics%model%ltaerosol,merra2_aerosol_aware=physics%model%mraerosol, &
                  nc=nc_36_ptr_array(cdata%thrd_no)%p,nwfa=nwfa_35_ptr_array(cdata%thrd_no)%p, &
                  nifa=nifa_37_ptr_array(cdata%thrd_no)%p,nwfa2d=nwfa2d_38_ptr_array(cdata%thrd_no)%p, &
                  nifa2d=nifa2d_39_ptr_array(cdata%thrd_no)%p,aero_ind_fdb=physics%model%aero_ind_fdb, &
                  tgrs=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  omega=physics%statein%vvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  sedi_semi=physics%model%sedi_semi,decfl=physics%model%decfl,islmsk=physics%interstitial(cdata%thrd_no)%islmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtp=physics%model%dtp,dt_inner=physics%model%dt_inner,first_time_step=physics%model%first_time_step, &
                  istep=cdata%loop_cnt,nsteps=cdata%loop_max,prcp=physics%interstitial(cdata%thrd_no)%prcpmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rain=rain_40_ptr_array(cdata%thrd_no)%p,graupel=graupel_41_ptr_array(cdata%thrd_no)%p, &
                  ice=ice_42_ptr_array(cdata%thrd_no)%p,snow=snow_43_ptr_array(cdata%thrd_no)%p, &
                  sr=physics%diag%sr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  refl_10cm=physics%diag%refl_10cm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  max_hail_diam_sfc=physics%diag%max_hail_diam_sfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fullradar_diag=physics%interstitial(cdata%thrd_no)%fullradar_diag,do_radar_ref=physics%model%lradar, &
                  aerfld=physics%tbd%aer_nm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrcaer), &
                  mpicomm=physics%model%communicator,mpirank=physics%model%me,mpiroot=physics%model%master, &
                  blkno=cdata%blk_no,ext_diag=physics%model%ext_diag_thompson,diag3d=diag3d_44_ptr_array(cdata%thrd_no)%p, &
                  reset_diag3d=physics%interstitial(cdata%thrd_no)%ext_diag_thompson_reset, &
                  spp_wts_mp=spp_wts_mp_45_ptr_array(cdata%thrd_no)%p,spp_mp=physics%model%spp_mp, &
                  n_var_spp=physics%model%n_var_spp,spp_prt_list=spp_prt_list_46_ptr_array(cdata%thrd_no)%p, &
                  spp_stddev_cutoff=spp_stddev_cutoff_47_ptr_array(cdata%thrd_no)%p,spp_var_list=spp_var_list_48_ptr_array(cdata%thrd_no)%p, &
                  cplchm=physics%model%cplchm,pfi_lsan=pfi_lsan_49_ptr_array(cdata%thrd_no)%p, &
                  pfl_lsan=pfl_lsan_50_ptr_array(cdata%thrd_no)%p,is_initialized=physics%model%thompson_mp_is_init, &
                  fs_fac_rain=physics%model%fs_fac_rain,fs_fac_snow=physics%model%fs_fac_snow, &
                  ten_q=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  dspechum=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  dqc=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntcw), &
                  dqr=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntrw), &
                  dqi=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  dqs=dqs_51_ptr_array(cdata%thrd_no)%p,dqg=dqg_52_ptr_array(cdata%thrd_no)%p, &
                  dni=dni_53_ptr_array(cdata%thrd_no)%p,dnr=dnr_54_ptr_array(cdata%thrd_no)%p, &
                  dnc=dnc_55_ptr_array(cdata%thrd_no)%p,dnwfa=dnwfa_56_ptr_array(cdata%thrd_no)%p, &
                  dnifa=dnifa_57_ptr_array(cdata%thrd_no)%p,dtgrs=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ntlnc > 0)) then
        nullify(nc_36_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntwa > 0)) then
        nullify(nwfa_35_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntia > 0)) then
        nullify(nifa_37_ptr_array(cdata%thrd_no)%p)
      end if

      if (((physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_tempo) .and. (physics%model%ltaerosol .or. physics%model%mraerosol))) then
        nullify(nwfa2d_38_ptr_array(cdata%thrd_no)%p)
      end if

      if (((physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_tempo) .and. (physics%model%ltaerosol .or. physics%model%mraerosol))) then
        nullify(nifa2d_39_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(rain_40_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(graupel_41_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(ice_42_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(snow_43_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ext_diag_thompson)) then
        nullify(diag3d_44_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_spp)) then
        nullify(spp_wts_mp_45_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_spp)) then
        nullify(spp_prt_list_46_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_spp)) then
        nullify(spp_stddev_cutoff_47_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_spp)) then
        nullify(spp_var_list_48_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplchm)) then
        nullify(pfi_lsan_49_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplchm)) then
        nullify(pfl_lsan_50_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntsw > 0)) then
        nullify(dqs_51_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntgl > 0)) then
        nullify(dqg_52_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntinc > 0)) then
        nullify(dni_53_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntrnc > 0)) then
        nullify(dnr_54_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntlnc > 0)) then
        nullify(dnc_55_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntwa > 0)) then
        nullify(dnwfa_56_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntia > 0)) then
        nullify(dnifa_57_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in mp_thompson_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call mp_thompson_post_run(ncol=physics%model%blksz(cdata%blk_no),nlev=physics%model%levs,dtgrs=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tgrs=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prslk=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtp=physics%model%dtp,ttendlim=physics%model%ttendlim,kdt=physics%model%kdt, &
                  mpicomm=physics%model%communicator,mpirank=physics%model%me,mpiroot=physics%model%master, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in mp_thompson_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        rain_40_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%rainmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        ice_42_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%icemp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        snow_43_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%snowmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        graupel_41_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%graupelmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%do_sppt .or. physics%model%cplchm .or. physics%model%ca_global .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        rain_cpl_58_ptr_array(cdata%thrd_no)%p => physics%coupling%rain_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        rainc_cpl_59_ptr_array(cdata%thrd_no)%p => physics%coupling%rainc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%do_sppt .or. physics%model%cplchm .or. physics%model%ca_global .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        snow_cpl_60_ptr_array(cdata%thrd_no)%p => physics%coupling%snow_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        drain_cpl_61_ptr_array(cdata%thrd_no)%p => physics%tbd%drain_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        dsnow_cpl_62_ptr_array(cdata%thrd_no)%p => physics%tbd%dsnow_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        raincprv_63_ptr_array(cdata%thrd_no)%p => physics%sfcprop%raincprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        rainncprv_64_ptr_array(cdata%thrd_no)%p => physics%sfcprop%rainncprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        iceprv_65_ptr_array(cdata%thrd_no)%p => physics%sfcprop%iceprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        snowprv_66_ptr_array(cdata%thrd_no)%p => physics%sfcprop%snowprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        graupelprv_67_ptr_array(cdata%thrd_no)%p => physics%sfcprop%graupelprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        draincprv_68_ptr_array(cdata%thrd_no)%p => physics%sfcprop%draincprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        drainncprv_69_ptr_array(cdata%thrd_no)%p => physics%sfcprop%drainncprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        diceprv_70_ptr_array(cdata%thrd_no)%p => physics%sfcprop%diceprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        dsnowprv_71_ptr_array(cdata%thrd_no)%p => physics%sfcprop%dsnowprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        dgraupelprv_72_ptr_array(cdata%thrd_no)%p => physics%sfcprop%dgraupelprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%num_dfi_radar>0)) then
        dfi_radar_tten_73_ptr_array(cdata%thrd_no)%p => physics%tbd%dfi_radar_tten(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%num_dfi_radar)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_23_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%progsigma)) then
        qmicro_9_ptr_array(cdata%thrd_no)%p => physics%coupling%dqdt_qmicro(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        prevsq_13_ptr_array(cdata%thrd_no)%p => physics%tbd%prevsq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
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
                  exticeden=physics%model%exticeden,rain0=rain_40_ptr_array(cdata%thrd_no)%p, &
                  ice0=ice_42_ptr_array(cdata%thrd_no)%p,snow0=snow_43_ptr_array(cdata%thrd_no)%p, &
                  graupel0=graupel_41_ptr_array(cdata%thrd_no)%p,del=physics%interstitial(cdata%thrd_no)%del(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
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
                  rain_cpl=rain_cpl_58_ptr_array(cdata%thrd_no)%p,rainc_cpl=rainc_cpl_59_ptr_array(cdata%thrd_no)%p, &
                  snow_cpl=snow_cpl_60_ptr_array(cdata%thrd_no)%p,pwat=physics%diag%pwat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  drain_cpl=drain_cpl_61_ptr_array(cdata%thrd_no)%p,dsnow_cpl=dsnow_cpl_62_ptr_array(cdata%thrd_no)%p, &
                  lsm=physics%model%lsm,lsm_ruc=physics%model%lsm_ruc,lsm_noahmp=physics%model%lsm_noahmp, &
                  raincprv=raincprv_63_ptr_array(cdata%thrd_no)%p,rainncprv=rainncprv_64_ptr_array(cdata%thrd_no)%p, &
                  iceprv=iceprv_65_ptr_array(cdata%thrd_no)%p,snowprv=snowprv_66_ptr_array(cdata%thrd_no)%p, &
                  graupelprv=graupelprv_67_ptr_array(cdata%thrd_no)%p,draincprv=draincprv_68_ptr_array(cdata%thrd_no)%p, &
                  drainncprv=drainncprv_69_ptr_array(cdata%thrd_no)%p,diceprv=diceprv_70_ptr_array(cdata%thrd_no)%p, &
                  dsnowprv=dsnowprv_71_ptr_array(cdata%thrd_no)%p,dgraupelprv=dgraupelprv_72_ptr_array(cdata%thrd_no)%p, &
                  dtp=physics%model%dtp,num_diag_buckets=physics%model%n_diag_buckets,num_dfi_radar=physics%model%num_dfi_radar, &
                  fh_dfi_radar=physics%model%fh_dfi_radar(one:physics%model%dfi_radar_max_intervals_plus_one), &
                  ix_dfi_radar=physics%model%ix_dfi_radar(one:physics%model%dfi_radar_max_intervals), &
                  dfi_radar_tten=dfi_radar_tten_73_ptr_array(cdata%thrd_no)%p,fhour=physics%model%fhour, &
                  radar_tten_limits=physics%model%radar_tten_limits(one:2),index_of_process_dfi_radar=physics%model%index_of_process_dfi_radar, &
                  dtend=dtend_23_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_temperature=physics%model%index_of_temperature,index_of_process_mp=physics%model%index_of_process_mp, &
                  ldiag3d=physics%model%ldiag3d,qdiag3d=physics%model%qdiag3d,dqdt_qmicro=qmicro_9_ptr_array(cdata%thrd_no)%p, &
                  prevsq=prevsq_13_ptr_array(cdata%thrd_no)%p,lssav=physics%model%lssav,lkm=physics%model%lkm, &
                  iopt_lake=physics%model%iopt_lake,iopt_lake_clm=physics%model%iopt_lake_clm, &
                  use_lake_model=physics%sfcprop%use_lake_model(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(rain_40_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(ice_42_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(snow_43_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imp_physics == physics%model%imp_physics_gfdl .or. physics%model%imp_physics == physics%model%imp_physics_thompson .or. physics%model%imp_physics == physics%model%imp_physics_nssl .or. physics%model%imp_physics == physics%model%imp_physics_tempo)) then
        nullify(graupel_41_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%do_sppt .or. physics%model%cplchm .or. physics%model%ca_global .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        nullify(rain_cpl_58_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        nullify(rainc_cpl_59_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%do_sppt .or. physics%model%cplchm .or. physics%model%ca_global .or. physics%model%cpllnd .or. physics%model%cpl_fire)) then
        nullify(snow_cpl_60_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        nullify(drain_cpl_61_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        nullify(dsnow_cpl_62_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        nullify(raincprv_63_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp .or. ( physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm) )) then
        nullify(rainncprv_64_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(iceprv_65_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(snowprv_66_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(graupelprv_67_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(draincprv_68_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(drainncprv_69_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(diceprv_70_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(dsnowprv_71_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(dgraupelprv_72_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%num_dfi_radar>0)) then
        nullify(dfi_radar_tten_73_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_23_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%progsigma)) then
        nullify(qmicro_9_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        nullify(prevsq_13_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_mp_generic_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke)) then
        prevst_12_ptr_array(cdata%thrd_no)%p => physics%tbd%prevst(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        prevsq_13_ptr_array(cdata%thrd_no)%p => physics%tbd%prevsq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        cactiv_16_ptr_array(cdata%thrd_no)%p => physics%tbd%cactiv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        cactiv_m_17_ptr_array(cdata%thrd_no)%p => physics%tbd%cactiv_m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        conv_act_18_ptr_array(cdata%thrd_no)%p => physics%sfcprop%conv_act(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        conv_act_m_19_ptr_array(cdata%thrd_no)%p => physics%sfcprop%conv_act_m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%rrfs_sd)) then
        chem3d_20_ptr_array(cdata%thrd_no)%p => physics%coupling%chem3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nchem)
      end if

      call cu_gf_driver_post_run(im=physics%model%blksz(cdata%blk_no),km=physics%model%levs,t=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  q=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  prevst=prevst_12_ptr_array(cdata%thrd_no)%p,prevsq=prevsq_13_ptr_array(cdata%thrd_no)%p, &
                  cactiv=cactiv_16_ptr_array(cdata%thrd_no)%p,cactiv_m=cactiv_m_17_ptr_array(cdata%thrd_no)%p, &
                  conv_act=conv_act_18_ptr_array(cdata%thrd_no)%p,conv_act_m=conv_act_m_19_ptr_array(cdata%thrd_no)%p, &
                  ntsmoke=physics%model%ntsmoke,ntdust=physics%model%ntdust,ntcoarsepm=physics%model%ntcoarsepm, &
                  errmsg=cdata%errmsg,chem3d=chem3d_20_ptr_array(cdata%thrd_no)%p,gq0=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  errflg=cdata%errflg)


      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke)) then
        nullify(prevst_12_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3 .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_ntiedtke .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_samf .or. physics%model%imfshalcnv == physics%model%imfshalcnv_c3)) then
        nullify(prevsq_13_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(cactiv_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(cactiv_m_17_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(conv_act_18_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(conv_act_m_19_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%rrfs_sd)) then
        nullify(chem3d_20_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in cu_gf_driver_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lightning_threat)) then
        wgrs_74_ptr_array(cdata%thrd_no)%p => physics%statein%wgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%lightning_threat)) then
        ltg1_max_75_ptr_array(cdata%thrd_no)%p => physics%diag%ltg1_max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lightning_threat)) then
        ltg2_max_76_ptr_array(cdata%thrd_no)%p => physics%diag%ltg2_max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lightning_threat)) then
        ltg3_max_77_ptr_array(cdata%thrd_no)%p => physics%diag%ltg3_max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
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
                  wgrs=wgrs_74_ptr_array(cdata%thrd_no)%p,qgraupel=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgl), &
                  qsnowwat=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsw), &
                  qicewat=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  con_rd=con_rd,tgrs=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  lightning_threat=physics%model%lightning_threat,ltg1_max=ltg1_max_75_ptr_array(cdata%thrd_no)%p, &
                  ltg2_max=ltg2_max_76_ptr_array(cdata%thrd_no)%p,ltg3_max=ltg3_max_77_ptr_array(cdata%thrd_no)%p, &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  kdt=physics%model%kdt,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lightning_threat)) then
        nullify(wgrs_74_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lightning_threat)) then
        nullify(ltg1_max_75_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lightning_threat)) then
        nullify(ltg2_max_76_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lightning_threat)) then
        nullify(ltg3_max_77_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in maximum_hourly_diagnostics_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ldiag3d)) then
        dtend_23_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
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

      call gfs_physics_post_run(ncol=physics%model%blksz(cdata%blk_no),nlev=physics%model%levs,dtend=dtend_23_ptr_array(cdata%thrd_no)%p, &
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
        nullify(dtend_23_ptr_array(cdata%thrd_no)%p)
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

    



   end function scm_hrrr_gf_ps_phys_ts_run_cap

   function scm_hrrr_gf_ps_phys_ts_final_cap(one,physics,cdata) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t

      implicit none

      ! Error handling
      integer :: ierr

      integer, intent(in), target :: one
      type(physics_type), intent(inout), target :: physics
      type(ccpp_t), intent(inout), target :: cdata

      ierr = 0


      if (.not.initialized(cdata%ccpp_instance)) return



      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      


      call mp_thompson_finalize(is_initialized=physics%model%thompson_mp_is_init,errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in mp_thompson_finalize: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call mp_thompson_post_finalize(errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in mp_thompson_post_finalize: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized = .false.


   end function scm_hrrr_gf_ps_phys_ts_final_cap

end module ccpp_scm_hrrr_gf_ps_phys_ts_cap
