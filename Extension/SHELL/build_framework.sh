#!/bin/sh

echo "~~~~~~~~~~~~~~~~开始执行脚本~~~~~~~~~~~~~~~~"
cd ..

# 开始时间
beginTime=`date +%s`
DATE=`date '+%Y-%m-%d-%T'`
#APP_NAME
APP_NAME="Eobd_apple"
#需要编译的 targetName

TARGET_NAME=$APP_NAME

#编译模式 工程默认有 Debug Release
CONFIGURATION_TARGET=Release
#取版本号
BUNDLESHORTVERSION=$(echo "cat //root/version/text()" | xmllint --shell ./../LIBTEXT/init.xml | sed '1d;3d')
#输出的ipa目录
IPAPATH="build/version/${BUNDLESHORTVERSION}"
#table路径
TablePath=${IPAPATH}/Table
frameWorkPATH="build/Release-iphoneos/${TARGET_NAME}.frameWork"
directFrameWorkPath=${IPAPATH}/${TARGET_NAME}.frameWork



echo "~~~~~~~~~~~~~~~~开始清理~~~~~~~~~~~~~~~~~~~"
rm -rf "build/"
xcodebuild -target "${TARGET_NAME}"  -configuration "$CONFIGURATION_TARGET" clean


echo "+++++++++++++++++build+++++++++++++++++"
xcodebuild -target "${TARGET_NAME}" -sdk iphoneos \
-configuration "$CONFIGURATION_TARGET" \
CODE_SIGN_IDENTITY="${CODE_SIGN_IDENTITY}" \
PROVISIONING_PROFILE="${PROVISIONING_PROFILE_NAME}"


echo "~~~~~~~~~~~~~~~~判断是否编译成功~~~~~~~~~~~~~~~~~~~"
if [ -f "${frameWorkPATH}/${TARGET_NAME}" ]; then
echo "编译成功"
else
echo "编译失败"
exit 1
fi


echo "~~~~~~~~~~~~~~~~导出.frameWork 和table文件~~~~~~~~~~~~~~~~~~~"
mkdir -p $TablePath
cp -rf ${frameWorkPATH} ${directFrameWorkPath}

cp -f ../LIBTEXT/*.tab $TablePath
cp -f ../LIBTEXT/VIN2VEHICLE/*.* $TablePath
cp -f ../LIBTEXT/*.xml $TablePath
cp -f ../LIBTEXT/key.txt $TablePath
cp -f ../LIBTEXT/car.png $TablePath
cp -f ../FUNCLIST/PDF/Eobd/*.pdf $TablePath

echo "~~~~~~~~~~~~~~~~判断是否导出成功~~~~~~~~~~~~~~~~~~~"
if [ -d "$directFrameWorkPath" ]; then
  echo "导出到Version文件夹成功"
else
  echo "导出到Version文件夹失败"
  exit 1
fi


echo "~~~~~~~~~~~~~~~~判断table文件是否导出成功~~~~~~~~~~~~~~~~~~~"
if [ -f "${TablePath}/en_dtc.tab" ]; then
echo "table文件导出成功"
else
echo "table文件导出失败"
exit 1
fi

exit 0
