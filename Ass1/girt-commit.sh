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
    # get the number changes of the index
    file_index_number=$(ls .girt/branch/$current_branch/index/|wc -l)
    # get the number changes of the index
    repository_branch_number=$(ls .girt/branch/$current_branch/repository/$latest_modify_branch|wc -l)
    if [ "$file_index_number" -eq "$repository_branch_number" ]
    then
        if [ $file_index_number -eq 0 ]
        then  
            if [ $repository_branch_number -eq 0]
            then
                echo "nothing to commit"
                exit 1
            else 
                :
            fi
        else
            :
        fi

        for file in .girt/branch/$current_branch/index/*
        do
            filename=$(echo $file | cur -d'/' -f5,5)
            current_file_in_list=$(ls .girt/branch/$current_branch/repository/$latest_modify_branch/$filename 2>/dev/null)
            if [ $current_file_in_list == "" ]
            then 
                changes_counter=1
                break
            else
                difference_in_repository=$(diff $file .girt/branch/$now_branch/repository/$latest_branch/$filename)

                current_diff_file_repository = $($difference_in_repository|wc -w)
                if [ "$current_diff_file_repository" -le 0 ]
                then
                    :
                else
                    changes_counter=1
                    break
                fi
            fi
        done
    else
        changes_counter=1
    fi
else
    changes_counter=1
fi

if [ $changes_counter -ne 0 ]
then
    :
else
    echo "nothing to commit";
    exit 1;
fi

mkdir ".girt/repository/$changes_number";
mkdir ".girt/repository/$current_branch/repository/$changes_number";

has_file=`ls .girt/branch/$current_branch/index|wc -l|sed 's/ //g'`;
if test $has_file -gt 0
then
    index_source="girt/branch/$current_branch/index/*"
    repository_destination=".girt/repository/$changes_number/"
    branch_destination=".girt/branch/$current_branch/repository/$changes_number/"
    cp -r $index_source  $repository_destination;
    cp -r $index_source  $branch_destination ;
fi
echo "Committed as commit $changes_number";