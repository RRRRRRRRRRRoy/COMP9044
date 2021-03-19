#!/bin/dash


counter_bp=$1;

sh ./snapshot-save.sh

echo "Restoring snapshot $counter_bp"

for file in *
do  
    # avoiding copy the same current file
	if [ "$file" != "snapshot-save.sh" ] 
    then 
        # avoiding copy the same current file
        if [ "$file" != "snapshot-load.sh" ]
	    then
            if [ "$file" != "backup.sh" ]
            then
                if [ "$file" != "backup.pl" ]
                then
                    if [ "$file" != "snapshot.pl" ]
                    then
			            rm $file
                    else
                        # pass
                        :
                    fi
                else
                    # pass
                    :
                fi
            else
                # pass
                :
            fi
	    else
            # pass
            :
        fi
    else
        # pass
        :
    fi
done

back_dir=".snapshot.$counter_bp"
for backup_file in $back_dir/*
do
	cp $backup_file . 
done