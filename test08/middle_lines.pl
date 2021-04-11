#!/usr/bin/perl -w

$input_file=$ARGV[0];

# createing a line list
@lines_list=();

# Copy from question1 in test6 do not forget to change the arrow
# Source: https://perldoc.perl.org/functions/open
open ($filestream,'<',$input_file) or die $!;

foreach $line($filestream){
    # chomp is to delete the empty line
    chomp $line;
    push @lines_list,$line;
}

$length_of_file=@lines_list;
$number_of_lines=$length_of_file;