#!/bin/bash
version=""
FALSE=1
TRUE=0
TARGET_VERSION=$1

function usage()
{
        echo "-------------------------------------------------------------------------------------------"
        echo "./checktag.sh <vxx.xx.xx>"
        echo "-------------------------------------------------------------------------------------------"
}

function read_version()
{
    str1=$(grep -i "BUILD_NUMBER=*" version.sh)
    version=${str1:14:9}
    echo "$version"
    return
}

#start run in here
if [ ! $# -eq 1 ];then
        usage
        exit $FALSE
fi

version=$(read_version)
echo "target version : $TARGET_VERSION"
echo "current version : $version"
if [ ! "$TARGET_VERSION" = "$version" ];then
  echo "exit $FALSE"
  exit $FALSE
fi
