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
end_number=$2
output_file_name=$3

# create the file
touch $output_file_name

while(test "$end_number" -gt "$start_number")
do
    echo "$start_number" >> $output_file_name
    start=$(($start_number + 1));
done