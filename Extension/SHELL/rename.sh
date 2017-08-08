
for name in `ls | grep .png`
do

	# preName=`echo $name|cut -d. -f1`
	preName=`echo $name|cut -c 1-8`
	newName="${preName}@2x.png"

	mv $name $newName;
	echo $newName;

done
