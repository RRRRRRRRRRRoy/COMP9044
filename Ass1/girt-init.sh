#!/bin/dash

# create the dir call girt
if [ -d ".girt" ]
then
    echo "girt-init: error: .girt already exist"
	exit 1
else 
    :
fi

# if the directory is not exists
# create the dir called .girt
mkdir ".girt"

echo "Initialized empty girt repository in .girt";
