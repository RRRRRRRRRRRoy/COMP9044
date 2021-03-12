#!/bin/sh

# Exercise 1 in lab04: Convert jpg to png

# Getting the picture in the current list and read it
ls *.jpg | while read jpg_picture
do
    # change get the new name of image 
    # This is to check the new image is exist or not
    new_image=$(echo "$jpg_picture"|sed 's/.jpg/.png/g')
    # test -f check the current file exist or not
    if test -f "$new_image"
    then
        # 1>&2 will redirect the file descriptor 1 to STDERR
        # Source: https://unix.stackexchange.com/questions/42728/what-does-31-12-23-do-in-a-script
        echo "$new_image already exists" 1>&2
        exit 1
    else
        
        # The meaning of convert
        # Source: https://explainshell.com/explain?cmd=convert
        # Do not forget not printing the warning by using 2>/dev/null
        # Source: https://stackoverflow.com/questions/33388349/graphicsmagick-error-gm-convert-profile-matches-srgb-but-writing-iccp-instead
        convert "$jpg_picture" "$new_image" 2>/dev/null
        # How to remove file(recursive and force)?
        # Source: https://explainshell.com/explain?cmd=rm+-rf 
        rm -r --force "$jpg_file"
    fi
done