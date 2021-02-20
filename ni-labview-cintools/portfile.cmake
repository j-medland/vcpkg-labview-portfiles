
# install based on target
if(VCPKG_TARGET_IS_WINDOWS)
    # Get the top level directory to copy files from
    file(TO_NATIVE_PATH "C:/Program Files (x86)/National Instruments/LabVIEW 2020/cintools" LABVIEW_CINTOOLS_ROOT)
    # header files
    file(INSTALL "${LABVIEW_CINTOOLS_ROOT}/" DESTINATION "${CURRENT_PACKAGES_DIR}/include" FILES_MATCHING PATTERN "*.h")
    # lib
    file(INSTALL "${LABVIEW_CINTOOLS_ROOT}/" DESTINATION "${CURRENT_PACKAGES_DIR}/lib" FILES_MATCHING PATTERN "*.lib")

#elseif (VCPKG_TARGET_IS_LINUX)

    #so
 #   file(INSTALL "${NIVOCUS_LIBRARYROOT}/${NIVOCUS_LINUX_BUILD_NAME}/bin" DESTINATION "${CURRENT_PACKAGES_DIR}" FILES_MATCHING PATTERN "*.so")

else ()
    message(FATAL_ERROR "Unknown build for this target")
endif ()

## cmake-config-file
file(TO_NATIVE_PATH "${CURRENT_PORT_DIR}/config.cmake" LABVIEW_CINTOOLS_CONFIG)
file(INSTALL "${LABVIEW_CINTOOLS_CONFIG}" DESTINATION "${CURRENT_PACKAGES_DIR}/share/ni-labview-2020-cintools" RENAME "ni-labview-2020-cintools-config.cmake")

# skip the lack of debug but it might mean we miss other files
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)