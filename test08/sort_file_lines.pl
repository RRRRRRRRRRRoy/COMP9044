#!/usr/bin/perl -w

# This part of code is from Q1
$input_file=$ARGV[0];

# createing a words list
%words_dict=();

# Copy from question1 in test6 do not forget to change the arrow
# Source: https://perldoc.perl.org/functions/open
open ($fileinputstream,'<',$input_file) or die $!;

foreach $line(<$fileinputstream>){
    # chomp is to delete the empty line
    # Source: https://perldoc.perl.org/functions/chomp
    chomp $line;
    # Using the length function can get the length of the strings
    # Source: https://www.geeksforgeeks.org/perl-length-function/
    $line_len = length($line);
    $words_dict{$line} = $line_len;
}

# Getting the key
# Source: https://perldoc.perl.org/functions/keys
@words_dict_key = keys %words_dict;

# How to use <=> checking the differnece of number
# Source: https://stackoverflow.com/questions/7855815/meaning-of-less-than-equal-greater-than-in-perl
# How to use cmp to checking the difference of string
# Source: https://www.geeksforgeeks.org/perl-cmp-operator/
# all to lower-case and doing the comparison
# checking uppercases lowercases and the normal case
@sorted_words_key = sort {$words_dict{$a} <=> $words_dict{$b} or $a cmp $b or lc($a) cmp lc($b) or uc($a) cmp uc($b) } @words_dict_key;


foreach $line_content (@sorted_words_key){
    # checking the content of each line is not null
    if($line_content ne ""){
        	print "$line_content\n";
    }
}


