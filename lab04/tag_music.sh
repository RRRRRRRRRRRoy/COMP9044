#!/bin/sh

for folder in "$@"
do  
    cd "$folder"
    # How to use find and the meaning of type f
    # Source: https://explainshell.com/explain?cmd=find+folder+-type+f
    for music in *
    do
        track=$(echo "$music" | cut -d' ' -f1)
        title=$(echo "$music" | sed -r 's/^..*?-.(.*?).-.*?$/\1/')
        artist=$(echo "$music" | sed 's/^.*-.//;s/\.mp3//')
        
    done
done