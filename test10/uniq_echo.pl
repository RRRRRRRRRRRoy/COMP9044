#!/usr/bin/perl -w

# THis question is similar to shell echo

# word list from the input
my @word_list = @ARGV;
my %words_counter=();
my @printing_array=();

# looping the word in the list
while($word=<@ARGV>){
    if(exists $words_counter{$word}){
        next;
    }else{
        # Setting the current apperance as 1
        $words_counter{$word} = 1;
        # adding the word to the printing array
		push @printing_array,$word;
    }
}

# printing the final result
print "@printing_array\n";