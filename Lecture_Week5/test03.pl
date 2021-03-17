#!/usr/bin/perl -w

@test = (1..100);

foreach $item (@test){
    $sum += $item;
}

print "$sum\n";