#!/bin/dash

# .girt
# |-- All repository
# |-- branch
#     |-- master branch
#         |-- index
#         |-- repository
#     |-- new branch
# |-- head(the location on branch)
# |-- commit
#     |-- msg
#

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
# U can find the structure of git from the following website
# Source: https://digitalvarys.com/git-basics-and-beginners-guide/
mkdir .girt/repository
# the location of the file on the branch(may not use)
mkdir .girt/head
# comit the staged files
mkdir .girt/commit

# branch
mkdir .girt/branch
mkdir .girt/branch/master
# Therefore, we need to create the index file in the repository
mkdir .girt/branch/master/index
# The repository in the master branch
mkdir .girt/branch/master/repository



# This is the same from the instruction
echo "Initialized empty girt repository in .girt";
