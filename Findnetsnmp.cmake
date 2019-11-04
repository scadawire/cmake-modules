

if(NOT NETSNMP_FOUND)

    find_path(NETSNMP_INCLUDE_DIR net-snmp-includes.h
        HINTS PATH_SUFFIXES include include/net-snmp)

    find_library(NETSNMP_LIBRARY netsnmp)
    find_library(M_LIBRARY m)
    mark_as_advanced(NETSNMP_INCLUDE_DIR NETSNMP_LIBRARY M_LIBRARY)

    include(FindPackageHandleStandardArgs)
    find_package_handle_standard_args(netsnmp
        REQUIRED_VARS NETSNMP_LIBRARY NETSNMP_INCLUDE_DIR)

    set(NETSNMP_INCLUDE_DIRS ${NETSNMP_INCLUDE_DIR})
    set(NETSNMP_LIBRARIES ${NETSNMP_LIBRARY})

endif(NOT NETSNMP_FOUND)
