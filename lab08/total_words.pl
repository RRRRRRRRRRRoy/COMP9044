#!/usr/bin/perl -w


# getting the filename from the input
$filename=$ARGV[0];

# # setting counter
$sum=0;

# # setting filestream to read file from the filename
# # Source: http://perltraining.com.au/tips/2005-11-17.html
open (my $stdin,'<',"$filename") or die "$!";

foreach $line(<$stdin>){
    $regrex = '[a-zA-Z]+';
    @words = $line =~ /$regrex/g;
    # Store the data in to a list using scalar counting the list
    # Source: https://www.tutorialspoint.com/perl/perl_scalar.htm
    $sum += scalar @words;
}


print "$sum\n";

