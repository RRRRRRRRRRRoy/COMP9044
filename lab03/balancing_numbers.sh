#!/bin/sh

while read line
do
    echo $line | tr "[0-4]|[6-9]" '[<<<<<]|[>>>>]'
done