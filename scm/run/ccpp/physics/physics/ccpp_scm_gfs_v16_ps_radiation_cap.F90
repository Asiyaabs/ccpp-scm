
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
module ccpp_scm_gfs_v16_ps_radiation_cap

   use gfs_radiation_surface, only: gfs_radiation_surface_init
   use gfs_rrtmg_pre, only: gfs_rrtmg_pre_run
   use gfs_radiation_surface, only: gfs_radiation_surface_run
   use rad_sw_pre, only: rad_sw_pre_run
   use rrtmg_sw, only: rrtmg_sw_run
   use rrtmg_sw_post, only: rrtmg_sw_post_run
   use rrtmg_lw, only: rrtmg_lw_run
   use rrtmg_lw_post, only: rrtmg_lw_post_run
   use gfs_radiation_post, only: gfs_radiation_post_run


   implicit none

   private
   public :: scm_gfs_v16_ps_radiation_tsinit_cap, &
             scm_gfs_v16_ps_radiation_tsfinal_cap, &
             scm_gfs_v16_ps_radiation_init_cap, &
             scm_gfs_v16_ps_radiation_run_cap, &
             scm_gfs_v16_ps_radiation_final_cap

   logical, dimension(200), save :: initialized = .false.

   contains

   function scm_gfs_v16_ps_radiation_tsinit_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_gfs_v16_ps_radiation_tsinit_cap

   function scm_gfs_v16_ps_radiation_tsfinal_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0







   end function scm_gfs_v16_ps_radiation_tsfinal_cap

   function scm_gfs_v16_ps_radiation_init_cap(one,physics,cdata,con_pi) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t
      use machine, only: kind_phys

      implicit none

      ! Error handling
      integer :: ierr

      integer, intent(in), target :: one
      type(physics_type), intent(in), target :: physics
      type(ccpp_t), intent(inout), target :: cdata
      real(kind_phys), intent(in), target :: con_pi

      ierr = 0


      if (initialized(cdata%ccpp_instance)) return



      ! Start of next subcycle

      ! Set loop extent variable for the following subcycle
      cdata%loop_max = 1

      cdata%loop_cnt = 1

      


      call gfs_radiation_surface_init(mpicomm=physics%model%communicator,mpirank=physics%model%me,mpiroot=physics%model%master, &
                  ialb=physics%model%ialb,iems=physics%model%iems,semis_file=physics%model%semis_file, &
                  con_pi=con_pi,errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_radiation_surface_init: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    


      initialized(cdata%ccpp_instance) = .true.


   end function scm_gfs_v16_ps_radiation_init_cap

   function scm_gfs_v16_ps_radiation_run_cap(one,physics,cdata,ltp,con_eps,con_pi,con_rd,con_g,con_ttp,con_thgni,con_epsm1, &
                  con_fvirt,con_rog,con_rocp) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t
      use machine, only: kind_phys

      implicit none

      ! Error handling
      integer :: ierr

      integer, intent(in), target :: one
      type(physics_type), intent(inout), target :: physics
      type(ccpp_t), intent(inout), target :: cdata
      integer, intent(in), target :: ltp
      real(kind_phys), intent(in), target :: con_eps
      real(kind_phys), intent(in), target :: con_pi
      real(kind_phys), intent(in), target :: con_rd
      real(kind_phys), intent(in), target :: con_g
      real(kind_phys), intent(in), target :: con_ttp
      real(kind_phys), intent(in), target :: con_thgni
      real(kind_phys), intent(in), target :: con_epsm1
      real(kind_phys), intent(in), target :: con_fvirt
      real(kind_phys), intent(in), target :: con_rog
      real(kind_phys), intent(in), target :: con_rocp
      
      ! Local variables/pointers for unit conversions, array transformations, ...
      type :: character_len3_r1_ptr_arr_type
         character(len=3), dimension(:), pointer :: p => null()
      end type character_len3_r1_ptr_arr_type
      type(character_len3_r1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lndp_var_list_1_ptr_array
      type :: real_kind_phys_rank2_ptr_arr_type
         real(kind_phys), dimension(:,:), pointer :: p => null()
      end type real_kind_phys_rank2_ptr_arr_type
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sfc_wts_2_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: mg_cld_3_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: effrr_in_4_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: sppt_wts_5_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cnvw_in_6_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: cnvc_in_7_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: effrl_inout_8_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: effri_inout_9_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: effrs_inout_10_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: qci_conv_11_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: alpha_12_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: spp_wts_rad_13_ptr_array
      type :: real_kind_phys_rank1_ptr_arr_type
         real(kind_phys), dimension(:), pointer :: p => null()
      end type real_kind_phys_rank1_ptr_arr_type
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: lndp_prt_list_14_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albdvis_ice_15_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albdnir_ice_16_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albivis_ice_17_ptr_array
      type(real_kind_phys_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: albinir_ice_18_ptr_array
      type :: integer_default_kind_rank1_ptr_arr_type
         integer, dimension(:), pointer :: p => null()
      end type integer_default_kind_rank1_ptr_arr_type
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: icseed_19_ptr_array
      type(integer_default_kind_rank1_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: icseed_20_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxlwup_clrsky_21_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxlwdown_clrsky_22_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxlwup_allsky_23_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxlwdown_allsky_24_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxswup_clrsky_25_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxswdown_clrsky_26_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxswup_allsky_27_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: fluxswdown_allsky_28_ptr_array
      type(real_kind_phys_rank2_ptr_arr_type), dimension(1:cdata%thrd_cnt) :: htrlwu_29_ptr_array

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

      

      if ((physics%model%lndp_type /= 0)) then
        lndp_var_list_1_ptr_array(cdata%thrd_no)%p => physics%model%lndp_var_list(:)
      end if

      if ((physics%model%lndp_type /= 0)) then
        sfc_wts_2_ptr_array(cdata%thrd_no)%p => physics%coupling%sfc_wts(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%n_var_lndp)
      end if

      if ((physics%model%indcld > 0)) then
        mg_cld_3_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%indcld)
      end if

      if ((physics%model%nreffr > 0)) then
        effrr_in_4_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nreffr)
      end if

      if ((physics%model%do_sppt .or. physics%model%ca_global)) then
        sppt_wts_5_ptr_array(cdata%thrd_no)%p => physics%coupling%sppt_wts(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((physics%model%ncnvw > 0)) then
        cnvw_in_6_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ncnvw)
      end if

      if ((physics%model%ncnvc > 0)) then
        cnvc_in_7_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%ncnvc)
      end if

      if ((physics%model%nleffr > 0)) then
        effrl_inout_8_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nleffr)
      end if

      if ((physics%model%nieffr > 0)) then
        effri_inout_9_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nieffr)
      end if

      if ((physics%model%nseffr > 0)) then
        effrs_inout_10_ptr_array(cdata%thrd_no)%p => physics%tbd%phy_f3d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,physics%model%nseffr)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        qci_conv_11_ptr_array(cdata%thrd_no)%p => physics%coupling%qci_conv(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      if ((.not. physics%model%do_rrtmgp)) then
        alpha_12_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%alpha(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk)
      end if

      if ((physics%model%do_spp)) then
        spp_wts_rad_13_ptr_array(cdata%thrd_no)%p => physics%coupling%spp_wts_rad(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
      end if

      call gfs_rrtmg_pre_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,lm=physics%model%levr, &
                  lmk=physics%model%lmk,lmp=physics%model%lmp,lextop=physics%model%lextop, &
                  xr_cnvcld=physics%model%xr_cnvcld,ltp=ltp,n_var_lndp=physics%model%n_var_lndp, &
                  imfdeepcnv=physics%model%imfdeepcnv,imfdeepcnv_gf=physics%model%imfdeepcnv_gf, &
                  imfdeepcnv_c3=physics%model%imfdeepcnv_c3,me=physics%model%me,ncnd=physics%model%ncnd, &
                  ntrac=physics%model%ntrac,num_p3d=physics%model%num_p3d,npdf3d=physics%model%npdf3d, &
                  ncnvcld3d=physics%model%ncnvcld3d,ntqv=physics%model%ntqv,ntcw=physics%model%ntcw, &
                  ntiw=physics%model%ntiw,ntlnc=physics%model%ntlnc,ntinc=physics%model%ntinc, &
                  ntrnc=physics%model%ntrnc,ntsnc=physics%model%ntsnc,ntrw=physics%model%ntrw, &
                  ntsw=physics%model%ntsw,ntgl=physics%model%ntgl,nthl=physics%model%nthl, &
                  ntccn=physics%model%ntccn,ntwa=physics%model%ntwa,ntoz=physics%model%ntoz, &
                  ntsmoke=physics%model%ntsmoke,ntdust=physics%model%ntdust,ntcoarsepm=physics%model%ntcoarsepm, &
                  ozphys=physics%model%ozphys,tempo_cfg=physics%model%tempo_cfg,iaermdl=physics%model%iaermdl, &
                  iaerflg=physics%model%iaerflg,nssl_ccn_on=physics%model%nssl_ccn_on,nssl_invertccn=physics%model%nssl_invertccn, &
                  ntclamt=physics%model%ntclamt,nleffr=physics%model%nleffr,nieffr=physics%model%nieffr, &
                  nseffr=physics%model%nseffr,lndp_type=physics%model%lndp_type,kdt=physics%model%kdt, &
                  ntdu1=physics%model%ntdu1,ntdu2=physics%model%ntdu2,ntdu3=physics%model%ntdu3, &
                  ntdu4=physics%model%ntdu4,ntdu5=physics%model%ntdu5,ntss1=physics%model%ntss1, &
                  ntss2=physics%model%ntss2,ntss3=physics%model%ntss3,ntss4=physics%model%ntss4, &
                  ntss5=physics%model%ntss5,ntsu=physics%model%ntsu,ntbcb=physics%model%ntbcb, &
                  ntbcl=physics%model%ntbcl,ntocb=physics%model%ntocb,ntocl=physics%model%ntocl, &
                  ntchm=physics%model%ntchm,imp_physics=physics%model%imp_physics,imp_physics_nssl=physics%model%imp_physics_nssl, &
                  imp_physics_thompson=physics%model%imp_physics_thompson,imp_physics_tempo=physics%model%imp_physics_tempo, &
                  imp_physics_gfdl=physics%model%imp_physics_gfdl,imp_physics_mg=physics%model%imp_physics_mg, &
                  imp_physics_wsm6=physics%model%imp_physics_wsm6,imp_physics_fer_hires=physics%model%imp_physics_fer_hires, &
                  iovr=physics%model%iovr,iovr_rand=physics%model%iovr_rand,iovr_maxrand=physics%model%iovr_maxrand, &
                  iovr_max=physics%model%iovr_max,iovr_dcorr=physics%model%iovr_dcorr,iovr_exp=physics%model%iovr_exp, &
                  iovr_exprand=physics%model%iovr_exprand,dcorr_con=physics%model%dcorr_con, &
                  idcor=physics%model%idcor,idcor_con=physics%model%idcor_con,idcor_hogan=physics%model%idcor_hogan, &
                  idcor_oreopoulos=physics%model%idcor_oreopoulos,julian=physics%model%julian, &
                  yearlen=physics%model%yearlen,lndp_var_list=lndp_var_list_1_ptr_array(cdata%thrd_no)%p, &
                  lsswr=physics%model%lsswr,lslwr=physics%model%lslwr,ltaerosol=physics%model%ltaerosol, &
                  mraerosol=physics%model%mraerosol,lgfdlmprad=physics%model%lgfdlmprad,uni_cld=physics%model%uni_cld, &
                  effr_in=physics%model%effr_in,do_mynnedmf=physics%model%do_mynnedmf,lmfshal=physics%model%lmfshal, &
                  lmfdeep2=physics%model%lmfdeep2,lcrick=physics%model%lcrick,lcnorm=physics%model%lcnorm, &
                  fhswr=physics%model%fhswr,fhlwr=physics%model%fhlwr,solhr=physics%model%solhr, &
                  sup=physics%model%sup,xr_con=physics%model%xr_con,xr_exp=physics%model%xr_exp, &
                  con_eps=con_eps,con_pi=con_pi,con_rd=con_rd,con_g=con_g,con_ttp=con_ttp, &
                  con_thgni=con_thgni,epsm1=con_epsm1,fvirt=con_fvirt,rog=con_rog,rocp=con_rocp, &
                  xlat_d=physics%grid%xlat_d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlat=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlon=physics%grid%xlon(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  coslat=physics%grid%coslat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sinlat=physics%grid%sinlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfc=physics%sfcprop%tsfc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slmsk=physics%sfcprop%slmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  prsi=physics%statein%prsi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1), &
                  prsl=physics%statein%prsl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  prslk=physics%statein%prslk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  tgrs=physics%stateout%gt0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  sfc_wts=sfc_wts_2_ptr_array(cdata%thrd_no)%p,mg_cld=mg_cld_3_ptr_array(cdata%thrd_no)%p, &
                  effrr_in=effrr_in_4_ptr_array(cdata%thrd_no)%p,pert_clds=physics%model%pert_clds, &
                  sppt_wts=sppt_wts_5_ptr_array(cdata%thrd_no)%p,sppt_amp=physics%model%sppt_amp, &
                  cnvw_in=cnvw_in_6_ptr_array(cdata%thrd_no)%p,cnvc_in=cnvc_in_7_ptr_array(cdata%thrd_no)%p, &
                  qgrs=physics%stateout%gq0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrac), &
                  aer_nm=physics%tbd%aer_nm(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs,one:physics%model%ntrcaer), &
                  dx=physics%grid%dx(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  icloud=physics%model%icloud,coszen=physics%radtend%coszen(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  coszdg=physics%radtend%coszdg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  effrl_inout=effrl_inout_8_ptr_array(cdata%thrd_no)%p,effri_inout=effri_inout_9_ptr_array(cdata%thrd_no)%p, &
                  effrs_inout=effrs_inout_10_ptr_array(cdata%thrd_no)%p,clouds1=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,1), &
                  clouds2=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,2), &
                  clouds3=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,3), &
                  clouds4=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,4), &
                  clouds5=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,5), &
                  qci_conv=qci_conv_11_ptr_array(cdata%thrd_no)%p,kd=physics%interstitial(cdata%thrd_no)%kd, &
                  kt=physics%interstitial(cdata%thrd_no)%kt,kb=physics%interstitial(cdata%thrd_no)%kb, &
                  mtopa=physics%interstitial(cdata%thrd_no)%mtopa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:3), &
                  mbota=physics%interstitial(cdata%thrd_no)%mbota(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:3), &
                  raddt=physics%interstitial(cdata%thrd_no)%raddt,tsfg=physics%interstitial(cdata%thrd_no)%tsfg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfa=physics%interstitial(cdata%thrd_no)%tsfa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  de_lgth=physics%interstitial(cdata%thrd_no)%de_lgth(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  alb1d=physics%interstitial(cdata%thrd_no)%alb1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  delp=physics%interstitial(cdata%thrd_no)%delr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  dz=physics%interstitial(cdata%thrd_no)%dzlyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  plvl=physics%interstitial(cdata%thrd_no)%plvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmp), &
                  plyr=physics%interstitial(cdata%thrd_no)%plyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  tlvl=physics%interstitial(cdata%thrd_no)%tlvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmp), &
                  tlyr=physics%interstitial(cdata%thrd_no)%tlyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  qlyr=physics%interstitial(cdata%thrd_no)%qlyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  olyr=physics%interstitial(cdata%thrd_no)%olyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  gasvmr_co2=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,1), &
                  gasvmr_n2o=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,2), &
                  gasvmr_ch4=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,3), &
                  gasvmr_o2=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,4), &
                  gasvmr_co=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,5), &
                  gasvmr_cfc11=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,6), &
                  gasvmr_cfc12=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,7), &
                  gasvmr_cfc22=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,8), &
                  gasvmr_ccl4=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,9), &
                  gasvmr_cfc113=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,10), &
                  aerodp=physics%interstitial(cdata%thrd_no)%aerodp(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nspc1), &
                  ext550=physics%radtend%ext550(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  clouds6=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,6), &
                  clouds7=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,7), &
                  clouds8=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,8), &
                  clouds9=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,9), &
                  cldsa=physics%interstitial(cdata%thrd_no)%cldsa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:5), &
                  cldfra=physics%diag%cldfra(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  cldfra2d=physics%diag%cldfra2d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lwp_ex=physics%diag%lwp_ex(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  iwp_ex=physics%diag%iwp_ex(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lwp_fc=physics%diag%lwp_fc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  iwp_fc=physics%diag%iwp_fc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  faersw1=physics%interstitial(cdata%thrd_no)%faersw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,one:physics%model%nbdsw,1), &
                  faersw2=physics%interstitial(cdata%thrd_no)%faersw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,one:physics%model%nbdsw,2), &
                  faersw3=physics%interstitial(cdata%thrd_no)%faersw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,one:physics%model%nbdsw,3), &
                  faerlw1=physics%interstitial(cdata%thrd_no)%faerlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,one:physics%model%nbdlw,1), &
                  faerlw2=physics%interstitial(cdata%thrd_no)%faerlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,one:physics%model%nbdlw,2), &
                  faerlw3=physics%interstitial(cdata%thrd_no)%faerlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,one:physics%model%nbdlw,3), &
                  alpha=alpha_12_ptr_array(cdata%thrd_no)%p,top_at_1=physics%model%top_at_1, &
                  si=physics%model%si(one:physics%model%levsp1),ico2=physics%model%ico2,rrfs_sd=physics%model%rrfs_sd, &
                  aero_dir_fdb=physics%model%aero_dir_fdb,fdb_coef=physics%model%smoke_dir_fdb_coef(one:7), &
                  spp_wts_rad=spp_wts_rad_13_ptr_array(cdata%thrd_no)%p,spp_rad=physics%model%spp_rad, &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lndp_type /= 0)) then
        nullify(lndp_var_list_1_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lndp_type /= 0)) then
        nullify(sfc_wts_2_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%indcld > 0)) then
        nullify(mg_cld_3_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nreffr > 0)) then
        nullify(effrr_in_4_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_sppt .or. physics%model%ca_global)) then
        nullify(sppt_wts_5_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ncnvw > 0)) then
        nullify(cnvw_in_6_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%ncnvc > 0)) then
        nullify(cnvc_in_7_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nleffr > 0)) then
        nullify(effrl_inout_8_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nieffr > 0)) then
        nullify(effri_inout_9_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%nseffr > 0)) then
        nullify(effrs_inout_10_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%imfdeepcnv == physics%model%imfdeepcnv_gf .or. physics%model%imfdeepcnv == physics%model%imfdeepcnv_c3)) then
        nullify(qci_conv_11_ptr_array(cdata%thrd_no)%p)
      end if

      if ((.not. physics%model%do_rrtmgp)) then
        nullify(alpha_12_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_spp)) then
        nullify(spp_wts_rad_13_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_rrtmg_pre_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%lndp_type /= 0)) then
        lndp_var_list_1_ptr_array(cdata%thrd_no)%p => physics%model%lndp_var_list(:)
      end if

      if ((physics%model%lndp_type /= 0)) then
        lndp_prt_list_14_ptr_array(cdata%thrd_no)%p => physics%model%lndp_prt_list(one:physics%model%n_var_lndp)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albdvis_ice_15_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdirvis_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albdnir_ice_16_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdirnir_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albivis_ice_17_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdifvis_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        albinir_ice_18_ptr_array(cdata%thrd_no)%p => physics%sfcprop%albdifnir_ice(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      call gfs_radiation_surface_run(im=physics%model%blksz(cdata%blk_no),ialb=physics%model%ialb,frac_grid=physics%model%frac_grid, &
                  lslwr=physics%model%lslwr,lsswr=physics%model%lsswr,lsm=physics%model%lsm, &
                  lsm_noahmp=physics%model%lsm_noahmp,lsm_ruc=physics%model%lsm_ruc,xlat=physics%grid%xlat(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  xlon=physics%grid%xlon(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  slmsk=physics%sfcprop%slmsk(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lndp_type=physics%model%lndp_type,n_var_lndp=physics%model%n_var_lndp,sfc_alb_pert=physics%interstitial(cdata%thrd_no)%alb1d(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  lndp_var_list=lndp_var_list_1_ptr_array(cdata%thrd_no)%p,lndp_prt_list=lndp_prt_list_14_ptr_array(cdata%thrd_no)%p, &
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
                  albdvis_ice=albdvis_ice_15_ptr_array(cdata%thrd_no)%p,albdnir_ice=albdnir_ice_16_ptr_array(cdata%thrd_no)%p, &
                  albivis_ice=albivis_ice_17_ptr_array(cdata%thrd_no)%p,albinir_ice=albinir_ice_18_ptr_array(cdata%thrd_no)%p, &
                  semisbase=physics%sfcprop%semisbase(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  semis=physics%radtend%semis(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcalb=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%nf_albd), &
                  sfc_alb_dif=physics%radtend%sfalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%lndp_type /= 0)) then
        nullify(lndp_var_list_1_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lndp_type /= 0)) then
        nullify(lndp_prt_list_14_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albdvis_ice_15_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albdnir_ice_16_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albivis_ice_17_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%lsm == physics%model%lsm_ruc .or. physics%model%use_cice_alb)) then
        nullify(albinir_ice_18_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_radiation_surface_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call rad_sw_pre_run(im=physics%model%blksz(cdata%blk_no),lsswr=physics%model%lsswr,coszen=physics%radtend%coszen(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  nday=physics%interstitial(cdata%thrd_no)%nday,idxday=physics%interstitial(cdata%thrd_no)%idxday(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rad_sw_pre_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2)) then
        icseed_19_ptr_array(cdata%thrd_no)%p => physics%tbd%icsdsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((.not. physics%model%do_rrtmgp)) then
        alpha_12_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%alpha(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk)
      end if

      call rrtmg_sw_run(plyr=physics%interstitial(cdata%thrd_no)%plyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  plvl=physics%interstitial(cdata%thrd_no)%plvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmp), &
                  tlyr=physics%interstitial(cdata%thrd_no)%tlyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  tlvl=physics%interstitial(cdata%thrd_no)%tlvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmp), &
                  qlyr=physics%interstitial(cdata%thrd_no)%qlyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  olyr=physics%interstitial(cdata%thrd_no)%olyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  gasvmr_co2=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,1), &
                  gasvmr_n2o=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,2), &
                  gasvmr_ch4=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,3), &
                  gasvmr_o2=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,4), &
                  gasvmr_co=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,5), &
                  gasvmr_cfc11=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,6), &
                  gasvmr_cfc12=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,7), &
                  gasvmr_cfc22=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,8), &
                  gasvmr_ccl4=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,9), &
                  icseed=icseed_19_ptr_array(cdata%thrd_no)%p,aeraod=physics%interstitial(cdata%thrd_no)%faersw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,one:physics%model%nbdsw,1), &
                  aerssa=physics%interstitial(cdata%thrd_no)%faersw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,one:physics%model%nbdsw,2), &
                  aerasy=physics%interstitial(cdata%thrd_no)%faersw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,one:physics%model%nbdsw,3), &
                  sfcalb_nir_dir=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  sfcalb_nir_dif=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),2), &
                  sfcalb_uvis_dir=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),3), &
                  sfcalb_uvis_dif=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),4), &
                  dzlyr=physics%interstitial(cdata%thrd_no)%dzlyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  delpin=physics%interstitial(cdata%thrd_no)%delr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  de_lgth=physics%interstitial(cdata%thrd_no)%de_lgth(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  alpha=alpha_12_ptr_array(cdata%thrd_no)%p,cosz=physics%radtend%coszen(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  solcon=physics%model%solcon,nday=physics%interstitial(cdata%thrd_no)%nday, &
                  idxday=physics%interstitial(cdata%thrd_no)%idxday(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  npts=physics%model%blksz(cdata%blk_no),nlay=physics%model%lmk,nlp1=physics%model%lmp, &
                  lprnt=physics%model%lprnt,inc_minor_gas=physics%model%inc_minor_gas,top_at_1=physics%model%top_at_1, &
                  iswcice=physics%model%icice_sw,iswcliq=physics%model%icliq_sw,isubcsw=physics%model%isubc_sw, &
                  iovr=physics%model%iovr,iovr_exp=physics%model%iovr_exp,iovr_exprand=physics%model%iovr_exprand, &
                  iovr_max=physics%model%iovr_max,iovr_rand=physics%model%iovr_rand,iovr_maxrand=physics%model%iovr_maxrand, &
                  iovr_dcorr=physics%model%iovr_dcorr,iswmode=physics%model%iswmode,cld_cf=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,1), &
                  lsswr=physics%model%lsswr,hswc=physics%interstitial(cdata%thrd_no)%htswc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  topflx=physics%diag%topfsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcflx=physics%radtend%sfcfsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cldtau=physics%interstitial(cdata%thrd_no)%cldtausw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  hsw0=physics%interstitial(cdata%thrd_no)%htsw0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  fdncmp=physics%interstitial(cdata%thrd_no)%scmpsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cld_lwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,2), &
                  cld_ref_liq=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,3), &
                  cld_iwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,4), &
                  cld_ref_ice=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,5), &
                  cld_rwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,6), &
                  cld_ref_rain=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,7), &
                  cld_swp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,8), &
                  cld_ref_snow=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,9), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2)) then
        nullify(icseed_19_ptr_array(cdata%thrd_no)%p)
      end if

      if ((.not. physics%model%do_rrtmgp)) then
        nullify(alpha_12_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrtmg_sw_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call rrtmg_sw_post_run(im=physics%model%blksz(cdata%blk_no),levr=physics%model%lmk,levs=physics%model%levs, &
                  ltp=ltp,nday=physics%interstitial(cdata%thrd_no)%nday,lm=physics%model%levr, &
                  kd=physics%interstitial(cdata%thrd_no)%kd,lsswr=physics%model%lsswr,swhtr=physics%model%swhtr, &
                  sfcalb1=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),1), &
                  sfcalb2=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),2), &
                  sfcalb3=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),3), &
                  sfcalb4=physics%interstitial(cdata%thrd_no)%sfcalb(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),4), &
                  htswc=physics%interstitial(cdata%thrd_no)%htswc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  htsw0=physics%interstitial(cdata%thrd_no)%htsw0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  nirbmdi=physics%coupling%nirbmdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  nirdfdi=physics%coupling%nirdfdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  visbmdi=physics%coupling%visbmdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  visdfdi=physics%coupling%visdfdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  nirbmui=physics%coupling%nirbmui(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  nirdfui=physics%coupling%nirdfui(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  visbmui=physics%coupling%visbmui(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  visdfui=physics%coupling%visdfui(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcdsw=physics%coupling%sfcdsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcnsw=physics%coupling%sfcnsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcdswc=physics%coupling%sfcdswc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  htrsw=physics%radtend%htrsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  swhc=physics%radtend%swhc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  scmpsw=physics%interstitial(cdata%thrd_no)%scmpsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcfsw=physics%radtend%sfcfsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  topfsw=physics%diag%topfsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrtmg_sw_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2)) then
        icseed_20_ptr_array(cdata%thrd_no)%p => physics%tbd%icsdlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no))
      end if

      if ((.not. physics%model%do_rrtmgp)) then
        alpha_12_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%alpha(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk)
      end if

      call rrtmg_lw_run(plyr=physics%interstitial(cdata%thrd_no)%plyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  plvl=physics%interstitial(cdata%thrd_no)%plvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmp), &
                  tlyr=physics%interstitial(cdata%thrd_no)%tlyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  tlvl=physics%interstitial(cdata%thrd_no)%tlvl(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmp), &
                  qlyr=physics%interstitial(cdata%thrd_no)%qlyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  olyr=physics%interstitial(cdata%thrd_no)%olyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  gasvmr_co2=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,1), &
                  gasvmr_n2o=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,2), &
                  gasvmr_ch4=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,3), &
                  gasvmr_o2=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,4), &
                  gasvmr_co=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,5), &
                  gasvmr_cfc11=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,6), &
                  gasvmr_cfc12=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,7), &
                  gasvmr_cfc22=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,8), &
                  gasvmr_ccl4=physics%interstitial(cdata%thrd_no)%gasvmr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,9), &
                  icseed=icseed_20_ptr_array(cdata%thrd_no)%p,aeraod=physics%interstitial(cdata%thrd_no)%faerlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,one:physics%model%nbdlw,1), &
                  aerssa=physics%interstitial(cdata%thrd_no)%faerlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,one:physics%model%nbdlw,2), &
                  sfemis=physics%radtend%semis(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfgtmp=physics%interstitial(cdata%thrd_no)%tsfg(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  dzlyr=physics%interstitial(cdata%thrd_no)%dzlyr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  delpin=physics%interstitial(cdata%thrd_no)%delr(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  de_lgth=physics%interstitial(cdata%thrd_no)%de_lgth(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  alpha=alpha_12_ptr_array(cdata%thrd_no)%p,npts=physics%model%blksz(cdata%blk_no), &
                  nlay=physics%model%lmk,nlp1=physics%model%lmp,lprnt=physics%model%lprnt, &
                  cld_cf=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,1), &
                  lslwr=physics%model%lslwr,top_at_1=physics%model%top_at_1,iovr=physics%model%iovr, &
                  iovr_exp=physics%model%iovr_exp,iovr_exprand=physics%model%iovr_exprand, &
                  iovr_max=physics%model%iovr_max,iovr_rand=physics%model%iovr_rand,iovr_maxrand=physics%model%iovr_maxrand, &
                  iovr_dcorr=physics%model%iovr_dcorr,inc_minor_gas=physics%model%inc_minor_gas, &
                  ilwcliq=physics%model%icliq_lw,ilwcice=physics%model%icice_lw,isubclw=physics%model%isubc_lw, &
                  hlwc=physics%interstitial(cdata%thrd_no)%htlwc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  topflx=physics%diag%topflw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcflx=physics%radtend%sfcflw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  cldtau=physics%interstitial(cdata%thrd_no)%cldtaulw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  hlw0=physics%interstitial(cdata%thrd_no)%htlw0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  cld_lwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,2), &
                  cld_ref_liq=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,3), &
                  cld_iwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,4), &
                  cld_ref_ice=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,5), &
                  cld_rwp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,6), &
                  cld_ref_rain=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,7), &
                  cld_swp=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,8), &
                  cld_ref_snow=physics%interstitial(cdata%thrd_no)%clouds(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk,9), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)


      if ((physics%model%isubc_lw == 2 .or. physics%model%isubc_sw == 2)) then
        nullify(icseed_20_ptr_array(cdata%thrd_no)%p)
      end if

      if ((.not. physics%model%do_rrtmgp)) then
        nullify(alpha_12_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrtmg_lw_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      


      call rrtmg_lw_post_run(im=physics%model%blksz(cdata%blk_no),levs=physics%model%levs,ltp=ltp,lm=physics%model%levr, &
                  kd=physics%interstitial(cdata%thrd_no)%kd,lslwr=physics%model%lslwr,lwhtr=physics%model%lwhtr, &
                  tsfa=physics%interstitial(cdata%thrd_no)%tsfa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  htlwc=physics%interstitial(cdata%thrd_no)%htlwc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  htlw0=physics%interstitial(cdata%thrd_no)%htlw0(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  sfcflw=physics%radtend%sfcflw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsflw=physics%radtend%tsflw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcdlw=physics%coupling%sfcdlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  htrlw=physics%radtend%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  lwhc=physics%radtend%lwhc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  errmsg=cdata%errmsg,errflg=cdata%errflg)



      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in rrtmg_lw_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    
      

      if ((physics%model%do_rrtmgp)) then
        fluxlwup_clrsky_21_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxlwup_clrsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxlwdown_clrsky_22_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxlwdown_clrsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxlwup_allsky_23_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxlwup_allsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxlwdown_allsky_24_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxlwdown_allsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxswup_clrsky_25_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxswup_clrsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxswdown_clrsky_26_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxswdown_clrsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxswup_allsky_27_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxswup_allsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        fluxswdown_allsky_28_ptr_array(cdata%thrd_no)%p => physics%interstitial(cdata%thrd_no)%fluxswdown_allsky(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levsp1)
      end if

      if ((physics%model%do_rrtmgp)) then
        htrlwu_29_ptr_array(cdata%thrd_no)%p => physics%coupling%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs)
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
                  do_rrtmgp=physics%model%do_rrtmgp,do_lw_clrsky_hr=physics%model%lwhtr,fluxlwup_clrsky=fluxlwup_clrsky_21_ptr_array(cdata%thrd_no)%p, &
                  fluxlwdown_clrsky=fluxlwdown_clrsky_22_ptr_array(cdata%thrd_no)%p,htrlwc=physics%radtend%lwhc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%lmk), &
                  fluxlwup_allsky=fluxlwup_allsky_23_ptr_array(cdata%thrd_no)%p,fluxlwdown_allsky=fluxlwdown_allsky_24_ptr_array(cdata%thrd_no)%p, &
                  htrlw=physics%radtend%htrlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  do_sw_clrsky_hr=physics%model%swhtr,htrswc=physics%radtend%swhc(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  fluxswup_clrsky=fluxswup_clrsky_25_ptr_array(cdata%thrd_no)%p,idxday=physics%interstitial(cdata%thrd_no)%idxday(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  fluxswdown_clrsky=fluxswdown_clrsky_26_ptr_array(cdata%thrd_no)%p,htrsw=physics%radtend%htrsw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no),one:physics%model%levs), &
                  fluxswup_allsky=fluxswup_allsky_27_ptr_array(cdata%thrd_no)%p,fluxswdown_allsky=fluxswdown_allsky_28_ptr_array(cdata%thrd_no)%p, &
                  isfc=physics%model%isfc,itoa=physics%model%itoa,tsflw=physics%radtend%tsflw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  tsfa=physics%interstitial(cdata%thrd_no)%tsfa(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfcdlw=physics%coupling%sfcdlw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  sfculw=physics%coupling%sfculw(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
                  htrlwu=htrlwu_29_ptr_array(cdata%thrd_no)%p,nirbmdi=physics%coupling%nirbmdi(physics%model%chunk_begin(cdata%chunk_no):physics%model%chunk_end(cdata%chunk_no)), &
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
        nullify(fluxlwup_clrsky_21_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxlwdown_clrsky_22_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxlwup_allsky_23_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxlwdown_allsky_24_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxswup_clrsky_25_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxswdown_clrsky_26_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxswup_allsky_27_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(fluxswdown_allsky_28_ptr_array(cdata%thrd_no)%p)
      end if

      if ((physics%model%do_rrtmgp)) then
        nullify(htrlwu_29_ptr_array(cdata%thrd_no)%p)
      end if

      if (cdata%errflg/=0) then
        cdata%errmsg = "An error occured in gfs_radiation_post_run: " // trim(cdata%errmsg)
        ierr=cdata%errflg
        return
      end if

    



   end function scm_gfs_v16_ps_radiation_run_cap

   function scm_gfs_v16_ps_radiation_final_cap() result(ierr)

      

      implicit none

      ! Error handling
      integer :: ierr

      

      ierr = 0






      initialized = .false.


   end function scm_gfs_v16_ps_radiation_final_cap

end module ccpp_scm_gfs_v16_ps_radiation_cap
