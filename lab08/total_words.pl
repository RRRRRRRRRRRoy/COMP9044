#!/usr/bin/perl -w

$counter = 0;

# getting the filename from the input
$filename=$ARGV[1];

# setting filestream to read file from the filename
# Source: http://perltraining.com.au/tips/2005-11-17.html
open (my $stdin,'<',"$filename") or die "$!";

foreach $line(<$stdin>){
    $counter += $line =~ /[a-zA-Z]/g;
}

print "$total\n"