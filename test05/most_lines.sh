#!/bin/dash

max=0
max_name=""

for file in "$@"
do
    current_number_line=$(awk '{print NR}' $file|tail -n1)
    current_file_name="$file"
    if [ $max -lt $current_number_line ]
    then
        max=$current_number_line
        max_name=$curremt_file_name
    fi
done

echo "$current_file_name"

