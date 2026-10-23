set(CMAKE_Fortran_COMPILER "/glade/u/apps/derecho/25.10/spack/opt/spack/ncarcompilers/1.1.0/intel-oneapi-compilers/2025.2.1/d7a7/bin/ifx")
set(CMAKE_Fortran_COMPILER_ARG1 "")
set(CMAKE_Fortran_COMPILER_ID "IntelLLVM")
set(CMAKE_Fortran_COMPILER_VERSION "2023.2.0")
set(CMAKE_Fortran_COMPILER_WRAPPER "CrayPrgEnv")
set(CMAKE_Fortran_PLATFORM_ID "Linux")
set(CMAKE_Fortran_SIMULATE_ID "")
set(CMAKE_Fortran_COMPILER_FRONTEND_VARIANT "GNU")
set(CMAKE_Fortran_SIMULATE_VERSION "")




set(CMAKE_AR "/usr/bin/ar")
set(CMAKE_Fortran_COMPILER_AR "CMAKE_Fortran_COMPILER_AR-NOTFOUND")
set(CMAKE_RANLIB "/usr/bin/ranlib")
set(CMAKE_Fortran_COMPILER_RANLIB "CMAKE_Fortran_COMPILER_RANLIB-NOTFOUND")
set(CMAKE_COMPILER_IS_GNUG77 )
set(CMAKE_Fortran_COMPILER_LOADED 1)
set(CMAKE_Fortran_COMPILER_WORKS TRUE)
set(CMAKE_Fortran_ABI_COMPILED TRUE)

set(CMAKE_Fortran_COMPILER_ENV_VAR "FC")

set(CMAKE_Fortran_COMPILER_SUPPORTS_F90 1)

set(CMAKE_Fortran_COMPILER_ID_RUN 1)
set(CMAKE_Fortran_SOURCE_FILE_EXTENSIONS f;F;fpp;FPP;f77;F77;f90;F90;for;For;FOR;f95;F95)
set(CMAKE_Fortran_IGNORE_EXTENSIONS h;H;o;O;obj;OBJ;def;DEF;rc;RC)
set(CMAKE_Fortran_LINKER_PREFERENCE 20)
if(UNIX)
  set(CMAKE_Fortran_OUTPUT_EXTENSION .o)
else()
  set(CMAKE_Fortran_OUTPUT_EXTENSION .obj)
endif()

# Save compiler ABI information.
set(CMAKE_Fortran_SIZEOF_DATA_PTR "8")
set(CMAKE_Fortran_COMPILER_ABI "ELF")
set(CMAKE_Fortran_LIBRARY_ARCHITECTURE "x86_64-unknown-linux-gnu")

if(CMAKE_Fortran_SIZEOF_DATA_PTR AND NOT CMAKE_SIZEOF_VOID_P)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_Fortran_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_Fortran_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_Fortran_COMPILER_ABI}")
endif()

if(CMAKE_Fortran_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "x86_64-unknown-linux-gnu")
endif()





set(CMAKE_Fortran_IMPLICIT_INCLUDE_DIRECTORIES "/glade/u/apps/derecho/23.09/spack/opt/spack/intel-oneapi-compilers-classic/2021.10.0/gcc/7.5.0/4zuc/include;/glade/u/apps/derecho/23.09/opt/view/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/netcdf-fortran-4.6.1-bds4ndu/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/netcdf-c-4.9.2-njuismn/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/c-blosc-1.21.5-uoxtiqu/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/zstd-1.5.2-z32seuu/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/snappy-1.1.10-x7yaer7/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/openblas-0.3.24-2zphhkk/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/curl-8.4.0-ylicq7b/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/nghttp2-1.57.0-744axjg/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/hdf5-1.14.0-nff76s4/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/python-3.10.13-amsag3y/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/util-linux-uuid-2.38.1-nu2z27d/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/sqlite-3.43.2-sawa33r/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/zlib-1.2.13-53oqwlx/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/libxcrypt-4.4.35-mjdbffm/include;/glade/work/epicufsrt/contrib/spack-stack/derecho/spack-stack-1.6.0/envs/unified-env/install/intel/2021.10.0/gettext-0.21.1-nr6oykc/include;/opt/cray/libfabric/1.15.2.0/include;/opt/cray/pe/mpich/8.1.25/ofi/intel/19.0/include;/opt/cray/pe/gcc/12.2.0/snos/include;/glade/u/apps/common/23.08/spack/opt/spack/intel-oneapi-compilers/2023.2.1/compiler/2023.2.1/linux/lib/oclfpga/include;/glade/u/apps/common/23.08/spack/opt/spack/intel-oneapi-compilers/2023.2.1/compiler/2023.2.1/linux/compiler/include/intel64;/glade/u/apps/common/23.08/spack/opt/spack/intel-oneapi-compilers/2023.2.1/compiler/2023.2.1/linux/compiler/include;/usr/local/include;/glade/u/apps/common/23.08/spack/opt/spack/intel-oneapi-compilers/2023.2.1/compiler/2023.2.1/linux/lib/clang/17/include;/usr/include")
set(CMAKE_Fortran_IMPLICIT_LINK_LIBRARIES "imf;m;pthread;ifport;ifcoremt;imf;svml;m;ipgo;irc;pthread;svml;c;gcc;gcc_s;irc_s;dl;c")
set(CMAKE_Fortran_IMPLICIT_LINK_DIRECTORIES "/glade/u/apps/derecho/23.09/spack/opt/spack/intel-oneapi-compilers-classic/2021.10.0/gcc/7.5.0/4zuc/lib;/glade/u/apps/derecho/23.09/opt/view/lib64;/glade/u/apps/derecho/23.09/opt/view/lib;/opt/cray/libfabric/1.15.2.0/lib64;/glade/u/apps/common/23.08/spack/opt/spack/intel-oneapi-compilers/2023.2.1/compiler/2023.2.1/linux/compiler/lib/intel64_lin;/glade/u/apps/common/23.08/spack/opt/spack/intel-oneapi-compilers/2023.2.1/compiler/2023.2.1/linux/lib;/glade/u/apps/common/23.08/spack/opt/spack/intel-oneapi-compilers/2023.2.1/compiler/2023.2.1/linux/lib/clang/17/lib/linux;/glade/u/apps/common/23.08/spack/opt/spack/intel-oneapi-compilers/2023.2.1/compiler/2023.2.1/linux/lib/clang/17/lib/x86_64-unknown-linux-gnu;/opt/cray/pe/gcc/12.2.0/snos/lib/gcc/x86_64-suse-linux/12.2.0;/opt/cray/pe/gcc/12.2.0/snos/lib64;/lib64;/usr/lib64;/opt/cray/pe/gcc/12.2.0/snos/lib;/lib;/usr/lib")
set(CMAKE_Fortran_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
