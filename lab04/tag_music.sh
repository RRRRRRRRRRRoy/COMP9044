for folder in "$@"
do  
    # How to use find and the meaning of type f
    # Source: https://explainshell.com/explain?cmd=find+folder+-type+f
    find "$folder" -type f | while read current_music
    do
        music_title=$(id3 -l "current_music"|head 1|sed "s/.-./ /g"| cut -d" " -f2,2)
        music_track=$(id3 -l "current_music"|head 1|sed "s/.-./ /g"| cut -d" " -f1,1|cut -d'/' -f3,3)
    done
done