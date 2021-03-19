 #!/bin/dash

 counter=0;
 directoryname=".snapshot.$counter"

 while [ -e $directoryname ]
 do
    counter=$(($counter+1))
    directoryname=".snapshot.$counter"
 done

 mkdir $dirname;