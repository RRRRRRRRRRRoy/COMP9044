#!/bin/dash

number=$1
name=$2

# echo "$number"

# echo "$name"

if test "$number" -le 0
then
    # echo "0error"
    exit 1
fi

# if test -f "hello*".txt
# then 
#     echo "not exist"
#     exit 1
# fi 


while test "$number" -gt 0 
do
    filename="hello${number}" 
    # echo $filename.txt
    echo "hello $name" > "$filename".txt
    number=$(($number - 1))
done