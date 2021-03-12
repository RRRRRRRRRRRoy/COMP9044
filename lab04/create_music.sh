#!/bin/dash
initial_path=$(pwd)
initial_path=$(echo "$sample_path/$1")

# How to check the dir exist or not
# Source: https://www.cyberciti.biz/faq/howto-check-if-a-directory-exists-in-a-bash-shellscript/
counter=0
flag=0
if [ "$#" -eq 2 ]
then
    if [ ! -d "$2" ]
    then 
        mkdir "$2"
    else
        #echo "exist!"
        :
    fi
    cd "$2"
    # How to use wget
    # Source: https://linuxconfig.org/wget-file-download-on-linux
    wget -q -O- 'https://en.wikipedia.org/wiki/Triple_J_Hottest_100?action=raw' | while read line
    do
        if [$counter -le 0]
        then
            new_album=$(echo "$line" | grep -e '.*style.*Triple.J.Hottest.100,.[0-9]{4}\|[0-9]{4}' |egrep -o 'Triple.J.Hottest.100,.[0-9]{4}')
            if ["$new_album" != ""]
            then
                counter=1
                mkdir "$new_album"
                cd "$new_album"
            fi
        else

        fi
    done
fi