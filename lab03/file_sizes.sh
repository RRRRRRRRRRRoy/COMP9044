#!/bin/sh

# COMP9041 Lab02 Exercise3 : File Sizes

# Creating arrays for 3 kinds of files
# Array operation in Shell
# Source: https://stackoverflow.com/questions/1878882/arrays-in-unix-shell
small_size=()
medium_size=()
large_size=()

# checking all these lines in the dir
file_number=$(ls -l | wc -l)
file_number=$(expr $file_number - 1)
file_counter=0 

wc -l $(ls *) | while read line
do
        file_lines=$(echo $line | cut -d' ' -f1)
        file_name=$(echo $line | cut -d' ' -f2)

        if test $file_lines -lt 10 
        then
            # before start len is 0 so we can store data in the 1st place
            # Then move to the second place which index is current len is 1
            # In this way this array can be Scalable
            # Details in looping an array
            # Source: https://stackoverflow.com/questions/8545943/shell-script-arrays
            index_small=${#small_size[*]}
            small_size[$index_small]=$file_name
        elif test $file_lines -ge 10 && test $file_lines -lt 100 
        then 
            # size is used to do the if-condition
            # name is the output --> name store to the array
            index_medium=${#medium_size[*]}
            medium_size[$index_medium]=$file_name
        elif test $file_lines -ge100 && test $file_lines -lt 1000
        then 
            index_large=${#large_size[*]}
            large_size[$index_large]=$file_name
        fi

        # Counter move to next file
        file_counter=$(($file_counter + 1))

        # checking whether go through all the current files in dir
        if test $file_counter -ge $file_number
        then 
            echo "Small files: ${small_size[*]}"
            echo "Medium-sized files: ${medium_size[*]}"
            echo "Large files: ${large_size[*]}" 
            exit 1
        fi
done


