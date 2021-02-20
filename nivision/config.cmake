set(NIVISION_PKG_NAME "nivision")

get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)


get_filename_component(NIVISION_PATH "${_DIR}/../../"  ABSOLUTE)

set(${NIVISION_PKG_NAME}_FOUND TRUE)
set(${NIVISION_PKG_NAME}_STATIC_LIB_PATH "${NIVISION_PATH}/lib/")
set(${NIVISION_PKG_NAME}_LIBRARIES "${NIVISION_PATH}/lib/nivision.lib")
set(${NIVISION_PKG_NAME}_INCLUDE_DIRS "${NIVISION_PATH}/include")
