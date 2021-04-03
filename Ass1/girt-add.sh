#!/bin/dash
# 3 April local coding and testing on MacOS

filelist=$@
# check .girt directory is exist or not
if [ ! -d .girt/ ]
then
    echo "girt-add: error: no .girt directory containing girt repository exists" >/dev/stderr
    exit 1;
else
    :
fi

# check the validation of the file name
for file in $filelist
do
    match_regex=$(echo "$file" | grep "^[a-zA-Z0-9][a-zA-Z0-9\.\-\_]*$")
    if [ "$match_regex" = "" ]
    then
        echo "girt-add: error: invalid filename '$file'" > /dev/stderr
        exit 1;
    else
        :
    fi
done

current_branch=$(cat .girt/current_branch)

# check the file is located in the directory
for file in $filelist
do
    current_file_index=$(ls $file 2>/dev/null) 
    current_file_dir=$(ls .girt/branch/$current_branch/index/$file 2>/dev/null)
    if [ "$current_file_dir" = '' ]
    then 
        if [ "$current_file_index" = '' ]
        then
            echo "girt-add: error: can not open '$file'" > /dev/stderr;
            exit 1;
        else
            :
        fi
    else
        :
    fi
done

# copy the file to the branch
# this is the girt-add operation
for file in $filelist
do
    current_file_dir=$(ls $file) 2>/dev/null
    if [ "current_file_dir" = '' ]
    then
        rm ".girt/branch/$current_branch/index/$file";
    else
        cp "$file"  .girt/branch/$current_branch/index/
    fi
done