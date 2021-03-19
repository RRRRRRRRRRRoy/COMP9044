#!/bin/dash

filename="$1"
counter=0
# get the file name
filename_cut=$(echo $filename | sed "s/.txt//g")
filename_copy=".$filename_cut.txt.$counter"
contain=$(ls $filename_copy 2>/dev/null)
while [ "$contain" != "" ]
do

    counter=$(($counter+1))
    filename_copy=".$filename_cut.txt.$counter"
    contain=$(ls $filename_copy 2>/dev/null)

done 

# copy files
cp $filename $filename_copy
echo "Backup of '$filename' saved as '$filename_copy'"

