#!/bin/sh

# 当前目录
CURRENT_DIR=$PWD

# 脚本所在目录
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)

## 工作空间目录
WORKSPACE_DIR=$SCRIPT_DIR/../..

## 打开工作空间
cd $WORKSPACE_DIR

#PROJECT_NAME
PROJECT_NAME="MaxiAp200_Diag"
WORKSPACE_NAME="MaxiAP200"

#需要编译的 targetName
TARGET_NAME_DEVELOP="${PROJECT_NAME}_AppStore"
TARGET_NAME_ENTERPRISE="${PROJECT_NAME}_Enterprie"
# TARGET_NAME_ADHOC="${PROJECT_NAME}_Adhoc"
# TARGET_NAME_APPSTORE="${PROJECT_NAME}_AppStore"
TARGET_NAME=$TARGET_NAME_ENTERPRISE

#编译模式 工程默认有 Debug Release
CONFIGURATION_TARGET=Release

#编译路径
BUILDPATH=$SCRIPT_DIR/$PROJECT_NAME/
ARCHIVEPATH=$SCRIPT_DIR/$PROJECT_NAME/$PROJECT_NAME.xcarchive

#证书名
CODE_SIGN_IDENTITY_ENTPRISE="iPhone Distribution: Autel Intelligent Technology Corp., Ltd."
CODE_SIGN_IDENTITY_PRODUCTION="iPhone Distribution: Autel Intelligent Technology Co., Ltd."
CODE_SIGN_IDENTITY=$CODE_SIGN_IDENTITY_ENTPRISE

#描述文件
PROVISIONING_PROFILE_NAME_ENTPRISE="132702b0-c2ec-4488-a74c-8698f6688301"
PROVISIONING_PROFILE_NAME_ADHOC="9420cc27-3d48-43c9-9c46-315ce743e59d"
PROVISIONING_PROFILE_NAME_APPSTORE="bc96500f-9b36-4c7f-b6e2-bf6e55fdef3b"
PROVISIONING_PROFILE_NAME=$PROVISIONING_PROFILE_NAME_ENTPRISE

#苹果账号
AppleID="Diagnostic@auteltech.net"
AppleIDPWD="Diagnostic0806"

#导出ipa 所需plist
ADHOCExportOptionsPlist=$SCRIPT_DIR/ADHOCExportOptionsPlist.plist
AppStoreExportOptionsPlist=$SCRIPT_DIR/AppStoreExportOptionsPlist.plist
ENTPRISEExportOptionsPlist=$SCRIPT_DIR/ENTPRISEExportOptionsPlist.plist
ExportOptionsPlist=$ENTPRISEExportOptionsPlist

# 是否上传AppStore
UPLOADAPPSTore=false

# 读取用户输入并存到变量里
method="$1"
# 判读用户是否有输入
if [ -n "$method" ]
then
    if [ "$method" = "enterprise" ]
    then
    PROVISIONING_PROFILE_NAME=$PROVISIONING_PROFILE_NAME_ENTPRISE
    CODE_SIGN_IDENTITY=$CODE_SIGN_IDENTITY_ENTPRISE
    ExportOptionsPlist=$ENTPRISEExportOptionsPlist
    TARGET_NAME=$TARGET_NAME_ENTERPRISE
    # elif [ "$method" = "ad-hoc" ]
    # then
    # PROVISIONING_PROFILE_NAME=$PROVISIONING_PROFILE_NAME_ADHOC
    # CODE_SIGN_IDENTITY=$CODE_SIGN_IDENTITY_PRODUCTION
    # ExportOptionsPlist=$ADHOCExportOptionsPlist
    # TARGET_NAME=$TARGET_NAME_ADHOC
    elif [ "$method" = "appstore" ]
    then
    UPLOADAPPSTore=true
    PROVISIONING_PROFILE_NAME=$PROVISIONING_PROFILE_NAME_APPSTORE
    CODE_SIGN_IDENTITY=$CODE_SIGN_IDENTITY_PRODUCTION
    ExportOptionsPlist=$AppStoreExportOptionsPlist
    TARGET_NAME=$TARGET_NAME_DEVELOP

    else
    echo "~~~~~~~~~~~~~~~~请输入正确的打包方式~~~~~~~~~~~~~~~~"
    echo "        1 enterprise(默认)"
    echo "        2 appstore "
    # echo "        3 ad-hoc"
    exit 1
    fi
else
    ExportOptionsPlist=$ENTPRISEExportOptionsPlist
fi


# info.plist路径
PROJECT_INFOPLIST_PATH=$WORKSPACE_DIR/$PROJECT_NAME/$PROJECT_NAME/info.plist
#取版本号
BUNDLESHORTVERSION=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" "${PROJECT_INFOPLIST_PATH}")
#取build值
BUNDLEVERSION=$(/usr/libexec/PlistBuddy -c "print CFBundleVersion" "${PROJECT_INFOPLIST_PATH}")
#输出文件路径
OUTPUT_PATH=$SCRIPT_DIR/version/$BUNDLESHORTVERSION

echo "~~~~~~~~~~~~~~~~开始清理~~~~~~~~~~~~~~~~~~~"
# 清理 避免出现一些莫名的错误
xcodebuild  -workspace $WORKSPACE_NAME.xcworkspace \
-scheme $TARGET_NAME \
-configuration 'Release' clean

# xcodebuild -target "${TARGET_NAME}"  -configuration 'Release' clean

# echo "+++++++++++++++++build+++++++++++++++++"
# xcodebuild -target "${PROJECT_NAME}" -sdk iphoneos \
# -configuration 'Release' \
# CODE_SIGN_IDENTITY="${CODE_SIGN_IDENTITY}" \
# PROVISIONING_PROFILE="${PROVISIONING_PROFILE_NAME}"



echo "~~~~~~~~~~~~~~~~开始构建~~~~~~~~~~~~~~~~~~~"
#开始构建

# xcodebuild archive -project ${PROJECT_NAME}.xcodeproj \
xcodebuild archive -workspace $WORKSPACE_NAME.xcworkspace \
-scheme $TARGET_NAME \
-sdk iphoneos \
-archivePath $ARCHIVEPATH \
-configuration $CONFIGURATION_TARGET
CODE_SIGN_IDENTITY=$CODE_SIGN_IDENTITY \
PROVISIONING_PROFILE=$PROVISIONING_PROFILE_NAME

echo "~~~~~~~~~~~~~~~~检查是否构建成功~~~~~~~~~~~~~~~~~~~"
# xcarchive 实际是一个文件夹不是一个文件所以使用 -d 判断
if [ -d "$ARCHIVEPATH" ]
then
echo "构建成功"
else
echo "构建失败"
rm -rf $BUILDPATH
exit 1
fi


echo "~~~~~~~~~~~~~~~~导出ipa~~~~~~~~~~~~~~~~~~~"

xcodebuild -exportArchive \
-archivePath $ARCHIVEPATH \
-exportOptionsPlist $ExportOptionsPlist \
-exportPath $OUTPUT_PATH


echo "~~~~~~~~~~~~~~~导出.xcarchive~~~~~~~~~~~~~~~"
XcarchivePath=$OUTPUT_PATH/${TARGET_NAME}_${BUNDLESHORTVERSION}.xcarchive
XcarchivePath_zip=$OUTPUT_PATH/${TARGET_NAME}_${BUNDLESHORTVERSION}.zip

cp -rf $ARCHIVEPATH $XcarchivePath

if [ -d "$XcarchivePath" ];
then
  echo ".xcarchive导出成功"

  zip -q -r  $XcarchivePath_zip  $XcarchivePath
else
  echo ".xcarchive导出失败"
fi

echo "~~~~~~~~~~~~~~~~检查是否成功导出ipa~~~~~~~~~~~~~~~~~~~"
IPA_FILE=$OUTPUT_PATH/$TARGET_NAME.ipa
if [ -f $IPA_FILE ]
then
echo "ipa导出成功"
echo "BUILD_NUMBER=V${BUNDLESHORTVERSION}" > $SCRIPT_DIR/version.sh
echo "版本号V${BUNDLESHORTVERSION}写入Build/version.sh成功"

mv $IPA_FILE $OUTPUT_PATH/"${TARGET_NAME}_${BUNDLESHORTVERSION}.ipa"

else
echo "ipa导出失败"
exit 1
fi

cd $CURRENT_DIR

exit 0
