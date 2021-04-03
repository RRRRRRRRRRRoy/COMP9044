#!/bin/dash

# Chec the current .girt directory is exist or not
if [ -d .girt/ ]
then
    :
else 
    echo "girt-commit: error: no .girt directory containing girt repository exists"
    exit 1
fi

current_branch=`cat .girt/current_branch`


if [ -d ".girt/branch/$current_branch/index" ]
then
    :
else
    echo "nothing added to commit"
    exit 1
fi

# check whether there are change
# if no changes, no need to commit
changes_counter=0
# notice here to use ls -c to check the last time of modification 
changes_list=$(ls -c .girt/repository|wc -l)
changes_number=$(echo $changes_list | sed 's/ //g')
if changes_number -ne 0
then

else
    changes_counter=1;

