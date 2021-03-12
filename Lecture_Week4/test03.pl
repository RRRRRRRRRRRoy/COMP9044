#!/usr/bin/perl -w

print "Enter x: ";
$x = <STDIN>;
chomp $x;
print "Enter y: ";
$y = <STDIN>;
chomp $y;
$pythagoras = sqrt $x * $x + $y * $y;
print "The square root of $x squared + $y squared is $pythagoras\n"