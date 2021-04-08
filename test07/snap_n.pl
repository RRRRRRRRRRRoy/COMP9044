#!/usr/bin/perl -w

# getting the filename from the input
$input_string=$ARGV[0];

# Setting the counter to counter the appearance
$counter=0;

%strings=();
# setting filestream to read file from the filename
# Source: http://perltraining.com.au/tips/2005-11-17.html
# open (my $stdin,'<',"@ARGV") or die "$!";

foreach $string(<STDIN>){
    $strings{$string} ++;
    if($input_string eq $strings{$string}){
        # current appearance is 1
        if($counter != 0){
		    next;
        }else{
            $output = $string;
            $counter = 1;
        }
    }
}

if(! $output){
	next;
}else{
    print "Snap: $output";
}