#!/bin/bash

#
# Name: magix_one
# 
# Author: Dr M. GUEDJ
#
# Description: todo
#


function usage {
	echo "Usage:" 
	echo "magix --one <some_file>"
	echo -e "\t -> magix acts only over <some_file>"
	echo "magix --all <some_directory>"
	echo -e "\t -> magix acts only over all the files from the <some_directory>"
	exit 1
}
	
if [ $# -lt 2 ]
then
	echo "!: two arguments are required."
	usage
fi

if [ "$1" = "--one" ]
then

	if [ ! -e $2 ]
	then 
		echo "!: $2 is not present in the current directory"
		usage
	fi

	if [ -d $2 ]
	then 
		echo "!: magix, with the option '--one', acts only over common files (no over directories)."
		usage
	fi

	bash magix_one.sh "$2"
	exit 0
fi

if [ "$1" = "--all" ]
then

	if [ ! -e $2 ]
	then 
		echo "!: $2 is not present in the current directory"
		usage
	fi

	if [ -f $2 ]
	then 
		echo "!: magix, with the option '--all', acts only over directories."
		usage
	fi


	cd $2
	for x in $( ls  )
	do
		bash magix_one.sh "$x" 
	done
		
	exit 0
fi

# otherwise
usage


