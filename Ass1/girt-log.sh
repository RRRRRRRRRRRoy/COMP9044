#!/bin/dash

# checking the .girt is exist or not
# copy girt-commit.sh checking the .girt
if [ -d .girt/ ]
then
    :
else
    # Do not forget to change to girt-log
    echo "girt-log: error: no .girt directory containing girt repository exists"
    exit 1
fi

#check .girt/log exists
current_branch=`cat .girt/now_branch`


if [ ! -e  .girt/branch/$current_branch/log ]
then
    echo "girt-log: error: your repository does not have any commits yet"
    exit 1
fi