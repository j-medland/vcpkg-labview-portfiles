
# install based on target
if(VCPKG_TARGET_IS_WINDOWS)
    # Get the top level directory to copy files from
    file(TO_NATIVE_PATH "C:/Program Files (x86)/National Instruments/Vision" NIVISION_ROOT)
    # header files
    file(INSTALL "${NIVISION_ROOT}/" DESTINATION "${CURRENT_PACKAGES_DIR}/Include" FILES_MATCHING PATTERN "*.h")
    # lib
    if(VCPKG_TARGET_ARCHITECTURE STREQUAL x64)
        set(LIB_DIR_NAME_APPEND "64")
    else
        set(LIB_DIR_NAME_APPEND "")
    file(INSTALL "${NIVISION_ROOT}/" DESTINATION "${CURRENT_PACKAGES_DIR}/Lib/MSVC${LIB_DIR_NAME_APPEND}" FILES_MATCHING PATTERN "*.lib")

#elseif (VCPKG_TARGET_IS_LINUX)
    #so
 #   file(INSTALL "${NIVOCUS_LIBRARYROOT}/${NIVOCUS_LINUX_BUILD_NAME}/bin" DESTINATION "${CURRENT_PACKAGES_DIR}" FILES_MATCHING PATTERN "*.so")

else ()
    message(FATAL_ERROR "Unknown build for this target")
endif ()

## cmake-config-file
file(TO_NATIVE_PATH "${CURRENT_PORT_DIR}/config.cmake" NIVISION_CONFIG)
file(INSTALL "${NIVISION_CONFIG}" DESTINATION "${CURRENT_PACKAGES_DIR}/share/nivision" RENAME "nivision-config.cmake")

# skip the lack of debug but it might mean we miss other files
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)