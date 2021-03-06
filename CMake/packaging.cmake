set(CPACK_GENERATOR "DEB")

set(CPACK_PACKAGE_NAME "clio-server")

# set(CPACK_DEBIAN_PACKAGE_DEBUG 1)
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA
    ${CMAKE_SOURCE_DIR}/CMake/conffiles
    ${CMAKE_SOURCE_DIR}/CMake/postinst
    )
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)
# NOTE: if CPACK_SET_DESTDIR is true, CPACK_PACKAGING_INSTALL_PREFIX isn't used
set(CPACK_SET_DESTDIR true) # defaults to /usr otherwise
set(CPACK_INSTALL_PREFIX /opt/clio) # the only one that seems to work
set(CPACK_DEBIAN_PACKAGE_HOMEPAGE "http://github.com/XRPLF/clio")
set(CPACK_DEBIAN_PACKAGE_RECOMMENDS "rippled")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Ripple Labs Inc. <support@ripple.com>")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Clio XRPL API server")
set(CPACK_PACKAGE_VENDOR "XRPLF")
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)

string(REGEX MATCHALL "([0-9]+).([0-9]+).([0-9]+)-?([A-Za-z0-9].*)?" OUT ${clio_version})
set(CPACK_PACKAGE_VERSION_MAJOR ${CMAKE_MATCH_1})
set(CPACK_PACKAGE_VERSION_MINOR ${CMAKE_MATCH_2})
set(CPACK_PACKAGE_VERSION_PATCH ${CMAKE_MATCH_3})
set(PRE_RELEASE_VERSION ${CMAKE_MATCH_4})

if(DEFINED PRE_RELEASE_VERSION)
    set(CPACK_DEBIAN_PACKAGE_RELEASE "${PRE_RELEASE_VERSION}")
else()
    set(CPACK_DEBIAN_PACKAGE_RELEASE 1)
endif()

set(CPACK_STRIP_FILES TRUE)

include(CPack)
