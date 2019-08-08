macro(install_dependencies)

if(NOT EXISTS "${CMAKE_SOURCE_DIR}/dependencies.txt")
    message(FATAL_ERROR "Cannot find dependencies.txt")
endif()

file(READ "${CMAKE_SOURCE_DIR}/dependencies.txt" depends)
string(REGEX REPLACE "\n" ";" depends "${depends}")
foreach(dependency ${depends})
    set (cmd_list ${dependency})
    separate_arguments(cmd_list)
    list(get cmd_list 2 dep)
    message(STATUS find_package ${dep})
endforeach(dependency)

endmacro(install_dependencies)
