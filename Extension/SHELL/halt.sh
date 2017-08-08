
/Users/autel/Desktop/Wish/git_commit_or_push.sh push
/Users/autel/Desktop/Language-/Gitnormal.sh push

echo "do you want to halt the mac , yes(y) ?"

read  halt

if [ $halt = "yes" ] || [ $halt = "y" ] || [ $halt = "Y" ]; then
  echo 'autel'|sudo -S halt
else
  echo "end"
fi
