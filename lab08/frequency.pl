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
    # delete lyrics/
	$file =~ s/lyrics\///g;
    # Delete the .txt
	$file =~ s/\.txt//g;
    # replace the _ by space
	$file =~ s/_/ /g;
	$artist = $file;
	$sum = 0;
    # Counting the number of each word in the lyrics
    %words_dict=();
	while($line = <$stdin>){
        # THis part of code is from Question1
        $regrex = '[a-zA-Z]+';
        @words = $line =~ /$regrex/g;
        # Store the data in to a list using scalar counting the list
        # Source: https://www.tutorialspoint.com/perl/perl_scalar.htm
        $sum += scalar @words;
        # This part of code is from question 2
		for $word (@words){
            # to lower cases
			$key = lc($word);
            $words_dict{$key}++;
		}
	}
    # format printing
    # Source: https://perldoc.perl.org/functions/printf
	printf "%4d/%6d = %.9f %s\n", $words_dict{$keyword}, $sum, $words_dict{$keyword}/$sum,$artist;
}