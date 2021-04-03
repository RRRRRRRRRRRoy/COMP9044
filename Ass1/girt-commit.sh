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
    exit 1;
fi

number_input=$#
changes_counter=0
change_number=$(ls -c .girt/repository|wc -l|sed 's/ //g')
if [ $change_number -ne 0 ]
then
    modified_sorted_branch=$()
    latest_branch=$(ls .girt/branch/$current_branch/repository|sort |tail -n 1)

    index_file_c=$(ls .girt/branch/$current_branch/index/ |wc -l)

    repository_branch_change=$(ls .girt/branch/$current_branch/repository/$latest_branch|wc -l)
    if [ "$index_file_c" -eq "$repository_branch_change" ]
    then
        if [ $index_file_c -eq 0 ]
        then
            if [ $repository_branch_change -eq 0 ]
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
            filename=$(echo $file|cut -d'/' -f5);
            contain=$(ls .girt/branch/$current_branch/repository/$latest_branch/$filename 2>/dev/null)
            if [ "$contain" = "" ]
            then
                changes_counter=1
                break
            else
                dif_now_repo=$(diff $file .girt/branch/$current_branch/repository/$latest_branch/$filename|wc -w)
                if [ $dif_now_repo -gt 0 ]
                then
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
    echo "nothing to commit"
    exit 1
fi

mkdir ".girt/repository/$change_number"
mkdir ".girt/branch/$current_branch/repository/$change_number"

has_file=$(ls .girt/branch/$current_branch/index|wc -l|sed 's/ //g')

current_branch_source=".girt/branch/$current_branch/index/*"
repository_destination=".girt/repository/$change_number/"
current_branch_destination=".girt/branch/$current_branch/repository/$change_number/"
if [ $has_file -le 0 ]
then
    :
else
    cp $current_branch_source  $repository_destination 
    cp $current_branch_source  $current_branch_destination 
fi
echo "Committed as commit $change_number"

if [ $number_input -eq 4 ]
then
    message=$3
else
    message=$2
fi

if [ -e ".girt/branch/$current_branch/log" ]
then
    :
else
    touch .girt/branch/$current_branch/log
fi
echo "$change_number $mess" >> .girt/branch/$current_branch/log
