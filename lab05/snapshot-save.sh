#!/bin/dash

counter=0;
directoryname=".snapshot.$counter"

# check the current directory is exist or not
while [ -e $directoryname ]
do
    counter=$(($counter+1))
    directoryname=".snapshot.$counter"
done

# create the dir if the current directory is not exist
mkdir $directoryname;


for file in *
do  
    # avoiding copy the same current file
	if [ "$file" != "snapshot-save.sh" ] 
    then 
        # avoiding copy the same current file
        if [ "$file" != "snapshot-load.sh" ]
	    then
            # avoiding copy the same current file
            if [ "$file" != "backup.sh" ]
	        then
                # avoiding copy the same current file
                if [ "$file" != "backup.pl" ]
	            then
			        cp $file $directoryname
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

echo "Creating snapshot $counter"