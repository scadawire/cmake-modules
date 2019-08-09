if(NOT TARGET lint)
    find_program(RUN_CLANG_TIDY
        NAMES 
            run-clang-tidy

        PATHS
            /usr/local/opt/llvm/bin

    )

    if (NOT RUN_CLANG_TIDY)
        message(WARNING "run-clang-tidy not found - no lint target")
    else()
        message(STATUS "run-clang-tidy found adding lint target")
        add_custom_target(lint
            COMMAND ${RUN_CLANG_TIDY} -checks='cppcoreguidelines-*,performance-*,readibility-*,modernize-*,misc-*,clang-analyzer-*,google-*'
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    )
    endif()
endif()

