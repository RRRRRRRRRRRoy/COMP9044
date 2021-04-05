#!/bin/dash

max=0
max_name=""

for file in "$@"
do
    number=$(awk '{print NR}' $file|tail -n1)
    # echo "current_number_line: $number"
    name="$file"
    # echo "current_file_name: $name"
    if [ $max -lt $number ]
    then
        max=$number
        max_name=$name
    fi
    # echo "Max: $max"
    # echo "Max_name: $max_name"
done

echo "$max_name"

