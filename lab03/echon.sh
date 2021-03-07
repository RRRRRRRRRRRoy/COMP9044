#!/bin/sh

# Check the number of input 
# <number of lines> <string> number is 2
if test $# -le 0
then
    echo "Usage: ./echon.sh <number of lines> <string>" 1>&2
    exit 1
elif test $# -gt 2
then
    echo "Usage: ./echon.sh <number of lines> <string>" 1>&2
    exit 1
fi

num=$1
str=$2
# Use bc can check whether the input is a string or not
# number use bc is still itself but string use bc is 0
# Source: https://stackoverflow.com/questions/31034540/correct-usage-of-bc-in-a-shell-script
if test $(echo $num | bc) != $num  # if test "..." != "..."
then 
    echo "./echon.sh: argument 1 must be a non-negative integer" 1>&2
    exit 1
# check the number which is negative
elif test $num -lt 0 
then 
    echo "./echon.sh: argument 1 must be a non-negative integer" 1>&2
    exit 1
fi


# using a counter to check the time of print
counter=0
while test $counter -lt $num 
do
    echo $str
    counter=$(($counter + 1))
done
