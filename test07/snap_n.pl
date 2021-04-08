#!/usr/bin/perl -w

# getting the filename from the input
$input_string=$ARGV[0];

# Setting the counter to counter the appearance
$counter=0;
$result="";

# setting filestream to read file from the filename
# Source: http://perltraining.com.au/tips/2005-11-17.html
# open (my $stdin,'<',"@ARGV") or die "$!";

@strings = <STDIN>;
foreach $string(@strings){
    $strings{$string}++;
    # Getting the current string compare with the input string
    $current_string = $strings{$string};
    if($input_string eq $current_string){
        # current appearance is 1 move to 2
        if($counter == 0){
		    $result = $string;
            $counter = 1;
        }
        # current appearance is not 1
        if ($counter != 0){
            next;
        }
    }
}

# check the result is not null
if($result ne ''){
	print "Snap: $result";
}