#!/usr/bin/perl -w

# These part of code is copied from Q3

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
    # counting the number of each word in the file
    %words_dict=();
    # Counting the number of each word in the lyrics
    $counter = 0;
    # counting the total number of words
    $sum = 0;
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
            if( ! exists($words_dict{$key})){
                $words_dict{$key}=0;
            }
            $words_dict{$key}++;
            
			if ($word =~ m/^$keyword$/i){
                $counter = $counter + 1;
            }
		}
	}
    # format printing
    # Source: https://perldoc.perl.org/functions/printf
	# printf "log((%d+1)/%6d) = %8.4f %s", $words_dict{$keyword}, $sum, log(($words_dict{$keyword}+1)/$sum),$artist;
    $log_result = log(($counter+1)/$sum);
    printf "log((%d+1)/%6d) = %8.4f %s\n", $counter, $sum, $log_result,$artist;
}