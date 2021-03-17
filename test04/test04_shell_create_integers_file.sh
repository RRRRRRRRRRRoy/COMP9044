#!/bin/sh
# check the input number
if [ "$#" -eq 3 ]
then
    :
else
then
    exit 1;
fi

if [ $1 -le $2 ]
then
    :
else
then
    exit 1;
fi

start_number=$1; 
end_number=$2;

output_file_name=$3;