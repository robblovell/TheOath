#! /bin/sh
file='../pubspec.yaml'
backupfile='pubspec.bak.yaml'
version=`egrep -e "(version: )([0-9]*\.[0-9]*\.[0-9]*\+)([0-9]*)" $file | cut -d: -f2 | sed -E "s/([0-9]*\.[0-9]*\.[0-9]*\+)([0-9]*)/\2/g"`
sed -E "s/(version: )([0-9]*\.[0-9]*\.[0-9]*\+)([0-9]*)/\1\2$(($version+1))/g" $file >| output
mv -f $file $backupfile
mv -f output $file
rm $backupfile
