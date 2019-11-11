#!/bin/bash

#
# Name: magix_one
# 
# Author: Dr M. GUEDJ
#
# Description: todo
#

name=$1"__magix"
cat $1 > $name

for line in $( cat magix.config | grep -v "^#" | sed "s/://" | sed "s/ /_/" | grep "\S" )
do
	#echo $line
	regular=$( echo $line | sed "s/_.//" )
	not_regular=$( echo $line | sed "s/._//" )
	#echo $regular "; " $not_regular
	cat $name | sed -i "s/$regular/$not_regular/g" > tee $name
	#cat $name	
done


echo "$name [OK]"

rm tee # to see later

# grep -v "^#" 
# --> remove line beginning by '#'
#
# sed s/:// 
# --> remove ':'
#
# grep "\S"
# --> remove blank lines


