#!/bin/dash
for file in $@
do
    awk 'END{print max(NR) "," FILENAME}' $file | sort -n -k1,1   
done