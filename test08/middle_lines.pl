#!/usr/bin/perl -w

$input_file=$ARGV[0];

# createing a line list
@lines_list=();

# Copy from question1 in test6 do not forget to change the arrow
# Source: https://perldoc.perl.org/functions/open
open ($fileinputstream,'<',$input_file) or die $!;

foreach $line($fileinputstream){
    # chomp is to delete the empty line
    # Source: https://perldoc.perl.org/functions/chomp
    chomp $line;
    push @lines_list,$line;
}

# Getting the length of the list
$length_of_file=@lines_list;
$number_of_lines=$length_of_file;
 
# checking odd ----> checking the remainder
$checking_odd=$number_of_lines % 2;
# if the file is not empty
if($number_of_lines > 0){
    # The current line number is odd number
    if($checking_odd == 1){
        $middle_index = $number_of_lines/2
        print "$lines_list[$middle_index]\n";
    }
    # The current line number is even number
    if($checking_odd == 0){
        # middle - 1 content ----> previous content
        $middle_index = $number_of_lines/2
        $previous_content = $lines_list[$middle_index-1];
        # middle content ----> later content
        $later_content = $lines_list[$middle_index];
        print "$previous_content\n";
        print "$later_content\n";
    }
}