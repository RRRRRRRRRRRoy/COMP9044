#!/usr/bin/perl -w


# in his question cannot use hash!!!!!
# This is due to the order of the hash keys
# Therefore the sequence is in the wrong order.
# change is to array!!!

@words_counter=();
# getting the input
@input_value = @ARGV;
foreach $word(@input_value){
    # creating a current to store the number of the words
    if(exists $words_in_sentence{$word}){
		next;
	}else{
        $words_in_sentence{$word} = 1;
        # Toturial of using push
        # Source: https://www.learn-perl.org/en/Arrays
		push @words_counter,$word;
    }
}

print "@words_counter";