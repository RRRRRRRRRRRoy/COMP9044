#!/usr/bin/perl -w

foreach $line(<STDIN>){
    # Removing the new line symbol
    # Source: https://www.geeksforgeeks.org/perl-chomp-function/
    chomp $line;
    # The first situation x.[0-4]x
    # less than 4 --> omit
    $regrex_smaller_than4 = "((\\d*)\.[0-4]\\d*)";
    while($line =~ /$regrex_smaller_than4/){
        # Getting the first matching line
        $current_number = $1;
        # Getting the second matching line
        $round_number = $2;
        $line =~ s/$current_number/$round_number/;
        }
    # The situation which is greater than 4
    $regrex_larger_than5 = "((\\d*)\.[5-9]\\d*)"
    while($line =~ /$regrex_larger_than5/){
        # Getting the first matching line
        $current_number = $1;
        # Getting the second matching line
        $round_number = $2;
        # Notice Here adding 1
        $round_number += 1;
        $line =~ s/$current_number/$round_number/;
        }
    
    print "$line\n";
    }