#!/usr/bin/perl -w


$keyword = $ARGV[0];

# filelist
@filelist = glob "lyrics/*.txt";

for $file (@filelist){
	open (my $stdin,'<',"$file") or die "$!";

    # String matching is from the following link
    # Source: https://www.tutorialspoint.com/perl/perl_regular_expressions.htm
    # Cutting the string
    # Ig using
    # Source: http://web.eecs.utk.edu/~bvanderz/cs460/notes/perl/perl2.html
    # print $file;
    $artist = $file;
    # delete lyrics/
	$artist =~ s/lyrics\///g;
    # Delete the .txt
	$artist =~ s/\.txt//g;
    # replace the _ by space
	$artist =~ s/_/ /g;
	$sum = 0;
    $counter = 0;
    # Counting the number of each word in the lyrics
    # %words_dict=();
    # Setting the counter for checking the number of keyword
	while($line = <$stdin>){
        # THis part of code is from Question1
        $regrex = '[a-zA-Z]+';
        @words = $line =~ /$regrex/g;
        # Store the data in to a list using scalar counting the list
        # Source: https://www.tutorialspoint.com/perl/perl_scalar.htm
        $sum += @words;
        # This part of code is from question 2
        $regrex_word = '[^a-z]+';
        # based on the regrex cutting the word store in array
	    @words_counter = split(/$regrex_word/i,$line);
		foreach $word (@words_counter){
        # checking whether the word is same or not
        # Do not forget to change all these variables to lower case
		    if (lc($keyword) eq lc($word) and uc($keyword) eq uc($word)){
                # Counter adding1
			    $counter ++;
		    }
	    }
	}
    # format printing
    # Source: https://perldoc.perl.org/functions/printf
	printf "%4d/%6d = %.9f %s\n", $counter, $sum, $counter/$sum,$artist;
    # Do not forget to close the file stream
    close $stdin;
}