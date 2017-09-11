
echo "do you want to push Language yes(y)?"
read  needPushLanguage

echo "do you want to push Wish yes(y)?"
read  needPushWith

echo "do you want to halt the mac , yes(y) ?"
read  needHalt


if [ $needPushLanguage = "yes" ] || [ $needPushLanguage = "y" ] || [ $needPushLanguage = "Y" ]; then
  /Users/autel/Desktop/Language-/gitnormal.sh  /Users/autel/Desktop/Language-  push
else
  /Users/autel/Desktop/Language-/gitnormal.sh  /Users/autel/Desktop/Language-
fi


if [ $needPushWith = "yes" ] || [ $needPushWith = "y" ] || [ $needPushWith = "Y" ]; then
  /Users/autel/Desktop/Language-/gitnormal.sh /Users/autel/Desktop/Wish push
else
  /Users/autel/Desktop/Language-/gitnormal.sh /Users/autel/Desktop/Wish
fi


if [ $needHalt = "yes" ] || [ $needHalt = "y" ] || [ $needHalt = "Y" ]; then
  echo 'autel'|sudo -S halt
else
  echo "end"
fi
