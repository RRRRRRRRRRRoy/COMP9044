#!/bin/dash

 filename="$1"
 counter=0
 # get the file name
 filename_cut=$(echo $filename | sed "s/.txt//g")
 filename_copy=".$filename_cut.txt.$number"
 contain=$(ls $filename_copy)
 while [ 1 ]
 do
    if []