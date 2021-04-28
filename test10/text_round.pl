#!/usr/bin/perl -w

foreach $line(<STDIN>){
    # Removing the new line symbol
    # Source: https://www.geeksforgeeks.org/perl-chomp-function/
    chomp $line;
    # The first situation x.[0-4]x
    # less than 4 --> omit
    while($line){
        if ($line =~ /((\d*)\.[0-4]\d*)/){
        # Getting the first matching line
        $current_number = $1;
        # Getting the second matching line
        $round_number = $2;
        $line =~ s/$current_number/$round_number/;
        }

    
    print "$line\n";
    }