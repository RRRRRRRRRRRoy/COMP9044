#!/bin/sh

for old_filename in "$@"
do
    new_filename=$(echo $sold_filename|tr A-Z a-z)
    # echo "$old_filename" -> $new_filename"
    cp $old_filename $new_filename
done