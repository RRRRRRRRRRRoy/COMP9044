#!/bin/dash

filelist=$@

# check .girt directory is exist or not
if [ ! -d .girt/ ]
then
    echo "girt-add: error" 
    exit 1;
fi

# check the validation of the file name
for file in $filelist
do
    match_regex=$(echo "$file" | egrep "^[0-9a-zA-Z][0-9a-zA-Z\.\-]+*$")
    if [ "" == "$match_regex" ]
    then
        echo "shrug-add: error:"
        exit 1;
    fi
done

# check the files are located in the directory
for file in $filelist
do
done

# copy the file to the branch
# this is the girt-add operation
for file in $filelist
do
done