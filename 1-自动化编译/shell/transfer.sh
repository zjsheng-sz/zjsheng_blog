



  # svn list http://10.240.4.2/svn/Develop/AllProject/DiagPlatform/Tags/Android/APP/SYSTEM_PROGRAM/iOSApp/MobVDT >version2.txt
    while read myline
    do
      # str1=`echo $myline|awk '{print substr($myline,0,8)}'`
      # str1=${myline:0:8}

      str1 = $myline

      echo "str1:${myline}"

      if [ $str1 = $BUILD_TAG ];then
        FLAG=$FALSE
      fi
    done < version.txt
