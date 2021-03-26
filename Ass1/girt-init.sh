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

# create the master branch as git
mkdir .girt/repository
mkdir .girt/branch
mkdir .girt/branch/master

# This is the same from the instruction
echo "Initialized empty girt repository in .girt";
