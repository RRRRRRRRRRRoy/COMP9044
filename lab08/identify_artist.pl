#!/usr/bin/perl -w

# Getting file recursively
# Source: https://perldoc.perl.org/functions/glob
@filelist = glob "lyrics/*.txt";
@input_list =@ARGV;
# build my artist hash
foreach $file (@filelist) 
{
    # get artist name
    # String matching is from the following link
    # Source: https://www.tutorialspoint.com/perl/perl_regular_expressions.htm
    # Cutting the string
    # Source: http://web.eecs.utk.edu/~bvanderz/cs460/notes/perl/perl2.html
    # These part of code is copied from Q3 log_probability
    $artist = $file;
    # delete lyrics/
	$artist =~ s/lyrics\///g;
    # Delete the .txt
	$artist =~ s/\.txt//g;
    # replace the _ by space
	$artist =~ s/_/ /g;

    # read lyrics from every artist
    open (my $stdin, '<', "$file") or die "$!";
    
    foreach $line (<$stdin>)
    {
        # This part of code is copied from Question1
        # \w including char number also _
        # Source: https://www.w3schools.com/jsref/jsref_regexp_wordchar.asp
        $regrex = '[a-zA-Z]+';
        @words = $line =~ /$regrex/g;
        foreach $word (@words)
        {
            # The idea of this part of code is copied from Question2
            $key = lc($word);
            # doing the statistics for each artist
            # Store the data in a (2-dimensional) hash.
            # Source: https://cgi.cse.unsw.edu.au/~cs2041/21T1/lab/08/questions
            $artist_hash{"$artist"}{"$key"} += 1;
        }
    }
    close $stdin;
}

foreach $file(@input_list){
    # reset hash artist_counter
    %artist_counter = ();

    # read lyrics from every artist
    open (my $stdin, '<', "$file") or die "$!";

    foreach $line (<$stdin>){
        # Source: https://perldoc.perl.org/functions/chomp
        chomp $line;
        # This part of code is copied from Question1
        $regrex = '[a-zA-Z]+';
        @words = $line =~ /$regrex/g;
        foreach $word (@words)
        {
            # This part of code is copied from Question2
            $key = lc($word);
            # How to get keys in perl hash?
            # Source: https://www.perltutorial.org/perl-hash/
            # How to use sort keyword to sort the value list
            # Source: https://perldoc.perl.org/functions/sort
            @artist_keys=sort keys %artist_hash;
            foreach $artist (@artist_keys)
            {
                # calculating the total number
                $sum = 0;
                # How to get keys in perl hash?
                # Source: https://www.perltutorial.org/perl-hash/
                # Searching the word in the second dimension
                @artist_words_number=keys %{$artist_hash{$artist}};
                foreach $word (@artist_words_number)
                {   
                    # Counting the words in artist hash
                    $sum += $artist_hash{$artist}{$word};
                }
                # checking whether the word is exists
                if ( ! exists $artist_hash{$artist}{$key})
                {
                    # if not exist using the 1 to calculate the log
                    # Setting the value as 1
                    $log_probability = log(1 / $sum);
                    $artist_counter{$artist} += $log_probability;
                }
                else
                {
                    # Claculating the frequency as Question 3
                    $log_probability = log(($artist_hash{$artist}{$key} + 1) / $sum);
                    $artist_counter{$artist} += $log_probability;
                }
            }
        }
    }

    # How to get values in perl hash?
    # Source: https://www.perltutorial.org/perl-hash/
    # How to use sort keyword to sort the value list
    # Source: https://perldoc.perl.org/functions/sort
    @log_values = sort values %artist_counter;
    # How to use shift operation in the list
    # Source: https://perldoc.perl.org/functions/shift
    $maximum = shift @log_values;
    @keys = keys %artist_counter;
    foreach $key (@keys)
    {
        # artist_value compare with the maximum
        $artist_value = $artist_counter{$key};
        if ($artist_value == $maximum)
        {
            # format printing
            # Source: https://perldoc.perl.org/functions/prin
            printf "%s most resembles the work of %s (log-probability=%.1f)\n", $file, $key, $maximum;
        }else{
            next;
        }
    }
    close $stdin;
}