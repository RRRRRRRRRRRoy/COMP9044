#!/bin/sh

for file in *
do
    if test '$file' =~ '^.*jpg$'
    then
        convert_file=$(echo $file|sed 's/jpg$/png/')
        if test -e "$new_file"