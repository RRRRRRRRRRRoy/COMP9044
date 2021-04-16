#!/usr/bin/perl -w

@input_array = @ARGV;
# HOw to sort the nurmerical array
# Source: https://www.oreilly.com/library/view/perl-cookbook/1565922433/ch04s15.html
@sorted_array = sort {$a <=> $b } @input_array;
# Use scalar to flat the array
# Source: https://www.tutorialspoint.com/perl/perl_scalar.htm
$numbers = scalar @sorted_array;
# median number
$middle_index = $numbers/2;
$median_number = $sorted_array[$middle_index];
print "$median_number\n";