#!/bin/dash

input1=$1
input2=$2
temp1=`echo  "$input1" | tr -cd "[0-9]" `
temp2=`echo  "$input2" | tr -cd "[0-9]" `

temporary=$temp1
while test $temporary -le $temp2
do
    # result=
    echo $(echo $input1 | sed s/$temp1/$temporary/g)
    temporary=$((temporary+1))
done