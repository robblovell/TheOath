#! /bin/sh
file='../ios/Flutter/Generated.xcconfig'
backupfile='Generated.bak.xcconfig'
version=`egrep -e "(FLUTTER_BUILD_NUMBER=)([0-9]*[0-9]*)" $file`
sed -E "s/(FLUTTER_BUILD_NUMBER=)([0-9]*[0-9]*)/\1$(($version+1))/g" $file >| output
mv -f $file $backupfile
mv -f output $file
rm $backupfile
