#!/bin/sh

# COMP9041 Lab02 Exercise3 : File Sizes

# Creating arrays for 3 kinds of files
small_size=()
medium_size=()
large_size=()

# checking all these lines in the dir
file_number=$(ls -l | wc -l)
file_number=$(expr $file_number - 1)
file_counter=0 

wc -l $(ls *) | while read line
do
        size=$(echo $line | cut -d' ' -f1)
        file_name=$(echo $line | cut -d' ' -f2)

        # Array operation in Shell
        # Source: https://stackoverflow.com/questions/1878882/arrays-in-unix-shell
        if test $size -lt 10 
        then
            # before start len is 0 so we can store data in the 1st place
            # Then move to the second place which index is current len is 1
            # In this way this array can be Scalable
            index_s=${#small[*]}
            small_size[$index_s]=$file_name
        elif test $size -ge 10 && test $size -lt 100 
        then 
            index_m=${#medium[*]}
            medium_size[$index_m]=$file_name
        elif test $size -lt 1000
        then 
            index_l=${#large[*]}
            large_size[$index_l]=$file_name
        fi

        # Counter move to next place
        file_counter=$(($file_counter + 1))

        # checking whether go through all the current files in dir
        if test $file_counter -ge $file_number
        then 
            echo "Small files: ${small[*]}"
            echo "Medium-sized files: ${small[*]}"
            echo "Large files: ${small[*]}" 
            exit 1
        fi
done


