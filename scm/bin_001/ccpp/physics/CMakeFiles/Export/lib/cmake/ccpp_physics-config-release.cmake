#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ccpp_physics" for configuration "Release"
set_property(TARGET ccpp_physics APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ccpp_physics PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "Fortran"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libccpp_physics.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS ccpp_physics )
list(APPEND _IMPORT_CHECK_FILES_FOR_ccpp_physics "${_IMPORT_PREFIX}/lib/libccpp_physics.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
