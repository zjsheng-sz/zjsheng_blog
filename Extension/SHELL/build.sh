#!/bin/sh

echo "~~~~~~~~~~~~~~~~开始执行脚本~~~~~~~~~~~~~~~~"
cd ..

# 开始时间
beginTime=`date +%s`
DATE=`date '+%Y-%m-%d-%T'`
#APP_NAME
APP_NAME="MobVDT"
#需要编译的 targetName
TARGET_NAME_DEVELOP="MobVDT"
TARGET_NAME_INTERPRISE="MobVDT_Enterprie"
TARGET_NAME_ADHOC="MobVDT_Adhoc"
TARGET_NAME_APPSTORE="MobVDT_AppStore"
TARGET_NAME=$TARGET_NAME_INTERPRISE

#编译模式 工程默认有 Debug Release
CONFIGURATION_TARGET=Release
#编译路径
BUILDPATH="Build/${APP_NAME}"
#archivePath
ARCHIVEPATH=${BUILDPATH}/${APP_NAME}.xcarchive
#证书名
CODE_SIGN_IDENTITY_ENTPRISE="iPhone Distribution: Autel Intelligent Technology Corp., Ltd."
CODE_SIGN_IDENTITY_PRODUCTION="iPhone Distribution: Autel Intelligent Technology Co., Ltd."
CODE_SIGN_IDENTITY=$CODE_SIGN_IDENTITY_ENTPRISE
#描述文件
PROVISIONING_PROFILE_NAME_ENTPRISE="441df4f5-9a1a-4d78-a473-43be886ff27f"
PROVISIONING_PROFILE_NAME_ADHOC="2a6b7ebc-543c-4d9d-8e59-f953aab625cb"
PROVISIONING_PROFILE_NAME_APPSTORE="0fc94984-52fb-4e09-bd48-57e7948691f6"
PROVISIONING_PROFILE_NAME=$PROVISIONING_PROFILE_NAME_ENTPRISE
#苹果账号
AppleID="Diagnostic@auteltech.net"
AppleIDPWD="Diagnostic321"
#导出ipa 所需plist
ADHOCExportOptionsPlist="./Build/ADHOCExportOptionsPlist.plist"
AppStoreExportOptionsPlist="./Build/AppStoreExportOptionsPlist.plist"
ENTPRISEExportOptionsPlist="./Build/ENTPRISEExportOptionsPlist.plist"
ExportOptionsPlist=${ENTPRISEExportOptionsPlist}
# 是否上传蒲公英
UPLOADPGYER=false
# 是否上传AppStore
UPLOADAPPSTore=false

# 读取用户输入并存到变量里
method="$1"
# 判读用户是否有输入
if [ -n "$method" ]
then
    if [ "$method" = "enterprise" ]
    then
    PROVISIONING_PROFILE_NAME=${PROVISIONING_PROFILE_NAME_ENTPRISE}
    CODE_SIGN_IDENTITY=${CODE_SIGN_IDENTITY_ENTPRISE}
    ExportOptionsPlist=${ENTPRISEExportOptionsPlist}
    TARGET_NAME=$TARGET_NAME_INTERPRISE
    elif [ "$method" = "ad-hoc" ]
    then
    PROVISIONING_PROFILE_NAME=$PROVISIONING_PROFILE_NAME_ADHOC
    CODE_SIGN_IDENTITY=${CODE_SIGN_IDENTITY_PRODUCTION}
    ExportOptionsPlist=${ADHOCExportOptionsPlist}
    TARGET_NAME=$TARGET_NAME_ADHOC
  elif [ "$method" = "appstore" ]
    then
    UPLOADAPPSTore=true
    PROVISIONING_PROFILE_NAME=$PROVISIONING_PROFILE_NAME_APPSTORE
    CODE_SIGN_IDENTITY=${CODE_SIGN_IDENTITY_PRODUCTION}
    ExportOptionsPlist=${AppStoreExportOptionsPlist}
    TARGET_NAME=$TARGET_NAME_APPSTORE

    else
    echo "~~~~~~~~~~~~~~~~请输入正确的打包方式~~~~~~~~~~~~~~~~"
    echo "        1 enterprise(默认)"
    echo "        2 ad-hoc"
    echo "        3 appstore "
    exit 1
    fi
else
    ExportOptionsPlist=${ENTPRISEExportOptionsPlist}
fi


# info.plist路径
PROJECT_INFOPLIST_PATH="./${APP_NAME}/${APP_NAME}.plist"
#取版本号
BUNDLESHORTVERSION=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" "${PROJECT_INFOPLIST_PATH}")
#取build值
BUNDLEVERSION=$(/usr/libexec/PlistBuddy -c "print CFBundleVersion" "${PROJECT_INFOPLIST_PATH}")
#输出的ipa目录
IPAPATH="Build/version/${BUNDLESHORTVERSION}"

echo "~~~~~~~~~~~~~~~~开始编译~~~~~~~~~~~~~~~~~~~"
echo "~~~~~~~~~~~~~~~~开始清理~~~~~~~~~~~~~~~~~~~"

rm -r

# 清理 避免出现一些莫名的错误
# xcodebuild clean -workspace ${TARGET_NAME}.xcworkspace \
# -configuration \
# ${CONFIGURATION} -alltargets
xcodebuild -target "${TARGET_NAME}"  -configuration 'Release' clean

echo "+++++++++++++++++build+++++++++++++++++"
xcodebuild -target "${APP_NAME}" -sdk iphoneos \
-configuration 'Release' \
CODE_SIGN_IDENTITY="${CODE_SIGN_IDENTITY}" \
PROVISIONING_PROFILE="${PROVISIONING_PROFILE_NAME}"


echo "~~~~~~~~~~~~~~~~开始构建~~~~~~~~~~~~~~~~~~~"
#开始构建
xcodebuild archive -project ${APP_NAME}.xcodeproj \
-scheme ${TARGET_NAME} \
-archivePath ${ARCHIVEPATH} \
-configuration ${CONFIGURATION_TARGET} \
CODE_SIGN_IDENTITY="${CODE_SIGN_IDENTITY}" \
PROVISIONING_PROFILE="${PROVISIONING_PROFILE_NAME}"

echo "~~~~~~~~~~~~~~~~检查是否构建成功~~~~~~~~~~~~~~~~~~~"
# xcarchive 实际是一个文件夹不是一个文件所以使用 -d 判断
if [ -d "$ARCHIVEPATH" ]
then
echo "构建成功......"
else
echo "构建失败......"
rm -rf $BUILDPATH
exit 1
fi
endTime=`date +%s`
ArchiveTime="构建时间$[ endTime - beginTime ]秒"


echo "~~~~~~~~~~~~~~~~导出ipa~~~~~~~~~~~~~~~~~~~"

beginTime=`date +%s`

xcodebuild -exportArchive \
-archivePath ${ARCHIVEPATH} \
-exportOptionsPlist ${ExportOptionsPlist} \
-exportPath ${IPAPATH}

echo "~~~~~~~~~~~~~~~~检查是否成功导出ipa~~~~~~~~~~~~~~~~~~~"
IPAFILEPATH=${IPAPATH}/${TARGET_NAME}.ipa
if [ -f "$IPAFILEPATH" ]
then
echo "导出ipa成功......"
echo "BUILD_NUMBER=V${BUNDLESHORTVERSION}" > Build/version.sh
echo "版本号V${BUNDLESHORTVERSION}写入Build/version.sh成功"
mv $IPAFILEPATH ${IPAPATH}/"${TARGET_NAME}_${BUNDLESHORTVERSION}.ipa"
else
echo "导出ipa失败......"
# 结束时间
endTime=`date +%s`
echo "$ArchiveTime"
echo "导出ipa时间$[ endTime - beginTime ]秒"
exit 1
fi

endTime=`date +%s`
ExportTime="导出ipa时间$[ endTime - beginTime ]秒"

#
# echo "~~~~~~~~~~~~~~~~配置信息~~~~~~~~~~~~~~~~~~~"
# echo "开始执行脚本时间: ${DATE}"
# echo "编译模式: ${CONFIGURATION_TARGET}"
# echo "导出ipa配置: ${ExportOptionsPlist}"
# echo "打包文件路径: ${ARCHIVEPATH}"
# echo "导出ipa路径: ${IPAPATH}"

# echo "$ArchiveTime"
# echo "$ExportTime"
exit 0
