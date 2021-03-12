for folder in "$@"
do  
    # How to use find and the meaning of type f
    # Source: https://explainshell.com/explain?cmd=find+folder+-type+f
    find "$folder" -type f | while read current_music
    do
    done
done