#!/bin/dash

max=0
max_name=""

# setting counter to doing the compare
for file in "$@"
do
    number=$(awk '{print NR}' $file|tail -n1)
    # This is the test point
    # echo "current_number_line: $number"
    name="$file"
    # This is the test point
    # echo "current_file_name: $name"
    if [ $max -lt $number ]
    then
        max=$number
        max_name=$name
    fi
    # This is the test point
    # echo "Max: $max"
    # echo "Max_name: $max_name"
done

echo "$max_name"

