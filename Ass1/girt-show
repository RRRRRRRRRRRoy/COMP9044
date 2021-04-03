#!/bin/dash

# checking the .girt is exist or not
# copy girt-commit.sh checking the .girt
if [ ! -d .girt/ ]
then
    # Do not forget to change to girt-show function
    echo "girt-show: error: no .girt directory containing girt repository exists"
    exit 1;
fi

# here is the printing details
print_content_slice=$1
# using the grep to check whether it is in the good format
match=$(echo $print_content_slice|egrep '^[0-9]*:.*$')
if [ "$match" = "" ]
then
    # matched is empty 
    echo "girt-show: error: invalid object $print_content_slice"
    exit 1
fi

#get the number before : and fileaname after :.
printing_number=$(echo $print_content_slice|sed 's/:[a-zA-Z0-9].*$//g')
printing_filename=$(echo $print_content_slice|sed 's/^[0-9]*://g')

# checking the printing number
# echo "$printing_number"
# checking the print filename
# echo "$printing_filename"

# getting the max number of repository
max_number=$(ls -c .girt/repository|wc -l|sed 's/ //g')
# getting the max repository
max_repository_number=$(($max_number - 1))
current_branch=$(cat .girt/current_branch)

if [ "$printing_number" != "" ]
then
    # If the printing number is not empty
    # comparing the max number with the printing number
    if [ $printing_number -le $max_repository_number ]
    then
        # getting the files in the dir and raising the exception
        files_in_directory=$(ls .girt/repository/$printing_number/$printing_filename 2>/dev/null)
        # files_in_directory is empty
        if [ "$files_in_directory" = "" ]
        then
            # empty ----> not include the file
            echo "girt-show: error: '$printing_filename' not found in commit $printing_number"
        else
            # not empty show the files
            cat ".girt/repository/$printing_number/$printing_filename"
        fi
    else
        # printing number is too large ----> error 
        echo "girt-show: error: unknown commit '$printing_number'"
        exit 1
    fi
else
    # If the printing number is empty
    files_in_directory=$(ls .girt/branch/$current_branch/index/$printing_filename 2>/dev/null)
    if [ "$files_in_directory" != "" ]
    then
        cat ".girt/branch/$current_branch/index/$printing_filename";
    else
        echo "girt-show: error: '$printing_filename' not found in index";
    fi
fi