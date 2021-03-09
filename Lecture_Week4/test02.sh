#!/bin/sh


repeat_message(){
    n=$1
    message=$2
    for i in $(seq 1 $n)
    do
        echo "$i: $message"
    done
}
i=0
while test $i -lt 4
do
    repeat_message 5 "Hello Roy"
    i=$((i + 1))
done 