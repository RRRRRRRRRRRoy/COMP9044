 #!/bin/dash

 counter=0;
 directoryname=".snapshot.$counter"

 while [-e $directoryname]