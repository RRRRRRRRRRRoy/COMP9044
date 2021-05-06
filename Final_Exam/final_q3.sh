#!/bin/dash 

for directory in $(ls -d */)
do
    # echo $dir
    # getting the file in the list
    dir_list=$(ls "$directory/")
    # Getting the number of files
    dir_num=$(echo "$dir_list" | wc -l)
    # echo $number
    # Checking the number of the files
    if test $dir_num -ge 2 
    then
       result=$(echo $directory | sed 's/\/$//g')
       echo $result
    fi
done