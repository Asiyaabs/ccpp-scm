
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
module ccpp_scm_gfs_v17_p8_ugwpv1_phys_ts_cap

   use gfs_photochemistry, only: gfs_photochemistry_init
   use gfs_photochemistry, only: gfs_photochemistry_run
   use gfs_photochemistry_post, only: gfs_photochemistry_post_run
   use get_phi_fv3, only: get_phi_fv3_run
   use gfs_suite_interstitial_3, only: gfs_suite_interstitial_3_run
   use gfs_suite_interstitial_4, only: gfs_suite_interstitial_4_run
   use maximum_hourly_diagnostics, only: maximum_hourly_diagnostics_run
   use gfs_physics_post, only: gfs_physics_post_run


   implicit none

   private
   public :: scm_gfs_v17_p8_ugwpv1_phys_ts_tsinit_cap, &
             scm_gfs_v17_p8_ugwpv1_phys_ts_tsfinal_cap, &
             scm_gfs_v17_p8_ugwpv1_phys_ts_init_cap, &
             scm_gfs_v17_p8_ugwpv1_phys_ts_run_cap, &
             scm_gfs_v17_p8_ugwpv1_phys_ts_final_cap

   logical, dimension(200), save :: initialized = .false.

   contains

   function scm_gfs_v17_p8_ugwpv1_phys_ts_tsinit_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_gfs_v17_p8_ugwpv1_phys_ts_tsinit_cap

   function scm_gfs_v17_p8_ugwpv1_phys_ts_tsfinal_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_gfs_v17_p8_ugwpv1_phys_ts_tsfinal_cap

   function scm_gfs_v17_p8_ugwpv1_phys_ts_init_cap(one,physics,cdata) result(ierr)

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

    


      initialized(cdata%ccpp_instance) = .true.


   end function scm_gfs_v17_p8_ugwpv1_phys_ts_init_cap

   function scm_gfs_v17_p8_ugwpv1_phys_ts_run_cap(one,physics,cdata,con_1ovg,con_fvirt,con_pi,con_rd,con_eps,con_g) result(ierr)

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
      real(kind_phys), intent(in), target :: con_pi
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: con_eps
      real(kind_phys), intent(in), target :: con_g
      
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
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: nwfa_12_ptr_array
      type :: real_kind_phys_rank3_ptr_arr_type
         real(kind_phys), dimension(:,:,:), pointer :: p => null()
      end type real_kind_phys_rank3_ptr_arr_type
      type(real_kind_phys_rank3_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: dtend_13_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: wgrs_14_ptr_array
      type :: real_kind_phys_rank1_ptr_arr_type
         real(kind_phys), dimension(:), pointer :: p => null()
      end type real_kind_phys_rank1_ptr_arr_type
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ltg1_max_15_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ltg2_max_16_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: ltg3_max_17_ptr_array

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

    
      

      if ((physics%model%ntwa > 0)) then
        nwfa_12_ptr_array(cdata%thrd_no)%p => physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntwa)
      end if

      if ((physics%model%ldiag3d)) then
        dtend_13_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
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
                  con_rd=con_rd,con_eps=con_eps,nssl_cccn=physics%model%nssl_cccn,nwfa=nwfa_12_ptr_array(cdata%thrd_no)%p, &
                  spechum=physics%statein%qgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntqv), &
                  dtidx=physics%model%dtidx(one:physics%model%ntracp100,one:physics%model%nprocess), &
                  dtend=dtend_13_ptr_array(cdata%thrd_no)%p,ntk=physics%interstitial(cdata%thrd_no)%ntk, &
                  ntke=physics%model%ntke,ldiag3d=physics%model%ldiag3d,qdiag3d=physics%model%qdiag3d, &
                  index_of_process_conv_trans=physics%model%index_of_process_conv_trans,index_of_process_dcnv=physics%model%index_of_process_dcnv, &
                  index_of_process_scnv=physics%model%index_of_process_scnv,otsptflag=physics%interstitial(cdata%thrd_no)%otsptflag(one:physics%model%ntrac), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%ntwa > 0)) then
        nullify(nwfa_12_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ldiag3d)) then
        nullify(dtend_13_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_suite_interstitial_4_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      

      if ((physics%model%lightning_threat)) then
        wgrs_14_ptr_array(cdata%thrd_no)%p => physics%statein%wgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%lightning_threat)) then
        ltg1_max_15_ptr_array(cdata%thrd_no)%p => physics%diag%ltg1_max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lightning_threat)) then
        ltg2_max_16_ptr_array(cdata%thrd_no)%p => physics%diag%ltg2_max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lightning_threat)) then
        ltg3_max_17_ptr_array(cdata%thrd_no)%p => physics%diag%ltg3_max(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
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
                  wgrs=wgrs_14_ptr_array(cdata%thrd_no)%p,qgraupel=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntgl), &
                  qsnowwat=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntsw), &
                  qicewat=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ntiw), &
                  con_rd=con_rd,tgrs=physics%statein%tgrs(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  lightning_threat=physics%model%lightning_threat,ltg1_max=ltg1_max_15_ptr_array(cdata%thrd_no)%p, &
                  ltg2_max=ltg2_max_16_ptr_array(cdata%thrd_no)%p,ltg3_max=ltg3_max_17_ptr_array(cdata%thrd_no)%p, &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  kdt=physics%model%kdt,errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lightning_threat)) then
        nullify(wgrs_14_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lightning_threat)) then
        nullify(ltg1_max_15_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lightning_threat)) then
        nullify(ltg2_max_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lightning_threat)) then
        nullify(ltg3_max_17_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in maximum_hourly_diagnostics_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%ldiag3d)) then
        dtend_13_ptr_array(cdata%thrd_no)%p => physics%diag%dtend(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ndtend)
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

      call gfs_physics_post_run(ncol=physics%model%blksz(cdata%blk_no),nlev=physics%model%levs,dtend=dtend_13_ptr_array(cdata%thrd_no)%p, &
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
        nullify(dtend_13_ptr_array(cdata%thrd_no)%p)
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

    



   end function scm_gfs_v17_p8_ugwpv1_phys_ts_run_cap

   function scm_gfs_v17_p8_ugwpv1_phys_ts_final_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0






      initialized = .false.


   end function scm_gfs_v17_p8_ugwpv1_phys_ts_final_cap

end module ccpp_scm_gfs_v17_p8_ugwpv1_phys_ts_cap
