#! /bin/sh
file='../android/local.properties'
backupfile='local.bak.properties'
backupfile='Generated.bak.xcconfig'
version=`egrep -e "(flutter.versionCode=)([0-9]*[0-9]*)" $file`
sed -E "s/(flutter.versionCode=)([0-9]*[0-9]*)/\1$(($version+1))/g" $file >| output
mv -f $file $backupfile
mv -f output $file
rm $backupfile
