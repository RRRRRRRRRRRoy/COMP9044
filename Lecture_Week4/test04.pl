#!/usr/bin/perl -w

print "Plz input numbers while entering strings: ";
$sum = 0;

while($line = <STDIN>){
    $line =~ s/^\s*//;
    $line =~ s/\s*$//;
    if($line !~ /^\d[.\d]*$/){
        # breaks
        last;
    }
    $sum += $line;
}
print "Sum of the numbers is $sum\n";