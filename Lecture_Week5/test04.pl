#!/usr/bin/perl -w

$a[0] = "Hello Roy";

# index
print "$#a\n";
# length = index + 1
print "",$#a+1,"\n";
# get the value
print "$a[$#a]\n";