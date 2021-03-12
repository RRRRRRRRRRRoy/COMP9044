#!/bin/sh

# exercise 3 date image in lab04

# for image in "$@"
# do
#     get_dir_info=$(ls -l "$image"|tr -s " ")
#     get_time_stamp=$(echo "$get_dir_info"|cut -d" " -f6-8)

#     lastmodify=`stat "$img" | egrep "Modify" | sed "s/Modify: //g"| sed "s/[0-9]* [a-zA-Z]*/[a-zA-Z]* [0-9]*/"`
#     convert -gravity south -pointsize 36 -draw "text 0,10 "$get_time_stamp"" "$image" "$image"
# done

for img in "$@"
do
    # using awk to re-arrange the sequence of the time stamp
    text=$(ls -l "$img" | tr -s ' ' | cut -d' ' -f6-8|awk '{print $2,$1,$3}')
    
    convert -gravity south -pointsize 36 -draw "text 0,10 '$text'" "$img" "$img"
    
done