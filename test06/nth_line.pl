#!/usr/bin/perl -w
$name = $ARGV[1];
$nth_number = $ARGV[0];
# Copy from question1 in test6 do not forget to change the arrow
open $filestream,'<',$name or die $!;

# using the array to read the data 
@numbers = <$filestream>;

$length_array=$#numbers+1;
# check the range of the data
if($nth_number <= $length_array){
    $nindex = $nth_number-1;
    print $numbers[$nindex];
}

# clost the filestream
close($filestream);