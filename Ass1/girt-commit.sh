#!/usr/bin/env dash

if [ -d .girt/ ]
then
    :
else
    echo "girt-commit: error: no .girt directory containing girt repository exists"
    exit 1
fi

current_branch=$(cat .girt/current_branch)


if [ -d ".girt/branch/$current_branch/index" ]
then
    :
else
    echo "nothing added to commit but untracked files present"
    exit 1
fi

changes_counter=0;
change_number=$(ls -c .girt/repository|wc -l|sed 's/ //g')
if [ $change_number -ne 0 ]
then
    changes_counter=1
else

fi