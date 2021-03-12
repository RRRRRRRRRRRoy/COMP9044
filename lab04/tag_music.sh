#!/bin/sh

for folder in "$@"
do  
    cd "$folder"
    # How to use find and the meaning of type f
    # Source: https://explainshell.com/explain?cmd=find+folder+-type+f
    for music in *
    do
        music_track=$(echo "$music" | cut -d' ' -f1)
        music_title=$(echo "$music" | sed -r 's/^..*?-.(.*?).-.*?$/\1/')
        music_artist=$(echo "$music" | sed 's/^.*-.//;s/\.mp3//')
        music_album=$(echo "$path" | sed 's/^.*\///')
        music_year=$(echo "$album" | cut -d',' -f2,2 | sed 's/^.//')
        #music_comment=""

        id3 -t "$music_title" "$music" 
        id3 -a "$music_artist" "$music" 
        id3 -T "$music_track" "$music" 
        id3 -A "$music_album" "$music" 
        id3 -y "$music_year" "$music" 
        #id3 -c "$music_comment" "$music" 
    done
done