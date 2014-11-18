################
# UseOVR.cmake #
################

OPTION(WITH_OVR "Build with Oculus support?" OFF)

IF(WITH_OVR)
  IF(MSVC_IDE)
    FIND_PATH(OVR_INCLUDE_DIR OVR.h HINTS $ENV{HOMEPATH}/Downloads/OculusSDK/LibOVR/Include)
    FIND_LIBRARY(OVR_LIBRARY libovr64 HINTS $ENV{HOMEPATH}/Downloads/OculusSDK/LibOVR/Lib/x64/VS2013)
  ELSEIF(APPLE)
    FIND_PATH(OVR_INCLUDE_DIR OVR.h HINTS ~/Downloads/OculusSDK/LibOVR/Include)
    FIND_LIBRARY(OVR_LIBRARY ovr HINTS ~/Downloads/OculusSDK/LibOVR/Lib/Mac/Release)
  ELSEIF("${CMAKE_SYSTEM}" MATCHES "Linux")
    FIND_PATH(OVR_INCLUDE_DIR OVR.h HINTS ~/Software/ovr_sdk_linux_0.4.3/LibOVR/Include)
    FIND_LIBRARY(OVR_LIBRARY ovr HINTS ~/Software/ovr_sdk_linux_0.4.3/LibOVR/Lib/Linux/Debug/x86_64)
  ELSE()
    FIND_PATH(OVR_INCLUDE_DIR OVR.h)
    FIND_LIBRARY(OVR_LIBRARY ovr)
  ENDIF()

  IF(APPLE)
    FIND_LIBRARY(COCOA Cocoa)
    FIND_LIBRARY(COREFOUNDATION CoreFoundation)
    FIND_LIBRARY(COREGRAPHICS CoreGraphics)
    FIND_LIBRARY(IOKIT IOKit)
  ENDIF()

  IF("${CMAKE_SYSTEM}" MATCHES "Linux")
    FIND_PACKAGE(X11)
  ENDIF()

  INCLUDE_DIRECTORIES(${OVR_INCLUDE_DIR})
  ADD_DEFINITIONS(-DWITH_OVR)
ENDIF()