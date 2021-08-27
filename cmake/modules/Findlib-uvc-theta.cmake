find_package(PkgConfig)

find_path(lib-uvc-theta_INCLUDE_DIR
  NAMES libuvc.h
  PATHS ${PC_lib-uvc-theta_INCLUDE_DIRS}  
)
find_library(lib-uvc-theta_LIBRARY
  NAMES libuvc
  PATHS ${PC_lib-uvc-theta_LIBRARY_DIRS}
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(lib-uvc-theta
  FOUND_VAR lib-uvc-theta_FOUND
  REQUIRED_VARS
  lib-uvc-theta_LIBRARY
  lib-uvc-theta_INCLUDE_DIR
  VERSION_VAR lib-uvc-theta_VERSION
)