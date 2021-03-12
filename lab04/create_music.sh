#!/bin/dash
initial_path=$(pwd)
initial_path=$(echo "$sample_path/$1")

# How to check the dir exist or not
# Source: https://www.cyberciti.biz/faq/howto-check-if-a-directory-exists-in-a-bash-shellscript/
if [ ! -d "$2" ]
then 
    mkdir "$2"
fi