

# 当前目录
CURRENT_DIR=${PWD}

# 脚本所在目录
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)

# version号
VERSION_NUM="1.17"

# build号
BUILD_NUM="1.17.03"

if [[ $1 ]]; then
  VERSION_NUM=$1
fi

if [[ $2 ]]; then
  BUILD_NUM=$2
fi

# 拼接version.build
VERSIONBUILDSRT=${BUILD_NUM}

## 平台工程 目录
PROJECT_PLATFROM_DIRECTORY=${SCRIPT_DIR}/../MaxiAp200_Platfrom/

cd ${PROJECT_PLATFROM_DIRECTORY}

#version.sh文件
echo "BUILD_NUMBER=V${VERSIONBUILDSRT}" > Build/version.sh
# version
agvtool new-marketing-version ${VERSION_NUM}
# build
agvtool new-version -all ${BUILD_NUM}

## 诊断工程 目录
PROJECT_DIAG_DIRECTORY=${SCRIPT_DIR}/../MaxiAp200_Diag/
cd ${PROJECT_DIAG_DIRECTORY}

#version.sh文件
echo "BUILD_NUMBER=V${VERSIONBUILDSRT}" > Build/version.sh

# version
agvtool new-marketing-version ${VERSION_NUM}
# build
agvtool new-version -all ${BUILD_NUM}


cd ${CURRENT_DIR}
