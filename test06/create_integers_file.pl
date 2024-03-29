#!/usr/bin/perl -w

# check the inputs are numbers
if($#ARGV != 2){
    exit 0;
}

# start number
$start_number = $ARGV[0];
# end number
$end_number = $ARGV[1];
# name
$name = $ARGV[2];

if($start_number <= $end_number ){
    # file stream in the previous lab and test
    # Source: https://perldoc.perl.org/functions/open
    open ($filestream,'>',$name) or die $!;
    while($start_number <= $end_number){
	    print $filestream "$start_number\n";
        $start_number=$start_number+1;
    }
    # Do not forget the close the file stream
    close("$filestream");
}