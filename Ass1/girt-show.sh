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
print_content_regex=$1;
# using the grep to check whether it is in the good format
match=$(echo $print_content_regex|grep -e '^[0-9]*:.+')
if test "$match" != ""
then
    # matched not empty
    :
else
    # matched is empty 
    echo "girt-show: error: invalid object $print_content_regex"
    exit 1
fi


