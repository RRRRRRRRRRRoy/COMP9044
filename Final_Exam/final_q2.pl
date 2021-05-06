#!/usr/bin/perl -w

$counter = 0;

while($line = <STDIN>){
    if($line =~ /3711\//){
        $counter += 1;
    }
}
print "$counter\n";
