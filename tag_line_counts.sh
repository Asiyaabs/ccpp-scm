#!/bin/bash
# tag_line_counts_simple.sh
# For every tagging file: lines in the original, lines in dev,
# and how many lines were ADDED, MODIFIED, DELETED going original -> dev.
# Read-only: runs diff, writes nothing, prints to screen.
#
# Check that always holds:  dev = orig + added - deleted
#
# Usage:  bash tag_line_counts_simple.sh       (exact: every character counts)
#         bash tag_line_counts_simple.sh -w    (ignore whitespace and blank lines)

DEV=/glade/work/asiyab/SWI_NCAR/UFS_versions_dev/ccpp-scm_dev
ORIG=/glade/u/home/asiyab/SWI_repos/ccpp-scm_non_dev
I=ccpp/physics/physics/Interstitials/UFS_SCM_NEPTUNE
P=ccpp/physics/physics

DIFFOPT=""
SKIPBLANK=0
if [ "$1" = "-w" ]; then
  DIFFOPT="-w -B"
  SKIPBLANK=1
  echo "Mode: ignoring whitespace and blank lines (diff -w -B)"
else
  echo "Mode: exact (every character counts)"
fi

FILES=(
 $I/GFS_PBL_generic_pre.F90  $I/GFS_PBL_generic_pre.meta
 $I/GFS_PBL_generic_post.F90 $I/GFS_PBL_generic_post.meta
 $P/PBL/SATMEDMF/satmedmfvdifq.F $P/PBL/SATMEDMF/satmedmfvdifq.meta
 $P/PBL/mfpbltq.f
 $P/PBL/SATMEDMF/mfscuq.f
 $P/PBL/SATMEDMF/satmedmfvdifq_can.F
 $P/CONV/SAMF/samfdeepcnv.f $P/CONV/SAMF/samfdeepcnv.meta
 $I/GFS_DCNV_generic_post.F90 $I/GFS_DCNV_generic_post.meta
 $P/CONV/SAMF/samfshalcnv.f $P/CONV/SAMF/samfshalcnv.meta
 $I/GFS_SCNV_generic_post.F90 $I/GFS_SCNV_generic_post.meta
 $P/MP/Thompson/mp_thompson.F90 $P/MP/Thompson/mp_thompson.meta
 $P/MP/Thompson/module_mp_thompson.F90
 $I/GFS_MP_generic_post.F90 $I/GFS_MP_generic_post.meta
 $P/photochem/module_h2ophys.F90
 $I/GFS_photochemistry.F90 $I/GFS_photochemistry.meta
 scm/src/GFS_typedefs.F90 scm/src/GFS_typedefs.meta
 scm/src/CCPP_typedefs.F90 scm/src/CCPP_typedefs.meta
 scm/src/scm_type_defs.F90 scm/src/scm_input.F90 scm/src/scm.F90
 scm/src/scm_time_integration.F90 scm/src/scm_forcing.F90
 scm/src/scm_output.F90
 scm/etc/tracer_config/tracers_GFS_v17_p8_ugwpv1.txt
 ccpp/physics_namelists/input_GFS_v17_p8_ugwpv1.nml
 ccpp/physics_namelists/input_GFS_v17_p8_ugwpv1_ps.nml
 scm/etc/case_config/twpice.nml
 ccpp/suites/suite_SCM_GFS_v17_p8_ugwpv1.xml
)

# diff ORIGINAL DEV -> "added modified deleted"
# Counts the actual content lines of each diff block:
#   <  = original line,  >  = dev line.
# In each block, min(<,>) lines are "modified"; the extra > lines are
# "added", the extra < lines are "deleted".
# With -w, blank (whitespace-only) lines are skipped on both sides,
# so only code/comment lines are counted.
counts() {
  diff $DIFFOPT "$1" "$2" | awk -v skipblank="$SKIPBLANK" '
    function flush() {
      if (o > n) { mod += n; del += o - n } else { mod += o; add += n - o }
      o = 0; n = 0
    }
    /^[0-9]+(,[0-9]+)?[acd][0-9]+(,[0-9]+)?$/ { flush(); next }
    /^</ { if (!(skipblank && $0 ~ /^<[ \t\r]*$/)) o++; next }
    /^>/ { if (!(skipblank && $0 ~ /^>[ \t\r]*$/)) n++; next }
    END { flush(); printf "%d %d %d\n", add, mod, del }'
}

FMT="%-56s %7s %7s %7s %9s %8s\n"
printf "$FMT" "file" "orig" "dev" "added" "modified" "deleted"
T0=0; T1=0; TA=0; TM=0; TD=0

for f in "${FILES[@]}"; do
  o="$ORIG/$f"; d="$DEV/$f"; name="${f#ccpp/physics/physics/}"
  if [ ! -f "$o" ] || [ ! -f "$d" ]; then
    printf "%-56s MISSING\n" "$name"; continue
  fi
  no=$(awk "END{print NR}" "$o"); nd=$(awk "END{print NR}" "$d")
  read a m de <<< "$(counts "$o" "$d")"
  printf "$FMT" "$name" "$no" "$nd" "$a" "$m" "$de"
  T0=$((T0+no)); T1=$((T1+nd)); TA=$((TA+a)); TM=$((TM+m)); TD=$((TD+de))
done

printf "$FMT" "TOTAL" "$T0" "$T1" "$TA" "$TM" "$TD"
