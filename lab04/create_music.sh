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
        if [[$counter -le 0]]
        then
            new_album=$(echo "$line" | grep -e '.*style.*Triple.J.Hottest.100,.[0-9]{4}\|[0-9]{4}' |egrep -o 'Triple.J.Hottest.100,.[0-9]{4}')
            # How to check null
            # Source: https://stackoverflow.com/questions/20075811/what-does-the-operator-mean-in-a-shell-script
            # You can also write 
            # if ! test "$new_album" != ""
            if ["$new_album" != ""]
            then
                # reset the counter and make directory
                counter=1
                mkdir "$new_album"
                cd "$new_album"
            fi
        else
            song=$(echo "$line" | grep -e "^#.*")
            if ["$song" != ""]
            then
                music_artist=$(echo "$line" | sed -r -e 's/\xE2\x80\x93.*?$//'| sed -r -e 's/\[\[[^]]*?\|([^]]*?)]]/\1/g'|sed -r -e 's/]//g'| sed -r -e 's/\[//g'| sed -r -e "s/^#//" | sed -r -e 's/^.*//'| sed -r -e 's/.*$//')
                music_name=$(echo "$line" | sed -r -e 's/^.*?\xE2\x80\x93//'| sed -r -e 's/\[\[[^]]*?\|([^]]*?)]]/\1/g'|sed -r -e 's/]//g'|sed -r -e 's/\[//g'|sed -r -e 's#/#-#g'|sed -r -e 's/"//g'|sed -r -e 's/^.*//'|sed -r -e 's/.*$//')
                new_music_file="$counter - $music_name - $music_artist.mp3"
                counter=$(($counter + 1))
                cp "../../$1" "$new_music_file"
            fi
            if [["$counter" -eq 11]]
            then
                counter=0
                cd ..
            fi
        fi
    done
fi