#!/usr/bin/perl -w
$name = $ARGV[1];
$nth_number = $ARGV[0];
open $filestream,'<',$name or die $!;

# using the array to read the data 
@numbers = <$filestream>;

# check the range of the data
if($nth_number <= $#numbers+1){
    print $numbers[$nth_number-1];
}



# clost the filestream
close($filestream);