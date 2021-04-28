#!/usr/bin/perl -w

# creating the line list to store the line data
@line_list=();

foreach $line(<STDIN>){
    # Removing the new line symbol
    # Source: https://www.geeksforgeeks.org/perl-chomp-function/
    chomp($line);
    # Store the data in an array
    push @line_list,$line;
}

foreach $line(@line_list){
    if($line !~ /^.*\#(\d*).*$/){
        next;
    }

}