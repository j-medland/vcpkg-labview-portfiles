# define values for the .vip version
set(NIVOCUS_VERSION 1.0.0.47)
set(NIVOCUS_HASH 7160400d2a8f7fa8e50611ccf76e5f4f4f9904b1036563c2d6f38e80f7596e74322c1d928927f27e93d466bf79d0f18f52b98acc6ea8b8bee125c6aeec11c9e2)
set(NIVOCUS_FILES_PATH "File Group 0/National Instruments/NIVision OpenCV Utilities/nivisionextlib")
set(NIVOCUS_WIN_BUILD_NAME "vc90")
set(NIVOCUS_LINUX_BUILD_NAME "gcc-4.7-linux")
set(NIVOCUS_PKG_NAME "nivision-opencv-utilities-system")
# Check platform
vcpkg_fail_port_install(MESSAGE "nivision-opencv-utilities-system currently only supports Linux and Windows platforms (no OSX binaries supplied by NI)" ON_TARGET "OSX")

# Check architecture:
if (VCPKG_TARGET_ARCHITECTURE STREQUAL "x86" OR VCPKG_TARGET_ARCHITECTURE STREQUAL "x64")
    set(NIVOCUS_ARCH ${VCPKG_TARGET_ARCHITECTURE})
elseif (VCPKG_TARGET_ARCHITECTURE STREQUAL "arm")
    message(FATAL_ERROR "ARM binaries are provided by NI but not supported by this portfile.")
else()
    message(FATAL_ERROR "Unsupported architecture: ${VCPKG_TARGET_ARCHITECTURE}")
endif()

vcpkg_download_distfile(ARCHIVE
    URLS "http://ftp.ni.com/evaluation/labview/lvtn/vipm/packages/national_instruments_nivision_opencv_utilities_system/national_instruments_nivision_opencv_utilities_system-${NIVOCUS_VERSION}.vip"
    FILENAME "national_instruments_nivision_opencv_utilities_system-${NIVOCUS_VERSION}.zip"
    SHA512 ${NIVOCUS_HASH}
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
    REF ${NIVOCUS_VERSION}
    NO_REMOVE_ONE_LEVEL
)

# build paths to copy files from

# Get the top level directory to copy files from
file(TO_NATIVE_PATH "${SOURCE_PATH}/${NIVOCUS_FILES_PATH}/" NIVOCUS_COPYROOT)

## <include> files
file(TO_NATIVE_PATH "${NIVOCUS_COPYROOT}/include" NIVOCUS_INCLUDE)
file(INSTALL "${NIVOCUS_INCLUDE}" DESTINATION "${CURRENT_PACKAGES_DIR}" FILES_MATCHING PATTERN "NIVision*.h")

## Library files
file(TO_NATIVE_PATH "${NIVOCUS_COPYROOT}/${NIVOCUS_ARCH}" NIVOCUS_LIBRARYROOT)

# install based on target
if(VCPKG_TARGET_IS_WINDOWS)

    #dll
    file(INSTALL "${NIVOCUS_LIBRARYROOT}/${NIVOCUS_WIN_BUILD_NAME}/bin" DESTINATION "${CURRENT_PACKAGES_DIR}" FILES_MATCHING PATTERN "*.dll")
    #lib
    file(INSTALL "${NIVOCUS_LIBRARYROOT}/${NIVOCUS_WIN_BUILD_NAME}/lib" DESTINATION "${CURRENT_PACKAGES_DIR}" FILES_MATCHING PATTERN "*.lib")

elseif (VCPKG_TARGET_IS_LINUX)

    #so
    file(INSTALL "${NIVOCUS_LIBRARYROOT}/${NIVOCUS_LINUX_BUILD_NAME}/bin" DESTINATION "${CURRENT_PACKAGES_DIR}" FILES_MATCHING PATTERN "*.so")

else ()
    message(FATAL_ERROR "Unknown build for this target")
endif ()

## License File
file(TO_NATIVE_PATH "${SOURCE_PATH}/license" NIVOCUS_LICENSE)
file(INSTALL "${NIVOCUS_LICENSE}" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${NIVOCUS_PKG_NAME}" RENAME copyright)

## cmake-config-file
file(TO_NATIVE_PATH "${CURRENT_PORT_DIR}/config.cmake" NIVOCUS_CMAKE_CONFIG)
file(INSTALL "${NIVOCUS_CMAKE_CONFIG}" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${NIVOCUS_PKG_NAME}" RENAME "${NIVOCUS_PKG_NAME}-config.cmake")

# skip the lack of debug but it might mean we miss other files
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)