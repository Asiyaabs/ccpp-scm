
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
!! @brief Auto-generated cap module for the CCPP radiation group
!!
!
module ccpp_scm_gfs_v16_rrtmgp_radiation_cap

   use gfs_rrtmgp_pre, only: gfs_rrtmgp_pre_init
   use gfs_radiation_surface, only: gfs_radiation_surface_init
   use rrtmgp_sw_main, only: rrtmgp_sw_main_init
   use rrtmgp_lw_main, only: rrtmgp_lw_main_init
   use gfs_rrtmgp_pre, only: gfs_rrtmgp_pre_run
   use gfs_radiation_surface, only: gfs_radiation_surface_run
   use gfs_rrtmgp_cloud_mp, only: gfs_rrtmgp_cloud_mp_run
   use gfs_rrtmgp_cloud_overlap, only: gfs_rrtmgp_cloud_overlap_run
   use gfs_cloud_diagnostics, only: gfs_cloud_diagnostics_run
   use rrtmgp_aerosol_optics, only: rrtmgp_aerosol_optics_run
   use rrtmgp_sw_main, only: rrtmgp_sw_main_run
   use rrtmgp_lw_main, only: rrtmgp_lw_main_run
   use gfs_radiation_post, only: gfs_radiation_post_run


   implicit none

   private
   public :: scm_gfs_v16_rrtmgp_radiation_tsinit_cap, &
             scm_gfs_v16_rrtmgp_radiation_tsfinal_cap, &
             scm_gfs_v16_rrtmgp_radiation_init_cap, &
             scm_gfs_v16_rrtmgp_radiation_run_cap, &
             scm_gfs_v16_rrtmgp_radiation_final_cap

   logical, dimension(200), save :: initialized = .false.

   contains

   function scm_gfs_v16_rrtmgp_radiation_tsinit_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_gfs_v16_rrtmgp_radiation_tsinit_cap

   function scm_gfs_v16_rrtmgp_radiation_tsfinal_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_gfs_v16_rrtmgp_radiation_tsfinal_cap

   function scm_gfs_v16_rrtmgp_radiation_init_cap(one,physics,cdata,con_pi) result(ierr)

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
      
      ! Local variables/pointers for unit conversions, array transformations, ...
      type :: character_len128_r1_ptr_arr_type
         character(len=128), dimension(:), pointer :: p => null()
      end type character_len128_r1_ptr_arr_type
      type(character_len128_r1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: active_gases_array_1_ptr_array

      ierr = 0


      if (initialized(cdata%ccpp_instance)) return



      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      

      if ((physics%model%do_rrtmgp)) then
        active_gases_array_1_ptr_array(cdata%thrd_no)%p => physics%model%active_gases_array(:)
      end if

      call gfs_rrtmgp_pre_init(ngases=physics%model%ngases,active_gases=physics%model%active_gases,active_gases_array=active_gases_array_1_ptr_array(cdata%thrd_no)%p, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%do_rrtmgp)) then
        nullify(active_gases_array_1_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_rrtmgp_pre_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call gfs_radiation_surface_init(mpicomm=physics%model%communicator,mpirank=physics%model%me,mpiroot=physics%model%master, &
                  ialb=physics%model%ialb,iems=physics%model%iems,semis_file=physics%model%semis_file, &
                  con_pi=con_pi,errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_radiation_surface_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%do_rrtmgp)) then
        active_gases_array_1_ptr_array(cdata%thrd_no)%p => physics%model%active_gases_array(:)
      end if

      call rrtmgp_sw_main_init(rrtmgp_root_dir=physics%model%rrtmgp_root,rrtmgp_sw_file_gas=physics%model%sw_file_gas, &
                  rrtmgp_sw_file_clouds=physics%model%sw_file_clouds,nrghice=physics%model%rrtmgp_nrghice, &
                  rrtmgp_phys_blksz=physics%model%rrtmgp_sw_phys_blksz,nlay=physics%model%levs, &
                  mpirank=physics%model%me,mpiroot=physics%model%master,mpicomm=physics%model%communicator, &
                  active_gases_array=active_gases_array_1_ptr_array(cdata%thrd_no)%p,errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)


      if ((physics%model%do_rrtmgp)) then
        nullify(active_gases_array_1_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrtmgp_sw_main_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%do_rrtmgp)) then
        active_gases_array_1_ptr_array(cdata%thrd_no)%p => physics%model%active_gases_array(:)
      end if

      call rrtmgp_lw_main_init(rrtmgp_root_dir=physics%model%rrtmgp_root,rrtmgp_lw_file_gas=physics%model%lw_file_gas, &
                  rrtmgp_lw_file_clouds=physics%model%lw_file_clouds,nrghice=physics%model%rrtmgp_nrghice, &
                  mpirank=physics%model%me,mpiroot=physics%model%master,mpicomm=physics%model%communicator, &
                  rrtmgp_phys_blksz=physics%model%rrtmgp_lw_phys_blksz,nlay=physics%model%levs, &
                  active_gases_array=active_gases_array_1_ptr_array(cdata%thrd_no)%p,errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)


      if ((physics%model%do_rrtmgp)) then
        nullify(active_gases_array_1_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrtmgp_lw_main_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized(cdata%ccpp_instance) = .true.


   end function scm_gfs_v16_rrtmgp_radiation_init_cap

   function scm_gfs_v16_rrtmgp_radiation_run_cap(one,physics,cdata,con_g,con_rd,con_eps,con_epsm1,con_fvirt,con_epsqs,con_pi, &
                  con_ttp,con_epsq) result(ierr)

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
      real(kind_phys), intent(in), target :: con_eps
      real(kind_phys), intent(in), target :: con_epsm1
      real(kind_phys), intent(in), target :: con_fvirt
      real(kind_phys), intent(in), target :: con_epsqs
      real(kind_phys), intent(in), target :: con_pi
      real(kind_phys), intent(in), target :: con_ttp
      real(kind_phys), intent(in), target :: con_epsq
      
      ! Local variables/pointers for unit conversions, array transformations, ...
      type :: real_kind_phys_rank2_ptr_arr_type
         real(kind_phys), dimension(:,:), pointer :: p => null()
      end type real_kind_phys_rank2_ptr_arr_type
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: p_lay_1_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: p_lev_2_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: t_lay_3_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: t_lev_4_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: deltaz_5_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: deltazc_6_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: deltap_7_ptr_array
      type :: real_kind_phys_rank1_ptr_arr_type
         real(kind_phys), dimension(:), pointer :: p => null()
      end type real_kind_phys_rank1_ptr_arr_type
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tsfc_radtime_8_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: q_lay_9_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: vmr_o2_10_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: vmr_h2o_11_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: vmr_o3_12_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: vmr_ch4_13_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: vmr_n2o_14_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: vmr_co2_15_ptr_array
      type :: character_len128_r1_ptr_arr_type
         character(len=128), dimension(:), pointer :: p => null()
      end type character_len128_r1_ptr_arr_type
      type(character_len128_r1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: active_gases_array_16_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sfc_emiss_byband_17_ptr_array
      type :: character_len3_r1_ptr_arr_type
         character(len=3), dimension(:), pointer :: p => null()
      end type character_len3_r1_ptr_arr_type
      type(character_len3_r1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lndp_var_list_18_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lndp_prt_list_19_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albdvis_ice_20_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albdnir_ice_21_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albivis_ice_22_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albinir_ice_23_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: effrin_cldliq_24_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: effrin_cldice_25_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: effrin_cldrain_26_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: effrin_cldsnow_27_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cld_cnv_frac_28_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qci_conv_29_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qc_mynn_30_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qi_mynn_31_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: precip_frac_32_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cld_cnv_lwp_33_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cld_cnv_iwp_34_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cld_cnv_reliq_35_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cld_cnv_reice_36_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cld_pbl_frac_37_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cld_pbl_lwp_38_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cld_pbl_iwp_39_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cld_pbl_reliq_40_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cld_pbl_reice_41_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cloud_overlap_param_42_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: precip_overlap_param_43_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cnv_cloud_overlap_param_44_ptr_array
      type :: integer_default_kind_rank1_ptr_arr_type
         integer, dimension(:), pointer :: p => null()
      end type integer_default_kind_rank1_ptr_arr_type
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: icseed_sw_45_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxswup_allsky_46_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxswdown_allsky_47_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxswup_clrsky_48_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxswdown_clrsky_49_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: icseed_lw_50_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxlwup_radtime_51_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxlwdown_radtime_52_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxlwup_allsky_53_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxlwdown_allsky_54_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxlwup_clrsky_55_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxlwdown_clrsky_56_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxlwup_jac_57_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: htrlwu_58_ptr_array

      ierr = 0


      if (.not.initialized(cdata%ccpp_instance)) then
        write(cdata%errmsg,'(*(a))') 'radiation_run called before radiation_init'
        cdata%errflg = 1
        return
      end if



      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      

      if ((physics%model%do_rrtmgp)) then
        p_lay_1_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%p_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        p_lev_2_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%p_lev(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        t_lay_3_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%t_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        t_lev_4_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%t_lev(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        deltaz_5_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%deltaz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        deltazc_6_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%deltazc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        deltap_7_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%deltap(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        tsfc_radtime_8_ptr_array(cdata%thrd_no)%p => physics%coupling%tsfc_radtime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_rrtmgp)) then
        q_lay_9_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%q_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_o2_10_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_o2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_h2o_11_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_h2o(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_o3_12_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_o3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_ch4_13_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_ch4(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_n2o_14_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_n2o(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_co2_15_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_co2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        active_gases_array_16_ptr_array(cdata%thrd_no)%p => physics%model%active_gases_array(:)
      end if

      if ((physics%model%do_rrtmgp)) then
        sfc_emiss_byband_17_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%sfc_emiss_byband(one:physics%model%rrtmgp_nbandslw,physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call gfs_rrtmgp_pre_run(me=physics%model%me,ncol=physics%model%blksz(cdata%blk_no),nlev=physics%model%levs, &
                  doswrad=physics%model%lsswr,dolwrad=physics%model%lslwr,i_o3=physics%model%ntoz, &
                  fhswr=physics%model%fhswr,fhlwr=physics%model%fhlwr,xlat=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlon=physics%grid%xlon(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  coslat=physics%grid%coslat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sinlat=physics%grid%sinlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  solhr=physics%model%solhr,prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  prslk=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tgrs=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  qgrs=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  tsfc=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  con_g=con_g,con_rd=con_rd,con_eps=con_eps,con_epsm1=con_epsm1,con_fvirt=con_fvirt, &
                  con_epsqs=con_epsqs,con_pi=con_pi,ico2=physics%model%ico2,raddt=physics%interstitial(cdata%thrd_no)%raddt, &
                  p_lay=p_lay_1_ptr_array(cdata%thrd_no)%p,p_lev=p_lev_2_ptr_array(cdata%thrd_no)%p, &
                  t_lay=t_lay_3_ptr_array(cdata%thrd_no)%p,t_lev=t_lev_4_ptr_array(cdata%thrd_no)%p, &
                  deltaz=deltaz_5_ptr_array(cdata%thrd_no)%p,deltazc=deltazc_6_ptr_array(cdata%thrd_no)%p, &
                  deltap=deltap_7_ptr_array(cdata%thrd_no)%p,top_at_1=physics%model%top_at_1, &
                  isfc=physics%model%isfc,itoa=physics%model%itoa,tsfc_radtime=tsfc_radtime_8_ptr_array(cdata%thrd_no)%p, &
                  tsfg=physics%interstitial(cdata%thrd_no)%tsfg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfa=physics%interstitial(cdata%thrd_no)%tsfa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tv_lay=physics%interstitial(cdata%thrd_no)%tv_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  relhum=physics%interstitial(cdata%thrd_no)%relhum(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  qs_lay=physics%interstitial(cdata%thrd_no)%qs_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  q_lay=q_lay_9_ptr_array(cdata%thrd_no)%p,vmr_o2=vmr_o2_10_ptr_array(cdata%thrd_no)%p, &
                  vmr_h2o=vmr_h2o_11_ptr_array(cdata%thrd_no)%p,vmr_o3=vmr_o3_12_ptr_array(cdata%thrd_no)%p, &
                  vmr_ch4=vmr_ch4_13_ptr_array(cdata%thrd_no)%p,vmr_n2o=vmr_n2o_14_ptr_array(cdata%thrd_no)%p, &
                  vmr_co2=vmr_co2_15_ptr_array(cdata%thrd_no)%p,active_gases_array=active_gases_array_16_ptr_array(cdata%thrd_no)%p, &
                  coszdg=physics%radtend%coszdg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  coszen=physics%radtend%coszen(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  semis=physics%radtend%semis(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfc_emiss_byband=sfc_emiss_byband_17_ptr_array(cdata%thrd_no)%p,nday=physics%interstitial(cdata%thrd_no)%nday, &
                  idxday=physics%interstitial(cdata%thrd_no)%idxday(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ozphys=physics%model%ozphys,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%do_rrtmgp)) then
        nullify(p_lay_1_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(p_lev_2_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(t_lay_3_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(t_lev_4_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(deltaz_5_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(deltazc_6_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(deltap_7_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(tsfc_radtime_8_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(q_lay_9_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_o2_10_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_h2o_11_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_o3_12_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_ch4_13_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_n2o_14_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_co2_15_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(active_gases_array_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(sfc_emiss_byband_17_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_rrtmgp_pre_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lndp_type /= 0)) then
        lndp_var_list_18_ptr_array(cdata%thrd_no)%p => physics%model%lndp_var_list(:)
      end if

      if ((physics%model%lndp_type /= 0)) then
        lndp_prt_list_19_ptr_array(cdata%thrd_no)%p => physics%model%lndp_prt_list(one:physics%model%n_var_lndp)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albdvis_ice_20_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdirvis_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albdnir_ice_21_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdirnir_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albivis_ice_22_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdifvis_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albinir_ice_23_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdifnir_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call gfs_radiation_surface_run(im=physics%model%blksz(cdata%blk_no),ialb=physics%model%ialb,frac_grid=physics%model%frac_grid, &
                  lslwr=physics%model%lslwr,lsswr=physics%model%lsswr,lsm=physics%model%lsm, &
                  lsm_noahmp=physics%model%lsm_noahmp,lsm_ruc=physics%model%lsm_ruc,xlat=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlon=physics%grid%xlon(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slmsk=physics%sfcprop%slmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lndp_type=physics%model%lndp_type,n_var_lndp=physics%model%n_var_lndp,sfc_alb_pert=physics%interstitial(cdata%thrd_no)%alb1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lndp_var_list=lndp_var_list_18_ptr_array(cdata%thrd_no)%p,lndp_prt_list=lndp_prt_list_19_ptr_array(cdata%thrd_no)%p, &
                  landfrac=physics%sfcprop%landfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snodl=physics%sfcprop%snodl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snodi=physics%sfcprop%snodi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sncovr=physics%sfcprop%sncovr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sncovr_ice=physics%sfcprop%sncovr_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fice=physics%sfcprop%fice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zorl=physics%sfcprop%zorl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hprime=physics%sfcprop%hprime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  tsfg=physics%interstitial(cdata%thrd_no)%tsfg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfa=physics%interstitial(cdata%thrd_no)%tsfa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tisfc=physics%sfcprop%tisfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  coszen=physics%radtend%coszen(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cplice=physics%model%cplice,min_seaice=physics%model%min_seaice,min_lakeice=physics%model%min_lakeice, &
                  lakefrac=physics%sfcprop%lakefrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_lake_model=physics%sfcprop%use_lake_model(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  alvsf=physics%sfcprop%alvsf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  alnsf=physics%sfcprop%alnsf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  alvwf=physics%sfcprop%alvwf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  alnwf=physics%sfcprop%alnwf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  facsf=physics%sfcprop%facsf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  facwf=physics%sfcprop%facwf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  semis_lnd=physics%sfcprop%emis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  semis_ice=physics%sfcprop%emis_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  semis_wat=physics%sfcprop%emis_wat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snoalb=physics%sfcprop%snoalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_cice_alb=physics%model%use_cice_alb,con_ttp=con_ttp,albdvis_lnd=physics%sfcprop%albdirvis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albdnir_lnd=physics%sfcprop%albdirnir_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albivis_lnd=physics%sfcprop%albdifvis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albinir_lnd=physics%sfcprop%albdifnir_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albdvis_ice=albdvis_ice_20_ptr_array(cdata%thrd_no)%p,albdnir_ice=albdnir_ice_21_ptr_array(cdata%thrd_no)%p, &
                  albivis_ice=albivis_ice_22_ptr_array(cdata%thrd_no)%p,albinir_ice=albinir_ice_23_ptr_array(cdata%thrd_no)%p, &
                  semisbase=physics%sfcprop%semisbase(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  semis=physics%radtend%semis(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcalb=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nf_albd), &
                  sfc_alb_dif=physics%radtend%sfalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lndp_type /= 0)) then
        nullify(lndp_var_list_18_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lndp_type /= 0)) then
        nullify(lndp_prt_list_19_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albdvis_ice_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albdnir_ice_21_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albivis_ice_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albinir_ice_23_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_radiation_surface_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%do_rrtmgp)) then
        p_lev_2_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%p_lev(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        p_lay_1_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%p_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        t_lay_3_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%t_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        q_lay_9_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%q_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%nleffr > 0)) then
        effrin_cldliq_24_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nleffr)
      end if

      if ((physics%model%nieffr > 0)) then
        effrin_cldice_25_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nieffr)
      end if

      if ((physics%model%nreffr > 0)) then
        effrin_cldrain_26_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nreffr)
      end if

      if ((physics%model%nseffr > 0)) then
        effrin_cldsnow_27_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nseffr)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_frac_28_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_frac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        qci_conv_29_ptr_array(cdata%thrd_no)%p => physics%coupling%qci_conv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        deltaz_5_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%deltaz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        deltazc_6_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%deltazc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        deltap_7_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%deltap(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        qc_mynn_30_ptr_array(cdata%thrd_no)%p => physics%tbd%qc_bl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        qi_mynn_31_ptr_array(cdata%thrd_no)%p => physics%tbd%qi_bl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        precip_frac_32_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%precip_frac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_lwp_33_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_lwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_iwp_34_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_iwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_reliq_35_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_reliq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_reice_36_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_reice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_mynnedmf)) then
        cld_pbl_frac_37_ptr_array(cdata%thrd_no)%p => physics%tbd%cldfra_bl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_pbl_lwp_38_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_pbl_lwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_pbl_iwp_39_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_pbl_iwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_pbl_reliq_40_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_pbl_reliq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_pbl_reice_41_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_pbl_reice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call gfs_rrtmgp_cloud_mp_run(ncol=physics%model%blksz(cdata%blk_no),nlev=physics%model%levs,ntracers=physics%model%ntrac, &
                  ncnd=physics%model%ncnd,icloud=physics%model%icloud,i_cldliq=physics%model%ntcw, &
                  i_cldice=physics%model%ntiw,i_cldrain=physics%model%ntrw,i_cldsnow=physics%model%ntsw, &
                  i_cldgrpl=physics%model%ntgl,i_cldtot=physics%model%ntclamt,i_cldliq_nc=physics%model%ntlnc, &
                  i_cldice_nc=physics%model%ntinc,i_twa=physics%model%ntwa,doswrad=physics%model%lsswr, &
                  dolwrad=physics%model%lslwr,effr_in=physics%model%effr_in,kdt=physics%model%kdt, &
                  imp_physics=physics%model%imp_physics,imp_physics_thompson=physics%model%imp_physics_thompson, &
                  imp_physics_gfdl=physics%model%imp_physics_gfdl,do_mynnedmf=physics%model%do_mynnedmf, &
                  uni_cld=physics%model%uni_cld,lmfdeep2=physics%model%lmfdeep2,lmfshal=physics%model%lmfshal, &
                  ltaerosol=physics%model%ltaerosol,mraerosol=physics%model%mraerosol,imfdeepcnv=physics%model%imfdeepcnv, &
                  imfdeepcnv_gf=physics%model%imfdeepcnv_gf,imfdeepcnv_samf=physics%model%imfdeepcnv_samf, &
                  lgfdlmprad=physics%model%lgfdlmprad,lsmask=physics%sfcprop%slmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlat=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlon=physics%grid%xlon(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dx=physics%grid%dx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  p_lev=p_lev_2_ptr_array(cdata%thrd_no)%p,p_lay=p_lay_1_ptr_array(cdata%thrd_no)%p, &
                  tv_lay=physics%interstitial(cdata%thrd_no)%tv_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  t_lay=t_lay_3_ptr_array(cdata%thrd_no)%p,qs_lay=physics%interstitial(cdata%thrd_no)%qs_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  q_lay=q_lay_9_ptr_array(cdata%thrd_no)%p,relhum=physics%interstitial(cdata%thrd_no)%relhum(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  effrin_cldliq=effrin_cldliq_24_ptr_array(cdata%thrd_no)%p,effrin_cldice=effrin_cldice_25_ptr_array(cdata%thrd_no)%p, &
                  effrin_cldrain=effrin_cldrain_26_ptr_array(cdata%thrd_no)%p,effrin_cldsnow=effrin_cldsnow_27_ptr_array(cdata%thrd_no)%p, &
                  tracer=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  cnv_mixratio=physics%cldprop%cnvw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  cld_cnv_frac=cld_cnv_frac_28_ptr_array(cdata%thrd_no)%p,qci_conv=qci_conv_29_ptr_array(cdata%thrd_no)%p, &
                  deltaz=deltaz_5_ptr_array(cdata%thrd_no)%p,deltazc=deltazc_6_ptr_array(cdata%thrd_no)%p, &
                  deltap=deltap_7_ptr_array(cdata%thrd_no)%p,qc_mynn=qc_mynn_30_ptr_array(cdata%thrd_no)%p, &
                  qi_mynn=qi_mynn_31_ptr_array(cdata%thrd_no)%p,con_g=con_g,con_rd=con_rd, &
                  con_eps=con_eps,con_ttp=con_ttp,dogp_smearclds=physics%model%dogp_smearclds, &
                  cld_frac=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,1), &
                  cld_lwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,2), &
                  cld_reliq=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,3), &
                  cld_iwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,4), &
                  cld_reice=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,5), &
                  cld_swp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,8), &
                  cld_resnow=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,9), &
                  cld_rwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,6), &
                  cld_rerain=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,7), &
                  precip_frac=precip_frac_32_ptr_array(cdata%thrd_no)%p,cld_cnv_lwp=cld_cnv_lwp_33_ptr_array(cdata%thrd_no)%p, &
                  cld_cnv_iwp=cld_cnv_iwp_34_ptr_array(cdata%thrd_no)%p,cld_cnv_reliq=cld_cnv_reliq_35_ptr_array(cdata%thrd_no)%p, &
                  cld_cnv_reice=cld_cnv_reice_36_ptr_array(cdata%thrd_no)%p,cld_pbl_frac=cld_pbl_frac_37_ptr_array(cdata%thrd_no)%p, &
                  cld_pbl_lwp=cld_pbl_lwp_38_ptr_array(cdata%thrd_no)%p,cld_pbl_iwp=cld_pbl_iwp_39_ptr_array(cdata%thrd_no)%p, &
                  cld_pbl_reliq=cld_pbl_reliq_40_ptr_array(cdata%thrd_no)%p,cld_pbl_reice=cld_pbl_reice_41_ptr_array(cdata%thrd_no)%p, &
                  lwp_ex=physics%diag%lwp_ex(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  iwp_ex=physics%diag%iwp_ex(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lwp_fc=physics%diag%lwp_fc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  iwp_fc=physics%diag%iwp_fc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cldfra2d=physics%diag%cldfra2d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%do_rrtmgp)) then
        nullify(p_lev_2_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(p_lay_1_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(t_lay_3_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(q_lay_9_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nleffr > 0)) then
        nullify(effrin_cldliq_24_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nieffr > 0)) then
        nullify(effrin_cldice_25_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nreffr > 0)) then
        nullify(effrin_cldrain_26_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nseffr > 0)) then
        nullify(effrin_cldsnow_27_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_frac_28_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(qci_conv_29_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(deltaz_5_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(deltazc_6_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(deltap_7_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(qc_mynn_30_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(qi_mynn_31_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(precip_frac_32_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_lwp_33_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_iwp_34_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_reliq_35_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_reice_36_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_mynnedmf)) then
        nullify(cld_pbl_frac_37_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_pbl_lwp_38_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_pbl_iwp_39_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_pbl_reliq_40_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_pbl_reice_41_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_rrtmgp_cloud_mp_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%do_rrtmgp)) then
        deltazc_6_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%deltazc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_frac_28_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_frac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cloud_overlap_param_42_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cloud_overlap_param(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        precip_overlap_param_43_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%precip_overlap_param(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cnv_cloud_overlap_param_44_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cnv_cloud_overlap_param(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call gfs_rrtmgp_cloud_overlap_run(ncol=physics%model%blksz(cdata%blk_no),nlev=physics%model%levs,yearlen=physics%model%yearlen, &
                  doswrad=physics%model%lsswr,dolwrad=physics%model%lslwr,julian=physics%model%julian, &
                  lat=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  deltazc=deltazc_6_ptr_array(cdata%thrd_no)%p,con_pi=con_pi,con_g=con_g, &
                  con_rd=con_rd,con_epsq=con_epsq,dcorr_con=physics%model%dcorr_con,idcor=physics%model%idcor, &
                  iovr=physics%model%iovr,iovr_convcld=physics%model%iovr_convcld,iovr_dcorr=physics%model%iovr_dcorr, &
                  iovr_exp=physics%model%iovr_exp,iovr_exprand=physics%model%iovr_exprand, &
                  idcor_con=physics%model%idcor_con,idcor_hogan=physics%model%idcor_hogan, &
                  idcor_oreopoulos=physics%model%idcor_oreopoulos,cld_frac=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,1), &
                  cld_cnv_frac=cld_cnv_frac_28_ptr_array(cdata%thrd_no)%p,top_at_1=physics%model%top_at_1, &
                  imfdeepcnv=physics%model%imfdeepcnv,imfdeepcnv_gf=physics%model%imfdeepcnv_gf, &
                  imfdeepcnv_samf=physics%model%imfdeepcnv_samf,de_lgth=physics%interstitial(cdata%thrd_no)%de_lgth(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cloud_overlap_param=cloud_overlap_param_42_ptr_array(cdata%thrd_no)%p,precip_overlap_param=precip_overlap_param_43_ptr_array(cdata%thrd_no)%p, &
                  cnv_cloud_overlap_param=cnv_cloud_overlap_param_44_ptr_array(cdata%thrd_no)%p, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%do_rrtmgp)) then
        nullify(deltazc_6_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_frac_28_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cloud_overlap_param_42_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(precip_overlap_param_43_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cnv_cloud_overlap_param_44_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_rrtmgp_cloud_overlap_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%do_rrtmgp)) then
        p_lay_1_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%p_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        p_lev_2_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%p_lev(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        deltaz_5_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%deltaz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cloud_overlap_param_42_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cloud_overlap_param(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        precip_overlap_param_43_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%precip_overlap_param(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call gfs_cloud_diagnostics_run(ncol=physics%model%blksz(cdata%blk_no),nlev=physics%model%levs,iovr=physics%model%iovr, &
                  iovr_rand=physics%model%iovr_rand,iovr_maxrand=physics%model%iovr_maxrand, &
                  iovr_max=physics%model%iovr_max,iovr_dcorr=physics%model%iovr_dcorr,iovr_exp=physics%model%iovr_exp, &
                  iovr_exprand=physics%model%iovr_exprand,lsswr=physics%model%lsswr,lslwr=physics%model%lslwr, &
                  lat=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  de_lgth=physics%interstitial(cdata%thrd_no)%de_lgth(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  p_lay=p_lay_1_ptr_array(cdata%thrd_no)%p,cld_frac=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,1), &
                  p_lev=p_lev_2_ptr_array(cdata%thrd_no)%p,deltaz=deltaz_5_ptr_array(cdata%thrd_no)%p, &
                  cloud_overlap_param=cloud_overlap_param_42_ptr_array(cdata%thrd_no)%p,precip_overlap_param=precip_overlap_param_43_ptr_array(cdata%thrd_no)%p, &
                  con_pi=con_pi,top_at_1=physics%model%top_at_1,si=physics%model%si(one:physics%model%levsp1), &
                  mtopa=physics%interstitial(cdata%thrd_no)%mtopa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:3), &
                  mbota=physics%interstitial(cdata%thrd_no)%mbota(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:3), &
                  cldsa=physics%interstitial(cdata%thrd_no)%cldsa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:5), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%do_rrtmgp)) then
        nullify(p_lay_1_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(p_lev_2_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(deltaz_5_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cloud_overlap_param_42_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(precip_overlap_param_43_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_cloud_diagnostics_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%do_rrtmgp)) then
        p_lev_2_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%p_lev(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        p_lay_1_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%p_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call rrtmgp_aerosol_optics_run(doswrad=physics%model%lsswr,dolwrad=physics%model%lslwr,top_at_1=physics%model%top_at_1, &
                  con_pi=con_pi,con_rd=con_rd,con_g=con_g,ncol=physics%model%blksz(cdata%blk_no), &
                  nlev=physics%model%levs,nday=physics%interstitial(cdata%thrd_no)%nday,idxday=physics%interstitial(cdata%thrd_no)%idxday(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  p_lev=p_lev_2_ptr_array(cdata%thrd_no)%p,p_lay=p_lay_1_ptr_array(cdata%thrd_no)%p, &
                  p_lk=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tv_lay=physics%interstitial(cdata%thrd_no)%tv_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  relhum=physics%interstitial(cdata%thrd_no)%relhum(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  lsmask=physics%sfcprop%slmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tracer=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  aerfld=physics%tbd%aer_nm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrcaer), &
                  lon=physics%grid%xlon(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lat=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  iaermdl=physics%model%iaermdl,iaerflg=physics%model%iaerflg,aerodp=physics%interstitial(cdata%thrd_no)%aerodp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nspc1), &
                  aersw_tau=physics%interstitial(cdata%thrd_no)%faersw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nbdsw,1), &
                  aersw_ssa=physics%interstitial(cdata%thrd_no)%faersw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nbdsw,2), &
                  aersw_g=physics%interstitial(cdata%thrd_no)%faersw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nbdsw,3), &
                  aerlw_tau=physics%interstitial(cdata%thrd_no)%faerlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nbdlw,1), &
                  aerlw_ssa=physics%interstitial(cdata%thrd_no)%faerlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nbdlw,2), &
                  aerlw_g=physics%interstitial(cdata%thrd_no)%faerlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nbdlw,3), &
                  ext550=physics%radtend%ext550(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%do_rrtmgp)) then
        nullify(p_lev_2_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(p_lay_1_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrtmgp_aerosol_optics_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2)) then
        icseed_sw_45_ptr_array(cdata%thrd_no)%p => physics%tbd%icsdsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_rrtmgp)) then
        p_lay_1_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%p_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        p_lev_2_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%p_lev(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        t_lay_3_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%t_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        t_lev_4_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%t_lev(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_o2_10_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_o2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_h2o_11_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_h2o(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_o3_12_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_o3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_ch4_13_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_ch4(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_n2o_14_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_n2o(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_co2_15_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_co2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        precip_frac_32_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%precip_frac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_lwp_33_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_lwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_iwp_34_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_iwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_reliq_35_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_reliq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_reice_36_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_reice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_pbl_lwp_38_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_pbl_lwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_pbl_iwp_39_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_pbl_iwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_pbl_reliq_40_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_pbl_reliq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_pbl_reice_41_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_pbl_reice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cloud_overlap_param_42_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cloud_overlap_param(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        active_gases_array_16_ptr_array(cdata%thrd_no)%p => physics%model%active_gases_array(:)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxswup_allsky_46_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxswup_allsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxswdown_allsky_47_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxswdown_allsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxswup_clrsky_48_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxswup_clrsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxswdown_clrsky_49_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxswdown_clrsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      call rrtmgp_sw_main_run(doswrad=physics%model%lsswr,doswclrsky=physics%model%swhtr,top_at_1=physics%model%top_at_1, &
                  isfc=physics%model%isfc,ncol=physics%model%blksz(cdata%blk_no),nlay=physics%model%levs, &
                  rrtmgp_phys_blksz=physics%model%rrtmgp_sw_phys_blksz,ngases=physics%model%ngases, &
                  nday=physics%interstitial(cdata%thrd_no)%nday,idx=physics%interstitial(cdata%thrd_no)%idxday(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  coszen=physics%radtend%coszen(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  isubc_sw=physics%model%isubc_sw,iovr=physics%model%iovr,iovr_maxrand=physics%model%iovr_maxrand, &
                  iovr_dcorr=physics%model%iovr_dcorr,iovr_exp=physics%model%iovr_exp,iovr_exprand=physics%model%iovr_exprand, &
                  iovr_rand=physics%model%iovr_rand,iovr_max=physics%model%iovr_max,iovr_convcld=physics%model%iovr_convcld, &
                  icseed_sw=icseed_sw_45_ptr_array(cdata%thrd_no)%p,p_lay=p_lay_1_ptr_array(cdata%thrd_no)%p, &
                  p_lev=p_lev_2_ptr_array(cdata%thrd_no)%p,t_lay=t_lay_3_ptr_array(cdata%thrd_no)%p, &
                  t_lev=t_lev_4_ptr_array(cdata%thrd_no)%p,vmr_o2=vmr_o2_10_ptr_array(cdata%thrd_no)%p, &
                  vmr_h2o=vmr_h2o_11_ptr_array(cdata%thrd_no)%p,vmr_o3=vmr_o3_12_ptr_array(cdata%thrd_no)%p, &
                  vmr_ch4=vmr_ch4_13_ptr_array(cdata%thrd_no)%p,vmr_n2o=vmr_n2o_14_ptr_array(cdata%thrd_no)%p, &
                  vmr_co2=vmr_co2_15_ptr_array(cdata%thrd_no)%p,cld_frac=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,1), &
                  cld_lwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,2), &
                  cld_reliq=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,3), &
                  cld_iwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,4), &
                  cld_reice=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,5), &
                  cld_swp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,8), &
                  cld_resnow=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,9), &
                  cld_rwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,6), &
                  cld_rerain=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,7), &
                  precip_frac=precip_frac_32_ptr_array(cdata%thrd_no)%p,cld_cnv_lwp=cld_cnv_lwp_33_ptr_array(cdata%thrd_no)%p, &
                  cld_cnv_iwp=cld_cnv_iwp_34_ptr_array(cdata%thrd_no)%p,cld_cnv_reliq=cld_cnv_reliq_35_ptr_array(cdata%thrd_no)%p, &
                  cld_cnv_reice=cld_cnv_reice_36_ptr_array(cdata%thrd_no)%p,cld_pbl_lwp=cld_pbl_lwp_38_ptr_array(cdata%thrd_no)%p, &
                  cld_pbl_iwp=cld_pbl_iwp_39_ptr_array(cdata%thrd_no)%p,cld_pbl_reliq=cld_pbl_reliq_40_ptr_array(cdata%thrd_no)%p, &
                  cld_pbl_reice=cld_pbl_reice_41_ptr_array(cdata%thrd_no)%p,cloud_overlap_param=cloud_overlap_param_42_ptr_array(cdata%thrd_no)%p, &
                  sfc_alb_nir_dir=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  sfc_alb_nir_dif=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),2), &
                  sfc_alb_uvvis_dir=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),3), &
                  sfc_alb_uvvis_dif=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),4), &
                  active_gases_array=active_gases_array_16_ptr_array(cdata%thrd_no)%p,aersw_tau=physics%interstitial(cdata%thrd_no)%faersw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nbdsw,1), &
                  aersw_ssa=physics%interstitial(cdata%thrd_no)%faersw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nbdsw,2), &
                  aersw_g=physics%interstitial(cdata%thrd_no)%faersw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nbdsw,3), &
                  solcon=physics%model%solcon,scmpsw=physics%interstitial(cdata%thrd_no)%scmpsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fluxswup_allsky=fluxswup_allsky_46_ptr_array(cdata%thrd_no)%p,fluxswdown_allsky=fluxswdown_allsky_47_ptr_array(cdata%thrd_no)%p, &
                  fluxswup_clrsky=fluxswup_clrsky_48_ptr_array(cdata%thrd_no)%p,fluxswdown_clrsky=fluxswdown_clrsky_49_ptr_array(cdata%thrd_no)%p, &
                  cldtausw=physics%interstitial(cdata%thrd_no)%cldtausw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2)) then
        nullify(icseed_sw_45_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(p_lay_1_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(p_lev_2_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(t_lay_3_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(t_lev_4_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_o2_10_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_h2o_11_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_o3_12_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_ch4_13_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_n2o_14_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_co2_15_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(precip_frac_32_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_lwp_33_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_iwp_34_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_reliq_35_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_reice_36_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_pbl_lwp_38_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_pbl_iwp_39_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_pbl_reliq_40_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_pbl_reice_41_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cloud_overlap_param_42_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(active_gases_array_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxswup_allsky_46_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxswdown_allsky_47_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxswup_clrsky_48_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxswdown_clrsky_49_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrtmgp_sw_main_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2)) then
        icseed_lw_50_ptr_array(cdata%thrd_no)%p => physics%tbd%icsdlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_rrtmgp)) then
        p_lay_1_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%p_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        p_lev_2_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%p_lev(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        t_lay_3_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%t_lay(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        t_lev_4_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%t_lev(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_o2_10_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_o2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_h2o_11_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_h2o(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_o3_12_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_o3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_ch4_13_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_ch4(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_n2o_14_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_n2o(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        vmr_co2_15_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%vmr_co2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        precip_frac_32_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%precip_frac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_lwp_33_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_lwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_iwp_34_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_iwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_reliq_35_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_reliq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_cnv_reice_36_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_cnv_reice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_pbl_lwp_38_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_pbl_lwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_pbl_iwp_39_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_pbl_iwp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_pbl_reliq_40_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_pbl_reliq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cld_pbl_reice_41_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cld_pbl_reice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        cloud_overlap_param_42_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%cloud_overlap_param(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_rrtmgp)) then
        active_gases_array_16_ptr_array(cdata%thrd_no)%p => physics%model%active_gases_array(:)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxlwup_radtime_51_ptr_array(cdata%thrd_no)%p => physics%coupling%fluxlwup_radtime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxlwdown_radtime_52_ptr_array(cdata%thrd_no)%p => physics%coupling%fluxlwdown_radtime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxlwup_allsky_53_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxlwup_allsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxlwdown_allsky_54_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxlwdown_allsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxlwup_clrsky_55_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxlwup_clrsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxlwdown_clrsky_56_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxlwdown_clrsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp .and. physics%model%use_lw_jacobian)) then
        fluxlwup_jac_57_ptr_array(cdata%thrd_no)%p => physics%coupling%fluxlwup_jac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      call rrtmgp_lw_main_run(dolwrad=physics%model%lslwr,dolwclrsky=physics%model%lwhtr,top_at_1=physics%model%top_at_1, &
                  dogp_lwscat=physics%model%dogp_lwscat,ncol=physics%model%blksz(cdata%blk_no), &
                  rrtmgp_phys_blksz=physics%model%rrtmgp_lw_phys_blksz,nlay=physics%model%levs, &
                  ngauss_angles=physics%model%rrtmgp_ngauss_ang,ngases=physics%model%ngases, &
                  isubc_lw=physics%model%isubc_lw,iovr=physics%model%iovr,iovr_maxrand=physics%model%iovr_maxrand, &
                  iovr_dcorr=physics%model%iovr_dcorr,iovr_exp=physics%model%iovr_exp,iovr_exprand=physics%model%iovr_exprand, &
                  iovr_rand=physics%model%iovr_rand,iovr_max=physics%model%iovr_max,iovr_convcld=physics%model%iovr_convcld, &
                  icseed_lw=icseed_lw_50_ptr_array(cdata%thrd_no)%p,semis=physics%radtend%semis(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfg=physics%interstitial(cdata%thrd_no)%tsfg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  p_lay=p_lay_1_ptr_array(cdata%thrd_no)%p,p_lev=p_lev_2_ptr_array(cdata%thrd_no)%p, &
                  t_lay=t_lay_3_ptr_array(cdata%thrd_no)%p,t_lev=t_lev_4_ptr_array(cdata%thrd_no)%p, &
                  vmr_o2=vmr_o2_10_ptr_array(cdata%thrd_no)%p,vmr_h2o=vmr_h2o_11_ptr_array(cdata%thrd_no)%p, &
                  vmr_o3=vmr_o3_12_ptr_array(cdata%thrd_no)%p,vmr_ch4=vmr_ch4_13_ptr_array(cdata%thrd_no)%p, &
                  vmr_n2o=vmr_n2o_14_ptr_array(cdata%thrd_no)%p,vmr_co2=vmr_co2_15_ptr_array(cdata%thrd_no)%p, &
                  cld_frac=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,1), &
                  cld_lwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,2), &
                  cld_reliq=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,3), &
                  cld_iwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,4), &
                  cld_reice=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,5), &
                  cld_swp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,8), &
                  cld_resnow=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,9), &
                  cld_rwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,6), &
                  cld_rerain=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,7), &
                  precip_frac=precip_frac_32_ptr_array(cdata%thrd_no)%p,cld_cnv_lwp=cld_cnv_lwp_33_ptr_array(cdata%thrd_no)%p, &
                  cld_cnv_iwp=cld_cnv_iwp_34_ptr_array(cdata%thrd_no)%p,cld_cnv_reliq=cld_cnv_reliq_35_ptr_array(cdata%thrd_no)%p, &
                  cld_cnv_reice=cld_cnv_reice_36_ptr_array(cdata%thrd_no)%p,cld_pbl_lwp=cld_pbl_lwp_38_ptr_array(cdata%thrd_no)%p, &
                  cld_pbl_iwp=cld_pbl_iwp_39_ptr_array(cdata%thrd_no)%p,cld_pbl_reliq=cld_pbl_reliq_40_ptr_array(cdata%thrd_no)%p, &
                  cld_pbl_reice=cld_pbl_reice_41_ptr_array(cdata%thrd_no)%p,cloud_overlap_param=cloud_overlap_param_42_ptr_array(cdata%thrd_no)%p, &
                  active_gases_array=active_gases_array_16_ptr_array(cdata%thrd_no)%p,aerlw_tau=physics%interstitial(cdata%thrd_no)%faerlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nbdlw,1), &
                  aerlw_ssa=physics%interstitial(cdata%thrd_no)%faerlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nbdlw,2), &
                  aerlw_g=physics%interstitial(cdata%thrd_no)%faerlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%nbdlw,3), &
                  fluxlwup_radtime=fluxlwup_radtime_51_ptr_array(cdata%thrd_no)%p,fluxlwdown_radtime=fluxlwdown_radtime_52_ptr_array(cdata%thrd_no)%p, &
                  fluxlwup_allsky=fluxlwup_allsky_53_ptr_array(cdata%thrd_no)%p,fluxlwdown_allsky=fluxlwdown_allsky_54_ptr_array(cdata%thrd_no)%p, &
                  fluxlwup_clrsky=fluxlwup_clrsky_55_ptr_array(cdata%thrd_no)%p,fluxlwdown_clrsky=fluxlwdown_clrsky_56_ptr_array(cdata%thrd_no)%p, &
                  fluxlwup_jac=fluxlwup_jac_57_ptr_array(cdata%thrd_no)%p,errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)


      if ((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2)) then
        nullify(icseed_lw_50_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(p_lay_1_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(p_lev_2_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(t_lay_3_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(t_lev_4_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_o2_10_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_h2o_11_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_o3_12_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_ch4_13_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_n2o_14_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(vmr_co2_15_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(precip_frac_32_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_lwp_33_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_iwp_34_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_reliq_35_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_cnv_reice_36_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_pbl_lwp_38_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_pbl_iwp_39_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_pbl_reliq_40_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cld_pbl_reice_41_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(cloud_overlap_param_42_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(active_gases_array_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxlwup_radtime_51_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxlwdown_radtime_52_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxlwup_allsky_53_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxlwdown_allsky_54_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxlwup_clrsky_55_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxlwdown_clrsky_56_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp .and. physics%model%use_lw_jacobian)) then
        nullify(fluxlwup_jac_57_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrtmgp_lw_main_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%do_rrtmgp)) then
        fluxlwup_clrsky_55_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxlwup_clrsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxlwdown_clrsky_56_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxlwdown_clrsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxlwup_allsky_53_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxlwup_allsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxlwdown_allsky_54_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxlwdown_allsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxswup_clrsky_48_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxswup_clrsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxswdown_clrsky_49_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxswdown_clrsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxswup_allsky_46_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxswup_allsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxswdown_allsky_47_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxswdown_allsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        htrlwu_58_ptr_array(cdata%thrd_no)%p => physics%coupling%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call gfs_radiation_post_run(dolwrad=physics%model%lslwr,doswrad=physics%model%lsswr,tend_opt_lwrad=physics%model%tend_opt_lwrad, &
                  tend_opt_swrad=physics%model%tend_opt_swrad,lssav=physics%model%lssav,total_albedo=physics%diag%total_albedo(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  topfsw=physics%diag%topfsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fhlwr=physics%model%fhlwr,fhswr=physics%model%fhswr,delt=physics%model%dtp, &
                  coszen=physics%radtend%coszen(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  coszdg=physics%radtend%coszdg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  raddt=physics%interstitial(cdata%thrd_no)%raddt,aerodp=physics%interstitial(cdata%thrd_no)%aerodp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nspc1), &
                  cldsa=physics%interstitial(cdata%thrd_no)%cldsa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:5), &
                  mtopa=physics%interstitial(cdata%thrd_no)%mtopa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:3), &
                  mbota=physics%interstitial(cdata%thrd_no)%mbota(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:3), &
                  cldtausw=physics%interstitial(cdata%thrd_no)%cldtausw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  cldtaulw=physics%interstitial(cdata%thrd_no)%cldtaulw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  p_lev=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  kb=physics%interstitial(cdata%thrd_no)%kb,kd=physics%interstitial(cdata%thrd_no)%kd, &
                  kt=physics%interstitial(cdata%thrd_no)%kt,sfcflw=physics%radtend%sfcflw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcfsw=physics%radtend%sfcfsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  topflw=physics%diag%topflw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  scmpsw=physics%interstitial(cdata%thrd_no)%scmpsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ncol=physics%model%blksz(cdata%blk_no),nlev=physics%model%levs,ntrac=physics%model%ntrac, &
                  lmk=physics%model%lmk,nday=physics%interstitial(cdata%thrd_no)%nday,nfxr=physics%model%nfxr, &
                  nspc1=physics%model%nspc1,fluxr=physics%diag%fluxr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nfxr), &
                  do_rrtmgp=physics%model%do_rrtmgp,do_lw_clrsky_hr=physics%model%lwhtr,fluxlwup_clrsky=fluxlwup_clrsky_55_ptr_array(cdata%thrd_no)%p, &
                  fluxlwdown_clrsky=fluxlwdown_clrsky_56_ptr_array(cdata%thrd_no)%p,htrlwc=physics%radtend%lwhc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  fluxlwup_allsky=fluxlwup_allsky_53_ptr_array(cdata%thrd_no)%p,fluxlwdown_allsky=fluxlwdown_allsky_54_ptr_array(cdata%thrd_no)%p, &
                  htrlw=physics%radtend%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  do_sw_clrsky_hr=physics%model%swhtr,htrswc=physics%radtend%swhc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  fluxswup_clrsky=fluxswup_clrsky_48_ptr_array(cdata%thrd_no)%p,idxday=physics%interstitial(cdata%thrd_no)%idxday(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fluxswdown_clrsky=fluxswdown_clrsky_49_ptr_array(cdata%thrd_no)%p,htrsw=physics%radtend%htrsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  fluxswup_allsky=fluxswup_allsky_46_ptr_array(cdata%thrd_no)%p,fluxswdown_allsky=fluxswdown_allsky_47_ptr_array(cdata%thrd_no)%p, &
                  isfc=physics%model%isfc,itoa=physics%model%itoa,tsflw=physics%radtend%tsflw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfa=physics%interstitial(cdata%thrd_no)%tsfa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcdlw=physics%coupling%sfcdlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfculw=physics%coupling%sfculw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  htrlwu=htrlwu_58_ptr_array(cdata%thrd_no)%p,nirbmdi=physics%coupling%nirbmdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  nirdfdi=physics%coupling%nirdfdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  visbmdi=physics%coupling%visbmdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  visdfdi=physics%coupling%visdfdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  nirbmui=physics%coupling%nirbmui(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  nirdfui=physics%coupling%nirdfui(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  visbmui=physics%coupling%visbmui(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  visdfui=physics%coupling%visdfui(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfc_alb_nir_dir=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  sfc_alb_nir_dif=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),2), &
                  sfc_alb_uvvis_dir=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),3), &
                  sfc_alb_uvvis_dif=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),4), &
                  sfcnsw=physics%coupling%sfcnsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcdsw=physics%coupling%sfcdsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
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


      if ((physics%model%do_rrtmgp)) then
        nullify(fluxlwup_clrsky_55_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxlwdown_clrsky_56_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxlwup_allsky_53_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxlwdown_allsky_54_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxswup_clrsky_48_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxswdown_clrsky_49_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxswup_allsky_46_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxswdown_allsky_47_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(htrlwu_58_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_radiation_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    



   end function scm_gfs_v16_rrtmgp_radiation_run_cap

   function scm_gfs_v16_rrtmgp_radiation_final_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0






      initialized = .false.


   end function scm_gfs_v16_rrtmgp_radiation_final_cap

end module ccpp_scm_gfs_v16_rrtmgp_radiation_cap
