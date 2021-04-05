#!/usr/bin/perl -w

# getting the filename from the input
$filename=$ARGV[0];

# setting counter
$sum=0;

# setting filestream to read file from the filename
# Source: http://perltraining.com.au/tips/2005-11-17.html
open (my $stdin,'<',"$filename") or die "$!";

# list to store the data of input stream
@whale_list=();
while($line = <$stdin>){
    # push operation of array
    # Source: https://www.geeksforgeeks.org/perl-push-function/
    push @whale_list, $line;
}

foreach $line (@whale_list){
    # checking the reading of record
    # print($record);
    # Source: https://perldoc.perl.org/functions/substr
    $line_name=substr($line,12);
    # check the recode name
    # print($record_name);
    # String matching
    # Source: https://www.tutorialspoint.com/perl/perl_regular_expressions.htm
    if ($line_name =~ "Orca"){
        # Split in perl
        # Source: https://perldoc.perl.org/functions/split
        @info = split / +/, $line;
        # This is for local test
        # print "$info[0] $info[1] $info[2]\n";
        $sum= $sum + $info[1];
    }
}

print "$sum Orcas reported in $filename\n";