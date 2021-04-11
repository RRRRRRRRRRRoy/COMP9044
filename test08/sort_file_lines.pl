#!/usr/bin/perl -w

# This part of code is from Q1
$input_file=$ARGV[0];

# createing a words list
@words_list=();

# Copy from question1 in test6 do not forget to change the arrow
# Source: https://perldoc.perl.org/functions/open
open ($fileinputstream,'<',$input_file) or die $!;

foreach $line($fileinputstream){
    # chomp is to delete the empty line
    # Source: https://perldoc.perl.org/functions/chomp
    chomp $line;
    push @lines_list,$line;
}