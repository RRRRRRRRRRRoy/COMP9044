#!/usr/bin/perl -w

$length_input = @ARGV;

# This step is to checking the first value is number
# And the second value is String

if($length_input == 2){
    if ($ARGV[0] =~ /^\d+$/){
        if($ARGV[1] =~ /^[a-zA-Z0-9]*$/){
            # Setting the counter to counter the time of printings
            $counter = 1;
            # Doing the printing operation
            while($counter <= $ARGV[0]){
                print "$ARGV[1]\n";
                $counter++;
            }
        }
    }else{
        # If the input is wrong
        print "./echon.pl: argument 1 must be a non-negative integer";
        exit 1;
    }
}else{
    # If the input is wrong
    print "Usage: ./echon.pl <number of lines> <string>";
    exit 1;
}