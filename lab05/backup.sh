#!/bin/dash

filename="$1"
counter=0
# get the file name
filename_cut=$(echo $filename | sed "s/.txt//g")
# arrange the backup name
filename_copy=".$filename_cut.txt.$counter"
contain=$(ls $filename_copy 2>/dev/null)
while [ "$contain" != "" ]
do
    # counter adding 1
    counter=$(($counter+1))
    # adding number to the backup
    filename_copy=".$filename_cut.txt.$counter"
    # avoiding /dev/null
    contain=$(ls $filename_copy 2>/dev/null)
done 

# copy files
cp $filename $filename_copy
echo "Backup of '$filename' saved as '$filename_copy'"

