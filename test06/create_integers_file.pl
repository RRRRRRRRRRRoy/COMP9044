#!/usr/bin/perl -w

# check the inputs are numbers
if($#ARGV != 2){
    exit 1;
}

# check the second is larger than the first open
if($ARGV[0] > $ARGV[1]){
    exit 1; 
}

# start number
$start_number = $ARGV[0];
# end number
$end_number = $ARGV[1];
# name
$name = $ARGV[2];

# file stream
open $filestream,'>',$name or die $!;
while($start_number <= $end_number){
	print $filestream "$start_number\n";
    $start_number=$start_number+1;
}

close("$filestream");