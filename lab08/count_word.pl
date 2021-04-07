#!/usr/bin/perl -w

# getting the filename from the input
my $seleted_word=$ARGV[0];
#$filename = $ARGV[1];
# # setting counter
# # setting filestream to read file from the filename
# # Source: http://perltraining.com.au/tips/2005-11-17.html
#open (my $stdin,'<',"$filename") or die "$!";

%words_dict=();
$sum = 0;

# This is similar to Nvdia 2019 interview question counting words
foreach $line(<STDIN>)
{
    $regrex='[^a-z]+';
    @words = split /$regrex/i,$line;
    foreach $word (@words)
    {   
        # using the dictionary to stroe the number of appearance
        if($word =~ m/^$seleted_word$/i){
            $sum ++;
        }
    }
}

print "$seleted_word occurred $sum times";
# Do not forget to close the file stream
close $stdin;