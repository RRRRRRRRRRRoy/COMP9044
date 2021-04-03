#!/bin/dash
#!/usr/bin/env dash

# checking the .girt is exist or not
# copy girt-commit.sh checking the .girt
if ! test -d .girt/
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
printing_filename=$(echo $print_content_slice|sed 's/^[0-9].*://g')

echo "$printing_number"
echo "$printing_filename"
