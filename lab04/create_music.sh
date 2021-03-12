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
        # 2kinds situation 
        # 1 counter <=0 --> create new album
        if [ $counter -le 0 ]
        then
            # This is based on the source of WebCSM 
            new_album=$(echo "$line" | egrep '.*style.*Triple.J.Hottest.100,.[0-9]{4}\|[0-9]{4}' |egrep -o 'Triple.J.Hottest.100,.[0-9]{4}')
            # How to check null
            # Source: https://stackoverflow.com/questions/20075811/what-does-the-operator-mean-in-a-shell-script
            # You can also write 
            # if ! test "$new_album" != ""
            if [ "$new_album" = "" ]
            then
                :
            else
                # reset the counter and make directory
                # create the dir moving to create the music file
                counter=1
                mkdir "$new_album"
                cd "$new_album"
            fi
        fi


        # 2 counter >0 --> create music
         if [ $counter -gt 0 ]
        then
            song=$(echo "$line" | egrep "^#.*")
            if [ "$song" = "" ]
            then
                :
            else
                # song is not null 
                # create the song 
                music_artist=$(echo "$line" | sed -r -e 's/\xE2\x80\x93.*?$//'|sed -r -e 's/\[\[[^]]*?\|([^]]*?)]]/\1/g'| sed -r -e 's/]//g'| sed -r -e 's/\[//g' | sed -r -e 's/^#//' | sed -r -e's/^[ ]*//' | sed -r -e 's/[ ]*$//')
                
                music_name=$(echo "$line" | sed -r -e 's/^.*?\xE2\x80\x93//' |sed -r -e 's/\[\[[^]]*?\|([^]]*?)]]/\1/g'| sed -r -e 's/]//g'| sed -r -e 's/\[//g'|sed -r -e 's#/#-#g' |sed -r -e 's/"//g' |sed -r -e 's/^[ ]*//'| sed -r -e 's/[ ]*$//')
            
                new_music_file="$counter - $music_name - $music_artist.mp3"
                counter=$(( $counter + 1 ))
                cp "../../$1" "$new_music_file"
            fi

            if [ "$counter" -eq 11 ]
            then
                counter=0
                cd ..
            else
                :
            fi
        fi

    done
else
    echo "The number of input values of $0 must be 2, plz try again" >/dev/null
fi