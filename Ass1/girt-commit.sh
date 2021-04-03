#!/bin/dash

# Chec the current .girt directory is exist or not
if [ ! -d .girt/ ]
then
    echo "girt-commit: error: no .girt directory containing girt repository exists"
    exit 1
else 
    :
fi

current_branch=`cat .girt/current_branch`



if [ -d ".girt/branch/$current_branch/index" ]
then
    :
else
    echo "nothing added to commit"
    exit 1
fi