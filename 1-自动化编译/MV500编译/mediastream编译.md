

## 先把新版本手动编译出来


### Box2D生成xcode工程脚本

1. 参考https://www.cnblogs.com/wengzilin/p/4466708.html

cmake  -DCMAKE_TOOLCHAIN_FILE=../toolchain/iOS_64.cmake \
-DCMAKE_IOS_DEVELOPER_ROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/ \
-DCMAKE_IOS_SDK_ROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/ \
-GXcode ..

2. 参考参考车系项目

cmake -DCMAKE_TOOLCHAIN_FILE=toolchain/toolchain-iOS.cmake \
-DCMAKE_IOS_DEVELOPER_ROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/ \
-GXcode ..


### mediastreamer2新版本生成xcode iOS工程脚本

1. 参考https://www.cnblogs.com/wengzilin/p/4466708.html

cmake  -DCMAKE_IOS_DEVELOPER_ROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/ \
-DCMAKE_IOS_SDK_ROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/ \
-DCMAKE_INSTALL_PREFIX=../install-prefix/  \
-DCMAKE_PREFIX_PATH=../apple-darwin/ \
-DCMAKE_TOOLCHAIN_FILE=toolchain/iOS_64.cmake  \
-GXcode ../mediastreamer2/

` CMake Deprecation Warning at /usr/local/Cellar/cmake/3.13.2/share/cmake/Modules/CMakeForceCompiler.cmake:83 (message):
  The CMAKE_FORCE_CXX_COMPILER macro is deprecated.  Instead just set
  CMAKE_CXX_COMPILER and allow CMake to identify the compiler.
Call Stack (most recent call first):
  /Users/zhongjiasheng/Desktop/MediaStreamerNewBuild/mediastreamer2/toolchain/iOS_64.cmake:31 (CMAKE_FORCE_CXX_COMPILER)
  /Users/zhongjiasheng/Desktop/MediaStreamerNewBuild/build/CMakeFiles/3.13.2/CMakeSystem.cmake:6 (include)
  /Users/zhongjiasheng/Desktop/MediaStreamerNewBuild/build/CMakeFiles/CMakeTmp/CMakeLists.txt:3 (project)

-- Check size of unsigned long - failed
CMake Error at /usr/local/Cellar/cmake/3.13.2/share/cmake/Modules/TestBigEndian.cmake:49 (message):
  no suitable type found
Call Stack (most recent call first):
  CMakeLists.txt:151 (test_big_endian)

-- Configuring incomplete, errors occurred! `


2. 参考车系项目

cmake -DCMAKE_TOOLCHAIN_FILE=toolchain/toolchain-iOS.cmake \
-DCMAKE_IOS_DEVELOPER_ROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/ \
-DCMAKE_INSTALL_PREFIX=/Users/zhongjiasheng/Desktop/MediaStreamerNewBuild/install-prefix \
-DCMAKE_PREFIX_PATH=/Users/zhongjiasheng/Desktop/MediaStreamerNewBuild/apple-darwin \
-GXcode /Users/zhongjiasheng/Desktop/MediaStreamerNewBuild/mediastreamer2


`<!-- CMake Error at /usr/local/Cellar/cmake/3.13.2/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
  Could NOT find FFMpeg (missing: FFMPEG_INCLUDE_DIRS FFMPEG_LIBRARIES
  LIBAVCODEC_INCLUDE_DIRS LIBAVUTIL_INCLUDE_DIRS LIBSWSCALE_INCLUDE_DIRS
  LIBAVCODEC_LIBRARIES LIBAVUTIL_LIBRARIES LIBSWSCALE_LIBRARIES)
Call Stack (most recent call first):
  /usr/local/Cellar/cmake/3.13.2/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
  cmake/FindFFMpeg.cmake:108 (find_package_handle_standard_args)
  CMakeLists.txt:242 (find_package)

-- Configuring incomplete, errors occurred! -->`


### mediastreamer2新版本生成xcode mac工程脚本

### mediastreamer2道通版本生成xcode ios工程脚本

### FFMpeg 编译
