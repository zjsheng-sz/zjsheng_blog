#!/bin/bash
# return value
# if [ -d ./iOSApp ];then
#   rm -rf ./iOSApp
# fi

FALSE=1
TRUE=0
NEW_FLAG=$TRUE
BUILD_TAG=$1

function check(){
  # svn list http://10.240.4.2/svn/Develop/AllProject/DiagPlatform/Tags/Android/APP/SYSTEM_PROGRAM/iOSApp/MobVDT >version2.txt
  FLAG=$TRUE
    while read myline
    do
      # str1=`echo $myline|awk '{print substr($myline,0,8)}'`
      str1=${myline:0:8}

      if [ $str1 = $BUILD_TAG ];then
        FLAG=$FALSE
      fi
    done < version2.txt

    echo $FLAG
    return
}

  NEW_FLAG=$(check)
  echo "+++++++++++++++"
  echo "NEW_FLAG:${NEW_FLAG}"

  if [[ $NEW_FLAG == $TRUE ]]; then
  echo "校验完成，即将打tag⋯⋯"
  echo "延时3分钟处理⋯⋯"
  sleep 3
  else
  echo "不要重复打tag,即将退出⋯⋯"
  exit 1
  fi
