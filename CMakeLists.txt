cmake_minimum_required(VERSION 3.16)
project(clio_builder)

include(ExternalProject)
# If we want to use any variables from this file in the CMake/packaging.cmake that
# will eventually end up in the clio repo's CMake dir, the packaging.cmake file
# will have to be configure_file()'d
# set(CLIO_BIN_DIR ${CMAKE_BINARY_DIR}/clio_bin_dir)
# NOTE: This is a little wonky bc the patch command
# needs to be configuring the postinst.in file that
# lives in this repo into the clio source repo.
set(CLIO_PROJECT_NAME clio) # NOTE: this should come from the actual project?
set(CPACK_PACKAGE_INSTALL_DIRECTORY /opt/clio) # NOTE: could this be overridden somewhere?
# TODO: pacakging.cmake must be configure_file()'d to have the same
# CPACK_PACKAGE_INSTALL_DIRECTORY between them...
configure_file("CMake/postinst.in" "${CMAKE_SOURCE_DIR}/CMake/postinst")

set(CLIO_REPO git@github.com:legleux/clio)
ExternalProject_Add(${CLIO_PROJECT_NAME}
    # BINARY_DIR ${CLIO_BIN_DIR}
    # LOG_DOWNLOAD 1
    # DOWNLOAD_COMMAND cp -r  /home/mlegleux/dev/SMALL_PKG_TEST/${CLIO_PROJECT_NAME} .
    DOWNLOAD_COMMAND cp -r /home/mlegleux/dev/clio .
    # GIT_REPOSITORY ${CLIO_REPO}
    # GIT_TAG new-build-repo
    # SOURCE_DIR clio
    # CONFIGURE_COMMAND
    # TODO: make the patch command use a script in case it gets more complicated
    PATCH_COMMAND cp -r ${CMAKE_CURRENT_SOURCE_DIR}/CMake .
        # COMMAND touch that
        # COMMAND bash ${CMAKE_CURRENT_SOURCE_DIR}/CMake/patch.sh ${CMAKE_CURRENT_SOURCE_DIR} ${CLIO_BIN_DIR}
        # COMMAND ${CMAKE_COMMAND} -DPIN=${CMAKE_CURRENT_SOURCE_DIR}/CMake/postinst.in -P ${CMAKE_CURRENT_SOURCE_DIR}/CMake/WTF.cmake

    CMAKE_ARGS -DPACKAGING=1
    BUILD_COMMAND cmake --build .
    INSTALL_COMMAND cmake --install . --prefix ${CMAKE_CURRENT_SOURCE_DIR}/CLIO_PACKAGE
    # INSTALL_COMMAND ""
)

ExternalProject_Get_property(${CLIO_PROJECT_NAME} SOURCE_DIR)
ExternalProject_Get_property(${CLIO_PROJECT_NAME} BINARY_DIR)
message("**********************************")
message("Source: ${SOURCE_DIR}")
message("Binary: ${BINARY_DIR}")
message("**********************************")

add_custom_command ( OUTPUT CLIO_PACKAGE
    COMMAND cpack --config ${BINARY_DIR}/CPackConfig.cmake
    # WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)
# ending up here:
#./build/clio-prefix/src/clio-build/CPackConfig.cmake


add_custom_target(package ALL DEPENDS CLIO_PACKAGE)
