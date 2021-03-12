#!/bin/sh

for folder in "$@"
do  
    # How to use find and the meaning of type f
    # Source: https://explainshell.com/explain?cmd=find+folder+-type+f
    find "$folder" -type f | while read current_music
    do
        music_title=$(id3 -l "current_music"|head 1|sed "s/.-./ /g"| cut -d" " -f2,2)
        music_track=$(id3 -l "current_music"|head 1|sed "s/.-./ /g"| cut -d" " -f1,1|cut -d'/' -f3,3)
        music_artist=$(id3 -l "current_music"|head 1|sed "s/.-./ /g"| cut -d" " -f3,3 | sed 's/.mp3:$//g')
        music_albym=$(id3 -l "current_music"|head 1|sed "s/.-./ /g"|cut -d" " -f1,1|cut -d'/' -f2,2)
        year=$(echo $album | cut -d',' -f2,2 | sed 's/ //g')

        command1=`id3 -t "$music_title" "$current_music"`
        command2=`id3 -T "$music_track" "$current_music"`
        command3=`id3 -a "$music_artist" "$current_music"`
        command4=`id3 -A "$music_albym" "$current_music"`
        command5=`id3 -y "$year" "$current_music"`
    done
done