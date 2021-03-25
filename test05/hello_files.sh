#!/bin/dash

number=$ARGV[0]
name=$ARGV[1]

if [ $number -gt 0 ]
then
    :
else
    exit 1


$counter=1
while [ $counter -le $number ]
do
    echo "hello $name" >> "hello$counter".txt
done