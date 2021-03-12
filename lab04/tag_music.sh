#!/bin/dash
# Notice! The directory change dir ---> cd

# STEP1: Selecting the string
# STEP2: Adding the string to the id3 tag

for folder in "$@"
do  
    root_dir=$(pwd)
    cd "$folder"
    # How to use find and the meaning of type f
    # Source: https://explainshell.com/explain?cmd=find+folder+-type+f
    for music in *
    do
        # Use the current path can get the info of album
        # Each tag in id3
        # Source: https://tldp.org/HOWTO/MP3-HOWTO-13.html
        get_current_music_path=$(pwd)
        music_track=$(echo "$music" | cut -d' ' -f1,1)
        id3 -T "$music_track" "$music" >/dev/null

        # Why using >/dev/null
        # Different situations of using >/dev/null
        # Source: https://linuxhint.com/what_is_dev_null/
        music_artist=$(echo "$music" | sed 's/^..*- //'| sed 's/\.mp3//')
        id3 -a "$music_artist" "$music" >/dev/null
        
        # sed -r
        # Source: https://explainshell.com/explain?cmd=sed+-r+
        music_title=$(echo "$music" | sed -r 's/^..*?-.(.+?).-..*?$/\1/')
        id3 -t "$music_title" "$music" >/dev/null

        music_album=$(echo "$get_current_music_path" | sed 's/^..*\///')
        id3 -A "$music_album" "$music" >/dev/null

        music_year=$(echo "$music_album" | cut -d',' -f2,2 | sed 's/^.//')
        id3 -y "$music_year" "$music" >/dev/null
        # music_comment="
        # id3 -c "$music_comment" "$music" 
    done
    # After finished this folder back to the root and continue
    cd $root_dir
done