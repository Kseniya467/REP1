#!/bin/bash
if [ $# -ne 2 ]; then 
	echo "Usage: $0 <directory> <mode>"
	exit 1
fi

dir="$1"
mode="$2"

if [ ! -d "$dir" ]; 
then 
	echo "Directory not found"
	exit 1 
fi 

if [ $mode -eq 1 ];
then
date=$(date +"%Y-%m-%d")

for file in "$dir"/*;
do  
tar -cf "$dir/$file-$date.tar" "$file"
done
echo "Archiving complete"


elif [ $mode -eq 2 ]; 
then 
echo "Enter a date to delete files"
given_date=$(date -d "$3" +"%Y-%m-%d")


for file in "$dir"/*; 
do 
file_date="${filename##*_}" 
file_date="${file_date%%.*}"

if [ "$file_date" -lt "$given_date" ];
then 
rm "$file"
fi
done

echo "Deletion complete"
else

echo "Unknown mode"
exit 1
fi
