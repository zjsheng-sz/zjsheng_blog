#!/bin/sh

echo "~~~~~~~~~~~~~~~先配置如下信息~~~~~~~~~~~~~~~~~~~"

# 配置项目名称 APP_NAME、要复制的table文件路径S OURCE_DIR、配置版本号 BUNDLESHORTVERSION 获取路径

echo "~~~~~~~~~~~~~~~~静态库自动打包脚本~~~~~~~~~~~~~~~~"

# 当前目录
CURRENT_DIR=$PWD
# 脚本所在目录
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)
## 项目目录
PROJECT_DIR=$SCRIPT_DIR/..
## 编译后文件目录
OUTPUT_DIR=$PROJECT_DIR/build
## 打开工作空间
cd $PROJECT_DIR
#APP_NAME
APP_NAME="Eobd_apple"
TARGET_NAME=$APP_NAME
#编译模式 工程默认有 Debug Release
CONFIGURATION_TARGET=Release
#资源文件
SOURCE_DIR="XXX";

#取版本号
BUNDLESHORTVERSION=$(echo "cat //root/version/text()" | xmllint --shell ./../LIBTEXT/init.xml | sed '1d;3d')
#table路径
TABLE_DIR="$OUTPUT_DIR/version/${BUNDLESHORTVERSION}/Table"
FRAMEWORK_FILE="$OUTPUT_DIR/version/${BUNDLESHORTVERSION}/${TARGET_NAME}.frameWork"
FRAMEWORK_FILE_IPHONE="$OUTPUT_DIR/Release-iphoneos/${TARGET_NAME}.frameWork"
FRAMEWORK_FILE_SIMULATOR="$OUTPUT_DIR/Release-iphonesimulator/${TARGET_NAME}.frameWork"

echo "~~~~~~~~~~~~~~~~开始清理~~~~~~~~~~~~~~~~~~~"
rm -rf $OUTPUT_DIR
xcodebuild -target "${TARGET_NAME}"  -configuration "$CONFIGURATION_TARGET" clean


echo "~~~~~~~~~~~~~~~~build~~~~~~~~~~~~~~~~~~~"
xcodebuild -target "${TARGET_NAME}" -sdk iphoneos \
-configuration "$CONFIGURATION_TARGET"
xcodebuild -target "${TARGET_NAME}" -sdk iphonesimulator \
-configuration "$CONFIGURATION_TARGET"



echo "~~~~~~~~~~~~~~~~判断是否编译成功~~~~~~~~~~~~~~~~~~~"

if [ -f "${FRAMEWORK_FILE_IPHONE}/${TARGET_NAME}" ]; then
echo "编译成功"
else
echo "编译失败"
cd $PWD
exit 1
fi


echo "~~~~~~~~~~~~~~~~导出.frameWork~~~~~~~~~~~~~~~~~~~"
mkdir -p $TABLE_DIR
cp -rf ${FRAMEWORK_FILE_IPHONE} ${FRAMEWORK_FILE}
lipo -create "$FRAMEWORK_FILE_IPHONE/$TARGET_NAME" "$FRAMEWORK_FILE_SIMULATOR/$TARGET_NAME"  -output "$FRAMEWORK_FILE/$TARGET_NAME"

cp -rf SOURCE_DIR $TABLE_DIR

# cp -f ../LIBTEXT/*.tab $TABLE_DIR
# cp -f ../LIBTEXT/VIN2VEHICLE/*.* $TABLE_DIR
# cp -f ../LIBTEXT/*.xml $TABLE_DIR
# cp -f ../LIBTEXT/key.txt $TABLE_DIR
# cp -f ../LIBTEXT/car.png $TABLE_DIR
# cp -f ../FUNCLIST/PDF/Eobd/*.pdf $TABLE_DIR

echo "~~~~~~~~~~~~~~~~判断.frameWork是否导出成功~~~~~~~~~~~~~~~~~~~"
if [ -d "$FRAMEWORK_FILE" ]; then
  echo "导出到Version文件夹成功"
else
  echo "导出到Version文件夹失败"
  cd $PWD
  exit 1
fi

echo "~~~~~~~~~~~~~~~~判断table文件是否导出成功~~~~~~~~~~~~~~~~~~~"
if [ -f "${TABLE_DIR}/en_dtc.tab" ]; then
echo "table文件导出成功"
else
echo "table文件导出失败"
cd $PWD
exit 1
fi

cd $PWD

exit 0
