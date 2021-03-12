#!/bin/dash

# How to check the dir exist or not
# Source: https://www.cyberciti.biz/faq/howto-check-if-a-directory-exists-in-a-bash-shellscript/
counter=0
# check the input number
# If true Continue
if [ "$#" -eq 2 ]
then
    # check the current is not exist
    if [ ! -d "$2" ]
    then 
        # current dir x exist ---> create a new dir 
        mkdir "$2"
    else
        # exist continue
        :
    fi
    cd "$2"
    # How to use wget
    # Source: https://linuxconfig.org/wget-file-download-on-linux
    wget -q -O- 'https://en.wikipedia.org/wiki/Triple_J_Hottest_100?action=raw' | while read line
    do
    done
else
    : >/dev/null
fi