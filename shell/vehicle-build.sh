#!/bin/sh

# alter here(only for LIBNAME and LIB_VERSION)
LIBNAME="Hyundai"
LIB_VERSION="v0.99.01"
IOS_SDK_VERSION="11.2"

# use ios-cmake to generate ios project
rm -rf prebuilt
#rm -rf lib/"${LIB_VERSION}"
rm -rf lib
rm -rf build.ios

#version=$(cat ./LIBTEXT/init_AP200_IOS.xml | sed /^$/d | grep "<version>" | sed 's/<version>/</' | cut -d '<' -f 2)
inputversion=$(echo $1 | cut -d '_' -f 1)
sed -i "" "s/XXXXX/${inputversion}/g" ./SRC/stdafxh/stdafx_AP200_IOS.h

cp -rf ./SRC/stdafxh/stdafx_AP200_IOS.h ./SRC/stdafx.h
cp -rf ../Std_908/Source_AP200/DiagnosisFrame_Encrypt.cpp ../Std_908/Source_AP200/DiagnosisFrame.cpp

mkdir build.ios
cd build.ios

# generate ios project
cmake -DCMAKE_TOOLCHAIN_FILE=../../Std_908/toolchain-iOS.cmake  -DCMAKE_IOS_DEVELOPER_ROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/  -GXcode ../IOS

cd ..

# build iphone os, this is a fat lib
xcodebuild -project build.ios/Project.xcodeproj -alltargets -sdk iphoneos -configuration Release 
if [ $? -ne 0 ]; then
exit 1
fi

# copy libXXX.a to lib/version
#mkdir -p lib/"${LIB_VERSION}"
#cp build.ios/lib/Release/lib"${LIBNAME}".a lib/"${LIB_VERSION}"
mkdir lib
cp build.ios/lib/Release/lib"${LIBNAME}".a lib/

echo "finished build ios fat library"