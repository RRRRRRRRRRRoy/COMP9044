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
    $words_dict{$line} = length($line);
}

# Getting the key
# Source: https://perldoc.perl.org/functions/keys
@words_dict_key = keys %words_dict;

# How to use <=> 
# Source: https://stackoverflow.com/questions/7855815/meaning-of-less-than-equal-greater-than-in-perl
# How to use cmp
# Source: https://www.geeksforgeeks.org/perl-cmp-operator/
@sorted_words_key = sort {$words_dict{$key1} <=> $words_dict{$key2} or $key1 cmp $key2} @words_dict_key;

foreach $line (@sorted_words_key){
	print "$line\n";
}