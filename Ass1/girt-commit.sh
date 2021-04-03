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
    # sorting and getting latest braches
    branch_list=$(ls .girt/branch/$current_branch/repository|sort)
    latest_modify_branch=$(echo $branch_list|tail -n 1)
    #need to check if index and latest repo contain same number of files.
    file_index_number=$(ls .girt/branch/$current_branch/index/|wc -l)
    #repo_file_c=`ls .girt/repo/$latest|wc -l`;
    repository_branch_number=$(ls .girt/branch/$current_branch/repository/$latest_modify_branch|wc -l)
    if [ "$file_index_number" -eq "$repository_branch_number" ]
    then
        :
    else
        changes_counter=1
    fi
else
    changes_counter=1;

