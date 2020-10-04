#! /bin/sh
file='../pubspec.yaml'
backupfile='pubspec.bak.yaml'
version=`egrep -e "(version: )([0-9]*\.[0-9]*\.[0-9]*\+)([0-9]*)" $file | cut -d: -f2 | sed -E "s/([0-9]*\.[0-9]*\.[0-9]*\+)([0-9]*)/\2/g"`
sed -E "s/(version: )([0-9]*\.[0-9]*\.[0-9]*\+)([0-9]*)/\1\2$(($version+1))/g" $file >| output
mv -f $file $backupfile
mv -f output $file
rm $backupfile

file='../ios/Flutter/Generated.xcconfig'
backupfile='Generated.bak.xcconfig'
sed -E "s/(FLUTTER_BUILD_NUMBER=)([0-9]*[0-9]*)/\1$(($version+1))/g" $file >| output
mv -f $file $backupfile
mv -f output $file
rm $backupfile

file='../android/local.properties'
backupfile='local.bak.properties'
sed -E "s/(flutter.versionCode=)([0-9]*[0-9]*)/\1$(($version+1))/g" $file >| output
mv -f $file $backupfile
mv -f output $file
rm $backupfile