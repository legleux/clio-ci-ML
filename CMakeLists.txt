cmake_minimum_required(VERSION 3.16)
project(clio_builder)

include(ExternalProject)
set(CLIO_PROJECT_NAME clio) # NOTE: this should be passed as CMake var from the src repo?
set(CPACK_PACKAGE_INSTALL_DIRECTORY /opt/clio) # NOTE: could this be overridden somewhere?
# TODO: packaging.cmake must be configure_file()'d to have the same
# CPACK_PACKAGE_INSTALL_DIRECTORY between them...
configure_file("CMake/postinst.in" "${CMAKE_SOURCE_DIR}/CMake/postinst")
ExternalProject_Add(${CLIO_PROJECT_NAME}
    DOWNLOAD_COMMAND cp -r ${SRC_DIR} .
    SOURCE_DIR ${SRC_DIR}
    # TODO: make the patch command use a script in case it gets more complicated
    PATCH_COMMAND cp -r ${CMAKE_CURRENT_SOURCE_DIR}/CMake .
    CMAKE_ARGS -DPACKAGING=1
    BUILD_COMMAND cmake --build . --parallel $(nproc)
    INSTALL_COMMAND ""
)

ExternalProject_Get_property(${CLIO_PROJECT_NAME} SOURCE_DIR)
ExternalProject_Get_property(${CLIO_PROJECT_NAME} BINARY_DIR)
message("**********************************")
message("SOURCE_DIR: ${SOURCE_DIR}")
message("BINARY_DIR: ${BINARY_DIR}")
message("**********************************")

add_custom_command ( OUTPUT CLIO_PACKAGE
    COMMAND cpack --config ${BINARY_DIR}/CPackConfig.cmake
)

add_custom_target(package ALL DEPENDS CLIO_PACKAGE)
add_dependencies(package clio)
