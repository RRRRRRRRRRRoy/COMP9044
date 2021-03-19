#!/usr/bin/perl -w

$input=$ARGV[0];

$temp = $input;
print "$input\n";
print "$temp =~ s/\"/\\"/g";
print "$temp\n";

# print "print \"$temp\n\";";
