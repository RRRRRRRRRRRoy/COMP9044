#!/usr/bin/perl -w


# getting the filename from the input
$filename=$ARGV[1];

# # setting counter
$sum=0;

# # setting filestream to read file from the filename
# # Source: http://perltraining.com.au/tips/2005-11-17.html
open $stdin,'<',$filename or die "$!";

foreach $line(<STDIN>){
    # Using [a-zA-Z] only
    # \w including char number also _
    # Source: https://www.w3schools.com/jsref/jsref_regexp_wordchar.asp
    $regrex = '[a-zA-Z]+';
    @words = $line =~ /$regrex/g;
    # Store the data in to a list using scalar counting the list
    # Source: https://www.tutorialspoint.com/perl/perl_scalar.htm
    $sum += scalar @words;
}


print "$sum words\n";

# Do not forget to close the file stream
#close $stdin;

