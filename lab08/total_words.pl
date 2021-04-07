#!/usr/bin/perl -w


# getting the filename from the input
$filename=$ARGV[0];

# # setting counter
# $sum=0;

# # setting filestream to read file from the filename
# # Source: http://perltraining.com.au/tips/2005-11-17.html
open (my $stdin,'<',"$filename") or die "$!";

foreach $line(<$stdin>){
    @words = length($line);
	$sum += scalar @words;
    # print "$sum";
}

print "$sum\n"

