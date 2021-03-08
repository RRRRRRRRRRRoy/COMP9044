#!/bin/sh

# COMP9041 Lab02 Exercise3 : File Sizes

# Creating arrays for 3 kinds of files
small=()
medium=()
large=()

# checking all these lines in the dir
file_number=$(ls -l | wc -l)
file_number=$(expr $file_number - 1)
file_counter=0 

wc -l $(ls *) | while read line
do
        size=$(echo $line | cut -d' ' -f1)
        file_name=$(echo $line | cut -d' ' -f2)

        if test $size -lt 10 
        then
            :
        elif test $size -ge 10 && test $size -lt 100 
        then 
            :
        elif test $size -lt 1000
        then 
            :
        fi

        # checking whether go through all the current files in dir
        file_counter=$(($file_counter + 1))

        if test $file_counter -ge $file_number
        then 
            echo "Small files: "
            echo "Medium-sized files: "
            echo "Large files: " 
            exit 1
        fi
done


