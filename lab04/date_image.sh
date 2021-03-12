#!/bin/sh

# exercise 3 date image in lab04

for image in "$@"
do
    get_dir_info=$(ls -l "$image"|tr -s " ")
    get_time_stamp=$(echo "$get_dir_info"|cut -d" " -f6-8)

    convert -gravity south -pointsize 36 -draw "text 0,10 "$time"" "$image" "$image"
done