#!/bin/sh
# Notice! The directory change dir ---> cd

for folder in "$@"
do  
    current_dir=$(pwd)
    cd "$folder"
    # How to use find and the meaning of type f
    # Source: https://explainshell.com/explain?cmd=find+folder+-type+f
    for music in *
    do
        get_current_music_path=$(pwd)
        music_track=$(echo "$music" | cut -d' ' -f1,1)
        music_title=$(echo "$music" | sed -r 's/^.+?- (.+?) -.+?$/\1/')
        music_artist=$(echo "$music" | sed 's/^.+- //;s/\.mp3//')
        music_album=$(echo "$get_current_music_path" | sed 's/^.+\///')
        music_year=$(echo "$music_album" | cut -d',' -f2 | sed 's/^ //')
        music_comment=""

        id3 -t "$music_title" "$music" >/dev/null
        id3 -a "$music_artist" "$music" >/dev/null
        id3 -T "$music_track" "$music" >/dev/null
        id3 -A "$music_album" "$music" >/dev/null
        id3 -y "$music_year" "$music" >/dev/null
        id3 -c "$music_comment" "$music" 
    done
    # After finished this folder back to the root and continue
    cd $current_dir
done