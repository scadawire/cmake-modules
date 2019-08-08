macro(install_dependencies)

if(NOT EXISTS "${CMAKE_SOURCE_DIR}/dependencies.txt")
    message(FATAL_ERROR "Cannot find dependencies.txt")
endif()

file(READ "${CMAKE_SOURCE_DIR}/dependencies.txt" depends)
string(REGEX REPLACE "\n" ";" depends "${depends}")
foreach(dependency ${depends})
    separate_arguments(${dependency})
    message(STATUS find_package ${dependency}[1])
endforeach(dependency)

endmacro(install_dependencies)
