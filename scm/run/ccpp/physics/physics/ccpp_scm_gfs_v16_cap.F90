
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
!! @brief Auto-generated cap module for the CCPP suite
!!
!
module ccpp_scm_gfs_v16_cap

   use ccpp_scm_gfs_v16_time_vary_cap, only: scm_gfs_v16_time_vary_tsinit_cap
   use ccpp_scm_gfs_v16_time_vary_cap, only: scm_gfs_v16_time_vary_tsfinal_cap
   use ccpp_scm_gfs_v16_time_vary_cap, only: scm_gfs_v16_time_vary_init_cap
   use ccpp_scm_gfs_v16_time_vary_cap, only: scm_gfs_v16_time_vary_run_cap
   use ccpp_scm_gfs_v16_time_vary_cap, only: scm_gfs_v16_time_vary_final_cap
   use ccpp_scm_gfs_v16_radiation_cap, only: scm_gfs_v16_radiation_tsinit_cap
   use ccpp_scm_gfs_v16_radiation_cap, only: scm_gfs_v16_radiation_tsfinal_cap
   use ccpp_scm_gfs_v16_radiation_cap, only: scm_gfs_v16_radiation_init_cap
   use ccpp_scm_gfs_v16_radiation_cap, only: scm_gfs_v16_radiation_run_cap
   use ccpp_scm_gfs_v16_radiation_cap, only: scm_gfs_v16_radiation_final_cap
   use ccpp_scm_gfs_v16_phys_ps_cap, only: scm_gfs_v16_phys_ps_tsinit_cap
   use ccpp_scm_gfs_v16_phys_ps_cap, only: scm_gfs_v16_phys_ps_tsfinal_cap
   use ccpp_scm_gfs_v16_phys_ps_cap, only: scm_gfs_v16_phys_ps_init_cap
   use ccpp_scm_gfs_v16_phys_ps_cap, only: scm_gfs_v16_phys_ps_run_cap
   use ccpp_scm_gfs_v16_phys_ps_cap, only: scm_gfs_v16_phys_ps_final_cap
   use ccpp_scm_gfs_v16_phys_ts_cap, only: scm_gfs_v16_phys_ts_tsinit_cap
   use ccpp_scm_gfs_v16_phys_ts_cap, only: scm_gfs_v16_phys_ts_tsfinal_cap
   use ccpp_scm_gfs_v16_phys_ts_cap, only: scm_gfs_v16_phys_ts_init_cap
   use ccpp_scm_gfs_v16_phys_ts_cap, only: scm_gfs_v16_phys_ts_run_cap
   use ccpp_scm_gfs_v16_phys_ts_cap, only: scm_gfs_v16_phys_ts_final_cap


   implicit none

   private
   public :: scm_gfs_v16_tsinit_cap, &
             scm_gfs_v16_tsfinal_cap, &
             scm_gfs_v16_init_cap, &
             scm_gfs_v16_run_cap, &
             scm_gfs_v16_final_cap

   contains

   function scm_gfs_v16_tsinit_cap(one,physics,cdata,con_pi) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t
      use machine, only: kind_phys

      implicit none

      integer :: ierr
      integer, intent(in), target :: one
      type(physics_type), intent(inout), target :: physics
      type(ccpp_t), intent(inout), target :: cdata
      real(kind_phys), intent(in), target :: con_pi

      ierr = 0


      ierr = scm_gfs_v16_time_vary_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
      if (ierr/=0) return

      ierr = scm_gfs_v16_radiation_tsinit_cap()
      if (ierr/=0) return

      ierr = scm_gfs_v16_phys_ps_tsinit_cap()
      if (ierr/=0) return

      ierr = scm_gfs_v16_phys_ts_tsinit_cap()
      if (ierr/=0) return


   end function scm_gfs_v16_tsinit_cap

   function scm_gfs_v16_tsfinal_cap() result(ierr)

      

      implicit none

      integer :: ierr
      

      ierr = 0


      ierr = scm_gfs_v16_time_vary_tsfinal_cap()
      if (ierr/=0) return

      ierr = scm_gfs_v16_radiation_tsfinal_cap()
      if (ierr/=0) return

      ierr = scm_gfs_v16_phys_ps_tsfinal_cap()
      if (ierr/=0) return

      ierr = scm_gfs_v16_phys_ts_tsfinal_cap()
      if (ierr/=0) return


   end function scm_gfs_v16_tsfinal_cap

   function scm_gfs_v16_init_cap(one,physics,cdata,con_solr_2008,con_solr_2002,con_pi,con_c,con_plnk,con_boltz, &
                  con_t0c,con_rd,con_g,ltp,con_zero,con_p0) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t
      use machine, only: kind_phys

      implicit none

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
      real(kind_phys), intent(in), target :: con_p0

      ierr = 0


      ierr = scm_gfs_v16_time_vary_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero)
      if (ierr/=0) return

      ierr = scm_gfs_v16_radiation_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
      if (ierr/=0) return

      ierr = scm_gfs_v16_phys_ps_init_cap(one=one,physics=physics,cdata=cdata,con_p0=con_p0)
      if (ierr/=0) return

      ierr = scm_gfs_v16_phys_ts_init_cap(one=one,physics=physics,cdata=cdata)
      if (ierr/=0) return


   end function scm_gfs_v16_init_cap

   function scm_gfs_v16_run_cap(one,physics,cdata,ltp,con_eps,con_pi,con_rd,con_g,con_ttp,con_thgni,con_epsm1, &
                  con_fvirt,con_rog,con_rocp,con_tice,con_cp,con_sbc,con_hvap,con_hfus,con_jcal, &
                  con_rhw0,rlapse,con_t0c,karman,con_rv,con_omega,con_1ovg,con_cliq,con_cvap, &
                  rainmin,rhowater) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t
      use machine, only: kind_phys

      implicit none

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
      real(kind_phys), intent(in), target :: con_tice
      real(kind_phys), intent(in), target :: con_cp
      real(kind_phys), intent(in), target :: con_sbc
      real(kind_phys), intent(in), target :: con_hvap
      real(kind_phys), intent(in), target :: con_hfus
      real(kind_phys), intent(in), target :: con_jcal
      real(kind_phys), intent(in), target :: con_rhw0
      real(kind_phys), intent(in), target :: rlapse
      real(kind_phys), intent(in), target :: con_t0c
      real(kind_phys), intent(in), target :: karman
      real(kind_phys), intent(in), target :: con_rv
      real(kind_phys), intent(in), target :: con_omega
      real(kind_phys), intent(in), target :: con_1ovg
      real(kind_phys), intent(in), target :: con_cliq
      real(kind_phys), intent(in), target :: con_cvap
      real(kind_phys), intent(in), target :: rainmin
      real(kind_phys), intent(in), target :: rhowater

      ierr = 0


      ierr = scm_gfs_v16_time_vary_run_cap()
      if (ierr/=0) return

      ierr = scm_gfs_v16_radiation_run_cap(one=one,physics=physics,cdata=cdata,ltp=ltp,con_eps=con_eps,con_pi=con_pi, &
                  con_rd=con_rd,con_g=con_g,con_ttp=con_ttp,con_thgni=con_thgni,con_epsm1=con_epsm1, &
                  con_fvirt=con_fvirt,con_rog=con_rog,con_rocp=con_rocp)
      if (ierr/=0) return

      ierr = scm_gfs_v16_phys_ps_run_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_g=con_g,con_tice=con_tice, &
                  con_cp=con_cp,con_pi=con_pi,con_sbc=con_sbc,con_hvap=con_hvap,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_hfus=con_hfus,con_jcal=con_jcal,con_rd=con_rd,con_rhw0=con_rhw0, &
                  rlapse=rlapse,con_t0c=con_t0c,con_rocp=con_rocp,karman=karman,con_rv=con_rv, &
                  con_omega=con_omega)
      if (ierr/=0) return

      ierr = scm_gfs_v16_phys_ts_run_cap(one=one,physics=physics,cdata=cdata,con_1ovg=con_1ovg,con_fvirt=con_fvirt, &
                  con_cliq=con_cliq,con_cp=con_cp,con_cvap=con_cvap,con_eps=con_eps,con_epsm1=con_epsm1, &
                  con_g=con_g,con_hvap=con_hvap,con_rd=con_rd,con_rv=con_rv,con_t0c=con_t0c, &
                  con_pi=con_pi,rainmin=rainmin,rhowater=rhowater)
      if (ierr/=0) return


   end function scm_gfs_v16_run_cap

   function scm_gfs_v16_final_cap(one,physics,cdata) result(ierr)

      use scm_type_defs, only: physics_type
      use ccpp_types, only: ccpp_t

      implicit none

      integer :: ierr
      integer, intent(in), target :: one
      type(physics_type), intent(inout), target :: physics
      type(ccpp_t), intent(inout), target :: cdata

      ierr = 0


      ierr = scm_gfs_v16_time_vary_final_cap(one=one,physics=physics,cdata=cdata)
      if (ierr/=0) return

      ierr = scm_gfs_v16_radiation_final_cap()
      if (ierr/=0) return

      ierr = scm_gfs_v16_phys_ps_final_cap(one=one,physics=physics,cdata=cdata)
      if (ierr/=0) return

      ierr = scm_gfs_v16_phys_ts_final_cap(one=one,physics=physics,cdata=cdata)
      if (ierr/=0) return


   end function scm_gfs_v16_final_cap

end module ccpp_scm_gfs_v16_cap
