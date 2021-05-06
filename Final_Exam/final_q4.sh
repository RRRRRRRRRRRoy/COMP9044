#!/bin/dash

input1=$1
input2=$2
# Cutting the number from the string
temp1=`echo  "$input1" | tr -cd "[0-9]" `
temp2=`echo  "$input2" | tr -cd "[0-9]" `

temporary=$temp1
# Looping and printing
while test $temporary -le $temp2
do
    # Printing the final result
    echo $(echo $input1 | sed s/$temp1/$temporary/g)
    temporary=$((temporary+1))
done