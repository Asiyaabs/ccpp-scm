#!/usr/bin/env bash

scmpath=${1:-$PWD}
machine=${2:-derecho}
compiler=${3:-intel}

module purge
module use $scmpath/scm/etc/modules
module load ${machine}_${compiler}/1.6.0
