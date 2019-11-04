

if(NOT TANGO_FOUND)
  
    find_path(TANGO_INCLUDE_DIR tango.h
        HINTS PATH_SUFFIXES include include/tango)

    find_library(TANGO_LIBRARY tango)
    mark_as_advanced(TANGO_INCLUDE_DIR TANGO_LIBRARY)

    include(FindPackageHandleStandardArgs)
    find_package_handle_standard_args(tango
        REQUIRED_VARS TANGO_LIBRARY TANGO_INCLUDE_DIR)
    
    set(TANGO_INCLUDE_DIRS ${TANGO_INCLUDE_DIR})
    set(TANGO_LIBRARIES ${TANGO_LIBRARY})

endif(NOT TANGO_FOUND)
