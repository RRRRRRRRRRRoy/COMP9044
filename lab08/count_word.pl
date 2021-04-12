#!/usr/bin/perl -w

# This counter is to counting the number of words
$counter = 0;
# Getting the input keywords
$selected_word = $ARGV[0];

while($line = <STDIN>){
    $regrex_word = '[^a-z]+';
    # based on the regrex cutting the word store in array
	@words = split(/$regrex_word/i,$line);

	foreach $word (@words){
        # checking whether the word is same or not
        # Do not forget to change all these variables to lower case
		if (lc($selected_word) eq lc($word) and uc($selected_word) eq uc($word)){
            # Counter adding1
			$counter += 1;
		}
	}
}

print "$selected_word occurred $counter times\n";