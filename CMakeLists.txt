cmake_minimum_required(VERSION 3.18)
project(libuvc-theta-sample)


find_package(PkgConfig) 
#find gstreamer (maybe this can be more elegant) maybe re-use FindGStreamer.cmake from google
pkg_check_modules(GLIB REQUIRED glib-2.0)
pkg_check_modules(GSTREAMER REQUIRED gstreamer-1.0)
pkg_check_modules(GSTREAMER-APP REQUIRED gstreamer-app-1.0)
add_definitions(-DGST_API_VERSION_1=1)


#find the libuvc via its own cmake module - the theta version
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules")
#find_package(lib-uvc-theta REQUIRED)
find_package(libuvc)

set(HEADERS
    gst/thetauvc.h
)

set(SOURCES
    gst/gst_viewer.c
    gst/thetauvc.c
)

#message(STATUS "libuvc inlcudes are in: ${lib-uvc-theta_INCLUDE_DIR}")

#the gst_viewer
add_executable(gst_viewer ${HEADERS} ${SOURCES})
target_include_directories(gst_viewer PRIVATE ${GSTREAMER_INCLUDE_DIRS})
target_link_libraries(gst_viewer
    ${GSTREAMER_LIBRARIES}
    ${GSTREAMER-APP_LIBRARIES}
    ${GLIB_LIBRARIES}
    pthread
    uvc
)

#the gst_loopback is the same executable as the gst_viewer, but due to different name it causes
#internally via arg0 a differen behaviour - thus we create a static link to the viewer with this name
add_custom_target(gst_loopback ALL
    COMMAND ${CMAKE_COMMAND} -E create_symlink gst_viewer gst_loopback)