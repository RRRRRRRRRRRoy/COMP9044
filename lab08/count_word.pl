#!/usr/bin/perl -w

# getting the filename from the input
$seleted_word=$ARGV[0];
$filename = $ARGV[1];
# # setting counter
# # setting filestream to read file from the filename
# # Source: http://perltraining.com.au/tips/2005-11-17.html
open (my $stdin,'<',"$filename") or die "$!";

%words_dict=();

# This is similar to Nvdia 2019 interview question counting words
foreach $line(<$stdin>)
{
    foreach $word ($line =~ /([a-zA-Z]+)/g)
    {   
        # using the dictionary to stroe the number of appearance
        $key = lc($word);
        $words_dict{$key}++;
    }
}

print "$seleted_word occurred $words_dict{$seleted_word} times"
# Do not forget to close the file stream
close $stdin;