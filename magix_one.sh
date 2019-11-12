#!/bin/bash

#
# Name: magix_one
# 
# Author: Dr M. GUEDJ
#
# Description: let's say it's magix.
#
# Version: 0.2
#
# Date: 12/11/2019
#
# License: MIT LICENSE 
# -- see the file MIT-LICENSE.txt
#


name=$1"__magix"
config="$HOME/.123/magix/magix.config" 
cat $1 > $name

for line in $( cat $config | grep -v "^#" | sed "s/://" | sed "s/ /_/" | grep "\S" )
do
	regular=$( echo $line | sed "s/_.//" )
	not_regular=$( echo $line | sed "s/._//" )
	cat $name | sed -i "s/$regular/$not_regular/g" > totrash $name
done


echo "$name [OK]"

rm totrash 

# Documentation
# grep -v "^#" 
# --> remove line beginning by '#'
#
# sed s/:// 
# --> remove ':'
#
# grep "\S"
# --> remove blank lines


