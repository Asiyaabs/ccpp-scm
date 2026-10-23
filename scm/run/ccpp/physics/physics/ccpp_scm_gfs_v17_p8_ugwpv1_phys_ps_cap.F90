
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
module ccpp_scm_gfs_v17_p8_ugwpv1_phys_ps_cap

   use noahmpdrv, only: noahmpdrv_timestep_init
   use gfs_surface_generic_pre, only: gfs_surface_generic_pre_init
   use noahmpdrv, only: noahmpdrv_init
   use gfs_surface_generic_post, only: gfs_surface_generic_post_init
   use satmedmfvdifq, only: satmedmfvdifq_init
   use ugwpv1_gsldrag, only: ugwpv1_gsldrag_init
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
   use noahmpdrv, only: noahmpdrv_run
   use sfc_sice, only: sfc_sice_run
   use gfs_surface_loop_control_part2, only: gfs_surface_loop_control_part2_run
   use gfs_surface_composites_post, only: gfs_surface_composites_post_run
   use sfc_diag, only: sfc_diag_run
   use sfc_diag_post, only: sfc_diag_post_run
   use gfs_surface_generic_post, only: gfs_surface_generic_post_run
   use gfs_pbl_generic_pre, only: gfs_pbl_generic_pre_run
   use satmedmfvdifq, only: satmedmfvdifq_run
   use gfs_pbl_generic_post, only: gfs_pbl_generic_post_run
   use gfs_gwd_generic_pre, only: gfs_gwd_generic_pre_run
   use ugwpv1_gsldrag, only: ugwpv1_gsldrag_run
   use ugwpv1_gsldrag_post, only: ugwpv1_gsldrag_post_run
   use gfs_gwd_generic_post, only: gfs_gwd_generic_post_run
   use noahmpdrv, only: noahmpdrv_finalize
   use ugwpv1_gsldrag, only: ugwpv1_gsldrag_finalize


   implicit none

   private
   public :: scm_gfs_v17_p8_ugwpv1_phys_ps_tsinit_cap, &
             scm_gfs_v17_p8_ugwpv1_phys_ps_tsfinal_cap, &
             scm_gfs_v17_p8_ugwpv1_phys_ps_init_cap, &
             scm_gfs_v17_p8_ugwpv1_phys_ps_run_cap, &
             scm_gfs_v17_p8_ugwpv1_phys_ps_final_cap

   logical, dimension(200), save :: initialized = .false.

   contains

   function scm_gfs_v17_p8_ugwpv1_phys_ps_tsinit_cap(one,physics,cdata,con_g,con_t0c,con_hfus) result(ierr)

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
      real(kind_phys), intent(in), target :: con_t0c
      real(kind_phys), intent(in), target :: con_hfus

      ierr = 0


      if (.not.initialized(cdata%ccpp_instance)) then
        write(cdata%errmsg,'(*(a))') 'phys_ps_timestep_init called before phys_ps_init'
        cdata%errflg = 1
        return
      end if



      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      


      call noahmpdrv_timestep_init(itime=physics%model%kdt,fhour=physics%model%fhour,delt=physics%model%dtf, &
                  km=physics%model%lsoil,ncols=physics%model%ncols,isot=physics%model%isot, &
                  ivegsrc=physics%model%ivegsrc,soiltyp=physics%sfcprop%stype(one:physics%model%ncols), &
                  vegtype=physics%sfcprop%vtype(one:physics%model%ncols),weasd=physics%sfcprop%weasdl(one:physics%model%ncols), &
                  land_iau_control=physics%sfcprop%land_iau_control,land_iau_data=physics%sfcprop%land_iau_data, &
                  land_iau_state=physics%sfcprop%land_iau_state,stc=physics%sfcprop%stc(one:physics%model%ncols,one:physics%model%lsoil), &
                  slc=physics%sfcprop%slc(one:physics%model%ncols,one:physics%model%lsoil), &
                  smc=physics%sfcprop%smc(one:physics%model%ncols,one:physics%model%lsoil), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg,con_g=con_g,con_t0c=con_t0c,con_hfus=con_hfus)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in noahmpdrv_timestep_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    



   end function scm_gfs_v17_p8_ugwpv1_phys_ps_tsinit_cap

   function scm_gfs_v17_p8_ugwpv1_phys_ps_tsfinal_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_gfs_v17_p8_ugwpv1_phys_ps_tsfinal_cap

   function scm_gfs_v17_p8_ugwpv1_phys_ps_init_cap(one,physics,cdata,con_pi,con_rerth,con_p0,con_g,con_omega,con_cp,con_rd, &
                  con_rv,con_fvirt) result(ierr)

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
      real(kind_phys), intent(in), target :: con_rerth
      real(kind_phys), intent(in), target :: con_p0
      real(kind_phys), intent(in), target :: con_g
      real(kind_phys), intent(in), target :: con_omega
      real(kind_phys), intent(in), target :: con_cp
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: con_rv
      real(kind_phys), intent(in), target :: con_fvirt

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

      


      call noahmpdrv_init(lsm=physics%model%lsm,lsm_noahmp=physics%model%lsm_noahmp,me=physics%model%me, &
                  isot=physics%model%isot,ivegsrc=physics%model%ivegsrc,nlunit=physics%model%nlunit, &
                  pores=physics%model%pores(one:30),resid=physics%model%resid(one:30),do_mynnsfclay=physics%model%do_mynnsfclay, &
                  do_mynnedmf=physics%model%do_mynnedmf,errmsg=cdata%errmsg,errflg=cdata%errflg, &
                  land_iau_control=physics%sfcprop%land_iau_control,land_iau_data=physics%sfcprop%land_iau_data, &
                  land_iau_state=physics%sfcprop%land_iau_state)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in noahmpdrv_init: " // trim(cdata%errmsg)
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

    
      


      call ugwpv1_gsldrag_init(me=physics%model%me,master=physics%model%master,nlunit=physics%model%nlunit, &
                  input_nml_file=physics%model%input_nml_file(:),logunit=physics%model%logunit, &
                  fn_nml2=physics%model%fn_nml,jdat=physics%model%jdat(one:8),lonr=physics%model%lonr, &
                  levs=physics%model%levs,ak=physics%model%ak(one:physics%model%levsp1),bk=physics%model%bk(one:physics%model%levsp1), &
                  dtp=physics%model%dtp,con_pi=con_pi,con_rerth=con_rerth,con_p0=con_p0,con_g=con_g, &
                  con_omega=con_omega,con_cp=con_cp,con_rd=con_rd,con_rv=con_rv,con_fvirt=con_fvirt, &
                  do_ugwp=physics%model%do_ugwp,do_ugwp_v0=physics%model%do_ugwp_v0,do_ugwp_v0_orog_only=physics%model%do_ugwp_v0_orog_only, &
                  do_gsl_drag_ls_bl=physics%model%do_gsl_drag_ls_bl,do_gsl_drag_ss=physics%model%do_gsl_drag_ss, &
                  do_gsl_drag_tofd=physics%model%do_gsl_drag_tofd,do_ngw_ec=physics%model%do_ngw_ec, &
                  do_ugwp_v1=physics%model%do_ugwp_v1,do_ugwp_v1_orog_only=physics%model%do_ugwp_v1_orog_only, &
                  do_ugwp_v1_w_gsldrag=physics%model%do_ugwp_v1_w_gsldrag,errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in ugwpv1_gsldrag_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized(cdata%ccpp_instance) = .true.


   end function scm_gfs_v17_p8_ugwpv1_phys_ps_init_cap

   function scm_gfs_v17_p8_ugwpv1_phys_ps_run_cap(one,physics,cdata,con_fvirt,con_g,con_tice,con_cp,con_pi,con_sbc,con_hvap, &
                  con_eps,con_epsm1,con_hfus,con_jcal,con_rd,con_rhw0,rlapse,con_zero,rhowater, &
                  con_t0c,con_rocp,karman,con_rv) result(ierr)

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
      integer, intent(in), target :: con_zero
      real(kind_phys), intent(in), target :: rhowater
      real(kind_phys), intent(in), target :: con_t0c
      real(kind_phys), intent(in), target :: con_rocp
      real(kind_phys), intent(in), target :: karman
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
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rainn_mp_38_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rainc_mp_39_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snow_mp_40_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: graupel_mp_41_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ice_mp_42_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snowxy_43_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tvxy_44_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tgxy_45_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: canicexy_46_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: canliqxy_47_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: eahxy_48_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tahxy_49_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cmxy_50_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: chxy_51_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fwetxy_52_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sneqvoxy_53_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: alboldxy_54_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qsnowxy_55_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wslakexy_56_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: zwtxy_57_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: waxy_58_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wtxy_59_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tsnoxy_60_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: zsnsoxy_61_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snicexy_62_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snliqxy_63_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lfmassxy_64_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rtmassxy_65_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: stmassxy_66_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: woodxy_67_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: stblcpxy_68_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fastcpxy_69_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: xlaixy_70_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: xsaixy_71_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: taussxy_72_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smoiseq_73_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smcwtdxy_74_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: deeprechxy_75_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rechxy_76_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wet1_77_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: t2mmp_78_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: q2mp_79_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rca_80_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: hflx_fire_81_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: evap_fire_82_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lake_t2m_83_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lake_q2m_84_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: pahi_85_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dlwsfci_cpl_86_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dswsfci_cpl_87_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dlwsfc_cpl_88_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dswsfc_cpl_89_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnirbmi_cpl_90_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnirdfi_cpl_91_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvisbmi_cpl_92_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvisdfi_cpl_93_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnirbm_cpl_94_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dnirdf_cpl_95_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvisbm_cpl_96_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvisdf_cpl_97_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nlwsfci_cpl_98_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nlwsfc_cpl_99_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: t2mi_cpl_100_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: q2mi_cpl_101_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: u10mi_cpl_102_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: v10mi_cpl_103_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tsfci_cpl_104_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: psurfi_cpl_105_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nnirbmi_cpl_106_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nnirdfi_cpl_107_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nvisbmi_cpl_108_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nvisdfi_cpl_109_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nswsfci_cpl_110_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nswsfc_cpl_111_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nnirbm_cpl_112_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nnirdf_cpl_113_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nvisbm_cpl_114_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nvisdf_cpl_115_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: paha_116_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: twa_117_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: claie_118_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cfch_119_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cfrt_120_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cclu_121_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cpopu_122_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_cpl_123_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_cpl_124_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfc_cpl_125_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfc_cpl_126_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfci_cpl_127_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfci_cpl_128_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfci_cpl_129_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfci_cpl_130_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ushfsfci_131_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_cice_132_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_cice_133_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfc_cice_134_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfc_cice_135_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dqsfc_med_136_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtsfc_med_137_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dusfc_med_138_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvsfc_med_139_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: varss_140_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ocss_141_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: oa4ss_142_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: clxss_143_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvdt_ogw_144_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du_ogwcol_145_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dv_ogwcol_146_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dudt_obl_147_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvdt_obl_148_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du_oblcol_149_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dv_oblcol_150_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dudt_oss_151_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvdt_oss_152_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du_osscol_153_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dv_osscol_154_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dudt_ofd_155_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvdt_ofd_156_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du_ofdcol_157_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dv_ofdcol_158_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dudt_ngw_159_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dvdt_ngw_160_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtdt_ngw_161_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: kdis_ngw_162_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: spp_wts_gwd_163_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du3dt_mtb_164_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du3dt_ogw_165_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du3dt_tms_166_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du3dt_ngw_167_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dv3dt_ngw_168_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ldu3dt_ngw_169_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ldv3dt_ngw_170_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ldt3dt_ngw_171_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dws3dt_ogw_172_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dws3dt_obl_173_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dws3dt_oss_174_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dws3dt_ofd_175_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ldu3dt_ogw_176_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ldu3dt_obl_177_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ldu3dt_oss_178_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ldu3dt_ofd_179_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du3_ogwcol_180_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dv3_ogwcol_181_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du3_oblcol_182_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dv3_oblcol_183_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du3_osscol_184_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dv3_osscol_185_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: du3_ofdcol_186_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dv3_ofdcol_187_ptr_array

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

    
      

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        rainn_mp_38_ptr_array(cdata%thrd_no)%p => physics%sfcprop%drainncprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        rainc_mp_39_ptr_array(cdata%thrd_no)%p => physics%sfcprop%draincprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        snow_mp_40_ptr_array(cdata%thrd_no)%p => physics%sfcprop%dsnowprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        graupel_mp_41_ptr_array(cdata%thrd_no)%p => physics%sfcprop%dgraupelprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        ice_mp_42_ptr_array(cdata%thrd_no)%p => physics%sfcprop%diceprv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        snowxy_43_ptr_array(cdata%thrd_no)%p => physics%sfcprop%snowxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        tvxy_44_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tvxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        tgxy_45_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tgxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        canicexy_46_ptr_array(cdata%thrd_no)%p => physics%sfcprop%canicexy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        canliqxy_47_ptr_array(cdata%thrd_no)%p => physics%sfcprop%canliqxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        eahxy_48_ptr_array(cdata%thrd_no)%p => physics%sfcprop%eahxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        tahxy_49_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tahxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        cmxy_50_ptr_array(cdata%thrd_no)%p => physics%sfcprop%cmxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        chxy_51_ptr_array(cdata%thrd_no)%p => physics%sfcprop%chxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        fwetxy_52_ptr_array(cdata%thrd_no)%p => physics%sfcprop%fwetxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        sneqvoxy_53_ptr_array(cdata%thrd_no)%p => physics%sfcprop%sneqvoxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        alboldxy_54_ptr_array(cdata%thrd_no)%p => physics%sfcprop%alboldxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        qsnowxy_55_ptr_array(cdata%thrd_no)%p => physics%sfcprop%qsnowxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        wslakexy_56_ptr_array(cdata%thrd_no)%p => physics%sfcprop%wslakexy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        zwtxy_57_ptr_array(cdata%thrd_no)%p => physics%sfcprop%zwtxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        waxy_58_ptr_array(cdata%thrd_no)%p => physics%sfcprop%waxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        wtxy_59_ptr_array(cdata%thrd_no)%p => physics%sfcprop%wtxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        tsnoxy_60_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tsnoxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),physics%model%lsnow_lsm_lbound:physics%model%lsnow_lsm_ubound)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        zsnsoxy_61_ptr_array(cdata%thrd_no)%p => physics%sfcprop%zsnsoxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),physics%model%lsnow_lsm_lbound:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        snicexy_62_ptr_array(cdata%thrd_no)%p => physics%sfcprop%snicexy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),physics%model%lsnow_lsm_lbound:physics%model%lsnow_lsm_ubound)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        snliqxy_63_ptr_array(cdata%thrd_no)%p => physics%sfcprop%snliqxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),physics%model%lsnow_lsm_lbound:physics%model%lsnow_lsm_ubound)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        lfmassxy_64_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lfmassxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        rtmassxy_65_ptr_array(cdata%thrd_no)%p => physics%sfcprop%rtmassxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        stmassxy_66_ptr_array(cdata%thrd_no)%p => physics%sfcprop%stmassxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        woodxy_67_ptr_array(cdata%thrd_no)%p => physics%sfcprop%woodxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        stblcpxy_68_ptr_array(cdata%thrd_no)%p => physics%sfcprop%stblcpxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        fastcpxy_69_ptr_array(cdata%thrd_no)%p => physics%sfcprop%fastcpxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noah .or. physics%model%lsm == physics%model%lsm_noahmp .or. physics%model%lsm == physics%model%lsm_ruc)) then
        xlaixy_70_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xlaixy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        xsaixy_71_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xsaixy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        taussxy_72_ptr_array(cdata%thrd_no)%p => physics%sfcprop%taussxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        smoiseq_73_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smoiseq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        smcwtdxy_74_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smcwtdxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        deeprechxy_75_ptr_array(cdata%thrd_no)%p => physics%sfcprop%deeprechxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        rechxy_76_ptr_array(cdata%thrd_no)%p => physics%sfcprop%rechxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((.not. physics%model%lsm == physics%model%lsm_ruc)) then
        wet1_77_ptr_array(cdata%thrd_no)%p => physics%diag%wet1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        t2mmp_78_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%t2mmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        q2mp_79_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%q2mp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noah .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        rca_80_ptr_array(cdata%thrd_no)%p => physics%sfcprop%rca(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call noahmpdrv_run(im=physics%model%blksz(cdata%blk_no),km=physics%model%lsoil,lsnowl=physics%model%lsnow_lsm_lbound, &
                  itime=physics%model%kdt,ps=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u1=physics%statein%ugrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  v1=physics%statein%vgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  t1=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  q1=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1,physics%model%ntqv), &
                  soiltyp=physics%sfcprop%stype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  soilcol=physics%sfcprop%scolor(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vegtype=physics%sfcprop%vtype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sigmaf=physics%interstitial(cdata%thrd_no)%sigmaf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dlwflx=physics%diag%dlwsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dswsfc=physics%diag%dswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snet=physics%diag%nswsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  delt=physics%model%dtf,tg3=physics%sfcprop%tg3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cm=physics%interstitial(cdata%thrd_no)%cd_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ch=physics%interstitial(cdata%thrd_no)%cdq_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsl1=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  prslk1=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  prslki=physics%interstitial(cdata%thrd_no)%work3(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsik1=physics%statein%prsik(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  zf=physics%diag%zlvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  pblh=physics%tbd%hpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slopetyp=physics%sfcprop%slope(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  shdmin=physics%sfcprop%shdmin(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  shdmax=physics%sfcprop%shdmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snoalb=physics%sfcprop%snoalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfalb=physics%radtend%sfalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flag_iter=physics%interstitial(cdata%thrd_no)%flag_iter(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  con_g=con_g,idveg=physics%model%iopt_dveg,iopt_crs=physics%model%iopt_crs, &
                  iopt_btr=physics%model%iopt_btr,iopt_run=physics%model%iopt_run,iopt_sfc=physics%model%iopt_sfc, &
                  iopt_frz=physics%model%iopt_frz,iopt_inf=physics%model%iopt_inf,iopt_rad=physics%model%iopt_rad, &
                  iopt_alb=physics%model%iopt_alb,iopt_snf=physics%model%iopt_snf,iopt_tbot=physics%model%iopt_tbot, &
                  iopt_stc=physics%model%iopt_stc,iopt_trs=physics%model%iopt_trs,iopt_diag=physics%model%iopt_diag, &
                  xlatin=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xcoszin=physics%interstitial(cdata%thrd_no)%xcosz(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  iyrlen=physics%model%yearlen,julian=physics%model%julian,garea=physics%grid%area(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rainn_mp=rainn_mp_38_ptr_array(cdata%thrd_no)%p,rainc_mp=rainc_mp_39_ptr_array(cdata%thrd_no)%p, &
                  snow_mp=snow_mp_40_ptr_array(cdata%thrd_no)%p,graupel_mp=graupel_mp_41_ptr_array(cdata%thrd_no)%p, &
                  ice_mp=ice_mp_42_ptr_array(cdata%thrd_no)%p,rhonewsn1=physics%diag%rhonewsn1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  con_hvap=con_hvap,con_cp=con_cp,con_jcal=con_jcal,rhoh2o=rhowater,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_fvirt=con_fvirt,con_rd=con_rd,con_hfus=con_hfus, &
                  thsfc_loc=physics%model%thsfc_loc,cpllnd=physics%model%cpllnd,cpllnd2atm=physics%model%cpllnd2atm, &
                  weasd=physics%sfcprop%weasdl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
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
                  rb1=physics%interstitial(cdata%thrd_no)%rb_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm1=physics%interstitial(cdata%thrd_no)%ffmm_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh1=physics%interstitial(cdata%thrd_no)%ffhh_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ustar1=physics%interstitial(cdata%thrd_no)%uustar_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stress1=physics%interstitial(cdata%thrd_no)%stress_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fm101=physics%interstitial(cdata%thrd_no)%fm10_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fh21=physics%interstitial(cdata%thrd_no)%fh2_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rmol1=physics%sfcprop%rmol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flhc1=physics%sfcprop%flhc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  flqc1=physics%sfcprop%flqc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  do_mynnsfclay=physics%model%do_mynnsfclay,snowxy=snowxy_43_ptr_array(cdata%thrd_no)%p, &
                  tvxy=tvxy_44_ptr_array(cdata%thrd_no)%p,tgxy=tgxy_45_ptr_array(cdata%thrd_no)%p, &
                  canicexy=canicexy_46_ptr_array(cdata%thrd_no)%p,canliqxy=canliqxy_47_ptr_array(cdata%thrd_no)%p, &
                  eahxy=eahxy_48_ptr_array(cdata%thrd_no)%p,tahxy=tahxy_49_ptr_array(cdata%thrd_no)%p, &
                  cmxy=cmxy_50_ptr_array(cdata%thrd_no)%p,chxy=chxy_51_ptr_array(cdata%thrd_no)%p, &
                  fwetxy=fwetxy_52_ptr_array(cdata%thrd_no)%p,sneqvoxy=sneqvoxy_53_ptr_array(cdata%thrd_no)%p, &
                  alboldxy=alboldxy_54_ptr_array(cdata%thrd_no)%p,qsnowxy=qsnowxy_55_ptr_array(cdata%thrd_no)%p, &
                  wslakexy=wslakexy_56_ptr_array(cdata%thrd_no)%p,zwtxy=zwtxy_57_ptr_array(cdata%thrd_no)%p, &
                  waxy=waxy_58_ptr_array(cdata%thrd_no)%p,wtxy=wtxy_59_ptr_array(cdata%thrd_no)%p, &
                  tsnoxy=tsnoxy_60_ptr_array(cdata%thrd_no)%p,zsnsoxy=zsnsoxy_61_ptr_array(cdata%thrd_no)%p, &
                  snicexy=snicexy_62_ptr_array(cdata%thrd_no)%p,snliqxy=snliqxy_63_ptr_array(cdata%thrd_no)%p, &
                  lfmassxy=lfmassxy_64_ptr_array(cdata%thrd_no)%p,rtmassxy=rtmassxy_65_ptr_array(cdata%thrd_no)%p, &
                  stmassxy=stmassxy_66_ptr_array(cdata%thrd_no)%p,woodxy=woodxy_67_ptr_array(cdata%thrd_no)%p, &
                  stblcpxy=stblcpxy_68_ptr_array(cdata%thrd_no)%p,fastcpxy=fastcpxy_69_ptr_array(cdata%thrd_no)%p, &
                  xlaixy=xlaixy_70_ptr_array(cdata%thrd_no)%p,xsaixy=xsaixy_71_ptr_array(cdata%thrd_no)%p, &
                  taussxy=taussxy_72_ptr_array(cdata%thrd_no)%p,smoiseq=smoiseq_73_ptr_array(cdata%thrd_no)%p, &
                  smcwtdxy=smcwtdxy_74_ptr_array(cdata%thrd_no)%p,deeprechxy=deeprechxy_75_ptr_array(cdata%thrd_no)%p, &
                  rechxy=rechxy_76_ptr_array(cdata%thrd_no)%p,albdvis=physics%sfcprop%albdirvis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albdnir=physics%sfcprop%albdirnir_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albivis=physics%sfcprop%albdifvis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  albinir=physics%sfcprop%albdifnir_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  emiss=physics%sfcprop%emis_lnd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
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
                  pah=physics%interstitial(cdata%thrd_no)%pah(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ecan=physics%interstitial(cdata%thrd_no)%ecan(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  etran=physics%interstitial(cdata%thrd_no)%etran(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  edir=physics%interstitial(cdata%thrd_no)%edir(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowc=physics%interstitial(cdata%thrd_no)%snowc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  stm=physics%diag%soilm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snohf=physics%interstitial(cdata%thrd_no)%snohf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  smcwlt2=physics%diag%smcwlt2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  smcref2=physics%diag%smcref2(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  wet1=wet1_77_ptr_array(cdata%thrd_no)%p,t2mmp=t2mmp_78_ptr_array(cdata%thrd_no)%p, &
                  q2mp=q2mp_79_ptr_array(cdata%thrd_no)%p,zvfun=physics%interstitial(cdata%thrd_no)%zvfun(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ztmax=physics%interstitial(cdata%thrd_no)%ztmax_land(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rca=rca_80_ptr_array(cdata%thrd_no)%p,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(rainn_mp_38_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(rainc_mp_39_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(snow_mp_40_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(graupel_mp_41_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(ice_mp_42_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(snowxy_43_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(tvxy_44_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(tgxy_45_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(canicexy_46_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(canliqxy_47_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(eahxy_48_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(tahxy_49_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(cmxy_50_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(chxy_51_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(fwetxy_52_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(sneqvoxy_53_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(alboldxy_54_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(qsnowxy_55_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(wslakexy_56_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(zwtxy_57_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(waxy_58_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(wtxy_59_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(tsnoxy_60_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(zsnsoxy_61_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(snicexy_62_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(snliqxy_63_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(lfmassxy_64_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(rtmassxy_65_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(stmassxy_66_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(woodxy_67_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(stblcpxy_68_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(fastcpxy_69_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noah .or. physics%model%lsm == physics%model%lsm_noahmp .or. physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(xlaixy_70_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(xsaixy_71_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(taussxy_72_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(smoiseq_73_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(smcwtdxy_74_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(deeprechxy_75_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(rechxy_76_ptr_array(cdata%thrd_no)%p)
      end if

      if ((.not. physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(wet1_77_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(t2mmp_78_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(q2mp_79_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noah .or. physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(rca_80_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in noahmpdrv_run: " // trim(cdata%errmsg)
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
        hflx_fire_81_ptr_array(cdata%thrd_no)%p => physics%sfcprop%hflx_fire(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cpl_fire)) then
        evap_fire_82_ptr_array(cdata%thrd_no)%p => physics%sfcprop%evap_fire(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
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
                  hflx_fire=hflx_fire_81_ptr_array(cdata%thrd_no)%p,evap_fire=evap_fire_82_ptr_array(cdata%thrd_no)%p, &
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
        nullify(hflx_fire_81_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cpl_fire)) then
        nullify(evap_fire_82_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_surface_composites_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        lake_t2m_83_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        lake_q2m_84_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lake_q2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
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
                  lake_t2m=lake_t2m_83_ptr_array(cdata%thrd_no)%p,diag_flux=physics%model%diag_flux, &
                  diag_log=physics%model%diag_log,shflx=physics%sfcprop%hflx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lake_q2m=lake_q2m_84_ptr_array(cdata%thrd_no)%p,cdq=physics%interstitial(cdata%thrd_no)%cdq(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  use_lake2m=physics%model%use_lake2m,wind=physics%interstitial(cdata%thrd_no)%wind(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  f10m=physics%sfcprop%f10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u10m=physics%diag%u10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v10m=physics%diag%v10m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t2m=physics%sfcprop%t2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  q2m=physics%sfcprop%q2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dpt2m=physics%diag%dpt2m(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        nullify(lake_t2m_83_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lkm > 0 .and. physics%model%iopt_lake == physics%model%iopt_lake_clm)) then
        nullify(lake_q2m_84_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in sfc_diag_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        t2mmp_78_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%t2mmp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        q2mp_79_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%q2mp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call sfc_diag_post_run(im=physics%model%blksz(cdata%blk_no),lsm=physics%model%lsm,lsm_noahmp=physics%model%lsm_noahmp, &
                  opt_diag=physics%model%iopt_diag,dry=physics%interstitial(cdata%thrd_no)%dry(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lssav=physics%model%lssav,dtf=physics%model%dtf,con_eps=con_eps,con_epsm1=con_epsm1, &
                  pgr=physics%statein%pgr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t2mmp=t2mmp_78_ptr_array(cdata%thrd_no)%p,q2mp=q2mp_79_ptr_array(cdata%thrd_no)%p, &
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
        nullify(t2mmp_78_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(q2mp_79_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in sfc_diag_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        pahi_85_ptr_array(cdata%thrd_no)%p => physics%diag%pahi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        dlwsfci_cpl_86_ptr_array(cdata%thrd_no)%p => physics%coupling%dlwsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        dswsfci_cpl_87_ptr_array(cdata%thrd_no)%p => physics%coupling%dswsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        dlwsfc_cpl_88_ptr_array(cdata%thrd_no)%p => physics%coupling%dlwsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        dswsfc_cpl_89_ptr_array(cdata%thrd_no)%p => physics%coupling%dswsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dnirbmi_cpl_90_ptr_array(cdata%thrd_no)%p => physics%coupling%dnirbmi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dnirdfi_cpl_91_ptr_array(cdata%thrd_no)%p => physics%coupling%dnirdfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvisbmi_cpl_92_ptr_array(cdata%thrd_no)%p => physics%coupling%dvisbmi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvisdfi_cpl_93_ptr_array(cdata%thrd_no)%p => physics%coupling%dvisdfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dnirbm_cpl_94_ptr_array(cdata%thrd_no)%p => physics%coupling%dnirbm_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dnirdf_cpl_95_ptr_array(cdata%thrd_no)%p => physics%coupling%dnirdf_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvisbm_cpl_96_ptr_array(cdata%thrd_no)%p => physics%coupling%dvisbm_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvisdf_cpl_97_ptr_array(cdata%thrd_no)%p => physics%coupling%dvisdf_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nlwsfci_cpl_98_ptr_array(cdata%thrd_no)%p => physics%coupling%nlwsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nlwsfc_cpl_99_ptr_array(cdata%thrd_no)%p => physics%coupling%nlwsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        t2mi_cpl_100_ptr_array(cdata%thrd_no)%p => physics%coupling%t2mi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        q2mi_cpl_101_ptr_array(cdata%thrd_no)%p => physics%coupling%q2mi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cplwav .or. physics%model%cpl_fire)) then
        u10mi_cpl_102_ptr_array(cdata%thrd_no)%p => physics%coupling%u10mi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cplwav .or. physics%model%cpl_fire)) then
        v10mi_cpl_103_ptr_array(cdata%thrd_no)%p => physics%coupling%v10mi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        tsfci_cpl_104_ptr_array(cdata%thrd_no)%p => physics%coupling%tsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        psurfi_cpl_105_ptr_array(cdata%thrd_no)%p => physics%coupling%psurfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nnirbmi_cpl_106_ptr_array(cdata%thrd_no)%p => physics%coupling%nnirbmi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nnirdfi_cpl_107_ptr_array(cdata%thrd_no)%p => physics%coupling%nnirdfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nvisbmi_cpl_108_ptr_array(cdata%thrd_no)%p => physics%coupling%nvisbmi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nvisdfi_cpl_109_ptr_array(cdata%thrd_no)%p => physics%coupling%nvisdfi_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nswsfci_cpl_110_ptr_array(cdata%thrd_no)%p => physics%coupling%nswsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nswsfc_cpl_111_ptr_array(cdata%thrd_no)%p => physics%coupling%nswsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nnirbm_cpl_112_ptr_array(cdata%thrd_no)%p => physics%coupling%nnirbm_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nnirdf_cpl_113_ptr_array(cdata%thrd_no)%p => physics%coupling%nnirdf_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nvisbm_cpl_114_ptr_array(cdata%thrd_no)%p => physics%coupling%nvisbm_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nvisdf_cpl_115_ptr_array(cdata%thrd_no)%p => physics%coupling%nvisdf_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        paha_116_ptr_array(cdata%thrd_no)%p => physics%diag%paha(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        waxy_58_ptr_array(cdata%thrd_no)%p => physics%sfcprop%waxy(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        twa_117_ptr_array(cdata%thrd_no)%p => physics%diag%twa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
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
                  pahi=pahi_85_ptr_array(cdata%thrd_no)%p,epi=physics%diag%epi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gfluxi=physics%diag%gfluxi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  t1=physics%diag%t1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  q1=physics%diag%q1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  u1=physics%diag%u1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  v1=physics%diag%v1(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dlwsfci_cpl=dlwsfci_cpl_86_ptr_array(cdata%thrd_no)%p,dswsfci_cpl=dswsfci_cpl_87_ptr_array(cdata%thrd_no)%p, &
                  dlwsfc_cpl=dlwsfc_cpl_88_ptr_array(cdata%thrd_no)%p,dswsfc_cpl=dswsfc_cpl_89_ptr_array(cdata%thrd_no)%p, &
                  dnirbmi_cpl=dnirbmi_cpl_90_ptr_array(cdata%thrd_no)%p,dnirdfi_cpl=dnirdfi_cpl_91_ptr_array(cdata%thrd_no)%p, &
                  dvisbmi_cpl=dvisbmi_cpl_92_ptr_array(cdata%thrd_no)%p,dvisdfi_cpl=dvisdfi_cpl_93_ptr_array(cdata%thrd_no)%p, &
                  dnirbm_cpl=dnirbm_cpl_94_ptr_array(cdata%thrd_no)%p,dnirdf_cpl=dnirdf_cpl_95_ptr_array(cdata%thrd_no)%p, &
                  dvisbm_cpl=dvisbm_cpl_96_ptr_array(cdata%thrd_no)%p,dvisdf_cpl=dvisdf_cpl_97_ptr_array(cdata%thrd_no)%p, &
                  nlwsfci_cpl=nlwsfci_cpl_98_ptr_array(cdata%thrd_no)%p,nlwsfc_cpl=nlwsfc_cpl_99_ptr_array(cdata%thrd_no)%p, &
                  t2mi_cpl=t2mi_cpl_100_ptr_array(cdata%thrd_no)%p,q2mi_cpl=q2mi_cpl_101_ptr_array(cdata%thrd_no)%p, &
                  u10mi_cpl=u10mi_cpl_102_ptr_array(cdata%thrd_no)%p,v10mi_cpl=v10mi_cpl_103_ptr_array(cdata%thrd_no)%p, &
                  tsfci_cpl=tsfci_cpl_104_ptr_array(cdata%thrd_no)%p,psurfi_cpl=psurfi_cpl_105_ptr_array(cdata%thrd_no)%p, &
                  nnirbmi_cpl=nnirbmi_cpl_106_ptr_array(cdata%thrd_no)%p,nnirdfi_cpl=nnirdfi_cpl_107_ptr_array(cdata%thrd_no)%p, &
                  nvisbmi_cpl=nvisbmi_cpl_108_ptr_array(cdata%thrd_no)%p,nvisdfi_cpl=nvisdfi_cpl_109_ptr_array(cdata%thrd_no)%p, &
                  nswsfci_cpl=nswsfci_cpl_110_ptr_array(cdata%thrd_no)%p,nswsfc_cpl=nswsfc_cpl_111_ptr_array(cdata%thrd_no)%p, &
                  nnirbm_cpl=nnirbm_cpl_112_ptr_array(cdata%thrd_no)%p,nnirdf_cpl=nnirdf_cpl_113_ptr_array(cdata%thrd_no)%p, &
                  nvisbm_cpl=nvisbm_cpl_114_ptr_array(cdata%thrd_no)%p,nvisdf_cpl=nvisdf_cpl_115_ptr_array(cdata%thrd_no)%p, &
                  gflux=physics%diag%gflux(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evbsa=physics%diag%evbsa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  evcwa=physics%diag%evcwa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  transa=physics%diag%transa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sbsnoa=physics%diag%sbsnoa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snowca=physics%diag%snowca(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  snohfa=physics%diag%snohfa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  paha=paha_116_ptr_array(cdata%thrd_no)%p,ep=physics%diag%ep(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ecan=physics%interstitial(cdata%thrd_no)%ecan(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  etran=physics%interstitial(cdata%thrd_no)%etran(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  edir=physics%interstitial(cdata%thrd_no)%edir(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  waxy=waxy_58_ptr_array(cdata%thrd_no)%p,runoff=physics%diag%runoff(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  srunoff=physics%diag%srunoff(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  runof=physics%interstitial(cdata%thrd_no)%runoff(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  drain=physics%interstitial(cdata%thrd_no)%drain(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tecan=physics%diag%tecan(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tetran=physics%diag%tetran(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tedir=physics%diag%tedir(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  twa=twa_117_ptr_array(cdata%thrd_no)%p,lheatstrg=physics%model%lheatstrg, &
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
        nullify(pahi_85_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(dlwsfci_cpl_86_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(dswsfci_cpl_87_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(dlwsfc_cpl_88_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(dswsfc_cpl_89_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dnirbmi_cpl_90_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dnirdfi_cpl_91_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvisbmi_cpl_92_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvisdfi_cpl_93_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dnirbm_cpl_94_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dnirdf_cpl_95_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvisbm_cpl_96_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvisdf_cpl_97_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(nlwsfci_cpl_98_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(nlwsfc_cpl_99_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(t2mi_cpl_100_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(q2mi_cpl_101_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cplwav .or. physics%model%cpl_fire)) then
        nullify(u10mi_cpl_102_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cplwav .or. physics%model%cpl_fire)) then
        nullify(v10mi_cpl_103_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cplchm .or. physics%model%cpllnd)) then
        nullify(tsfci_cpl_104_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(psurfi_cpl_105_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nnirbmi_cpl_106_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nnirdfi_cpl_107_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nvisbmi_cpl_108_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nvisdfi_cpl_109_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(nswsfci_cpl_110_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nswsfc_cpl_111_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nnirbm_cpl_112_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nnirdf_cpl_113_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nvisbm_cpl_114_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpllnd)) then
        nullify(nvisdf_cpl_115_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(paha_116_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(waxy_58_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(twa_117_ptr_array(cdata%thrd_no)%p)
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
        claie_118_ptr_array(cdata%thrd_no)%p => physics%diag%claie(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        cfch_119_ptr_array(cdata%thrd_no)%p => physics%diag%cfch(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        cfrt_120_ptr_array(cdata%thrd_no)%p => physics%diag%cfrt(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        cclu_121_ptr_array(cdata%thrd_no)%p => physics%diag%cclu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        cpopu_122_ptr_array(cdata%thrd_no)%p => physics%diag%cpopu(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
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
                  cplaqm=physics%model%cplaqm,claie=claie_118_ptr_array(cdata%thrd_no)%p, &
                  cfch=cfch_119_ptr_array(cdata%thrd_no)%p,cfrt=cfrt_120_ptr_array(cdata%thrd_no)%p, &
                  cclu=cclu_121_ptr_array(cdata%thrd_no)%p,cpopu=cpopu_122_ptr_array(cdata%thrd_no)%p, &
                  sfc_rlm=physics%model%sfc_rlm,tc_pbl=physics%model%tc_pbl,use_lpt=physics%model%use_lpt, &
                  ntqv=physics%model%ntqv,dtend=dtend_18_ptr_array(cdata%thrd_no)%p,nqvtag=physics%model%nqvtag, &
                  nqvtagv=physics%interstitial(cdata%thrd_no)%nqvtagv,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_temperature=physics%model%index_of_temperature,index_of_x_wind=physics%model%index_of_x_wind, &
                  index_of_y_wind=physics%model%index_of_y_wind,index_of_process_pbl=physics%model%index_of_process_pbl, &
                  gen_tend=physics%model%flag_for_pbl_generic_tend,ldiag3d=physics%model%ldiag3d, &
                  ten_t=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_u=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  ten_v=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(claie_118_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(cfch_119_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(cfrt_120_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(cclu_121_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplaqm .and. physics%model%do_canopy)) then
        nullify(cpopu_122_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_18_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in satmedmfvdifq_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ldiag3d)) then
        dtend_18_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dusfc_cpl_123_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvsfc_cpl_124_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dtsfc_cpl_125_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dqsfc_cpl_126_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfc_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dusfci_cpl_127_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvsfci_cpl_128_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        dtsfci_cpl_129_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        dqsfci_cpl_130_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfci_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplchm)) then
        ushfsfci_131_ptr_array(cdata%thrd_no)%p => physics%coupling%ushfsfci(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dusfc_cice_132_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dvsfc_cice_133_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dtsfc_cice_134_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        dqsfc_cice_135_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfcin_cpl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        dqsfc_med_136_ptr_array(cdata%thrd_no)%p => physics%coupling%dqsfcin_med(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        dtsfc_med_137_ptr_array(cdata%thrd_no)%p => physics%coupling%dtsfcin_med(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%cplflx .and. physics%model%use_med_flux)) then
        dusfc_med_138_ptr_array(cdata%thrd_no)%p => physics%coupling%dusfcin_med(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        dvsfc_med_139_ptr_array(cdata%thrd_no)%p => physics%coupling%dvsfcin_med(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
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
                  dusfc_cpl=dusfc_cpl_123_ptr_array(cdata%thrd_no)%p,dvsfc_cpl=dvsfc_cpl_124_ptr_array(cdata%thrd_no)%p, &
                  dtsfc_cpl=dtsfc_cpl_125_ptr_array(cdata%thrd_no)%p,dqsfc_cpl=dqsfc_cpl_126_ptr_array(cdata%thrd_no)%p, &
                  dusfci_cpl=dusfci_cpl_127_ptr_array(cdata%thrd_no)%p,dvsfci_cpl=dvsfci_cpl_128_ptr_array(cdata%thrd_no)%p, &
                  dtsfci_cpl=dtsfci_cpl_129_ptr_array(cdata%thrd_no)%p,dqsfci_cpl=dqsfci_cpl_130_ptr_array(cdata%thrd_no)%p, &
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
                  ushfsfci=ushfsfci_131_ptr_array(cdata%thrd_no)%p,oceanfrac=physics%sfcprop%oceanfrac(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kdt=physics%model%kdt,dusfc_cice=dusfc_cice_132_ptr_array(cdata%thrd_no)%p, &
                  dvsfc_cice=dvsfc_cice_133_ptr_array(cdata%thrd_no)%p,dtsfc_cice=dtsfc_cice_134_ptr_array(cdata%thrd_no)%p, &
                  dqsfc_cice=dqsfc_cice_135_ptr_array(cdata%thrd_no)%p,use_med_flux=physics%model%use_med_flux, &
                  dqsfc_med=dqsfc_med_136_ptr_array(cdata%thrd_no)%p,dtsfc_med=dtsfc_med_137_ptr_array(cdata%thrd_no)%p, &
                  dusfc_med=dusfc_med_138_ptr_array(cdata%thrd_no)%p,dvsfc_med=dvsfc_med_139_ptr_array(cdata%thrd_no)%p, &
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
        nullify(dusfc_cpl_123_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvsfc_cpl_124_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dtsfc_cpl_125_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dqsfc_cpl_126_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dusfci_cpl_127_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvsfci_cpl_128_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(dtsfci_cpl_129_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire .or. (physics%model%cplaqm .and. .not. physics%model%cplflx))) then
        nullify(dqsfci_cpl_130_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplchm)) then
        nullify(ushfsfci_131_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dusfc_cice_132_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dvsfc_cice_133_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dtsfc_cice_134_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .or. physics%model%cpl_fire)) then
        nullify(dqsfc_cice_135_ptr_array(cdata%thrd_no)%p)
      end if

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        nullify(dqsfc_med_136_ptr_array(cdata%thrd_no)%p)
      end if

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        nullify(dtsfc_med_137_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%cplflx .and. physics%model%use_med_flux)) then
        nullify(dusfc_med_138_ptr_array(cdata%thrd_no)%p)
      end if

      if (((physics%model%cplflx .or. physics%model%cpl_fire) .and. physics%model%use_med_flux)) then
        nullify(dvsfc_med_139_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_pbl_generic_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        varss_140_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%varss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        ocss_141_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ocss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        oa4ss_142_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%oa4ss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        clxss_143_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%clxss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      call gfs_gwd_generic_pre_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,nmtvr=physics%model%nmtvr, &
                  mntvar=physics%sfcprop%hprime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nmtvr), &
                  oc=physics%interstitial(cdata%thrd_no)%oc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  oa4=physics%interstitial(cdata%thrd_no)%oa4(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  clx=physics%interstitial(cdata%thrd_no)%clx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  theta=physics%interstitial(cdata%thrd_no)%theta(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  varss=varss_140_ptr_array(cdata%thrd_no)%p,ocss=ocss_141_ptr_array(cdata%thrd_no)%p, &
                  oa4ss=oa4ss_142_ptr_array(cdata%thrd_no)%p,clxss=clxss_143_ptr_array(cdata%thrd_no)%p, &
                  sigma=physics%interstitial(cdata%thrd_no)%sigma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gamma=physics%interstitial(cdata%thrd_no)%gamma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  elvmax=physics%interstitial(cdata%thrd_no)%elvmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(varss_140_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(ocss_141_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(oa4ss_142_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(clxss_143_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_gwd_generic_pre_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        varss_140_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%varss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        ocss_141_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%ocss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        oa4ss_142_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%oa4ss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        clxss_143_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%clxss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvdt_ogw_144_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        du_ogwcol_145_ptr_array(cdata%thrd_no)%p => physics%diag%du_ogwcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dv_ogwcol_146_ptr_array(cdata%thrd_no)%p => physics%diag%dv_ogwcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dudt_obl_147_ptr_array(cdata%thrd_no)%p => physics%diag%dudt_obl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvdt_obl_148_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_obl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        du_oblcol_149_ptr_array(cdata%thrd_no)%p => physics%diag%du_oblcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dv_oblcol_150_ptr_array(cdata%thrd_no)%p => physics%diag%dv_oblcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dudt_oss_151_ptr_array(cdata%thrd_no)%p => physics%diag%dudt_oss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvdt_oss_152_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_oss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        du_osscol_153_ptr_array(cdata%thrd_no)%p => physics%diag%du_osscol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dv_osscol_154_ptr_array(cdata%thrd_no)%p => physics%diag%dv_osscol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dudt_ofd_155_ptr_array(cdata%thrd_no)%p => physics%diag%dudt_ofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvdt_ofd_156_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_ofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        du_ofdcol_157_ptr_array(cdata%thrd_no)%p => physics%diag%du_ofdcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dv_ofdcol_158_ptr_array(cdata%thrd_no)%p => physics%diag%dv_ofdcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        dudt_ngw_159_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%dudt_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        dvdt_ngw_160_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%dvdt_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        dtdt_ngw_161_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%dtdt_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        kdis_ngw_162_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%kdis_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_18_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
      end if

      if ((physics%model%do_spp)) then
        spp_wts_gwd_163_ptr_array(cdata%thrd_no)%p => physics%coupling%spp_wts_gwd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call ugwpv1_gsldrag_run(me=physics%model%me,master=physics%model%master,im=physics%model%blksz(cdata%blk_no), &
                  levs=physics%model%levs,ak=physics%model%ak(one:physics%model%levsp1),bk=physics%model%bk(one:physics%model%levsp1), &
                  ntrac=physics%model%ntrac,lonr=physics%model%lonr,dtp=physics%model%dtp, &
                  kdt=physics%model%kdt,ldiag3d=physics%model%ldiag3d,lssav=physics%model%lssav, &
                  flag_for_gwd_generic_tend=physics%model%flag_for_gwd_generic_tend,do_gsl_drag_ls_bl=physics%model%do_gsl_drag_ls_bl, &
                  do_gsl_drag_ss=physics%model%do_gsl_drag_ss,do_gsl_drag_tofd=physics%model%do_gsl_drag_tofd, &
                  do_gwd_opt_psl=physics%model%do_gwd_opt_psl,psl_gwd_dx_factor=physics%model%psl_gwd_dx_factor, &
                  do_ngw_ec=physics%model%do_ngw_ec,do_ugwp_v1=physics%model%do_ugwp_v1,do_ugwp_v1_orog_only=physics%model%do_ugwp_v1_orog_only, &
                  do_ugwp_v1_w_gsldrag=physics%model%do_ugwp_v1_w_gsldrag,gwd_opt=physics%model%gwd_opt, &
                  do_tofd=physics%model%do_tofd,ldiag_ugwp=physics%model%ldiag_ugwp,ugwp_seq_update=physics%model%ugwp_seq_update, &
                  cdmbgwd=physics%model%cdmbgwd(one:4),alpha_fd=physics%model%alpha_fd,jdat=physics%model%jdat(one:8), &
                  nmtvr=physics%model%nmtvr,hprime=physics%sfcprop%hprime(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  oc=physics%interstitial(cdata%thrd_no)%oc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  theta=physics%interstitial(cdata%thrd_no)%theta(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sigma=physics%interstitial(cdata%thrd_no)%sigma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  gamma=physics%interstitial(cdata%thrd_no)%gamma(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  elvmax=physics%interstitial(cdata%thrd_no)%elvmax(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  clx=physics%interstitial(cdata%thrd_no)%clx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  oa4=physics%interstitial(cdata%thrd_no)%oa4(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:4), &
                  varss=varss_140_ptr_array(cdata%thrd_no)%p,oc1ss=ocss_141_ptr_array(cdata%thrd_no)%p, &
                  oa4ss=oa4ss_142_ptr_array(cdata%thrd_no)%p,ol4ss=clxss_143_ptr_array(cdata%thrd_no)%p, &
                  dx=physics%grid%dx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlat=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlat_d=physics%grid%xlat_d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sinlat=physics%grid%sinlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  coslat=physics%grid%coslat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  area=physics%grid%area(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rain=physics%sfcprop%tprcp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  br1=physics%interstitial(cdata%thrd_no)%rb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  hpbl=physics%tbd%hpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  vtype=physics%sfcprop%vtype(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  kpbl=physics%interstitial(cdata%thrd_no)%kpbl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slmsk=physics%sfcprop%slmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  ugrs=physics%stateout%gu0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  vgrs=physics%stateout%gv0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tgrs=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  q1=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prslk=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  phii=physics%statein%phii(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  phil=physics%statein%phil(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  del=physics%interstitial(cdata%thrd_no)%del(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tau_amf=physics%tbd%tau_amf(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dudt_ogw=physics%diag%dudt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt_ogw=dvdt_ogw_144_ptr_array(cdata%thrd_no)%p,du_ogwcol=du_ogwcol_145_ptr_array(cdata%thrd_no)%p, &
                  dv_ogwcol=dv_ogwcol_146_ptr_array(cdata%thrd_no)%p,dudt_obl=dudt_obl_147_ptr_array(cdata%thrd_no)%p, &
                  dvdt_obl=dvdt_obl_148_ptr_array(cdata%thrd_no)%p,du_oblcol=du_oblcol_149_ptr_array(cdata%thrd_no)%p, &
                  dv_oblcol=dv_oblcol_150_ptr_array(cdata%thrd_no)%p,dudt_oss=dudt_oss_151_ptr_array(cdata%thrd_no)%p, &
                  dvdt_oss=dvdt_oss_152_ptr_array(cdata%thrd_no)%p,du_osscol=du_osscol_153_ptr_array(cdata%thrd_no)%p, &
                  dv_osscol=dv_osscol_154_ptr_array(cdata%thrd_no)%p,dudt_ofd=dudt_ofd_155_ptr_array(cdata%thrd_no)%p, &
                  dvdt_ofd=dvdt_ofd_156_ptr_array(cdata%thrd_no)%p,du_ofdcol=du_ofdcol_157_ptr_array(cdata%thrd_no)%p, &
                  dv_ofdcol=dv_ofdcol_158_ptr_array(cdata%thrd_no)%p,dudt_ngw=dudt_ngw_159_ptr_array(cdata%thrd_no)%p, &
                  dvdt_ngw=dvdt_ngw_160_ptr_array(cdata%thrd_no)%p,dtdt_ngw=dtdt_ngw_161_ptr_array(cdata%thrd_no)%p, &
                  kdis_ngw=kdis_ngw_162_ptr_array(cdata%thrd_no)%p,dudt_gw=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt_gw=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dtdt_gw=physics%interstitial(cdata%thrd_no)%ten_t(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dqdt_gw=physics%interstitial(cdata%thrd_no)%ten_q(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  kdis_gw=physics%diag%kdis_gw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tau_ogw=physics%interstitial(cdata%thrd_no)%tau_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tau_ngw=physics%interstitial(cdata%thrd_no)%tau_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tau_oss=physics%interstitial(cdata%thrd_no)%tau_oss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zogw=physics%interstitial(cdata%thrd_no)%zogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zlwb=physics%interstitial(cdata%thrd_no)%zlwb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zobl=physics%interstitial(cdata%thrd_no)%zmtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zngw=physics%interstitial(cdata%thrd_no)%zngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dusfcg=physics%interstitial(cdata%thrd_no)%dusfcg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dvsfcg=physics%interstitial(cdata%thrd_no)%dvsfcg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  rdxzb=physics%diag%zmtnblck(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dtend=dtend_18_ptr_array(cdata%thrd_no)%p,dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  index_of_x_wind=physics%model%index_of_x_wind,index_of_y_wind=physics%model%index_of_y_wind, &
                  index_of_temperature=physics%model%index_of_temperature,index_of_process_orographic_gwd=physics%model%index_of_process_orographic_gwd, &
                  index_of_process_nonorographic_gwd=physics%model%index_of_process_nonorographic_gwd, &
                  lprnt=physics%model%lprnt,ipr=physics%model%ipr,spp_wts_gwd=spp_wts_gwd_163_ptr_array(cdata%thrd_no)%p, &
                  spp_gwd=physics%model%spp_gwd,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(varss_140_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(ocss_141_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(oa4ss_142_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%gwd_opt == 2 .or. physics%model%gwd_opt == 3 .or. physics%model%gwd_opt == 22 .or. physics%model%gwd_opt == 33)) then
        nullify(clxss_143_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvdt_ogw_144_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(du_ogwcol_145_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dv_ogwcol_146_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dudt_obl_147_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvdt_obl_148_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(du_oblcol_149_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dv_oblcol_150_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dudt_oss_151_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvdt_oss_152_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(du_osscol_153_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dv_osscol_154_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dudt_ofd_155_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvdt_ofd_156_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(du_ofdcol_157_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dv_ofdcol_158_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        nullify(dudt_ngw_159_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        nullify(dvdt_ngw_160_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        nullify(dtdt_ngw_161_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        nullify(kdis_ngw_162_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_18_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_spp)) then
        nullify(spp_wts_gwd_163_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in ugwpv1_gsldrag_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dudt_obl_147_ptr_array(cdata%thrd_no)%p => physics%diag%dudt_obl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvdt_obl_148_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_obl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dudt_ofd_155_ptr_array(cdata%thrd_no)%p => physics%diag%dudt_ofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvdt_ofd_156_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_ofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvdt_ogw_144_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dudt_oss_151_ptr_array(cdata%thrd_no)%p => physics%diag%dudt_oss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dvdt_oss_152_ptr_array(cdata%thrd_no)%p => physics%diag%dvdt_oss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        du3dt_mtb_164_ptr_array(cdata%thrd_no)%p => physics%diag%du3dt_mtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        du3dt_ogw_165_ptr_array(cdata%thrd_no)%p => physics%diag%du3dt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        du3dt_tms_166_ptr_array(cdata%thrd_no)%p => physics%diag%du3dt_tms(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        du3dt_ngw_167_ptr_array(cdata%thrd_no)%p => physics%diag%du3dt_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        dv3dt_ngw_168_ptr_array(cdata%thrd_no)%p => physics%diag%dv3dt_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        dudt_ngw_159_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%dudt_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        dvdt_ngw_160_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%dvdt_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        dtdt_ngw_161_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%dtdt_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        ldu3dt_ngw_169_ptr_array(cdata%thrd_no)%p => physics%diag%ldu3dt_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        ldv3dt_ngw_170_ptr_array(cdata%thrd_no)%p => physics%diag%ldv3dt_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        ldt3dt_ngw_171_ptr_array(cdata%thrd_no)%p => physics%diag%ldt3dt_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        dws3dt_ogw_172_ptr_array(cdata%thrd_no)%p => physics%diag%dws3dt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        dws3dt_obl_173_ptr_array(cdata%thrd_no)%p => physics%diag%dws3dt_obl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        dws3dt_oss_174_ptr_array(cdata%thrd_no)%p => physics%diag%dws3dt_oss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        dws3dt_ofd_175_ptr_array(cdata%thrd_no)%p => physics%diag%dws3dt_ofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        ldu3dt_ogw_176_ptr_array(cdata%thrd_no)%p => physics%diag%ldu3dt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        ldu3dt_obl_177_ptr_array(cdata%thrd_no)%p => physics%diag%ldu3dt_obl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        ldu3dt_oss_178_ptr_array(cdata%thrd_no)%p => physics%diag%ldu3dt_oss(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ldiag_ugwp)) then
        ldu3dt_ofd_179_ptr_array(cdata%thrd_no)%p => physics%diag%ldu3dt_ofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        du_ogwcol_145_ptr_array(cdata%thrd_no)%p => physics%diag%du_ogwcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dv_ogwcol_146_ptr_array(cdata%thrd_no)%p => physics%diag%dv_ogwcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        du_oblcol_149_ptr_array(cdata%thrd_no)%p => physics%diag%du_oblcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dv_oblcol_150_ptr_array(cdata%thrd_no)%p => physics%diag%dv_oblcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        du_osscol_153_ptr_array(cdata%thrd_no)%p => physics%diag%du_osscol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dv_osscol_154_ptr_array(cdata%thrd_no)%p => physics%diag%dv_osscol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        du_ofdcol_157_ptr_array(cdata%thrd_no)%p => physics%diag%du_ofdcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dv_ofdcol_158_ptr_array(cdata%thrd_no)%p => physics%diag%dv_ofdcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        du3_ogwcol_180_ptr_array(cdata%thrd_no)%p => physics%diag%du3_ogwcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dv3_ogwcol_181_ptr_array(cdata%thrd_no)%p => physics%diag%dv3_ogwcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        du3_oblcol_182_ptr_array(cdata%thrd_no)%p => physics%diag%du3_oblcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dv3_oblcol_183_ptr_array(cdata%thrd_no)%p => physics%diag%dv3_oblcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        du3_osscol_184_ptr_array(cdata%thrd_no)%p => physics%diag%du3_osscol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dv3_osscol_185_ptr_array(cdata%thrd_no)%p => physics%diag%dv3_osscol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        du3_ofdcol_186_ptr_array(cdata%thrd_no)%p => physics%diag%du3_ofdcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        dv3_ofdcol_187_ptr_array(cdata%thrd_no)%p => physics%diag%dv3_ofdcol(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call ugwpv1_gsldrag_post_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,ldiag_ugwp=physics%model%ldiag_ugwp, &
                  dtf=physics%model%dtf,dudt_gw=physics%interstitial(cdata%thrd_no)%ten_u(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt_gw=physics%interstitial(cdata%thrd_no)%ten_v(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tau_ogw=physics%interstitial(cdata%thrd_no)%tau_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tau_ngw=physics%interstitial(cdata%thrd_no)%tau_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zobl=physics%interstitial(cdata%thrd_no)%zmtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zlwb=physics%interstitial(cdata%thrd_no)%zlwb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  zogw=physics%interstitial(cdata%thrd_no)%zogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dudt_obl=dudt_obl_147_ptr_array(cdata%thrd_no)%p,dvdt_obl=dvdt_obl_148_ptr_array(cdata%thrd_no)%p, &
                  dudt_ofd=dudt_ofd_155_ptr_array(cdata%thrd_no)%p,dvdt_ofd=dvdt_ofd_156_ptr_array(cdata%thrd_no)%p, &
                  dudt_ogw=physics%diag%dudt_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  dvdt_ogw=dvdt_ogw_144_ptr_array(cdata%thrd_no)%p,dudt_oss=dudt_oss_151_ptr_array(cdata%thrd_no)%p, &
                  dvdt_oss=dvdt_oss_152_ptr_array(cdata%thrd_no)%p,tot_zmtb=physics%diag%zmtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tot_zlwb=physics%diag%zlwb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tot_zogw=physics%diag%zogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tot_tofd=physics%diag%tau_tofd(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tot_mtb=physics%diag%tau_mtb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tot_ogw=physics%diag%tau_ogw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tot_ngw=physics%diag%tau_ngw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  du3dt_mtb=du3dt_mtb_164_ptr_array(cdata%thrd_no)%p,du3dt_ogw=du3dt_ogw_165_ptr_array(cdata%thrd_no)%p, &
                  du3dt_tms=du3dt_tms_166_ptr_array(cdata%thrd_no)%p,du3dt_ngw=du3dt_ngw_167_ptr_array(cdata%thrd_no)%p, &
                  dv3dt_ngw=dv3dt_ngw_168_ptr_array(cdata%thrd_no)%p,dudt_ngw=dudt_ngw_159_ptr_array(cdata%thrd_no)%p, &
                  dvdt_ngw=dvdt_ngw_160_ptr_array(cdata%thrd_no)%p,dtdt_ngw=dtdt_ngw_161_ptr_array(cdata%thrd_no)%p, &
                  ldu3dt_ngw=ldu3dt_ngw_169_ptr_array(cdata%thrd_no)%p,ldv3dt_ngw=ldv3dt_ngw_170_ptr_array(cdata%thrd_no)%p, &
                  ldt3dt_ngw=ldt3dt_ngw_171_ptr_array(cdata%thrd_no)%p,dws3dt_ogw=dws3dt_ogw_172_ptr_array(cdata%thrd_no)%p, &
                  dws3dt_obl=dws3dt_obl_173_ptr_array(cdata%thrd_no)%p,dws3dt_oss=dws3dt_oss_174_ptr_array(cdata%thrd_no)%p, &
                  dws3dt_ofd=dws3dt_ofd_175_ptr_array(cdata%thrd_no)%p,ldu3dt_ogw=ldu3dt_ogw_176_ptr_array(cdata%thrd_no)%p, &
                  ldu3dt_obl=ldu3dt_obl_177_ptr_array(cdata%thrd_no)%p,ldu3dt_oss=ldu3dt_oss_178_ptr_array(cdata%thrd_no)%p, &
                  ldu3dt_ofd=ldu3dt_ofd_179_ptr_array(cdata%thrd_no)%p,du_ogwcol=du_ogwcol_145_ptr_array(cdata%thrd_no)%p, &
                  dv_ogwcol=dv_ogwcol_146_ptr_array(cdata%thrd_no)%p,du_oblcol=du_oblcol_149_ptr_array(cdata%thrd_no)%p, &
                  dv_oblcol=dv_oblcol_150_ptr_array(cdata%thrd_no)%p,du_osscol=du_osscol_153_ptr_array(cdata%thrd_no)%p, &
                  dv_osscol=dv_osscol_154_ptr_array(cdata%thrd_no)%p,du_ofdcol=du_ofdcol_157_ptr_array(cdata%thrd_no)%p, &
                  dv_ofdcol=dv_ofdcol_158_ptr_array(cdata%thrd_no)%p,du3_ogwcol=du3_ogwcol_180_ptr_array(cdata%thrd_no)%p, &
                  dv3_ogwcol=dv3_ogwcol_181_ptr_array(cdata%thrd_no)%p,du3_oblcol=du3_oblcol_182_ptr_array(cdata%thrd_no)%p, &
                  dv3_oblcol=dv3_oblcol_183_ptr_array(cdata%thrd_no)%p,du3_osscol=du3_osscol_184_ptr_array(cdata%thrd_no)%p, &
                  dv3_osscol=dv3_osscol_185_ptr_array(cdata%thrd_no)%p,du3_ofdcol=du3_ofdcol_186_ptr_array(cdata%thrd_no)%p, &
                  dv3_ofdcol=dv3_ofdcol_187_ptr_array(cdata%thrd_no)%p,errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)


      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dudt_obl_147_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvdt_obl_148_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dudt_ofd_155_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvdt_ofd_156_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvdt_ogw_144_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dudt_oss_151_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dvdt_oss_152_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(du3dt_mtb_164_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(du3dt_ogw_165_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(du3dt_tms_166_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(du3dt_ngw_167_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(dv3dt_ngw_168_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        nullify(dudt_ngw_159_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        nullify(dvdt_ngw_160_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp .or. physics%model%do_ugwp_v0 .or. physics%model%do_ugwp_v0_nst_only .or. physics%model%do_ugwp_v1)) then
        nullify(dtdt_ngw_161_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(ldu3dt_ngw_169_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(ldv3dt_ngw_170_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(ldt3dt_ngw_171_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(dws3dt_ogw_172_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(dws3dt_obl_173_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(dws3dt_oss_174_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(dws3dt_ofd_175_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(ldu3dt_ogw_176_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(ldu3dt_obl_177_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(ldu3dt_oss_178_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag_ugwp)) then
        nullify(ldu3dt_ofd_179_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(du_ogwcol_145_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dv_ogwcol_146_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(du_oblcol_149_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dv_oblcol_150_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(du_osscol_153_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dv_osscol_154_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(du_ofdcol_157_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dv_ofdcol_158_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(du3_ogwcol_180_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dv3_ogwcol_181_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(du3_oblcol_182_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dv3_oblcol_183_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(du3_osscol_184_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dv3_osscol_185_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(du3_ofdcol_186_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1 .or. physics%model%ldiag_ugwp)) then
        nullify(dv3_ofdcol_187_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in ugwpv1_gsldrag_post_run: " // trim(cdata%errmsg)
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

    



   end function scm_gfs_v17_p8_ugwpv1_phys_ps_run_cap

   function scm_gfs_v17_p8_ugwpv1_phys_ps_final_cap(one,physics,cdata) result(ierr)

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

      


      call noahmpdrv_finalize(land_iau_control=physics%sfcprop%land_iau_control,land_iau_data=physics%sfcprop%land_iau_data, &
                  land_iau_state=physics%sfcprop%land_iau_state,errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in noahmpdrv_finalize: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      


      call ugwpv1_gsldrag_finalize(errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in ugwpv1_gsldrag_finalize: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized = .false.


   end function scm_gfs_v17_p8_ugwpv1_phys_ps_final_cap

end module ccpp_scm_gfs_v17_p8_ugwpv1_phys_ps_cap
