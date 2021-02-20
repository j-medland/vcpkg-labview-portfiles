set(LABVIEW_CINTOOLS_PKG_NAME "ni-labview-2020-cintools")

get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)


get_filename_component(LVCINTOOLS_PATH "${_DIR}/../../"  ABSOLUTE)

set(${LABVIEW_CINTOOLS_PKG_NAME}_FOUND TRUE)
set(${LABVIEW_CINTOOLS_PKG_NAME}_STATIC_LIB_PATH "${LVCINTOOLS_PATH}/lib/")
set(${LABVIEW_CINTOOLS_PKG_NAME}_LIBRARIES "${LVCINTOOLS_PATH}/lib/labview.lib")
set(${LABVIEW_CINTOOLS_PKG_NAME}_INCLUDE_DIRS "${LVCINTOOLS_PATH}/include")
