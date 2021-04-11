#!/usr/bin/perl -w

# Printing the result
@printing_list = ();

# Geting the input ARGV
@input_list = @ARGV;

# Go through the whole input list checking vowel
foreach $element(@input_list){
    $vowel_regrex = '[aeiouAEIOU]';
    # The meaning of gi option
    # Source: https://www.perlmonks.org/?node_id=608925
    # The the vowel for three times
    if($element =~ /$vowel_regrex{3}/gi){
        push @printing_list,$element;
    }
}

print "@printing_list\n";