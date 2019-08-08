# An example Module file for CMake that will find the CFITSIO package
#
#  CFITSIO_ROOT_DIR     - CFITSIO root directory
#
#
#  CFITSIO_FOUND        - system has CFITSIO
#  CFITSIO_INCLUDE_DIR  - the CFITSIO include directory (cached)
#  CFITSIO_INCLUDE_DIRS - the CFITSIO include directories
#  CFITSIO_LIBRARY      - the CFITSIO library (cached)
#  CFITSIO_LIBRARIES    - the CFITSIO libraries

if(NOT CFITSIO_FOUND)

  find_path(CFITSIO_INCLUDE_DIR fitsio.h
    HINTS ${CFITSIO_ROOT_DIR} PATH_SUFFIXES include include/cfitsio
             include/libcfitsio0)

  find_library(CFITSIO_LIBRARY cfitsio
    HINTS ${CFITSIO_ROOT_DIR} PATH_SUFFIXES lib)
  find_library(M_LIBRARY m)
  mark_as_advanced(CFITSIO_INCLUDE_DIR CFITSIO_LIBRARY M_LIBRARY)

  if(CMAKE_VERSION VERSION_LESS "2.8.3")
    find_package_handle_standard_args(CFITSIO DEFAULT_MSG
      CFITSIO_LIBRARY M_LIBRARY CFITSIO_INCLUDE_DIR)
  else ()
    include(FindPackageHandleStandardArgs)
    find_package_handle_standard_args(CFITSIO
      REQUIRED_VARS CFITSIO_LIBRARY M_LIBRARY CFITSIO_INCLUDE_DIR
      VERSION_VAR CFITSIO_VERSION_STRING)
  endif ()

  set(CFITSIO_INCLUDE_DIRS ${CFITSIO_INCLUDE_DIR})
  set(CFITSIO_LIBRARIES ${CFITSIO_LIBRARY} ${M_LIBRARY})

endif(NOT CFITSIO_FOUND)
