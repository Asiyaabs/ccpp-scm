
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
!! @brief Auto-generated API for the CCPP static build
!!
!
module ccpp_static_api

   use ccpp_scm_gfs_v16_cap, only: scm_gfs_v16_tsinit_cap
   use ccpp_scm_gfs_v16_cap, only: scm_gfs_v16_tsfinal_cap
   use ccpp_scm_gfs_v16_cap, only: scm_gfs_v16_init_cap
   use ccpp_scm_gfs_v16_cap, only: scm_gfs_v16_run_cap
   use ccpp_scm_gfs_v16_cap, only: scm_gfs_v16_final_cap
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
   use ccpp_scm_gfs_v16_ps_cap, only: scm_gfs_v16_ps_tsinit_cap
   use ccpp_scm_gfs_v16_ps_cap, only: scm_gfs_v16_ps_tsfinal_cap
   use ccpp_scm_gfs_v16_ps_cap, only: scm_gfs_v16_ps_init_cap
   use ccpp_scm_gfs_v16_ps_cap, only: scm_gfs_v16_ps_run_cap
   use ccpp_scm_gfs_v16_ps_cap, only: scm_gfs_v16_ps_final_cap
   use ccpp_scm_gfs_v16_ps_time_vary_cap, only: scm_gfs_v16_ps_time_vary_tsinit_cap
   use ccpp_scm_gfs_v16_ps_time_vary_cap, only: scm_gfs_v16_ps_time_vary_tsfinal_cap
   use ccpp_scm_gfs_v16_ps_time_vary_cap, only: scm_gfs_v16_ps_time_vary_init_cap
   use ccpp_scm_gfs_v16_ps_time_vary_cap, only: scm_gfs_v16_ps_time_vary_run_cap
   use ccpp_scm_gfs_v16_ps_time_vary_cap, only: scm_gfs_v16_ps_time_vary_final_cap
   use ccpp_scm_gfs_v16_ps_radiation_cap, only: scm_gfs_v16_ps_radiation_tsinit_cap
   use ccpp_scm_gfs_v16_ps_radiation_cap, only: scm_gfs_v16_ps_radiation_tsfinal_cap
   use ccpp_scm_gfs_v16_ps_radiation_cap, only: scm_gfs_v16_ps_radiation_init_cap
   use ccpp_scm_gfs_v16_ps_radiation_cap, only: scm_gfs_v16_ps_radiation_run_cap
   use ccpp_scm_gfs_v16_ps_radiation_cap, only: scm_gfs_v16_ps_radiation_final_cap
   use ccpp_scm_gfs_v16_ps_phys_ps_cap, only: scm_gfs_v16_ps_phys_ps_tsinit_cap
   use ccpp_scm_gfs_v16_ps_phys_ps_cap, only: scm_gfs_v16_ps_phys_ps_tsfinal_cap
   use ccpp_scm_gfs_v16_ps_phys_ps_cap, only: scm_gfs_v16_ps_phys_ps_init_cap
   use ccpp_scm_gfs_v16_ps_phys_ps_cap, only: scm_gfs_v16_ps_phys_ps_run_cap
   use ccpp_scm_gfs_v16_ps_phys_ps_cap, only: scm_gfs_v16_ps_phys_ps_final_cap
   use ccpp_scm_gfs_v16_ps_phys_ts_cap, only: scm_gfs_v16_ps_phys_ts_tsinit_cap
   use ccpp_scm_gfs_v16_ps_phys_ts_cap, only: scm_gfs_v16_ps_phys_ts_tsfinal_cap
   use ccpp_scm_gfs_v16_ps_phys_ts_cap, only: scm_gfs_v16_ps_phys_ts_init_cap
   use ccpp_scm_gfs_v16_ps_phys_ts_cap, only: scm_gfs_v16_ps_phys_ts_run_cap
   use ccpp_scm_gfs_v16_ps_phys_ts_cap, only: scm_gfs_v16_ps_phys_ts_final_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_cap, only: scm_gfs_v17_p8_ugwpv1_tsinit_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_cap, only: scm_gfs_v17_p8_ugwpv1_tsfinal_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_cap, only: scm_gfs_v17_p8_ugwpv1_init_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_cap, only: scm_gfs_v17_p8_ugwpv1_run_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_cap, only: scm_gfs_v17_p8_ugwpv1_final_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_time_vary_cap, only: scm_gfs_v17_p8_ugwpv1_time_vary_tsinit_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_time_vary_cap, only: scm_gfs_v17_p8_ugwpv1_time_vary_tsfinal_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_time_vary_cap, only: scm_gfs_v17_p8_ugwpv1_time_vary_init_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_time_vary_cap, only: scm_gfs_v17_p8_ugwpv1_time_vary_run_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_time_vary_cap, only: scm_gfs_v17_p8_ugwpv1_time_vary_final_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_radiation_cap, only: scm_gfs_v17_p8_ugwpv1_radiation_tsinit_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_radiation_cap, only: scm_gfs_v17_p8_ugwpv1_radiation_tsfinal_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_radiation_cap, only: scm_gfs_v17_p8_ugwpv1_radiation_init_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_radiation_cap, only: scm_gfs_v17_p8_ugwpv1_radiation_run_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_radiation_cap, only: scm_gfs_v17_p8_ugwpv1_radiation_final_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_phys_ps_cap, only: scm_gfs_v17_p8_ugwpv1_phys_ps_tsinit_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_phys_ps_cap, only: scm_gfs_v17_p8_ugwpv1_phys_ps_tsfinal_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_phys_ps_cap, only: scm_gfs_v17_p8_ugwpv1_phys_ps_init_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_phys_ps_cap, only: scm_gfs_v17_p8_ugwpv1_phys_ps_run_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_phys_ps_cap, only: scm_gfs_v17_p8_ugwpv1_phys_ps_final_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_phys_ts_cap, only: scm_gfs_v17_p8_ugwpv1_phys_ts_tsinit_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_phys_ts_cap, only: scm_gfs_v17_p8_ugwpv1_phys_ts_tsfinal_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_phys_ts_cap, only: scm_gfs_v17_p8_ugwpv1_phys_ts_init_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_phys_ts_cap, only: scm_gfs_v17_p8_ugwpv1_phys_ts_run_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_phys_ts_cap, only: scm_gfs_v17_p8_ugwpv1_phys_ts_final_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_cap, only: scm_gfs_v17_p8_ugwpv1_ps_tsinit_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_cap, only: scm_gfs_v17_p8_ugwpv1_ps_tsfinal_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_cap, only: scm_gfs_v17_p8_ugwpv1_ps_init_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_cap, only: scm_gfs_v17_p8_ugwpv1_ps_run_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_cap, only: scm_gfs_v17_p8_ugwpv1_ps_final_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_time_vary_cap, only: scm_gfs_v17_p8_ugwpv1_ps_time_vary_tsinit_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_time_vary_cap, only: scm_gfs_v17_p8_ugwpv1_ps_time_vary_tsfinal_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_time_vary_cap, only: scm_gfs_v17_p8_ugwpv1_ps_time_vary_init_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_time_vary_cap, only: scm_gfs_v17_p8_ugwpv1_ps_time_vary_run_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_time_vary_cap, only: scm_gfs_v17_p8_ugwpv1_ps_time_vary_final_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_radiation_cap, only: scm_gfs_v17_p8_ugwpv1_ps_radiation_tsinit_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_radiation_cap, only: scm_gfs_v17_p8_ugwpv1_ps_radiation_tsfinal_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_radiation_cap, only: scm_gfs_v17_p8_ugwpv1_ps_radiation_init_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_radiation_cap, only: scm_gfs_v17_p8_ugwpv1_ps_radiation_run_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_radiation_cap, only: scm_gfs_v17_p8_ugwpv1_ps_radiation_final_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_phys_ps_cap, only: scm_gfs_v17_p8_ugwpv1_ps_phys_ps_tsinit_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_phys_ps_cap, only: scm_gfs_v17_p8_ugwpv1_ps_phys_ps_tsfinal_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_phys_ps_cap, only: scm_gfs_v17_p8_ugwpv1_ps_phys_ps_init_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_phys_ps_cap, only: scm_gfs_v17_p8_ugwpv1_ps_phys_ps_run_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_phys_ps_cap, only: scm_gfs_v17_p8_ugwpv1_ps_phys_ps_final_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_phys_ts_cap, only: scm_gfs_v17_p8_ugwpv1_ps_phys_ts_tsinit_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_phys_ts_cap, only: scm_gfs_v17_p8_ugwpv1_ps_phys_ts_tsfinal_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_phys_ts_cap, only: scm_gfs_v17_p8_ugwpv1_ps_phys_ts_init_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_phys_ts_cap, only: scm_gfs_v17_p8_ugwpv1_ps_phys_ts_run_cap
   use ccpp_scm_gfs_v17_p8_ugwpv1_ps_phys_ts_cap, only: scm_gfs_v17_p8_ugwpv1_ps_phys_ts_final_cap
   use ccpp_scm_rap_cap, only: scm_rap_tsinit_cap
   use ccpp_scm_rap_cap, only: scm_rap_tsfinal_cap
   use ccpp_scm_rap_cap, only: scm_rap_init_cap
   use ccpp_scm_rap_cap, only: scm_rap_run_cap
   use ccpp_scm_rap_cap, only: scm_rap_final_cap
   use ccpp_scm_rap_time_vary_cap, only: scm_rap_time_vary_tsinit_cap
   use ccpp_scm_rap_time_vary_cap, only: scm_rap_time_vary_tsfinal_cap
   use ccpp_scm_rap_time_vary_cap, only: scm_rap_time_vary_init_cap
   use ccpp_scm_rap_time_vary_cap, only: scm_rap_time_vary_run_cap
   use ccpp_scm_rap_time_vary_cap, only: scm_rap_time_vary_final_cap
   use ccpp_scm_rap_radiation_cap, only: scm_rap_radiation_tsinit_cap
   use ccpp_scm_rap_radiation_cap, only: scm_rap_radiation_tsfinal_cap
   use ccpp_scm_rap_radiation_cap, only: scm_rap_radiation_init_cap
   use ccpp_scm_rap_radiation_cap, only: scm_rap_radiation_run_cap
   use ccpp_scm_rap_radiation_cap, only: scm_rap_radiation_final_cap
   use ccpp_scm_rap_phys_ps_cap, only: scm_rap_phys_ps_tsinit_cap
   use ccpp_scm_rap_phys_ps_cap, only: scm_rap_phys_ps_tsfinal_cap
   use ccpp_scm_rap_phys_ps_cap, only: scm_rap_phys_ps_init_cap
   use ccpp_scm_rap_phys_ps_cap, only: scm_rap_phys_ps_run_cap
   use ccpp_scm_rap_phys_ps_cap, only: scm_rap_phys_ps_final_cap
   use ccpp_scm_rap_phys_ts_cap, only: scm_rap_phys_ts_tsinit_cap
   use ccpp_scm_rap_phys_ts_cap, only: scm_rap_phys_ts_tsfinal_cap
   use ccpp_scm_rap_phys_ts_cap, only: scm_rap_phys_ts_init_cap
   use ccpp_scm_rap_phys_ts_cap, only: scm_rap_phys_ts_run_cap
   use ccpp_scm_rap_phys_ts_cap, only: scm_rap_phys_ts_final_cap
   use ccpp_scm_rap_ps_cap, only: scm_rap_ps_tsinit_cap
   use ccpp_scm_rap_ps_cap, only: scm_rap_ps_tsfinal_cap
   use ccpp_scm_rap_ps_cap, only: scm_rap_ps_init_cap
   use ccpp_scm_rap_ps_cap, only: scm_rap_ps_run_cap
   use ccpp_scm_rap_ps_cap, only: scm_rap_ps_final_cap
   use ccpp_scm_rap_ps_time_vary_cap, only: scm_rap_ps_time_vary_tsinit_cap
   use ccpp_scm_rap_ps_time_vary_cap, only: scm_rap_ps_time_vary_tsfinal_cap
   use ccpp_scm_rap_ps_time_vary_cap, only: scm_rap_ps_time_vary_init_cap
   use ccpp_scm_rap_ps_time_vary_cap, only: scm_rap_ps_time_vary_run_cap
   use ccpp_scm_rap_ps_time_vary_cap, only: scm_rap_ps_time_vary_final_cap
   use ccpp_scm_rap_ps_radiation_cap, only: scm_rap_ps_radiation_tsinit_cap
   use ccpp_scm_rap_ps_radiation_cap, only: scm_rap_ps_radiation_tsfinal_cap
   use ccpp_scm_rap_ps_radiation_cap, only: scm_rap_ps_radiation_init_cap
   use ccpp_scm_rap_ps_radiation_cap, only: scm_rap_ps_radiation_run_cap
   use ccpp_scm_rap_ps_radiation_cap, only: scm_rap_ps_radiation_final_cap
   use ccpp_scm_rap_ps_phys_ps_cap, only: scm_rap_ps_phys_ps_tsinit_cap
   use ccpp_scm_rap_ps_phys_ps_cap, only: scm_rap_ps_phys_ps_tsfinal_cap
   use ccpp_scm_rap_ps_phys_ps_cap, only: scm_rap_ps_phys_ps_init_cap
   use ccpp_scm_rap_ps_phys_ps_cap, only: scm_rap_ps_phys_ps_run_cap
   use ccpp_scm_rap_ps_phys_ps_cap, only: scm_rap_ps_phys_ps_final_cap
   use ccpp_scm_rap_ps_phys_ts_cap, only: scm_rap_ps_phys_ts_tsinit_cap
   use ccpp_scm_rap_ps_phys_ts_cap, only: scm_rap_ps_phys_ts_tsfinal_cap
   use ccpp_scm_rap_ps_phys_ts_cap, only: scm_rap_ps_phys_ts_init_cap
   use ccpp_scm_rap_ps_phys_ts_cap, only: scm_rap_ps_phys_ts_run_cap
   use ccpp_scm_rap_ps_phys_ts_cap, only: scm_rap_ps_phys_ts_final_cap
   use ccpp_scm_hrrr_gf_cap, only: scm_hrrr_gf_tsinit_cap
   use ccpp_scm_hrrr_gf_cap, only: scm_hrrr_gf_tsfinal_cap
   use ccpp_scm_hrrr_gf_cap, only: scm_hrrr_gf_init_cap
   use ccpp_scm_hrrr_gf_cap, only: scm_hrrr_gf_run_cap
   use ccpp_scm_hrrr_gf_cap, only: scm_hrrr_gf_final_cap
   use ccpp_scm_hrrr_gf_time_vary_cap, only: scm_hrrr_gf_time_vary_tsinit_cap
   use ccpp_scm_hrrr_gf_time_vary_cap, only: scm_hrrr_gf_time_vary_tsfinal_cap
   use ccpp_scm_hrrr_gf_time_vary_cap, only: scm_hrrr_gf_time_vary_init_cap
   use ccpp_scm_hrrr_gf_time_vary_cap, only: scm_hrrr_gf_time_vary_run_cap
   use ccpp_scm_hrrr_gf_time_vary_cap, only: scm_hrrr_gf_time_vary_final_cap
   use ccpp_scm_hrrr_gf_radiation_cap, only: scm_hrrr_gf_radiation_tsinit_cap
   use ccpp_scm_hrrr_gf_radiation_cap, only: scm_hrrr_gf_radiation_tsfinal_cap
   use ccpp_scm_hrrr_gf_radiation_cap, only: scm_hrrr_gf_radiation_init_cap
   use ccpp_scm_hrrr_gf_radiation_cap, only: scm_hrrr_gf_radiation_run_cap
   use ccpp_scm_hrrr_gf_radiation_cap, only: scm_hrrr_gf_radiation_final_cap
   use ccpp_scm_hrrr_gf_phys_ps_cap, only: scm_hrrr_gf_phys_ps_tsinit_cap
   use ccpp_scm_hrrr_gf_phys_ps_cap, only: scm_hrrr_gf_phys_ps_tsfinal_cap
   use ccpp_scm_hrrr_gf_phys_ps_cap, only: scm_hrrr_gf_phys_ps_init_cap
   use ccpp_scm_hrrr_gf_phys_ps_cap, only: scm_hrrr_gf_phys_ps_run_cap
   use ccpp_scm_hrrr_gf_phys_ps_cap, only: scm_hrrr_gf_phys_ps_final_cap
   use ccpp_scm_hrrr_gf_phys_ts_cap, only: scm_hrrr_gf_phys_ts_tsinit_cap
   use ccpp_scm_hrrr_gf_phys_ts_cap, only: scm_hrrr_gf_phys_ts_tsfinal_cap
   use ccpp_scm_hrrr_gf_phys_ts_cap, only: scm_hrrr_gf_phys_ts_init_cap
   use ccpp_scm_hrrr_gf_phys_ts_cap, only: scm_hrrr_gf_phys_ts_run_cap
   use ccpp_scm_hrrr_gf_phys_ts_cap, only: scm_hrrr_gf_phys_ts_final_cap
   use ccpp_scm_hrrr_gf_ps_cap, only: scm_hrrr_gf_ps_tsinit_cap
   use ccpp_scm_hrrr_gf_ps_cap, only: scm_hrrr_gf_ps_tsfinal_cap
   use ccpp_scm_hrrr_gf_ps_cap, only: scm_hrrr_gf_ps_init_cap
   use ccpp_scm_hrrr_gf_ps_cap, only: scm_hrrr_gf_ps_run_cap
   use ccpp_scm_hrrr_gf_ps_cap, only: scm_hrrr_gf_ps_final_cap
   use ccpp_scm_hrrr_gf_ps_time_vary_cap, only: scm_hrrr_gf_ps_time_vary_tsinit_cap
   use ccpp_scm_hrrr_gf_ps_time_vary_cap, only: scm_hrrr_gf_ps_time_vary_tsfinal_cap
   use ccpp_scm_hrrr_gf_ps_time_vary_cap, only: scm_hrrr_gf_ps_time_vary_init_cap
   use ccpp_scm_hrrr_gf_ps_time_vary_cap, only: scm_hrrr_gf_ps_time_vary_run_cap
   use ccpp_scm_hrrr_gf_ps_time_vary_cap, only: scm_hrrr_gf_ps_time_vary_final_cap
   use ccpp_scm_hrrr_gf_ps_radiation_cap, only: scm_hrrr_gf_ps_radiation_tsinit_cap
   use ccpp_scm_hrrr_gf_ps_radiation_cap, only: scm_hrrr_gf_ps_radiation_tsfinal_cap
   use ccpp_scm_hrrr_gf_ps_radiation_cap, only: scm_hrrr_gf_ps_radiation_init_cap
   use ccpp_scm_hrrr_gf_ps_radiation_cap, only: scm_hrrr_gf_ps_radiation_run_cap
   use ccpp_scm_hrrr_gf_ps_radiation_cap, only: scm_hrrr_gf_ps_radiation_final_cap
   use ccpp_scm_hrrr_gf_ps_phys_ps_cap, only: scm_hrrr_gf_ps_phys_ps_tsinit_cap
   use ccpp_scm_hrrr_gf_ps_phys_ps_cap, only: scm_hrrr_gf_ps_phys_ps_tsfinal_cap
   use ccpp_scm_hrrr_gf_ps_phys_ps_cap, only: scm_hrrr_gf_ps_phys_ps_init_cap
   use ccpp_scm_hrrr_gf_ps_phys_ps_cap, only: scm_hrrr_gf_ps_phys_ps_run_cap
   use ccpp_scm_hrrr_gf_ps_phys_ps_cap, only: scm_hrrr_gf_ps_phys_ps_final_cap
   use ccpp_scm_hrrr_gf_ps_phys_ts_cap, only: scm_hrrr_gf_ps_phys_ts_tsinit_cap
   use ccpp_scm_hrrr_gf_ps_phys_ts_cap, only: scm_hrrr_gf_ps_phys_ts_tsfinal_cap
   use ccpp_scm_hrrr_gf_ps_phys_ts_cap, only: scm_hrrr_gf_ps_phys_ts_init_cap
   use ccpp_scm_hrrr_gf_ps_phys_ts_cap, only: scm_hrrr_gf_ps_phys_ts_run_cap
   use ccpp_scm_hrrr_gf_ps_phys_ts_cap, only: scm_hrrr_gf_ps_phys_ts_final_cap
   use ccpp_scm_wofs_v0_cap, only: scm_wofs_v0_tsinit_cap
   use ccpp_scm_wofs_v0_cap, only: scm_wofs_v0_tsfinal_cap
   use ccpp_scm_wofs_v0_cap, only: scm_wofs_v0_init_cap
   use ccpp_scm_wofs_v0_cap, only: scm_wofs_v0_run_cap
   use ccpp_scm_wofs_v0_cap, only: scm_wofs_v0_final_cap
   use ccpp_scm_wofs_v0_time_vary_cap, only: scm_wofs_v0_time_vary_tsinit_cap
   use ccpp_scm_wofs_v0_time_vary_cap, only: scm_wofs_v0_time_vary_tsfinal_cap
   use ccpp_scm_wofs_v0_time_vary_cap, only: scm_wofs_v0_time_vary_init_cap
   use ccpp_scm_wofs_v0_time_vary_cap, only: scm_wofs_v0_time_vary_run_cap
   use ccpp_scm_wofs_v0_time_vary_cap, only: scm_wofs_v0_time_vary_final_cap
   use ccpp_scm_wofs_v0_radiation_cap, only: scm_wofs_v0_radiation_tsinit_cap
   use ccpp_scm_wofs_v0_radiation_cap, only: scm_wofs_v0_radiation_tsfinal_cap
   use ccpp_scm_wofs_v0_radiation_cap, only: scm_wofs_v0_radiation_init_cap
   use ccpp_scm_wofs_v0_radiation_cap, only: scm_wofs_v0_radiation_run_cap
   use ccpp_scm_wofs_v0_radiation_cap, only: scm_wofs_v0_radiation_final_cap
   use ccpp_scm_wofs_v0_phys_ps_cap, only: scm_wofs_v0_phys_ps_tsinit_cap
   use ccpp_scm_wofs_v0_phys_ps_cap, only: scm_wofs_v0_phys_ps_tsfinal_cap
   use ccpp_scm_wofs_v0_phys_ps_cap, only: scm_wofs_v0_phys_ps_init_cap
   use ccpp_scm_wofs_v0_phys_ps_cap, only: scm_wofs_v0_phys_ps_run_cap
   use ccpp_scm_wofs_v0_phys_ps_cap, only: scm_wofs_v0_phys_ps_final_cap
   use ccpp_scm_wofs_v0_phys_ts_cap, only: scm_wofs_v0_phys_ts_tsinit_cap
   use ccpp_scm_wofs_v0_phys_ts_cap, only: scm_wofs_v0_phys_ts_tsfinal_cap
   use ccpp_scm_wofs_v0_phys_ts_cap, only: scm_wofs_v0_phys_ts_init_cap
   use ccpp_scm_wofs_v0_phys_ts_cap, only: scm_wofs_v0_phys_ts_run_cap
   use ccpp_scm_wofs_v0_phys_ts_cap, only: scm_wofs_v0_phys_ts_final_cap
   use ccpp_scm_wofs_v0_ps_cap, only: scm_wofs_v0_ps_tsinit_cap
   use ccpp_scm_wofs_v0_ps_cap, only: scm_wofs_v0_ps_tsfinal_cap
   use ccpp_scm_wofs_v0_ps_cap, only: scm_wofs_v0_ps_init_cap
   use ccpp_scm_wofs_v0_ps_cap, only: scm_wofs_v0_ps_run_cap
   use ccpp_scm_wofs_v0_ps_cap, only: scm_wofs_v0_ps_final_cap
   use ccpp_scm_wofs_v0_ps_time_vary_cap, only: scm_wofs_v0_ps_time_vary_tsinit_cap
   use ccpp_scm_wofs_v0_ps_time_vary_cap, only: scm_wofs_v0_ps_time_vary_tsfinal_cap
   use ccpp_scm_wofs_v0_ps_time_vary_cap, only: scm_wofs_v0_ps_time_vary_init_cap
   use ccpp_scm_wofs_v0_ps_time_vary_cap, only: scm_wofs_v0_ps_time_vary_run_cap
   use ccpp_scm_wofs_v0_ps_time_vary_cap, only: scm_wofs_v0_ps_time_vary_final_cap
   use ccpp_scm_wofs_v0_ps_radiation_cap, only: scm_wofs_v0_ps_radiation_tsinit_cap
   use ccpp_scm_wofs_v0_ps_radiation_cap, only: scm_wofs_v0_ps_radiation_tsfinal_cap
   use ccpp_scm_wofs_v0_ps_radiation_cap, only: scm_wofs_v0_ps_radiation_init_cap
   use ccpp_scm_wofs_v0_ps_radiation_cap, only: scm_wofs_v0_ps_radiation_run_cap
   use ccpp_scm_wofs_v0_ps_radiation_cap, only: scm_wofs_v0_ps_radiation_final_cap
   use ccpp_scm_wofs_v0_ps_phys_ps_cap, only: scm_wofs_v0_ps_phys_ps_tsinit_cap
   use ccpp_scm_wofs_v0_ps_phys_ps_cap, only: scm_wofs_v0_ps_phys_ps_tsfinal_cap
   use ccpp_scm_wofs_v0_ps_phys_ps_cap, only: scm_wofs_v0_ps_phys_ps_init_cap
   use ccpp_scm_wofs_v0_ps_phys_ps_cap, only: scm_wofs_v0_ps_phys_ps_run_cap
   use ccpp_scm_wofs_v0_ps_phys_ps_cap, only: scm_wofs_v0_ps_phys_ps_final_cap
   use ccpp_scm_wofs_v0_ps_phys_ts_cap, only: scm_wofs_v0_ps_phys_ts_tsinit_cap
   use ccpp_scm_wofs_v0_ps_phys_ts_cap, only: scm_wofs_v0_ps_phys_ts_tsfinal_cap
   use ccpp_scm_wofs_v0_ps_phys_ts_cap, only: scm_wofs_v0_ps_phys_ts_init_cap
   use ccpp_scm_wofs_v0_ps_phys_ts_cap, only: scm_wofs_v0_ps_phys_ts_run_cap
   use ccpp_scm_wofs_v0_ps_phys_ts_cap, only: scm_wofs_v0_ps_phys_ts_final_cap
   use ccpp_scm_gfs_v16_rrtmgp_cap, only: scm_gfs_v16_rrtmgp_tsinit_cap
   use ccpp_scm_gfs_v16_rrtmgp_cap, only: scm_gfs_v16_rrtmgp_tsfinal_cap
   use ccpp_scm_gfs_v16_rrtmgp_cap, only: scm_gfs_v16_rrtmgp_init_cap
   use ccpp_scm_gfs_v16_rrtmgp_cap, only: scm_gfs_v16_rrtmgp_run_cap
   use ccpp_scm_gfs_v16_rrtmgp_cap, only: scm_gfs_v16_rrtmgp_final_cap
   use ccpp_scm_gfs_v16_rrtmgp_time_vary_cap, only: scm_gfs_v16_rrtmgp_time_vary_tsinit_cap
   use ccpp_scm_gfs_v16_rrtmgp_time_vary_cap, only: scm_gfs_v16_rrtmgp_time_vary_tsfinal_cap
   use ccpp_scm_gfs_v16_rrtmgp_time_vary_cap, only: scm_gfs_v16_rrtmgp_time_vary_init_cap
   use ccpp_scm_gfs_v16_rrtmgp_time_vary_cap, only: scm_gfs_v16_rrtmgp_time_vary_run_cap
   use ccpp_scm_gfs_v16_rrtmgp_time_vary_cap, only: scm_gfs_v16_rrtmgp_time_vary_final_cap
   use ccpp_scm_gfs_v16_rrtmgp_radiation_cap, only: scm_gfs_v16_rrtmgp_radiation_tsinit_cap
   use ccpp_scm_gfs_v16_rrtmgp_radiation_cap, only: scm_gfs_v16_rrtmgp_radiation_tsfinal_cap
   use ccpp_scm_gfs_v16_rrtmgp_radiation_cap, only: scm_gfs_v16_rrtmgp_radiation_init_cap
   use ccpp_scm_gfs_v16_rrtmgp_radiation_cap, only: scm_gfs_v16_rrtmgp_radiation_run_cap
   use ccpp_scm_gfs_v16_rrtmgp_radiation_cap, only: scm_gfs_v16_rrtmgp_radiation_final_cap
   use ccpp_scm_gfs_v16_rrtmgp_phys_ps_cap, only: scm_gfs_v16_rrtmgp_phys_ps_tsinit_cap
   use ccpp_scm_gfs_v16_rrtmgp_phys_ps_cap, only: scm_gfs_v16_rrtmgp_phys_ps_tsfinal_cap
   use ccpp_scm_gfs_v16_rrtmgp_phys_ps_cap, only: scm_gfs_v16_rrtmgp_phys_ps_init_cap
   use ccpp_scm_gfs_v16_rrtmgp_phys_ps_cap, only: scm_gfs_v16_rrtmgp_phys_ps_run_cap
   use ccpp_scm_gfs_v16_rrtmgp_phys_ps_cap, only: scm_gfs_v16_rrtmgp_phys_ps_final_cap
   use ccpp_scm_gfs_v16_rrtmgp_phys_ts_cap, only: scm_gfs_v16_rrtmgp_phys_ts_tsinit_cap
   use ccpp_scm_gfs_v16_rrtmgp_phys_ts_cap, only: scm_gfs_v16_rrtmgp_phys_ts_tsfinal_cap
   use ccpp_scm_gfs_v16_rrtmgp_phys_ts_cap, only: scm_gfs_v16_rrtmgp_phys_ts_init_cap
   use ccpp_scm_gfs_v16_rrtmgp_phys_ts_cap, only: scm_gfs_v16_rrtmgp_phys_ts_run_cap
   use ccpp_scm_gfs_v16_rrtmgp_phys_ts_cap, only: scm_gfs_v16_rrtmgp_phys_ts_final_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_cap, only: scm_gfs_v16_rrtmgp_ps_tsinit_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_cap, only: scm_gfs_v16_rrtmgp_ps_tsfinal_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_cap, only: scm_gfs_v16_rrtmgp_ps_init_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_cap, only: scm_gfs_v16_rrtmgp_ps_run_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_cap, only: scm_gfs_v16_rrtmgp_ps_final_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_time_vary_cap, only: scm_gfs_v16_rrtmgp_ps_time_vary_tsinit_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_time_vary_cap, only: scm_gfs_v16_rrtmgp_ps_time_vary_tsfinal_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_time_vary_cap, only: scm_gfs_v16_rrtmgp_ps_time_vary_init_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_time_vary_cap, only: scm_gfs_v16_rrtmgp_ps_time_vary_run_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_time_vary_cap, only: scm_gfs_v16_rrtmgp_ps_time_vary_final_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_radiation_cap, only: scm_gfs_v16_rrtmgp_ps_radiation_tsinit_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_radiation_cap, only: scm_gfs_v16_rrtmgp_ps_radiation_tsfinal_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_radiation_cap, only: scm_gfs_v16_rrtmgp_ps_radiation_init_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_radiation_cap, only: scm_gfs_v16_rrtmgp_ps_radiation_run_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_radiation_cap, only: scm_gfs_v16_rrtmgp_ps_radiation_final_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_phys_ps_cap, only: scm_gfs_v16_rrtmgp_ps_phys_ps_tsinit_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_phys_ps_cap, only: scm_gfs_v16_rrtmgp_ps_phys_ps_tsfinal_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_phys_ps_cap, only: scm_gfs_v16_rrtmgp_ps_phys_ps_init_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_phys_ps_cap, only: scm_gfs_v16_rrtmgp_ps_phys_ps_run_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_phys_ps_cap, only: scm_gfs_v16_rrtmgp_ps_phys_ps_final_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_phys_ts_cap, only: scm_gfs_v16_rrtmgp_ps_phys_ts_tsinit_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_phys_ts_cap, only: scm_gfs_v16_rrtmgp_ps_phys_ts_tsfinal_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_phys_ts_cap, only: scm_gfs_v16_rrtmgp_ps_phys_ts_init_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_phys_ts_cap, only: scm_gfs_v16_rrtmgp_ps_phys_ts_run_cap
   use ccpp_scm_gfs_v16_rrtmgp_ps_phys_ts_cap, only: scm_gfs_v16_rrtmgp_ps_phys_ts_final_cap
   use ccpp_types, only: one
   use scm_type_defs, only: physics
   use scm_physical_constants, only: con_pi
   use scm_physical_constants, only: con_g
   use scm_physical_constants, only: con_t0c
   use scm_physical_constants, only: con_hfus
   use scm_physical_constants, only: con_solr_2008
   use scm_physical_constants, only: con_solr_2002
   use scm_physical_constants, only: con_c
   use scm_physical_constants, only: con_plnk
   use scm_physical_constants, only: con_boltz
   use scm_physical_constants, only: con_rd
   use gfs_typedefs, only: ltp
   use scm_physical_constants, only: con_zero
   use scm_physical_constants, only: con_p0
   use scm_physical_constants, only: con_rerth
   use scm_physical_constants, only: con_omega
   use scm_physical_constants, only: con_cp
   use scm_physical_constants, only: con_rv
   use scm_physical_constants, only: con_fvirt
   use scm_physical_constants, only: con_rgas
   use scm_physical_constants, only: con_amd
   use scm_physical_constants, only: con_amw
   use scm_physical_constants, only: con_avgd
   use scm_physical_constants, only: con_hvap
   use scm_physical_constants, only: con_eps
   use scm_physical_constants, only: con_cvap
   use scm_physical_constants, only: con_cliq
   use scm_physical_constants, only: con_csol
   use scm_physical_constants, only: con_rocp
   use scm_physical_constants, only: karman
   use scm_physical_constants, only: con_sbc
   use scm_physical_constants, only: rhowater
   use scm_physical_constants, only: rholakeice
   use scm_physical_constants, only: con_ttp
   use scm_physical_constants, only: con_thgni
   use scm_physical_constants, only: con_epsm1
   use scm_physical_constants, only: con_rog
   use scm_physical_constants, only: con_tice
   use scm_physical_constants, only: con_jcal
   use scm_physical_constants, only: con_rhw0
   use scm_physical_constants, only: rlapse
   use scm_physical_constants, only: con_1ovg
   use scm_physical_constants, only: rainmin
   use scm_physical_constants, only: con_epsqs
   use scm_physical_constants, only: con_epsq

   implicit none

   private
   public :: ccpp_physics_timestep_init,ccpp_physics_timestep_finalize,ccpp_physics_init,ccpp_physics_run,ccpp_physics_finalize

   contains

   ! Necessary to convert incoming suite and group names to lowercase
   function to_lower(str) result(lower)
      implicit none
      character(len=*), intent(in) :: str
      character(len=len(str)) :: lower
      integer, parameter :: upper_to_lower = ichar('a') - ichar('A')
      integer :: i, ichar_val

      do i = 1, len(str)
         ichar_val = ichar(str(i:i))
         if (ichar_val >= ichar('A') .and. ichar_val <= ichar('Z')) then
            lower(i:i) = char(ichar_val + upper_to_lower)
         else
            lower(i:i) = str(i:i)
         end if
      end do
   end function to_lower

   subroutine ccpp_physics_timestep_init(cdata, suite_name, group_name, ierr)

      use ccpp_types, only : ccpp_t

      implicit none

      type(ccpp_t),               intent(inout) :: cdata
      character(len=*),           intent(in)    :: suite_name
      character(len=*), optional, intent(in)    :: group_name
      integer,                    intent(out)   :: ierr

      ierr = 0


      if (to_lower(trim(suite_name))=="scm_gfs_v16") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_time_vary_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_radiation_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_phys_ps_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_phys_ts_tsinit_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_ps_time_vary_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_ps_radiation_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_ps_phys_ps_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_ps_phys_ts_tsinit_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_ps_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v17_p8_ugwpv1") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v17_p8_ugwpv1_time_vary_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v17_p8_ugwpv1_radiation_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v17_p8_ugwpv1_phys_ps_tsinit_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_t0c=con_t0c,con_hfus=con_hfus)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v17_p8_ugwpv1_phys_ts_tsinit_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v17_p8_ugwpv1_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi,con_g=con_g,con_t0c=con_t0c, &
                  con_hfus=con_hfus)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v17_p8_ugwpv1_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_time_vary_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_radiation_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_phys_ps_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_phys_ts_tsinit_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v17_p8_ugwpv1_ps_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)

         end if

      else if (to_lower(trim(suite_name))=="scm_rap") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_rap_time_vary_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_rap_radiation_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_rap_phys_ps_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_rap_phys_ts_tsinit_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_rap_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)

         end if

      else if (to_lower(trim(suite_name))=="scm_rap_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_rap_ps_time_vary_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_rap_ps_radiation_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_rap_ps_phys_ps_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_rap_ps_phys_ts_tsinit_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_rap_ps_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)

         end if

      else if (to_lower(trim(suite_name))=="scm_hrrr_gf") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_hrrr_gf_time_vary_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_hrrr_gf_radiation_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_hrrr_gf_phys_ps_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_hrrr_gf_phys_ts_tsinit_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_hrrr_gf_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)

         end if

      else if (to_lower(trim(suite_name))=="scm_hrrr_gf_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_hrrr_gf_ps_time_vary_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_hrrr_gf_ps_radiation_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_hrrr_gf_ps_phys_ps_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_hrrr_gf_ps_phys_ts_tsinit_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_hrrr_gf_ps_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)

         end if

      else if (to_lower(trim(suite_name))=="scm_wofs_v0") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_wofs_v0_time_vary_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_wofs_v0_radiation_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_wofs_v0_phys_ps_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_wofs_v0_phys_ts_tsinit_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_wofs_v0_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)

         end if

      else if (to_lower(trim(suite_name))=="scm_wofs_v0_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_wofs_v0_ps_time_vary_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_wofs_v0_ps_radiation_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_wofs_v0_ps_phys_ps_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_wofs_v0_ps_phys_ts_tsinit_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_wofs_v0_ps_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_rrtmgp") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_rrtmgp_time_vary_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_rrtmgp_radiation_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_rrtmgp_phys_ps_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_rrtmgp_phys_ts_tsinit_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_rrtmgp_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_rrtmgp_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_rrtmgp_ps_time_vary_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_rrtmgp_ps_radiation_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_rrtmgp_ps_phys_ps_tsinit_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_rrtmgp_ps_phys_ts_tsinit_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_rrtmgp_ps_tsinit_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)

         end if

      else

         write(cdata%errmsg,'(*(a))') 'Invalid suite ' // to_lower(trim(suite_name))
         ierr = 1

      end if

      cdata%errflg = ierr

   end subroutine ccpp_physics_timestep_init

   subroutine ccpp_physics_timestep_finalize(cdata, suite_name, group_name, ierr)

      use ccpp_types, only : ccpp_t

      implicit none

      type(ccpp_t),               intent(inout) :: cdata
      character(len=*),           intent(in)    :: suite_name
      character(len=*), optional, intent(in)    :: group_name
      integer,                    intent(out)   :: ierr

      ierr = 0


      if (to_lower(trim(suite_name))=="scm_gfs_v16") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_time_vary_tsfinal_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_radiation_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_phys_ps_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_phys_ts_tsfinal_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_tsfinal_cap()

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_ps_time_vary_tsfinal_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_ps_radiation_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_ps_phys_ps_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_ps_phys_ts_tsfinal_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_ps_tsfinal_cap()

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v17_p8_ugwpv1") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v17_p8_ugwpv1_time_vary_tsfinal_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v17_p8_ugwpv1_radiation_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v17_p8_ugwpv1_phys_ps_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v17_p8_ugwpv1_phys_ts_tsfinal_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v17_p8_ugwpv1_tsfinal_cap()

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v17_p8_ugwpv1_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_time_vary_tsfinal_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_radiation_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_phys_ps_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_phys_ts_tsfinal_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v17_p8_ugwpv1_ps_tsfinal_cap()

         end if

      else if (to_lower(trim(suite_name))=="scm_rap") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_rap_time_vary_tsfinal_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_rap_radiation_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_rap_phys_ps_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_rap_phys_ts_tsfinal_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_rap_tsfinal_cap()

         end if

      else if (to_lower(trim(suite_name))=="scm_rap_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_rap_ps_time_vary_tsfinal_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_rap_ps_radiation_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_rap_ps_phys_ps_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_rap_ps_phys_ts_tsfinal_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_rap_ps_tsfinal_cap()

         end if

      else if (to_lower(trim(suite_name))=="scm_hrrr_gf") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_hrrr_gf_time_vary_tsfinal_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_hrrr_gf_radiation_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_hrrr_gf_phys_ps_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_hrrr_gf_phys_ts_tsfinal_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_hrrr_gf_tsfinal_cap()

         end if

      else if (to_lower(trim(suite_name))=="scm_hrrr_gf_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_hrrr_gf_ps_time_vary_tsfinal_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_hrrr_gf_ps_radiation_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_hrrr_gf_ps_phys_ps_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_hrrr_gf_ps_phys_ts_tsfinal_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_hrrr_gf_ps_tsfinal_cap()

         end if

      else if (to_lower(trim(suite_name))=="scm_wofs_v0") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_wofs_v0_time_vary_tsfinal_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_wofs_v0_radiation_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_wofs_v0_phys_ps_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_wofs_v0_phys_ts_tsfinal_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_wofs_v0_tsfinal_cap()

         end if

      else if (to_lower(trim(suite_name))=="scm_wofs_v0_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_wofs_v0_ps_time_vary_tsfinal_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_wofs_v0_ps_radiation_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_wofs_v0_ps_phys_ps_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_wofs_v0_ps_phys_ts_tsfinal_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_wofs_v0_ps_tsfinal_cap()

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_rrtmgp") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_rrtmgp_time_vary_tsfinal_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_rrtmgp_radiation_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_rrtmgp_phys_ps_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_rrtmgp_phys_ts_tsfinal_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_rrtmgp_tsfinal_cap()

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_rrtmgp_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_rrtmgp_ps_time_vary_tsfinal_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_rrtmgp_ps_radiation_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_rrtmgp_ps_phys_ps_tsfinal_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_rrtmgp_ps_phys_ts_tsfinal_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_rrtmgp_ps_tsfinal_cap()

         end if

      else

         write(cdata%errmsg,'(*(a))') 'Invalid suite ' // to_lower(trim(suite_name))
         ierr = 1

      end if

      cdata%errflg = ierr

   end subroutine ccpp_physics_timestep_finalize

   subroutine ccpp_physics_init(cdata, suite_name, group_name, ierr)

      use ccpp_types, only : ccpp_t

      implicit none

      type(ccpp_t),               intent(inout) :: cdata
      character(len=*),           intent(in)    :: suite_name
      character(len=*), optional, intent(in)    :: group_name
      integer,                    intent(out)   :: ierr

      ierr = 0


      if (to_lower(trim(suite_name))=="scm_gfs_v16") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_time_vary_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_radiation_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_phys_ps_init_cap(one=one,physics=physics,cdata=cdata,con_p0=con_p0)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_phys_ts_init_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero,con_p0=con_p0)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_ps_time_vary_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_ps_radiation_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_ps_phys_ps_init_cap(one=one,physics=physics,cdata=cdata,con_p0=con_p0)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_ps_phys_ts_init_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_ps_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero,con_p0=con_p0)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v17_p8_ugwpv1") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v17_p8_ugwpv1_time_vary_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v17_p8_ugwpv1_radiation_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v17_p8_ugwpv1_phys_ps_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi,con_rerth=con_rerth,con_p0=con_p0, &
                  con_g=con_g,con_omega=con_omega,con_cp=con_cp,con_rd=con_rd,con_rv=con_rv, &
                  con_fvirt=con_fvirt)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v17_p8_ugwpv1_phys_ts_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi,con_t0c=con_t0c,con_rv=con_rv, &
                  con_cp=con_cp,con_rgas=con_rgas,con_boltz=con_boltz,con_amd=con_amd,con_amw=con_amw, &
                  con_avgd=con_avgd,con_hvap=con_hvap,con_hfus=con_hfus,con_g=con_g,con_rd=con_rd, &
                  con_eps=con_eps)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v17_p8_ugwpv1_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero,con_rerth=con_rerth, &
                  con_p0=con_p0,con_omega=con_omega,con_cp=con_cp,con_rv=con_rv,con_fvirt=con_fvirt, &
                  con_rgas=con_rgas,con_amd=con_amd,con_amw=con_amw,con_avgd=con_avgd,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_eps=con_eps)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v17_p8_ugwpv1_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_time_vary_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_radiation_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_phys_ps_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi,con_rerth=con_rerth,con_p0=con_p0, &
                  con_g=con_g,con_omega=con_omega,con_cp=con_cp,con_rd=con_rd,con_rv=con_rv, &
                  con_fvirt=con_fvirt)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_phys_ts_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi,con_t0c=con_t0c,con_rv=con_rv, &
                  con_cp=con_cp,con_rgas=con_rgas,con_boltz=con_boltz,con_amd=con_amd,con_amw=con_amw, &
                  con_avgd=con_avgd,con_hvap=con_hvap,con_hfus=con_hfus,con_g=con_g,con_rd=con_rd, &
                  con_eps=con_eps)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v17_p8_ugwpv1_ps_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero,con_rerth=con_rerth, &
                  con_p0=con_p0,con_omega=con_omega,con_cp=con_cp,con_rv=con_rv,con_fvirt=con_fvirt, &
                  con_rgas=con_rgas,con_amd=con_amd,con_amw=con_amw,con_avgd=con_avgd,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_eps=con_eps)

         end if

      else if (to_lower(trim(suite_name))=="scm_rap") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_rap_time_vary_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_rap_radiation_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_rap_phys_ps_init_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_rd=con_rd,con_cp=con_cp, &
                  con_g=con_g,con_rv=con_rv,con_cvap=con_cvap,con_cliq=con_cliq,con_csol=con_csol, &
                  con_rocp=con_rocp,con_hvap=con_hvap,con_hfus=con_hfus,con_eps=con_eps,karman=karman, &
                  con_t0c=con_t0c)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_rap_phys_ts_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi,con_t0c=con_t0c,con_rv=con_rv, &
                  con_cp=con_cp,con_rgas=con_rgas,con_boltz=con_boltz,con_amd=con_amd,con_amw=con_amw, &
                  con_avgd=con_avgd,con_hvap=con_hvap,con_hfus=con_hfus,con_g=con_g,con_rd=con_rd, &
                  con_eps=con_eps)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_rap_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero,con_fvirt=con_fvirt, &
                  con_cp=con_cp,con_rv=con_rv,con_cvap=con_cvap,con_cliq=con_cliq,con_csol=con_csol, &
                  con_rocp=con_rocp,con_hvap=con_hvap,con_hfus=con_hfus,con_eps=con_eps,karman=karman, &
                  con_rgas=con_rgas,con_amd=con_amd,con_amw=con_amw,con_avgd=con_avgd)

         end if

      else if (to_lower(trim(suite_name))=="scm_rap_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_rap_ps_time_vary_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_rap_ps_radiation_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_rap_ps_phys_ps_init_cap(one=one,physics=physics,cdata=cdata,con_cp=con_cp,con_g=con_g,con_rd=con_rd, &
                  con_rv=con_rv,con_cvap=con_cvap,con_cliq=con_cliq,con_csol=con_csol,con_rocp=con_rocp, &
                  con_hvap=con_hvap,con_hfus=con_hfus,con_fvirt=con_fvirt,con_eps=con_eps, &
                  karman=karman,con_t0c=con_t0c)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_rap_ps_phys_ts_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi,con_t0c=con_t0c,con_rv=con_rv, &
                  con_cp=con_cp,con_rgas=con_rgas,con_boltz=con_boltz,con_amd=con_amd,con_amw=con_amw, &
                  con_avgd=con_avgd,con_hvap=con_hvap,con_hfus=con_hfus,con_g=con_g,con_rd=con_rd, &
                  con_eps=con_eps)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_rap_ps_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero,con_cp=con_cp,con_rv=con_rv, &
                  con_cvap=con_cvap,con_cliq=con_cliq,con_csol=con_csol,con_rocp=con_rocp, &
                  con_hvap=con_hvap,con_hfus=con_hfus,con_fvirt=con_fvirt,con_eps=con_eps, &
                  karman=karman,con_rgas=con_rgas,con_amd=con_amd,con_amw=con_amw,con_avgd=con_avgd)

         end if

      else if (to_lower(trim(suite_name))=="scm_hrrr_gf") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_hrrr_gf_time_vary_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_hrrr_gf_radiation_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_hrrr_gf_phys_ps_init_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_rd=con_rd,con_pi=con_pi, &
                  karman=karman,con_g=con_g,con_sbc=con_sbc,con_t0c=con_t0c,rhowater=rhowater, &
                  con_csol=con_csol,con_cliq=con_cliq,con_hfus=con_hfus,con_hvap=con_hvap, &
                  con_eps=con_eps,con_cp=con_cp,rholakeice=rholakeice,con_rv=con_rv,con_cvap=con_cvap, &
                  con_rocp=con_rocp)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_hrrr_gf_phys_ts_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi,con_t0c=con_t0c,con_rv=con_rv, &
                  con_cp=con_cp,con_rgas=con_rgas,con_boltz=con_boltz,con_amd=con_amd,con_amw=con_amw, &
                  con_avgd=con_avgd,con_hvap=con_hvap,con_hfus=con_hfus,con_g=con_g,con_rd=con_rd, &
                  con_eps=con_eps)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_hrrr_gf_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero,con_fvirt=con_fvirt, &
                  karman=karman,con_sbc=con_sbc,rhowater=rhowater,con_csol=con_csol,con_cliq=con_cliq, &
                  con_hfus=con_hfus,con_hvap=con_hvap,con_eps=con_eps,con_cp=con_cp,rholakeice=rholakeice, &
                  con_rv=con_rv,con_cvap=con_cvap,con_rocp=con_rocp,con_rgas=con_rgas,con_amd=con_amd, &
                  con_amw=con_amw,con_avgd=con_avgd)

         end if

      else if (to_lower(trim(suite_name))=="scm_hrrr_gf_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_hrrr_gf_ps_time_vary_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_hrrr_gf_ps_radiation_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_hrrr_gf_ps_phys_ps_init_cap(one=one,physics=physics,cdata=cdata,con_cp=con_cp,con_g=con_g,con_rd=con_rd, &
                  con_rv=con_rv,con_cvap=con_cvap,con_cliq=con_cliq,con_csol=con_csol,con_rocp=con_rocp, &
                  con_hvap=con_hvap,con_hfus=con_hfus,con_fvirt=con_fvirt,con_eps=con_eps, &
                  karman=karman,con_t0c=con_t0c)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_hrrr_gf_ps_phys_ts_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi,con_t0c=con_t0c,con_rv=con_rv, &
                  con_cp=con_cp,con_rgas=con_rgas,con_boltz=con_boltz,con_amd=con_amd,con_amw=con_amw, &
                  con_avgd=con_avgd,con_hvap=con_hvap,con_hfus=con_hfus,con_g=con_g,con_rd=con_rd, &
                  con_eps=con_eps)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_hrrr_gf_ps_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero,con_cp=con_cp,con_rv=con_rv, &
                  con_cvap=con_cvap,con_cliq=con_cliq,con_csol=con_csol,con_rocp=con_rocp, &
                  con_hvap=con_hvap,con_hfus=con_hfus,con_fvirt=con_fvirt,con_eps=con_eps, &
                  karman=karman,con_rgas=con_rgas,con_amd=con_amd,con_amw=con_amw,con_avgd=con_avgd)

         end if

      else if (to_lower(trim(suite_name))=="scm_wofs_v0") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_wofs_v0_time_vary_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_wofs_v0_radiation_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_wofs_v0_phys_ps_init_cap(one=one,physics=physics,cdata=cdata,con_cp=con_cp,con_g=con_g,con_rd=con_rd, &
                  con_rv=con_rv,con_cvap=con_cvap,con_cliq=con_cliq,con_csol=con_csol,con_rocp=con_rocp, &
                  con_hvap=con_hvap,con_hfus=con_hfus,con_fvirt=con_fvirt,con_eps=con_eps, &
                  karman=karman,con_t0c=con_t0c,con_p0=con_p0)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_wofs_v0_phys_ts_init_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_rd=con_rd,con_cp=con_cp, &
                  con_rv=con_rv,con_t0c=con_t0c,con_cliq=con_cliq,con_csol=con_csol,con_eps=con_eps)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_wofs_v0_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero,con_cp=con_cp,con_rv=con_rv, &
                  con_cvap=con_cvap,con_cliq=con_cliq,con_csol=con_csol,con_rocp=con_rocp, &
                  con_hvap=con_hvap,con_hfus=con_hfus,con_fvirt=con_fvirt,con_eps=con_eps, &
                  karman=karman,con_p0=con_p0)

         end if

      else if (to_lower(trim(suite_name))=="scm_wofs_v0_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_wofs_v0_ps_time_vary_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_wofs_v0_ps_radiation_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_wofs_v0_ps_phys_ps_init_cap(one=one,physics=physics,cdata=cdata,con_cp=con_cp,con_g=con_g,con_rd=con_rd, &
                  con_rv=con_rv,con_cvap=con_cvap,con_cliq=con_cliq,con_csol=con_csol,con_rocp=con_rocp, &
                  con_hvap=con_hvap,con_hfus=con_hfus,con_fvirt=con_fvirt,con_eps=con_eps, &
                  karman=karman,con_t0c=con_t0c,con_p0=con_p0)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_wofs_v0_ps_phys_ts_init_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_rd=con_rd,con_cp=con_cp, &
                  con_rv=con_rv,con_t0c=con_t0c,con_cliq=con_cliq,con_csol=con_csol,con_eps=con_eps)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_wofs_v0_ps_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_rd=con_rd,con_g=con_g,ltp=ltp,con_zero=con_zero,con_cp=con_cp,con_rv=con_rv, &
                  con_cvap=con_cvap,con_cliq=con_cliq,con_csol=con_csol,con_rocp=con_rocp, &
                  con_hvap=con_hvap,con_hfus=con_hfus,con_fvirt=con_fvirt,con_eps=con_eps, &
                  karman=karman,con_p0=con_p0)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_rrtmgp") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_rrtmgp_time_vary_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_zero=con_zero)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_rrtmgp_radiation_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_rrtmgp_phys_ps_init_cap(one=one,physics=physics,cdata=cdata,con_p0=con_p0)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_rrtmgp_phys_ts_init_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_rrtmgp_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_zero=con_zero,con_p0=con_p0)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_rrtmgp_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_rrtmgp_ps_time_vary_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_zero=con_zero)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_rrtmgp_ps_radiation_init_cap(one=one,physics=physics,cdata=cdata,con_pi=con_pi)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_rrtmgp_ps_phys_ps_init_cap(one=one,physics=physics,cdata=cdata,con_p0=con_p0)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_rrtmgp_ps_phys_ts_init_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_rrtmgp_ps_init_cap(one=one,physics=physics,cdata=cdata,con_solr_2008=con_solr_2008,con_solr_2002=con_solr_2002, &
                  con_pi=con_pi,con_c=con_c,con_plnk=con_plnk,con_boltz=con_boltz,con_t0c=con_t0c, &
                  con_zero=con_zero,con_p0=con_p0)

         end if

      else

         write(cdata%errmsg,'(*(a))') 'Invalid suite ' // to_lower(trim(suite_name))
         ierr = 1

      end if

      cdata%errflg = ierr

   end subroutine ccpp_physics_init

   subroutine ccpp_physics_run(cdata, suite_name, group_name, ierr)

      use ccpp_types, only : ccpp_t

      implicit none

      type(ccpp_t),               intent(inout) :: cdata
      character(len=*),           intent(in)    :: suite_name
      character(len=*), optional, intent(in)    :: group_name
      integer,                    intent(out)   :: ierr

      ierr = 0


      if (to_lower(trim(suite_name))=="scm_gfs_v16") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_time_vary_run_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_radiation_run_cap(one=one,physics=physics,cdata=cdata,ltp=ltp,con_eps=con_eps,con_pi=con_pi, &
                  con_rd=con_rd,con_g=con_g,con_ttp=con_ttp,con_thgni=con_thgni,con_epsm1=con_epsm1, &
                  con_fvirt=con_fvirt,con_rog=con_rog,con_rocp=con_rocp)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_phys_ps_run_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_g=con_g,con_tice=con_tice, &
                  con_cp=con_cp,con_pi=con_pi,con_sbc=con_sbc,con_hvap=con_hvap,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_hfus=con_hfus,con_jcal=con_jcal,con_rd=con_rd,con_rhw0=con_rhw0, &
                  rlapse=rlapse,con_t0c=con_t0c,con_rocp=con_rocp,karman=karman,con_rv=con_rv, &
                  con_omega=con_omega)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_phys_ts_run_cap(one=one,physics=physics,cdata=cdata,con_1ovg=con_1ovg,con_fvirt=con_fvirt, &
                  con_cliq=con_cliq,con_cp=con_cp,con_cvap=con_cvap,con_eps=con_eps,con_epsm1=con_epsm1, &
                  con_g=con_g,con_hvap=con_hvap,con_rd=con_rd,con_rv=con_rv,con_t0c=con_t0c, &
                  con_pi=con_pi,rainmin=rainmin,rhowater=rhowater)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_run_cap(one=one,physics=physics,cdata=cdata,ltp=ltp,con_eps=con_eps,con_pi=con_pi, &
                  con_rd=con_rd,con_g=con_g,con_ttp=con_ttp,con_thgni=con_thgni,con_epsm1=con_epsm1, &
                  con_fvirt=con_fvirt,con_rog=con_rog,con_rocp=con_rocp,con_tice=con_tice, &
                  con_cp=con_cp,con_sbc=con_sbc,con_hvap=con_hvap,con_hfus=con_hfus,con_jcal=con_jcal, &
                  con_rhw0=con_rhw0,rlapse=rlapse,con_t0c=con_t0c,karman=karman,con_rv=con_rv, &
                  con_omega=con_omega,con_1ovg=con_1ovg,con_cliq=con_cliq,con_cvap=con_cvap, &
                  rainmin=rainmin,rhowater=rhowater)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_ps_time_vary_run_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_ps_radiation_run_cap(one=one,physics=physics,cdata=cdata,ltp=ltp,con_eps=con_eps,con_pi=con_pi, &
                  con_rd=con_rd,con_g=con_g,con_ttp=con_ttp,con_thgni=con_thgni,con_epsm1=con_epsm1, &
                  con_fvirt=con_fvirt,con_rog=con_rog,con_rocp=con_rocp)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_ps_phys_ps_run_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_g=con_g,con_cp=con_cp, &
                  con_hvap=con_hvap,con_rd=con_rd,karman=karman,con_tice=con_tice,con_pi=con_pi, &
                  con_sbc=con_sbc,con_rv=con_rv,con_hfus=con_hfus,con_eps=con_eps,con_epsm1=con_epsm1, &
                  con_rocp=con_rocp,con_omega=con_omega)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_ps_phys_ts_run_cap(one=one,physics=physics,cdata=cdata,con_1ovg=con_1ovg,con_fvirt=con_fvirt, &
                  con_cliq=con_cliq,con_cp=con_cp,con_cvap=con_cvap,con_eps=con_eps,con_epsm1=con_epsm1, &
                  con_g=con_g,con_hvap=con_hvap,con_rd=con_rd,con_rv=con_rv,con_t0c=con_t0c, &
                  con_pi=con_pi,rainmin=rainmin,rhowater=rhowater)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_ps_run_cap(one=one,physics=physics,cdata=cdata,ltp=ltp,con_eps=con_eps,con_pi=con_pi, &
                  con_rd=con_rd,con_g=con_g,con_ttp=con_ttp,con_thgni=con_thgni,con_epsm1=con_epsm1, &
                  con_fvirt=con_fvirt,con_rog=con_rog,con_rocp=con_rocp,con_cp=con_cp,con_hvap=con_hvap, &
                  karman=karman,con_tice=con_tice,con_sbc=con_sbc,con_rv=con_rv,con_hfus=con_hfus, &
                  con_omega=con_omega,con_1ovg=con_1ovg,con_cliq=con_cliq,con_cvap=con_cvap, &
                  con_t0c=con_t0c,rainmin=rainmin,rhowater=rhowater)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v17_p8_ugwpv1") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v17_p8_ugwpv1_time_vary_run_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v17_p8_ugwpv1_radiation_run_cap(one=one,physics=physics,cdata=cdata,ltp=ltp,con_eps=con_eps,con_pi=con_pi, &
                  con_rd=con_rd,con_g=con_g,con_ttp=con_ttp,con_thgni=con_thgni,con_epsm1=con_epsm1, &
                  con_fvirt=con_fvirt,con_rog=con_rog,con_rocp=con_rocp)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v17_p8_ugwpv1_phys_ps_run_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_g=con_g,con_tice=con_tice, &
                  con_cp=con_cp,con_pi=con_pi,con_sbc=con_sbc,con_hvap=con_hvap,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_hfus=con_hfus,con_jcal=con_jcal,con_rd=con_rd,con_rhw0=con_rhw0, &
                  rlapse=rlapse,con_zero=con_zero,rhowater=rhowater,con_t0c=con_t0c,con_rocp=con_rocp, &
                  karman=karman,con_rv=con_rv)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v17_p8_ugwpv1_phys_ts_run_cap(one=one,physics=physics,cdata=cdata,con_1ovg=con_1ovg,con_fvirt=con_fvirt, &
                  con_cliq=con_cliq,con_cp=con_cp,con_cvap=con_cvap,con_eps=con_eps,con_epsm1=con_epsm1, &
                  con_g=con_g,con_hvap=con_hvap,con_rd=con_rd,con_rv=con_rv,con_t0c=con_t0c, &
                  con_pi=con_pi,rainmin=rainmin,rhowater=rhowater)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v17_p8_ugwpv1_run_cap(one=one,physics=physics,cdata=cdata,ltp=ltp,con_eps=con_eps,con_pi=con_pi, &
                  con_rd=con_rd,con_g=con_g,con_ttp=con_ttp,con_thgni=con_thgni,con_epsm1=con_epsm1, &
                  con_fvirt=con_fvirt,con_rog=con_rog,con_rocp=con_rocp,con_tice=con_tice, &
                  con_cp=con_cp,con_sbc=con_sbc,con_hvap=con_hvap,con_hfus=con_hfus,con_jcal=con_jcal, &
                  con_rhw0=con_rhw0,rlapse=rlapse,con_zero=con_zero,rhowater=rhowater,con_t0c=con_t0c, &
                  karman=karman,con_rv=con_rv,con_1ovg=con_1ovg,con_cliq=con_cliq,con_cvap=con_cvap, &
                  rainmin=rainmin)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v17_p8_ugwpv1_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_time_vary_run_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_radiation_run_cap(one=one,physics=physics,cdata=cdata,ltp=ltp,con_eps=con_eps,con_pi=con_pi, &
                  con_rd=con_rd,con_g=con_g,con_ttp=con_ttp,con_thgni=con_thgni,con_epsm1=con_epsm1, &
                  con_fvirt=con_fvirt,con_rog=con_rog,con_rocp=con_rocp)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_phys_ps_run_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_g=con_g,con_cp=con_cp, &
                  con_hvap=con_hvap,con_rd=con_rd,karman=karman,con_tice=con_tice,con_pi=con_pi, &
                  con_sbc=con_sbc,con_rv=con_rv,con_hfus=con_hfus,con_eps=con_eps,con_epsm1=con_epsm1)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_phys_ts_run_cap(one=one,physics=physics,cdata=cdata,con_1ovg=con_1ovg,con_fvirt=con_fvirt, &
                  con_cliq=con_cliq,con_cp=con_cp,con_cvap=con_cvap,con_eps=con_eps,con_epsm1=con_epsm1, &
                  con_g=con_g,con_hvap=con_hvap,con_rd=con_rd,con_rv=con_rv,con_t0c=con_t0c, &
                  con_pi=con_pi,rainmin=rainmin,rhowater=rhowater)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v17_p8_ugwpv1_ps_run_cap(one=one,physics=physics,cdata=cdata,ltp=ltp,con_eps=con_eps,con_pi=con_pi, &
                  con_rd=con_rd,con_g=con_g,con_ttp=con_ttp,con_thgni=con_thgni,con_epsm1=con_epsm1, &
                  con_fvirt=con_fvirt,con_rog=con_rog,con_rocp=con_rocp,con_cp=con_cp,con_hvap=con_hvap, &
                  karman=karman,con_tice=con_tice,con_sbc=con_sbc,con_rv=con_rv,con_hfus=con_hfus, &
                  con_1ovg=con_1ovg,con_cliq=con_cliq,con_cvap=con_cvap,con_t0c=con_t0c,rainmin=rainmin, &
                  rhowater=rhowater)

         end if

      else if (to_lower(trim(suite_name))=="scm_rap") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_rap_time_vary_run_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_rap_radiation_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_pi=con_pi,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_rv=con_rv,con_cvap=con_cvap,con_rocp=con_rocp,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_cp=con_cp,ltp=ltp,con_rd=con_rd,con_ttp=con_ttp,con_thgni=con_thgni, &
                  con_fvirt=con_fvirt,con_rog=con_rog)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_rap_phys_ps_run_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_g=con_g,con_tice=con_tice, &
                  con_cp=con_cp,con_pi=con_pi,con_sbc=con_sbc,con_hvap=con_hvap,con_hfus=con_hfus, &
                  con_jcal=con_jcal,con_eps=con_eps,con_epsm1=con_epsm1,con_rd=con_rd,con_rhw0=con_rhw0, &
                  rlapse=rlapse,con_rv=con_rv,con_rocp=con_rocp,karman=karman)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_rap_phys_ts_run_cap(one=one,physics=physics,cdata=cdata,con_1ovg=con_1ovg,con_fvirt=con_fvirt, &
                  con_g=con_g,con_cp=con_cp,con_hvap=con_hvap,con_rv=con_rv,con_pi=con_pi, &
                  con_rd=con_rd,con_eps=con_eps,rainmin=rainmin,rhowater=rhowater,con_t0c=con_t0c)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_rap_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_pi=con_pi,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_rv=con_rv,con_cvap=con_cvap,con_rocp=con_rocp,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_cp=con_cp,ltp=ltp,con_rd=con_rd,con_ttp=con_ttp,con_thgni=con_thgni, &
                  con_fvirt=con_fvirt,con_rog=con_rog,con_tice=con_tice,con_sbc=con_sbc,con_jcal=con_jcal, &
                  con_rhw0=con_rhw0,rlapse=rlapse,karman=karman,con_1ovg=con_1ovg,rainmin=rainmin, &
                  rhowater=rhowater,con_t0c=con_t0c)

         end if

      else if (to_lower(trim(suite_name))=="scm_rap_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_rap_ps_time_vary_run_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_rap_ps_radiation_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_pi=con_pi,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_rv=con_rv,con_cvap=con_cvap,con_rocp=con_rocp,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_cp=con_cp,ltp=ltp,con_rd=con_rd,con_ttp=con_ttp,con_thgni=con_thgni, &
                  con_fvirt=con_fvirt,con_rog=con_rog)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_rap_ps_phys_ps_run_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_g=con_g,con_cp=con_cp, &
                  con_hvap=con_hvap,con_rd=con_rd,karman=karman,con_tice=con_tice,con_pi=con_pi, &
                  con_sbc=con_sbc,con_rv=con_rv)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_rap_ps_phys_ts_run_cap(one=one,physics=physics,cdata=cdata,con_1ovg=con_1ovg,con_fvirt=con_fvirt, &
                  con_g=con_g,con_cp=con_cp,con_hvap=con_hvap,con_rv=con_rv,con_pi=con_pi, &
                  con_rd=con_rd,con_eps=con_eps,rainmin=rainmin,rhowater=rhowater,con_t0c=con_t0c)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_rap_ps_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_pi=con_pi,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_rv=con_rv,con_cvap=con_cvap,con_rocp=con_rocp,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_cp=con_cp,ltp=ltp,con_rd=con_rd,con_ttp=con_ttp,con_thgni=con_thgni, &
                  con_fvirt=con_fvirt,con_rog=con_rog,karman=karman,con_tice=con_tice,con_sbc=con_sbc, &
                  con_1ovg=con_1ovg,rainmin=rainmin,rhowater=rhowater,con_t0c=con_t0c)

         end if

      else if (to_lower(trim(suite_name))=="scm_hrrr_gf") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_hrrr_gf_time_vary_run_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_hrrr_gf_radiation_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_pi=con_pi,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_rv=con_rv,con_cvap=con_cvap,con_rocp=con_rocp,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_cp=con_cp,ltp=ltp,con_rd=con_rd,con_ttp=con_ttp,con_thgni=con_thgni, &
                  con_fvirt=con_fvirt,con_rog=con_rog)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_hrrr_gf_phys_ps_run_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_g=con_g,con_tice=con_tice, &
                  con_cp=con_cp,con_pi=con_pi,con_sbc=con_sbc,con_hvap=con_hvap,con_rd=con_rd, &
                  con_rv=con_rv,con_hfus=con_hfus,con_eps=con_eps,con_epsm1=con_epsm1,con_rocp=con_rocp, &
                  karman=karman)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_hrrr_gf_phys_ts_run_cap(one=one,physics=physics,cdata=cdata,con_1ovg=con_1ovg,con_fvirt=con_fvirt, &
                  con_g=con_g,con_cp=con_cp,con_hvap=con_hvap,con_rv=con_rv,con_pi=con_pi, &
                  con_rd=con_rd,con_eps=con_eps,rainmin=rainmin,rhowater=rhowater,con_t0c=con_t0c)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_hrrr_gf_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_pi=con_pi,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_rv=con_rv,con_cvap=con_cvap,con_rocp=con_rocp,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_cp=con_cp,ltp=ltp,con_rd=con_rd,con_ttp=con_ttp,con_thgni=con_thgni, &
                  con_fvirt=con_fvirt,con_rog=con_rog,con_tice=con_tice,con_sbc=con_sbc,karman=karman, &
                  con_1ovg=con_1ovg,rainmin=rainmin,rhowater=rhowater,con_t0c=con_t0c)

         end if

      else if (to_lower(trim(suite_name))=="scm_hrrr_gf_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_hrrr_gf_ps_time_vary_run_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_hrrr_gf_ps_radiation_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_pi=con_pi,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_rv=con_rv,con_cvap=con_cvap,con_rocp=con_rocp,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_cp=con_cp,ltp=ltp,con_rd=con_rd,con_ttp=con_ttp,con_thgni=con_thgni, &
                  con_fvirt=con_fvirt,con_rog=con_rog)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_hrrr_gf_ps_phys_ps_run_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_g=con_g,con_cp=con_cp, &
                  con_hvap=con_hvap,con_rd=con_rd,karman=karman,con_tice=con_tice,con_pi=con_pi, &
                  con_sbc=con_sbc,con_rv=con_rv)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_hrrr_gf_ps_phys_ts_run_cap(one=one,physics=physics,cdata=cdata,con_1ovg=con_1ovg,con_fvirt=con_fvirt, &
                  con_g=con_g,con_cp=con_cp,con_hvap=con_hvap,con_rv=con_rv,con_pi=con_pi, &
                  con_rd=con_rd,con_eps=con_eps,rainmin=rainmin,rhowater=rhowater,con_t0c=con_t0c)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_hrrr_gf_ps_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_pi=con_pi,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_rv=con_rv,con_cvap=con_cvap,con_rocp=con_rocp,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_cp=con_cp,ltp=ltp,con_rd=con_rd,con_ttp=con_ttp,con_thgni=con_thgni, &
                  con_fvirt=con_fvirt,con_rog=con_rog,karman=karman,con_tice=con_tice,con_sbc=con_sbc, &
                  con_1ovg=con_1ovg,rainmin=rainmin,rhowater=rhowater,con_t0c=con_t0c)

         end if

      else if (to_lower(trim(suite_name))=="scm_wofs_v0") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_wofs_v0_time_vary_run_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_wofs_v0_radiation_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_pi=con_pi,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_rv=con_rv,con_cvap=con_cvap,con_rocp=con_rocp,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_cp=con_cp,ltp=ltp,con_rd=con_rd,con_ttp=con_ttp,con_thgni=con_thgni, &
                  con_fvirt=con_fvirt,con_rog=con_rog)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_wofs_v0_phys_ps_run_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_g=con_g,con_tice=con_tice, &
                  con_cp=con_cp,con_pi=con_pi,con_sbc=con_sbc,con_hvap=con_hvap,con_hfus=con_hfus, &
                  con_jcal=con_jcal,con_eps=con_eps,con_epsm1=con_epsm1,con_rd=con_rd,con_rhw0=con_rhw0, &
                  rlapse=rlapse,con_t0c=con_t0c,con_rocp=con_rocp,karman=karman,con_rv=con_rv, &
                  con_omega=con_omega)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_wofs_v0_phys_ts_run_cap(one=one,physics=physics,cdata=cdata,con_1ovg=con_1ovg,con_fvirt=con_fvirt, &
                  con_g=con_g,con_rd=con_rd,rainmin=rainmin,rhowater=rhowater,con_t0c=con_t0c)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_wofs_v0_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_pi=con_pi,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_rv=con_rv,con_cvap=con_cvap,con_rocp=con_rocp,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_cp=con_cp,ltp=ltp,con_rd=con_rd,con_ttp=con_ttp,con_thgni=con_thgni, &
                  con_fvirt=con_fvirt,con_rog=con_rog,con_tice=con_tice,con_sbc=con_sbc,con_jcal=con_jcal, &
                  con_rhw0=con_rhw0,rlapse=rlapse,con_t0c=con_t0c,karman=karman,con_omega=con_omega, &
                  con_1ovg=con_1ovg,rainmin=rainmin,rhowater=rhowater)

         end if

      else if (to_lower(trim(suite_name))=="scm_wofs_v0_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_wofs_v0_ps_time_vary_run_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_wofs_v0_ps_radiation_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_pi=con_pi,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_rv=con_rv,con_cvap=con_cvap,con_rocp=con_rocp,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_cp=con_cp,ltp=ltp,con_rd=con_rd,con_ttp=con_ttp,con_thgni=con_thgni, &
                  con_fvirt=con_fvirt,con_rog=con_rog)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_wofs_v0_ps_phys_ps_run_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_g=con_g,con_cp=con_cp, &
                  con_hvap=con_hvap,con_rd=con_rd,karman=karman,con_tice=con_tice,con_pi=con_pi, &
                  con_sbc=con_sbc,con_rv=con_rv,con_omega=con_omega)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_wofs_v0_ps_phys_ts_run_cap(one=one,physics=physics,cdata=cdata,con_1ovg=con_1ovg,con_fvirt=con_fvirt, &
                  con_g=con_g,con_rd=con_rd,rainmin=rainmin,rhowater=rhowater,con_t0c=con_t0c)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_wofs_v0_ps_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_pi=con_pi,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_rv=con_rv,con_cvap=con_cvap,con_rocp=con_rocp,con_hvap=con_hvap, &
                  con_hfus=con_hfus,con_cp=con_cp,ltp=ltp,con_rd=con_rd,con_ttp=con_ttp,con_thgni=con_thgni, &
                  con_fvirt=con_fvirt,con_rog=con_rog,karman=karman,con_tice=con_tice,con_sbc=con_sbc, &
                  con_omega=con_omega,con_1ovg=con_1ovg,rainmin=rainmin,rhowater=rhowater, &
                  con_t0c=con_t0c)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_rrtmgp") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_rrtmgp_time_vary_run_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_rrtmgp_radiation_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_rd=con_rd,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_fvirt=con_fvirt,con_epsqs=con_epsqs,con_pi=con_pi, &
                  con_ttp=con_ttp,con_epsq=con_epsq)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_rrtmgp_phys_ps_run_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_g=con_g,con_tice=con_tice, &
                  con_cp=con_cp,con_pi=con_pi,con_sbc=con_sbc,con_hvap=con_hvap,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_hfus=con_hfus,con_jcal=con_jcal,con_rd=con_rd,con_rhw0=con_rhw0, &
                  rlapse=rlapse,con_t0c=con_t0c,con_rocp=con_rocp,karman=karman,con_rv=con_rv, &
                  con_omega=con_omega)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_rrtmgp_phys_ts_run_cap(one=one,physics=physics,cdata=cdata,con_1ovg=con_1ovg,con_fvirt=con_fvirt, &
                  con_cliq=con_cliq,con_cp=con_cp,con_cvap=con_cvap,con_eps=con_eps,con_epsm1=con_epsm1, &
                  con_g=con_g,con_hvap=con_hvap,con_rd=con_rd,con_rv=con_rv,con_t0c=con_t0c, &
                  con_pi=con_pi,rainmin=rainmin,rhowater=rhowater)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_rrtmgp_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_rd=con_rd,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_fvirt=con_fvirt,con_epsqs=con_epsqs,con_pi=con_pi, &
                  con_ttp=con_ttp,con_epsq=con_epsq,con_tice=con_tice,con_cp=con_cp,con_sbc=con_sbc, &
                  con_hvap=con_hvap,con_hfus=con_hfus,con_jcal=con_jcal,con_rhw0=con_rhw0, &
                  rlapse=rlapse,con_t0c=con_t0c,con_rocp=con_rocp,karman=karman,con_rv=con_rv, &
                  con_omega=con_omega,con_1ovg=con_1ovg,con_cliq=con_cliq,con_cvap=con_cvap, &
                  rainmin=rainmin,rhowater=rhowater)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_rrtmgp_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_rrtmgp_ps_time_vary_run_cap()
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_rrtmgp_ps_radiation_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_rd=con_rd,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_fvirt=con_fvirt,con_epsqs=con_epsqs,con_pi=con_pi, &
                  con_ttp=con_ttp,con_epsq=con_epsq)
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_rrtmgp_ps_phys_ps_run_cap(one=one,physics=physics,cdata=cdata,con_fvirt=con_fvirt,con_g=con_g,con_cp=con_cp, &
                  con_hvap=con_hvap,con_rd=con_rd,karman=karman,con_tice=con_tice,con_pi=con_pi, &
                  con_sbc=con_sbc,con_rv=con_rv,con_hfus=con_hfus,con_eps=con_eps,con_epsm1=con_epsm1, &
                  con_omega=con_omega)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_rrtmgp_ps_phys_ts_run_cap(one=one,physics=physics,cdata=cdata,con_1ovg=con_1ovg,con_fvirt=con_fvirt, &
                  con_cliq=con_cliq,con_cp=con_cp,con_cvap=con_cvap,con_eps=con_eps,con_epsm1=con_epsm1, &
                  con_g=con_g,con_hvap=con_hvap,con_rd=con_rd,con_rv=con_rv,con_t0c=con_t0c, &
                  con_pi=con_pi,rainmin=rainmin,rhowater=rhowater)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_rrtmgp_ps_run_cap(one=one,physics=physics,cdata=cdata,con_g=con_g,con_rd=con_rd,con_eps=con_eps, &
                  con_epsm1=con_epsm1,con_fvirt=con_fvirt,con_epsqs=con_epsqs,con_pi=con_pi, &
                  con_ttp=con_ttp,con_epsq=con_epsq,con_cp=con_cp,con_hvap=con_hvap,karman=karman, &
                  con_tice=con_tice,con_sbc=con_sbc,con_rv=con_rv,con_hfus=con_hfus,con_omega=con_omega, &
                  con_1ovg=con_1ovg,con_cliq=con_cliq,con_cvap=con_cvap,con_t0c=con_t0c,rainmin=rainmin, &
                  rhowater=rhowater)

         end if

      else

         write(cdata%errmsg,'(*(a))') 'Invalid suite ' // to_lower(trim(suite_name))
         ierr = 1

      end if

      cdata%errflg = ierr

   end subroutine ccpp_physics_run

   subroutine ccpp_physics_finalize(cdata, suite_name, group_name, ierr)

      use ccpp_types, only : ccpp_t

      implicit none

      type(ccpp_t),               intent(inout) :: cdata
      character(len=*),           intent(in)    :: suite_name
      character(len=*), optional, intent(in)    :: group_name
      integer,                    intent(out)   :: ierr

      ierr = 0


      if (to_lower(trim(suite_name))=="scm_gfs_v16") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_time_vary_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_radiation_final_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_phys_ps_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_phys_ts_final_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_final_cap(one=one,physics=physics,cdata=cdata)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_ps_time_vary_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_ps_radiation_final_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_ps_phys_ps_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_ps_phys_ts_final_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_ps_final_cap(one=one,physics=physics,cdata=cdata)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v17_p8_ugwpv1") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v17_p8_ugwpv1_time_vary_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v17_p8_ugwpv1_radiation_final_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v17_p8_ugwpv1_phys_ps_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v17_p8_ugwpv1_phys_ts_final_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v17_p8_ugwpv1_final_cap(one=one,physics=physics,cdata=cdata)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v17_p8_ugwpv1_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_time_vary_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_radiation_final_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_phys_ps_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v17_p8_ugwpv1_ps_phys_ts_final_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v17_p8_ugwpv1_ps_final_cap(one=one,physics=physics,cdata=cdata)

         end if

      else if (to_lower(trim(suite_name))=="scm_rap") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_rap_time_vary_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_rap_radiation_final_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_rap_phys_ps_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_rap_phys_ts_final_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_rap_final_cap(one=one,physics=physics,cdata=cdata)

         end if

      else if (to_lower(trim(suite_name))=="scm_rap_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_rap_ps_time_vary_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_rap_ps_radiation_final_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_rap_ps_phys_ps_final_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_rap_ps_phys_ts_final_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_rap_ps_final_cap(one=one,physics=physics,cdata=cdata)

         end if

      else if (to_lower(trim(suite_name))=="scm_hrrr_gf") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_hrrr_gf_time_vary_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_hrrr_gf_radiation_final_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_hrrr_gf_phys_ps_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_hrrr_gf_phys_ts_final_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_hrrr_gf_final_cap(one=one,physics=physics,cdata=cdata)

         end if

      else if (to_lower(trim(suite_name))=="scm_hrrr_gf_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_hrrr_gf_ps_time_vary_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_hrrr_gf_ps_radiation_final_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_hrrr_gf_ps_phys_ps_final_cap()
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_hrrr_gf_ps_phys_ts_final_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_hrrr_gf_ps_final_cap(one=one,physics=physics,cdata=cdata)

         end if

      else if (to_lower(trim(suite_name))=="scm_wofs_v0") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_wofs_v0_time_vary_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_wofs_v0_radiation_final_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_wofs_v0_phys_ps_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_wofs_v0_phys_ts_final_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_wofs_v0_final_cap(one=one,physics=physics,cdata=cdata)

         end if

      else if (to_lower(trim(suite_name))=="scm_wofs_v0_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_wofs_v0_ps_time_vary_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_wofs_v0_ps_radiation_final_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_wofs_v0_ps_phys_ps_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_wofs_v0_ps_phys_ts_final_cap()
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_wofs_v0_ps_final_cap(one=one,physics=physics,cdata=cdata)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_rrtmgp") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_rrtmgp_time_vary_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_rrtmgp_radiation_final_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_rrtmgp_phys_ps_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_rrtmgp_phys_ts_final_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_rrtmgp_final_cap(one=one,physics=physics,cdata=cdata)

         end if

      else if (to_lower(trim(suite_name))=="scm_gfs_v16_rrtmgp_ps") then

         if (present(group_name)) then

            if (to_lower(trim(group_name))=="time_vary") then
               ierr = scm_gfs_v16_rrtmgp_ps_time_vary_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="radiation") then
               ierr = scm_gfs_v16_rrtmgp_ps_radiation_final_cap()
            else if (to_lower(trim(group_name))=="phys_ps") then
               ierr = scm_gfs_v16_rrtmgp_ps_phys_ps_final_cap(one=one,physics=physics,cdata=cdata)
            else if (to_lower(trim(group_name))=="phys_ts") then
               ierr = scm_gfs_v16_rrtmgp_ps_phys_ts_final_cap(one=one,physics=physics,cdata=cdata)
            else
               write(cdata%errmsg, '(*(a))') 'Group ' // to_lower(trim(group_name)) // ' not found'
               ierr = 1
            end if

         else

           ierr = scm_gfs_v16_rrtmgp_ps_final_cap(one=one,physics=physics,cdata=cdata)

         end if

      else

         write(cdata%errmsg,'(*(a))') 'Invalid suite ' // to_lower(trim(suite_name))
         ierr = 1

      end if

      cdata%errflg = ierr

   end subroutine ccpp_physics_finalize

end module ccpp_static_api
