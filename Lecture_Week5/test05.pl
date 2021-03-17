#!/usr/bin/perl -w

while(1){
    print "Enter the index: ";
    $n = <STDIN>;
    if  (!$n){
        last;
    }
    
    chomp $n;
    $a[$n] = 42;
    print "Array element $n now contains $a[$n]\n";
    print "\n";
    $size = $#a+1;
    print "Array size is now $size\n";
    print "\n";
}