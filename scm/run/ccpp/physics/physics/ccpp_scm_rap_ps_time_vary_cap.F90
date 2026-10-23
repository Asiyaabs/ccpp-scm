
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
!! @brief Auto-generated cap module for the CCPP time_vary group
!!
!
module ccpp_scm_rap_ps_time_vary_cap

   use gfs_time_vary_pre, only: gfs_time_vary_pre_timestep_init
   use gfs_rrtmg_setup, only: gfs_rrtmg_setup_timestep_init
   use gfs_rad_time_vary, only: gfs_rad_time_vary_timestep_init
   use gfs_phys_time_vary, only: gfs_phys_time_vary_timestep_init
   use gfs_time_vary_pre, only: gfs_time_vary_pre_init
   use gfs_rrtmg_setup, only: gfs_rrtmg_setup_init
   use gfs_phys_time_vary, only: gfs_phys_time_vary_init
   use gfs_time_vary_pre, only: gfs_time_vary_pre_finalize
   use gfs_rrtmg_setup, only: gfs_rrtmg_setup_finalize
   use gfs_phys_time_vary, only: gfs_phys_time_vary_finalize


   implicit none

   private
   public :: scm_rap_ps_time_vary_tsinit_cap, &
             scm_rap_ps_time_vary_tsfinal_cap, &
             scm_rap_ps_time_vary_init_cap, &
             scm_rap_ps_time_vary_run_cap, &
             scm_rap_ps_time_vary_final_cap

   logical, dimension(200), save :: initialized = .false.

   contains

   function scm_rap_ps_time_vary_tsinit_cap(one,physics,cdata,con_pi) result(ierr)

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
      type :: integer_default_kind_rank2_ptr_arr_type
         integer, dimension(:,:), pointer :: p => null()
      end type integer_default_kind_rank2_ptr_arr_type
      type(integer_default_kind_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rseeds_1_ptr_array
      type :: integer_default_kind_rank1_ptr_arr_type
         integer, dimension(:), pointer :: p => null()
      end type integer_default_kind_rank1_ptr_arr_type
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: icsdsw_2_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: icsdlw_3_ptr_array
      type :: real_kind_phys_rank1_ptr_arr_type
         real(kind_phys), dimension(:), pointer :: p => null()
      end type real_kind_phys_rank1_ptr_arr_type
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ps_2delt_4_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ps_1delt_5_ptr_array
      type :: real_kind_phys_rank2_ptr_arr_type
         real(kind_phys), dimension(:,:), pointer :: p => null()
      end type real_kind_phys_rank2_ptr_arr_type
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: t_2delt_6_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: t_1delt_7_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qv_2delt_8_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qv_1delt_9_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx1_o3_10_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx2_o3_11_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddy_o3_12_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx1_h_13_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx2_h_14_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddy_h_15_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx1_aer_16_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx2_aer_17_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddy_aer_18_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: iindx1_aer_19_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: iindx2_aer_20_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddx_aer_21_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx1_ci_22_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx2_ci_23_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddy_ci_24_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: iindx1_ci_25_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: iindx2_ci_26_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddx_ci_27_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx1_tau_28_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx2_tau_29_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddy_j1tau_30_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddy_j2tau_31_ptr_array

      ierr = 0


      if (.not.initialized(cdata%ccpp_instance)) then
        write(cdata%errmsg,'(*(a))') 'time_vary_timestep_init called before time_vary_init'
        cdata%errflg = 1
        return
      end if



      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      


      call gfs_time_vary_pre_timestep_init(jdat=physics%model%jdat(one:8),idat=physics%model%idat(one:8),dtp=physics%model%dtp, &
                  nsswr=physics%model%nsswr,nslwr=physics%model%nslwr,idate=physics%model%idate(one:4), &
                  debug=physics%model%debug,me=physics%model%me,master=physics%model%master, &
                  nscyc=physics%model%nscyc,sec=physics%model%sec,phour=physics%model%phour, &
                  zhour=physics%model%zhour,fhour=physics%model%fhour,kdt=physics%model%kdt, &
                  julian=physics%model%julian,yearlen=physics%model%yearlen,ipt=physics%model%ipt, &
                  lprnt=physics%model%lprnt,lssav=physics%model%lssav,lsswr=physics%model%lsswr, &
                  lslwr=physics%model%lslwr,solhr=physics%model%solhr,tgrs=physics%statein%tgrs(one:physics%model%ncols,one:physics%model%levs), &
                  ugrs=physics%statein%ugrs(one:physics%model%ncols,one:physics%model%levs), &
                  vgrs=physics%statein%vgrs(one:physics%model%ncols,one:physics%model%levs), &
                  qgrs=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,one:physics%model%ntrac), &
                  gt0=physics%stateout%gt0(one:physics%model%ncols,one:physics%model%levs), &
                  gu0=physics%stateout%gu0(one:physics%model%ncols,one:physics%model%levs), &
                  gv0=physics%stateout%gv0(one:physics%model%ncols,one:physics%model%levs), &
                  gq0=physics%stateout%gq0(one:physics%model%ncols,one:physics%model%levs,one:physics%model%ntrac), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_time_vary_pre_timestep_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call gfs_rrtmg_setup_timestep_init(idate=physics%model%idat(one:8),jdate=physics%model%jdat(one:8),deltsw=physics%model%fhswr, &
                  deltim=physics%model%dtf,lsswr=physics%model%lsswr,mpicomm=physics%model%communicator, &
                  mpirank=physics%model%me,mpiroot=physics%model%master,iaermdl=physics%model%iaermdl, &
                  iaerflg=physics%model%iaerflg,isol=physics%model%isol,aeros_file=physics%model%aeros_file, &
                  co2dat_file=physics%model%co2dat_file,co2gbl_file=physics%model%co2gbl_file, &
                  ictm=physics%model%ictm,ico2=physics%model%ico2,ntoz=physics%model%ntoz, &
                  ozphys=physics%model%ozphys,con_pi=con_pi,slag=physics%model%slag,sdec=physics%model%sdec, &
                  cdec=physics%model%cdec,solcon=physics%model%solcon,errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_rrtmg_setup_timestep_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if (((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2) .and. physics%model%lrseeds)) then
        rseeds_1_ptr_array(cdata%thrd_no)%p => physics%tbd%rseeds(one:physics%model%ncols,one:physics%model%nrstreams)
      end if

      if ((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2)) then
        icsdsw_2_ptr_array(cdata%thrd_no)%p => physics%tbd%icsdsw(one:physics%model%ncols)
      end if

      if ((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2)) then
        icsdlw_3_ptr_array(cdata%thrd_no)%p => physics%tbd%icsdlw(one:physics%model%ncols)
      end if

      if ((physics%model%nps2delt > 0)) then
        ps_2delt_4_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f2d(one:physics%model%ncols,physics%model%nps2delt)
      end if

      if ((physics%model%npsdelt > 0)) then
        ps_1delt_5_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f2d(one:physics%model%ncols,physics%model%npsdelt)
      end if

      if ((physics%model%nt2delt > 0)) then
        t_2delt_6_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(one:physics%model%ncols,one:physics%model%levs,physics%model%nt2delt)
      end if

      if ((physics%model%ntdelt > 0)) then
        t_1delt_7_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(one:physics%model%ncols,one:physics%model%levs,physics%model%ntdelt)
      end if

      if ((physics%model%nqv2delt > 0)) then
        qv_2delt_8_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(one:physics%model%ncols,one:physics%model%levs,physics%model%nqv2delt)
      end if

      if ((physics%model%nqvdelt > 0)) then
        qv_1delt_9_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(one:physics%model%ncols,one:physics%model%levs,physics%model%nqvdelt)
      end if

      call gfs_rad_time_vary_timestep_init(lrseeds=physics%model%lrseeds,rseeds=rseeds_1_ptr_array(cdata%thrd_no)%p, &
                  lslwr=physics%model%lslwr,lsswr=physics%model%lsswr,isubc_lw=physics%model%isubc_lw, &
                  isubc_sw=physics%model%isubc_sw,icsdsw=icsdsw_2_ptr_array(cdata%thrd_no)%p, &
                  icsdlw=icsdlw_3_ptr_array(cdata%thrd_no)%p,cnx=physics%model%cnx,cny=physics%model%cny, &
                  isc=physics%model%isc,jsc=physics%model%jsc,imap=physics%tbd%imap(one:physics%model%ncols), &
                  jmap=physics%tbd%jmap(one:physics%model%ncols),sec=physics%model%sec,kdt=physics%model%kdt, &
                  imp_physics=physics%model%imp_physics,ipsd0=physics%model%ipsd0,ipsdlim=physics%model%ipsdlim, &
                  ps_2delt=ps_2delt_4_ptr_array(cdata%thrd_no)%p,ps_1delt=ps_1delt_5_ptr_array(cdata%thrd_no)%p, &
                  t_2delt=t_2delt_6_ptr_array(cdata%thrd_no)%p,t_1delt=t_1delt_7_ptr_array(cdata%thrd_no)%p, &
                  qv_2delt=qv_2delt_8_ptr_array(cdata%thrd_no)%p,qv_1delt=qv_1delt_9_ptr_array(cdata%thrd_no)%p, &
                  t=physics%statein%tgrs(one:physics%model%ncols,one:physics%model%levs), &
                  qv=physics%statein%qgrs(one:physics%model%ncols,one:physics%model%levs,physics%model%ntqv), &
                  ps=physics%statein%prsi(one:physics%model%ncols,1),errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)


      if (((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2) .and. physics%model%lrseeds)) then
        nullify(rseeds_1_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2)) then
        nullify(icsdsw_2_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2)) then
        nullify(icsdlw_3_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nps2delt > 0)) then
        nullify(ps_2delt_4_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%npsdelt > 0)) then
        nullify(ps_1delt_5_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nt2delt > 0)) then
        nullify(t_2delt_6_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntdelt > 0)) then
        nullify(t_1delt_7_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nqv2delt > 0)) then
        nullify(qv_2delt_8_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nqvdelt > 0)) then
        nullify(qv_1delt_9_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_rad_time_vary_timestep_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ntoz>0)) then
        jindx1_o3_10_ptr_array(cdata%thrd_no)%p => physics%grid%jindx1_o3(one:physics%model%ncols)
      end if

      if ((physics%model%ntoz>0)) then
        jindx2_o3_11_ptr_array(cdata%thrd_no)%p => physics%grid%jindx2_o3(one:physics%model%ncols)
      end if

      if ((physics%model%ntoz>0)) then
        ddy_o3_12_ptr_array(cdata%thrd_no)%p => physics%grid%ddy_o3(one:physics%model%ncols)
      end if

      if ((physics%model%h2o_phys)) then
        jindx1_h_13_ptr_array(cdata%thrd_no)%p => physics%grid%jindx1_h(one:physics%model%ncols)
      end if

      if ((physics%model%h2o_phys)) then
        jindx2_h_14_ptr_array(cdata%thrd_no)%p => physics%grid%jindx2_h(one:physics%model%ncols)
      end if

      if ((physics%model%h2o_phys)) then
        ddy_h_15_ptr_array(cdata%thrd_no)%p => physics%grid%ddy_h(one:physics%model%ncols)
      end if

      if ((physics%model%iaerclm)) then
        jindx1_aer_16_ptr_array(cdata%thrd_no)%p => physics%grid%jindx1_aer(one:physics%model%ncols)
      end if

      if ((physics%model%iaerclm)) then
        jindx2_aer_17_ptr_array(cdata%thrd_no)%p => physics%grid%jindx2_aer(one:physics%model%ncols)
      end if

      if ((physics%model%iaerclm)) then
        ddy_aer_18_ptr_array(cdata%thrd_no)%p => physics%grid%ddy_aer(one:physics%model%ncols)
      end if

      if ((physics%model%iaerclm)) then
        iindx1_aer_19_ptr_array(cdata%thrd_no)%p => physics%grid%iindx1_aer(one:physics%model%ncols)
      end if

      if ((physics%model%iaerclm)) then
        iindx2_aer_20_ptr_array(cdata%thrd_no)%p => physics%grid%iindx2_aer(one:physics%model%ncols)
      end if

      if ((physics%model%iaerclm)) then
        ddx_aer_21_ptr_array(cdata%thrd_no)%p => physics%grid%ddx_aer(one:physics%model%ncols)
      end if

      if ((physics%model%iccn==1)) then
        jindx1_ci_22_ptr_array(cdata%thrd_no)%p => physics%grid%jindx1_ci(one:physics%model%ncols)
      end if

      if ((physics%model%iccn==1)) then
        jindx2_ci_23_ptr_array(cdata%thrd_no)%p => physics%grid%jindx2_ci(one:physics%model%ncols)
      end if

      if ((physics%model%iccn==1)) then
        ddy_ci_24_ptr_array(cdata%thrd_no)%p => physics%grid%ddy_ci(one:physics%model%ncols)
      end if

      if ((physics%model%iccn==1)) then
        iindx1_ci_25_ptr_array(cdata%thrd_no)%p => physics%grid%iindx1_ci(one:physics%model%ncols)
      end if

      if ((physics%model%iccn==1)) then
        iindx2_ci_26_ptr_array(cdata%thrd_no)%p => physics%grid%iindx2_ci(one:physics%model%ncols)
      end if

      if ((physics%model%iccn==1)) then
        ddx_ci_27_ptr_array(cdata%thrd_no)%p => physics%grid%ddx_ci(one:physics%model%ncols)
      end if

      if ((physics%model%do_ugwp_v1)) then
        jindx1_tau_28_ptr_array(cdata%thrd_no)%p => physics%grid%jindx1_tau(one:physics%model%ncols)
      end if

      if ((physics%model%do_ugwp_v1)) then
        jindx2_tau_29_ptr_array(cdata%thrd_no)%p => physics%grid%jindx2_tau(one:physics%model%ncols)
      end if

      if ((physics%model%do_ugwp_v1)) then
        ddy_j1tau_30_ptr_array(cdata%thrd_no)%p => physics%grid%ddy_j1tau(one:physics%model%ncols)
      end if

      if ((physics%model%do_ugwp_v1)) then
        ddy_j2tau_31_ptr_array(cdata%thrd_no)%p => physics%grid%ddy_j2tau(one:physics%model%ncols)
      end if

      call gfs_phys_time_vary_timestep_init(mpicomm=physics%model%communicator,mpirank=physics%model%me,mpiroot=physics%model%master, &
                  cnx=physics%model%cnx,cny=physics%model%cny,isc=physics%model%isc,jsc=physics%model%jsc, &
                  nrcm=physics%model%nrcm,im=physics%model%ncols,levs=physics%model%levs, &
                  kdt=physics%model%kdt,idate=physics%model%idate(one:4),nsswr=physics%model%nsswr, &
                  fhswr=physics%model%fhswr,lsswr=physics%model%lsswr,fhour=physics%model%fhour, &
                  imfdeepcnv=physics%model%imfdeepcnv,cal_pre=physics%model%cal_pre,random_clds=physics%model%random_clds, &
                  ntoz=physics%model%ntoz,h2o_phys=physics%model%h2o_phys,iaerclm=physics%model%iaerclm, &
                  iaermdl=physics%model%iaermdl,iccn=physics%model%iccn,clstp=physics%model%clstp, &
                  jindx1_o3=jindx1_o3_10_ptr_array(cdata%thrd_no)%p,jindx2_o3=jindx2_o3_11_ptr_array(cdata%thrd_no)%p, &
                  ddy_o3=ddy_o3_12_ptr_array(cdata%thrd_no)%p,ozpl=physics%tbd%ozpl(one:physics%model%ncols,one:physics%model%levozp,one:physics%model%oz_coeff), &
                  jindx1_h=jindx1_h_13_ptr_array(cdata%thrd_no)%p,jindx2_h=jindx2_h_14_ptr_array(cdata%thrd_no)%p, &
                  ddy_h=ddy_h_15_ptr_array(cdata%thrd_no)%p,h2opl=physics%tbd%h2opl(one:physics%model%ncols,one:physics%model%levh2o,one:physics%model%h2o_coeff), &
                  iflip=physics%model%iflip,jindx1_aer=jindx1_aer_16_ptr_array(cdata%thrd_no)%p, &
                  jindx2_aer=jindx2_aer_17_ptr_array(cdata%thrd_no)%p,ddy_aer=ddy_aer_18_ptr_array(cdata%thrd_no)%p, &
                  iindx1_aer=iindx1_aer_19_ptr_array(cdata%thrd_no)%p,iindx2_aer=iindx2_aer_20_ptr_array(cdata%thrd_no)%p, &
                  ddx_aer=ddx_aer_21_ptr_array(cdata%thrd_no)%p,aer_nm=physics%tbd%aer_nm(one:physics%model%ncols,one:physics%model%levs,one:physics%model%ntrcaer), &
                  jindx1_ci=jindx1_ci_22_ptr_array(cdata%thrd_no)%p,jindx2_ci=jindx2_ci_23_ptr_array(cdata%thrd_no)%p, &
                  ddy_ci=ddy_ci_24_ptr_array(cdata%thrd_no)%p,iindx1_ci=iindx1_ci_25_ptr_array(cdata%thrd_no)%p, &
                  iindx2_ci=iindx2_ci_26_ptr_array(cdata%thrd_no)%p,ddx_ci=ddx_ci_27_ptr_array(cdata%thrd_no)%p, &
                  in_nm=physics%tbd%in_nm(one:physics%model%ncols,one:physics%model%levs), &
                  ccn_nm=physics%tbd%ccn_nm(one:physics%model%ncols,one:physics%model%levs), &
                  imap=physics%tbd%imap(one:physics%model%ncols),jmap=physics%tbd%jmap(one:physics%model%ncols), &
                  prsl=physics%statein%prsl(one:physics%model%ncols,one:physics%model%levs), &
                  seed0=physics%model%seed0,rann=physics%tbd%rann(one:physics%model%ncols,one:physics%model%nrcm), &
                  nthrds=physics%model%nthreads,do_ugwp_v1=physics%model%do_ugwp_v1,jindx1_tau=jindx1_tau_28_ptr_array(cdata%thrd_no)%p, &
                  jindx2_tau=jindx2_tau_29_ptr_array(cdata%thrd_no)%p,ddy_j1tau=ddy_j1tau_30_ptr_array(cdata%thrd_no)%p, &
                  ddy_j2tau=ddy_j2tau_31_ptr_array(cdata%thrd_no)%p,tau_amf=physics%tbd%tau_amf(one:physics%model%ncols), &
                  ozphys=physics%model%ozphys,h2ophys=physics%model%h2ophys,is_initialized=physics%model%gfs_phys_time_vary_is_init, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ntoz>0)) then
        nullify(jindx1_o3_10_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntoz>0)) then
        nullify(jindx2_o3_11_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntoz>0)) then
        nullify(ddy_o3_12_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%h2o_phys)) then
        nullify(jindx1_h_13_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%h2o_phys)) then
        nullify(jindx2_h_14_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%h2o_phys)) then
        nullify(ddy_h_15_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iaerclm)) then
        nullify(jindx1_aer_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iaerclm)) then
        nullify(jindx2_aer_17_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iaerclm)) then
        nullify(ddy_aer_18_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iaerclm)) then
        nullify(iindx1_aer_19_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iaerclm)) then
        nullify(iindx2_aer_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iaerclm)) then
        nullify(ddx_aer_21_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iccn==1)) then
        nullify(jindx1_ci_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iccn==1)) then
        nullify(jindx2_ci_23_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iccn==1)) then
        nullify(ddy_ci_24_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iccn==1)) then
        nullify(iindx1_ci_25_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iccn==1)) then
        nullify(iindx2_ci_26_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iccn==1)) then
        nullify(ddx_ci_27_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1)) then
        nullify(jindx1_tau_28_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1)) then
        nullify(jindx2_tau_29_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1)) then
        nullify(ddy_j1tau_30_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1)) then
        nullify(ddy_j2tau_31_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_phys_time_vary_timestep_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    



   end function scm_rap_ps_time_vary_tsinit_cap

   function scm_rap_ps_time_vary_tsfinal_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_rap_ps_time_vary_tsfinal_cap

   function scm_rap_ps_time_vary_init_cap(one,physics,cdata,con_solr_2008,con_solr_2002,con_pi,con_c,con_plnk,con_boltz, &
                  con_t0c,con_rd,con_g,ltp,con_zero) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t
      use machine, only: kind_phys

      implicit none

      ! Error handling
      integer :: ierr

      integer, intent(in), target :: one
      type(physics_type), intent(inout), target :: physics
      type(ccpp_t), intent(inout), target :: cdata
      real(kind_phys), intent(in), target :: con_solr_2008
      real(kind_phys), intent(in), target :: con_solr_2002
      real(kind_phys), intent(in), target :: con_pi
      real(kind_phys), intent(in), target :: con_c
      real(kind_phys), intent(in), target :: con_plnk
      real(kind_phys), intent(in), target :: con_boltz
      real(kind_phys), intent(in), target :: con_t0c
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: con_g
      integer, intent(in), target :: ltp
      integer, intent(in), target :: con_zero
      
      ! Local variables/pointers for unit conversions, array transformations, ...
      type :: integer_default_kind_rank1_ptr_arr_type
         integer, dimension(:), pointer :: p => null()
      end type integer_default_kind_rank1_ptr_arr_type
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx1_o3_1_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx2_o3_2_ptr_array
      type :: real_kind_phys_rank1_ptr_arr_type
         real(kind_phys), dimension(:), pointer :: p => null()
      end type real_kind_phys_rank1_ptr_arr_type
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddy_o3_3_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx1_h_4_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx2_h_5_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddy_h_6_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx1_aer_7_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx2_aer_8_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddy_aer_9_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: iindx1_aer_10_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: iindx2_aer_11_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddx_aer_12_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx1_ci_13_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx2_ci_14_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddy_ci_15_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: iindx1_ci_16_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: iindx2_ci_17_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddx_ci_18_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx1_tau_19_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: jindx2_tau_20_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddy_j1tau_21_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ddy_j2tau_22_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tvxy_23_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tgxy_24_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tahxy_25_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: canicexy_26_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: canliqxy_27_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: eahxy_28_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cmxy_29_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: chxy_30_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fwetxy_31_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sneqvoxy_32_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: alboldxy_33_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qsnowxy_34_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wslakexy_35_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: taussxy_36_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: waxy_37_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wtxy_38_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: zwtxy_39_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: xlaixy_40_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: xsaixy_41_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lfmassxy_42_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: stmassxy_43_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rtmassxy_44_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: woodxy_45_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: stblcpxy_46_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fastcpxy_47_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smcwtdxy_48_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: deeprechxy_49_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: rechxy_50_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albdvis_ice_51_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albdnir_ice_52_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albivis_ice_53_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albinir_ice_54_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snowxy_55_ptr_array
      type :: real_kind_phys_rank2_ptr_arr_type
         real(kind_phys), dimension(:,:), pointer :: p => null()
      end type real_kind_phys_rank2_ptr_arr_type
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snicexy_56_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: snliqxy_57_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: tsnoxy_58_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: smoiseq_59_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: zsnsoxy_60_ptr_array

      ierr = 0


      if (initialized(cdata%ccpp_instance)) return



      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      


      call gfs_time_vary_pre_init(errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_time_vary_pre_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call gfs_rrtmg_setup_init(si=physics%model%si(one:physics%model%levsp1),levr=physics%model%levr,ictm=physics%model%ictm, &
                  isol=physics%model%isol,solar_file=physics%model%solar_file,con_solr_2008=con_solr_2008, &
                  con_solr_2002=con_solr_2002,ico2=physics%model%ico2,iaer=physics%model%iaer, &
                  ntcw=physics%model%ntcw,num_p3d=physics%model%num_p3d,npdf3d=physics%model%npdf3d, &
                  ntoz=physics%model%ntoz,iovr=physics%model%iovr,iovr_exp=physics%model%iovr_exp, &
                  iovr_exprand=physics%model%iovr_exprand,iovr_max=physics%model%iovr_max, &
                  iovr_rand=physics%model%iovr_rand,iovr_maxrand=physics%model%iovr_maxrand, &
                  iovr_dcorr=physics%model%iovr_dcorr,isubcsw=physics%model%isubc_sw,isubclw=physics%model%isubc_lw, &
                  iswmode=physics%model%iswmode,icliq_sw=physics%model%icliq_sw,lcrick=physics%model%lcrick, &
                  lcnorm=physics%model%lcnorm,imp_physics=physics%model%imp_physics,lnoprec=physics%model%lnoprec, &
                  idate=physics%model%idate(one:4),iflip=physics%model%iflip,do_rrtmgp=physics%model%do_rrtmgp, &
                  mpicomm=physics%model%communicator,mpirank=physics%model%me,mpiroot=physics%model%master, &
                  aeros_file=physics%model%aeros_file,co2usr_file=physics%model%co2usr_file, &
                  co2cyc_file=physics%model%co2cyc_file,rad_hr_units=physics%model%rad_hr_units, &
                  inc_minor_gas=physics%model%inc_minor_gas,icliq_lw=physics%model%icliq_lw, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,lalw1bd=physics%model%lalw1bd,ltp=ltp,lextop=physics%model%lextop, &
                  ipsd0=physics%model%ipsd0,iaermdl=physics%model%iaermdl,iaerflg=physics%model%iaerflg, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_rrtmg_setup_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ntoz>0)) then
        jindx1_o3_1_ptr_array(cdata%thrd_no)%p => physics%grid%jindx1_o3(one:physics%model%ncols)
      end if

      if ((physics%model%ntoz>0)) then
        jindx2_o3_2_ptr_array(cdata%thrd_no)%p => physics%grid%jindx2_o3(one:physics%model%ncols)
      end if

      if ((physics%model%ntoz>0)) then
        ddy_o3_3_ptr_array(cdata%thrd_no)%p => physics%grid%ddy_o3(one:physics%model%ncols)
      end if

      if ((physics%model%h2o_phys)) then
        jindx1_h_4_ptr_array(cdata%thrd_no)%p => physics%grid%jindx1_h(one:physics%model%ncols)
      end if

      if ((physics%model%h2o_phys)) then
        jindx2_h_5_ptr_array(cdata%thrd_no)%p => physics%grid%jindx2_h(one:physics%model%ncols)
      end if

      if ((physics%model%h2o_phys)) then
        ddy_h_6_ptr_array(cdata%thrd_no)%p => physics%grid%ddy_h(one:physics%model%ncols)
      end if

      if ((physics%model%iaerclm)) then
        jindx1_aer_7_ptr_array(cdata%thrd_no)%p => physics%grid%jindx1_aer(one:physics%model%ncols)
      end if

      if ((physics%model%iaerclm)) then
        jindx2_aer_8_ptr_array(cdata%thrd_no)%p => physics%grid%jindx2_aer(one:physics%model%ncols)
      end if

      if ((physics%model%iaerclm)) then
        ddy_aer_9_ptr_array(cdata%thrd_no)%p => physics%grid%ddy_aer(one:physics%model%ncols)
      end if

      if ((physics%model%iaerclm)) then
        iindx1_aer_10_ptr_array(cdata%thrd_no)%p => physics%grid%iindx1_aer(one:physics%model%ncols)
      end if

      if ((physics%model%iaerclm)) then
        iindx2_aer_11_ptr_array(cdata%thrd_no)%p => physics%grid%iindx2_aer(one:physics%model%ncols)
      end if

      if ((physics%model%iaerclm)) then
        ddx_aer_12_ptr_array(cdata%thrd_no)%p => physics%grid%ddx_aer(one:physics%model%ncols)
      end if

      if ((physics%model%iccn==1)) then
        jindx1_ci_13_ptr_array(cdata%thrd_no)%p => physics%grid%jindx1_ci(one:physics%model%ncols)
      end if

      if ((physics%model%iccn==1)) then
        jindx2_ci_14_ptr_array(cdata%thrd_no)%p => physics%grid%jindx2_ci(one:physics%model%ncols)
      end if

      if ((physics%model%iccn==1)) then
        ddy_ci_15_ptr_array(cdata%thrd_no)%p => physics%grid%ddy_ci(one:physics%model%ncols)
      end if

      if ((physics%model%iccn==1)) then
        iindx1_ci_16_ptr_array(cdata%thrd_no)%p => physics%grid%iindx1_ci(one:physics%model%ncols)
      end if

      if ((physics%model%iccn==1)) then
        iindx2_ci_17_ptr_array(cdata%thrd_no)%p => physics%grid%iindx2_ci(one:physics%model%ncols)
      end if

      if ((physics%model%iccn==1)) then
        ddx_ci_18_ptr_array(cdata%thrd_no)%p => physics%grid%ddx_ci(one:physics%model%ncols)
      end if

      if ((physics%model%do_ugwp_v1)) then
        jindx1_tau_19_ptr_array(cdata%thrd_no)%p => physics%grid%jindx1_tau(one:physics%model%ncols)
      end if

      if ((physics%model%do_ugwp_v1)) then
        jindx2_tau_20_ptr_array(cdata%thrd_no)%p => physics%grid%jindx2_tau(one:physics%model%ncols)
      end if

      if ((physics%model%do_ugwp_v1)) then
        ddy_j1tau_21_ptr_array(cdata%thrd_no)%p => physics%grid%ddy_j1tau(one:physics%model%ncols)
      end if

      if ((physics%model%do_ugwp_v1)) then
        ddy_j2tau_22_ptr_array(cdata%thrd_no)%p => physics%grid%ddy_j2tau(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        tvxy_23_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tvxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        tgxy_24_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tgxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        tahxy_25_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tahxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        canicexy_26_ptr_array(cdata%thrd_no)%p => physics%sfcprop%canicexy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        canliqxy_27_ptr_array(cdata%thrd_no)%p => physics%sfcprop%canliqxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        eahxy_28_ptr_array(cdata%thrd_no)%p => physics%sfcprop%eahxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        cmxy_29_ptr_array(cdata%thrd_no)%p => physics%sfcprop%cmxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        chxy_30_ptr_array(cdata%thrd_no)%p => physics%sfcprop%chxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        fwetxy_31_ptr_array(cdata%thrd_no)%p => physics%sfcprop%fwetxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        sneqvoxy_32_ptr_array(cdata%thrd_no)%p => physics%sfcprop%sneqvoxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        alboldxy_33_ptr_array(cdata%thrd_no)%p => physics%sfcprop%alboldxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        qsnowxy_34_ptr_array(cdata%thrd_no)%p => physics%sfcprop%qsnowxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        wslakexy_35_ptr_array(cdata%thrd_no)%p => physics%sfcprop%wslakexy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        taussxy_36_ptr_array(cdata%thrd_no)%p => physics%sfcprop%taussxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        waxy_37_ptr_array(cdata%thrd_no)%p => physics%sfcprop%waxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        wtxy_38_ptr_array(cdata%thrd_no)%p => physics%sfcprop%wtxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        zwtxy_39_ptr_array(cdata%thrd_no)%p => physics%sfcprop%zwtxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noah .or. physics%model%lsm == physics%model%lsm_noahmp .or. physics%model%lsm == physics%model%lsm_ruc)) then
        xlaixy_40_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xlaixy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        xsaixy_41_ptr_array(cdata%thrd_no)%p => physics%sfcprop%xsaixy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        lfmassxy_42_ptr_array(cdata%thrd_no)%p => physics%sfcprop%lfmassxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        stmassxy_43_ptr_array(cdata%thrd_no)%p => physics%sfcprop%stmassxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        rtmassxy_44_ptr_array(cdata%thrd_no)%p => physics%sfcprop%rtmassxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        woodxy_45_ptr_array(cdata%thrd_no)%p => physics%sfcprop%woodxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        stblcpxy_46_ptr_array(cdata%thrd_no)%p => physics%sfcprop%stblcpxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        fastcpxy_47_ptr_array(cdata%thrd_no)%p => physics%sfcprop%fastcpxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        smcwtdxy_48_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smcwtdxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        deeprechxy_49_ptr_array(cdata%thrd_no)%p => physics%sfcprop%deeprechxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        rechxy_50_ptr_array(cdata%thrd_no)%p => physics%sfcprop%rechxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albdvis_ice_51_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdirvis_ice(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albdnir_ice_52_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdirnir_ice(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albivis_ice_53_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdifvis_ice(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albinir_ice_54_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdifnir_ice(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        snowxy_55_ptr_array(cdata%thrd_no)%p => physics%sfcprop%snowxy(one:physics%model%ncols)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        snicexy_56_ptr_array(cdata%thrd_no)%p => physics%sfcprop%snicexy(one:physics%model%ncols,physics%model%lsnow_lsm_lbound:physics%model%lsnow_lsm_ubound)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        snliqxy_57_ptr_array(cdata%thrd_no)%p => physics%sfcprop%snliqxy(one:physics%model%ncols,physics%model%lsnow_lsm_lbound:physics%model%lsnow_lsm_ubound)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        tsnoxy_58_ptr_array(cdata%thrd_no)%p => physics%sfcprop%tsnoxy(one:physics%model%ncols,physics%model%lsnow_lsm_lbound:physics%model%lsnow_lsm_ubound)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        smoiseq_59_ptr_array(cdata%thrd_no)%p => physics%sfcprop%smoiseq(one:physics%model%ncols,one:physics%model%lsoil_lsm)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        zsnsoxy_60_ptr_array(cdata%thrd_no)%p => physics%sfcprop%zsnsoxy(one:physics%model%ncols,physics%model%lsnow_lsm_lbound:physics%model%lsoil_lsm)
      end if

      call gfs_phys_time_vary_init(mpicomm=physics%model%communicator,mpirank=physics%model%me,mpiroot=physics%model%master, &
                  ntoz=physics%model%ntoz,h2o_phys=physics%model%h2o_phys,iaerclm=physics%model%iaerclm, &
                  iaermdl=physics%model%iaermdl,iccn=physics%model%iccn,iflip=physics%model%iflip, &
                  im=physics%model%ncols,levs=physics%model%levs,nx=physics%model%nx,ny=physics%model%ny, &
                  idate=physics%model%idate(one:4),xlat_d=physics%grid%xlat_d(one:physics%model%ncols), &
                  xlon_d=physics%grid%xlon_d(one:physics%model%ncols),jindx1_o3=jindx1_o3_1_ptr_array(cdata%thrd_no)%p, &
                  jindx2_o3=jindx2_o3_2_ptr_array(cdata%thrd_no)%p,ddy_o3=ddy_o3_3_ptr_array(cdata%thrd_no)%p, &
                  jindx1_h=jindx1_h_4_ptr_array(cdata%thrd_no)%p,jindx2_h=jindx2_h_5_ptr_array(cdata%thrd_no)%p, &
                  ddy_h=ddy_h_6_ptr_array(cdata%thrd_no)%p,h2opl=physics%tbd%h2opl(one:physics%model%ncols,one:physics%model%levh2o,one:physics%model%h2o_coeff), &
                  fhour=physics%model%fhour,jindx1_aer=jindx1_aer_7_ptr_array(cdata%thrd_no)%p, &
                  jindx2_aer=jindx2_aer_8_ptr_array(cdata%thrd_no)%p,ddy_aer=ddy_aer_9_ptr_array(cdata%thrd_no)%p, &
                  iindx1_aer=iindx1_aer_10_ptr_array(cdata%thrd_no)%p,iindx2_aer=iindx2_aer_11_ptr_array(cdata%thrd_no)%p, &
                  ddx_aer=ddx_aer_12_ptr_array(cdata%thrd_no)%p,aer_nm=physics%tbd%aer_nm(one:physics%model%ncols,one:physics%model%levs,one:physics%model%ntrcaer), &
                  jindx1_ci=jindx1_ci_13_ptr_array(cdata%thrd_no)%p,jindx2_ci=jindx2_ci_14_ptr_array(cdata%thrd_no)%p, &
                  ddy_ci=ddy_ci_15_ptr_array(cdata%thrd_no)%p,iindx1_ci=iindx1_ci_16_ptr_array(cdata%thrd_no)%p, &
                  iindx2_ci=iindx2_ci_17_ptr_array(cdata%thrd_no)%p,ddx_ci=ddx_ci_18_ptr_array(cdata%thrd_no)%p, &
                  imap=physics%tbd%imap(one:physics%model%ncols),jmap=physics%tbd%jmap(one:physics%model%ncols), &
                  do_ugwp_v1=physics%model%do_ugwp_v1,jindx1_tau=jindx1_tau_19_ptr_array(cdata%thrd_no)%p, &
                  jindx2_tau=jindx2_tau_20_ptr_array(cdata%thrd_no)%p,ddy_j1tau=ddy_j1tau_21_ptr_array(cdata%thrd_no)%p, &
                  ddy_j2tau=ddy_j2tau_22_ptr_array(cdata%thrd_no)%p,isot=physics%model%isot, &
                  ivegsrc=physics%model%ivegsrc,nlunit=physics%model%nlunit,sncovr=physics%sfcprop%sncovr(one:physics%model%ncols), &
                  sncovr_ice=physics%sfcprop%sncovr_ice(one:physics%model%ncols),lsm=physics%model%lsm, &
                  lsm_noahmp=physics%model%lsm_noahmp,lsm_ruc=physics%model%lsm_ruc,min_seaice=physics%model%min_seaice, &
                  fice=physics%sfcprop%fice(one:physics%model%ncols),landfrac=physics%sfcprop%landfrac(one:physics%model%ncols), &
                  vtype=physics%sfcprop%vtype(one:physics%model%ncols),weasd=physics%sfcprop%weasd(one:physics%model%ncols), &
                  lsoil=physics%model%lsoil,zs=physics%model%zs(one:physics%model%lsoil_lsm), &
                  dzs=physics%model%dzs(one:physics%model%lsoil_lsm),lsnow_lsm_lbound=physics%model%lsnow_lsm_lbound, &
                  lsnow_lsm_ubound=physics%model%lsnow_lsm_ubound,tvxy=tvxy_23_ptr_array(cdata%thrd_no)%p, &
                  tgxy=tgxy_24_ptr_array(cdata%thrd_no)%p,tahxy=tahxy_25_ptr_array(cdata%thrd_no)%p, &
                  canicexy=canicexy_26_ptr_array(cdata%thrd_no)%p,canliqxy=canliqxy_27_ptr_array(cdata%thrd_no)%p, &
                  eahxy=eahxy_28_ptr_array(cdata%thrd_no)%p,cmxy=cmxy_29_ptr_array(cdata%thrd_no)%p, &
                  chxy=chxy_30_ptr_array(cdata%thrd_no)%p,fwetxy=fwetxy_31_ptr_array(cdata%thrd_no)%p, &
                  sneqvoxy=sneqvoxy_32_ptr_array(cdata%thrd_no)%p,alboldxy=alboldxy_33_ptr_array(cdata%thrd_no)%p, &
                  qsnowxy=qsnowxy_34_ptr_array(cdata%thrd_no)%p,wslakexy=wslakexy_35_ptr_array(cdata%thrd_no)%p, &
                  taussxy=taussxy_36_ptr_array(cdata%thrd_no)%p,waxy=waxy_37_ptr_array(cdata%thrd_no)%p, &
                  wtxy=wtxy_38_ptr_array(cdata%thrd_no)%p,zwtxy=zwtxy_39_ptr_array(cdata%thrd_no)%p, &
                  xlaixy=xlaixy_40_ptr_array(cdata%thrd_no)%p,xsaixy=xsaixy_41_ptr_array(cdata%thrd_no)%p, &
                  lfmassxy=lfmassxy_42_ptr_array(cdata%thrd_no)%p,stmassxy=stmassxy_43_ptr_array(cdata%thrd_no)%p, &
                  rtmassxy=rtmassxy_44_ptr_array(cdata%thrd_no)%p,woodxy=woodxy_45_ptr_array(cdata%thrd_no)%p, &
                  stblcpxy=stblcpxy_46_ptr_array(cdata%thrd_no)%p,fastcpxy=fastcpxy_47_ptr_array(cdata%thrd_no)%p, &
                  smcwtdxy=smcwtdxy_48_ptr_array(cdata%thrd_no)%p,deeprechxy=deeprechxy_49_ptr_array(cdata%thrd_no)%p, &
                  rechxy=rechxy_50_ptr_array(cdata%thrd_no)%p,albdvis_lnd=physics%sfcprop%albdirvis_lnd(one:physics%model%ncols), &
                  albdnir_lnd=physics%sfcprop%albdirnir_lnd(one:physics%model%ncols),albivis_lnd=physics%sfcprop%albdifvis_lnd(one:physics%model%ncols), &
                  albinir_lnd=physics%sfcprop%albdifnir_lnd(one:physics%model%ncols),albdvis_ice=albdvis_ice_51_ptr_array(cdata%thrd_no)%p, &
                  albdnir_ice=albdnir_ice_52_ptr_array(cdata%thrd_no)%p,albivis_ice=albivis_ice_53_ptr_array(cdata%thrd_no)%p, &
                  albinir_ice=albinir_ice_54_ptr_array(cdata%thrd_no)%p,emiss_lnd=physics%sfcprop%emis_lnd(one:physics%model%ncols), &
                  emiss_ice=physics%sfcprop%emis_ice(one:physics%model%ncols),snowxy=snowxy_55_ptr_array(cdata%thrd_no)%p, &
                  snicexy=snicexy_56_ptr_array(cdata%thrd_no)%p,snliqxy=snliqxy_57_ptr_array(cdata%thrd_no)%p, &
                  tsnoxy=tsnoxy_58_ptr_array(cdata%thrd_no)%p,smoiseq=smoiseq_59_ptr_array(cdata%thrd_no)%p, &
                  zsnsoxy=zsnsoxy_60_ptr_array(cdata%thrd_no)%p,slc=physics%sfcprop%slc(one:physics%model%ncols,one:physics%model%lsoil), &
                  smc=physics%sfcprop%smc(one:physics%model%ncols,one:physics%model%lsoil), &
                  stc=physics%sfcprop%stc(one:physics%model%ncols,one:physics%model%lsoil), &
                  tsfcl=physics%sfcprop%tsfcl(one:physics%model%ncols),snowd=physics%sfcprop%snowd(one:physics%model%ncols), &
                  canopy=physics%sfcprop%canopy(one:physics%model%ncols),tg3=physics%sfcprop%tg3(one:physics%model%ncols), &
                  stype=physics%sfcprop%stype(one:physics%model%ncols),con_t0c=con_t0c,lsm_cold_start=physics%model%lsm_cold_start, &
                  nthrds=physics%model%nthreads,lkm=physics%model%lkm,use_lake_model=physics%sfcprop%use_lake_model(one:physics%model%ncols), &
                  lakefrac=physics%sfcprop%lakefrac(one:physics%model%ncols),lakedepth=physics%sfcprop%lakedepth(one:physics%model%ncols), &
                  iopt_lake=physics%model%iopt_lake,iopt_lake_clm=physics%model%iopt_lake_clm, &
                  iopt_lake_flake=physics%model%iopt_lake_flake,lakefrac_threshold=physics%model%lakefrac_threshold, &
                  lakedepth_threshold=physics%model%lakedepth_threshold,ozphys=physics%model%ozphys, &
                  h2ophys=physics%model%h2ophys,is_initialized=physics%model%gfs_phys_time_vary_is_init, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ntoz>0)) then
        nullify(jindx1_o3_1_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntoz>0)) then
        nullify(jindx2_o3_2_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ntoz>0)) then
        nullify(ddy_o3_3_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%h2o_phys)) then
        nullify(jindx1_h_4_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%h2o_phys)) then
        nullify(jindx2_h_5_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%h2o_phys)) then
        nullify(ddy_h_6_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iaerclm)) then
        nullify(jindx1_aer_7_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iaerclm)) then
        nullify(jindx2_aer_8_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iaerclm)) then
        nullify(ddy_aer_9_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iaerclm)) then
        nullify(iindx1_aer_10_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iaerclm)) then
        nullify(iindx2_aer_11_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iaerclm)) then
        nullify(ddx_aer_12_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iccn==1)) then
        nullify(jindx1_ci_13_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iccn==1)) then
        nullify(jindx2_ci_14_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iccn==1)) then
        nullify(ddy_ci_15_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iccn==1)) then
        nullify(iindx1_ci_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iccn==1)) then
        nullify(iindx2_ci_17_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%iccn==1)) then
        nullify(ddx_ci_18_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1)) then
        nullify(jindx1_tau_19_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1)) then
        nullify(jindx2_tau_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1)) then
        nullify(ddy_j1tau_21_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_ugwp_v1)) then
        nullify(ddy_j2tau_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(tvxy_23_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(tgxy_24_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(tahxy_25_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(canicexy_26_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(canliqxy_27_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(eahxy_28_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(cmxy_29_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(chxy_30_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(fwetxy_31_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(sneqvoxy_32_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(alboldxy_33_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(qsnowxy_34_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(wslakexy_35_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(taussxy_36_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(waxy_37_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(wtxy_38_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(zwtxy_39_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noah .or. physics%model%lsm == physics%model%lsm_noahmp .or. physics%model%lsm == physics%model%lsm_ruc)) then
        nullify(xlaixy_40_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(xsaixy_41_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(lfmassxy_42_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(stmassxy_43_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(rtmassxy_44_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(woodxy_45_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(stblcpxy_46_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(fastcpxy_47_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(smcwtdxy_48_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(deeprechxy_49_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(rechxy_50_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albdvis_ice_51_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albdnir_ice_52_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albivis_ice_53_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albinir_ice_54_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(snowxy_55_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(snicexy_56_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(snliqxy_57_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(tsnoxy_58_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(smoiseq_59_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_noahmp)) then
        nullify(zsnsoxy_60_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_phys_time_vary_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized(cdata%ccpp_instance) = .true.


   end function scm_rap_ps_time_vary_init_cap

   function scm_rap_ps_time_vary_run_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_rap_ps_time_vary_run_cap

   function scm_rap_ps_time_vary_final_cap(one,physics,cdata) result(ierr)

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

      


      call gfs_time_vary_pre_finalize(errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_time_vary_pre_finalize: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call gfs_rrtmg_setup_finalize(errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_rrtmg_setup_finalize: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call gfs_phys_time_vary_finalize(is_initialized=physics%model%gfs_phys_time_vary_is_init,errmsg=cdata%errmsg, &
                  errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_phys_time_vary_finalize: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized = .false.


   end function scm_rap_ps_time_vary_final_cap

end module ccpp_scm_rap_ps_time_vary_cap
