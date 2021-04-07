#!/usr/bin/perl -w

# These part of code is copied from Q3

$keyword = $ARGV[0];

# filelist
@filelist = glob "lyrics/*.txt";


# These Code are copied from Question2
for $file (@filelist){
	open (my $stdin,'<',"$file") or die "$!";
    # String matching is from the following link
    # Source: https://www.tutorialspoint.com/perl/perl_regular_expressions.htm
    # Cutting the string
    # Source: http://web.eecs.utk.edu/~bvanderz/cs460/notes/perl/perl2.html
    # print $file;
	$artist = $file;
    # delete lyrics/
	$artist =~ s/lyrics\///g;
    # Delete the .txt
	$artist =~ s/\.txt//g;
    # replace the _ by space
	$artist =~ s/_/ /g;
    # counting the number of each word in the file
    # %words_dict=();
    # Counting the number of each word in the lyrics
    $counter = 0;
    # counting the total number of words
    $sum = 0;
	while($line = <$stdin>){
        # Source: https://perldoc.perl.org/functions/chomp
        chomp $line;
        # THis part of code is from Question1
        $regrex = '[a-zA-Z]+';
        @words = $line =~ /$regrex/g;
        # Store the data in to a list using scalar counting the list
        # Source: https://www.tutorialspoint.com/perl/perl_scalar.htm
        $sum += scalar @words;
        # for $word (@words){
        #     $words_dict{$word}=0
        # }
        # This part of code is from question 2
		for $word (@words){
            # to lower cases
            $key = lc($word);
            $words_dict{$key}++;
            
			if ($word =~ m/^$keyword$/i){
                $counter = $counter + 1;
            }
		}
	}
    # format printing
    # Source: https://perldoc.perl.org/functions/printf
	#printf "log((%d+1)/%6d) = %8.4f %s", $words_dict{$keyword}, $sum, log(($words_dict{$keyword}+1)/$sum),$artist;
    # printf "log((%d+1)/%6d) = %8.4f %s\n", $words_dict{$keyword}, $sum, log(($words_dict{$keyword}+1)/$sum),$artist;
    $log_result = log(($counter+1)/$sum);
    printf "log((%d+1)/%6d) = %8.4f %s\n", $counter, $sum, $log_result,$artist;
    # Do not forget to close the file stream
    close $stdin;
}