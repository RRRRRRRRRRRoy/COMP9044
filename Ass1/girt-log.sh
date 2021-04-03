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

# check .girt/log exists
current_branch=`cat .girt/current_branch`


# This is to check the current log file is exist or not
if [ -e  .girt/branch/$current_branch/log ]
then
    # if exists continue
    :
else
    # if not exist ----> no commit there is not log file
    echo "girt-log: error: your repository does not have any commits yet"
    exit 1
fi

# The sequence of print is from the latest commit to the earler commit
