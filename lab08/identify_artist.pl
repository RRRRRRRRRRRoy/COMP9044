#!/usr/bin/perl -w

@filelist = glob "lyrics/*.txt";
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

foreach $file(@ARGV){
    # reset hash artist_counter
    %artist_counter = ();

    # read lyrics from every artist
    open (my $stdin, '<', "$file") or die "$!";

    foreach $line (<$stdin>){
        # This part of code is copied from Question1
        $regrex = '[a-zA-Z]+';
        @words = $line =~ /$regrex/g;
        foreach $word (@words)
        {
            # This part of code is copied from Question2
            $key = lc($word);
            foreach $artist (sort keys %artist_hash)
            {
                # calculating the total number
                $sum = 0;
                # Searching the word in the second dimension
                foreach $word (keys %{$artist_hash{$artist}})
                {   
                    # Counting the words in artist hash
                    $sum += $artist_hash{$artist}{$word};
                }
                # checking whether the word is exists
                if ( ! exists $artist_hash{$artist}{$key})
                {
                    # if not exist using the 1 to calculate the log
                    $frequency = 1 / $sum;
                    $log_prob = log($frequency);
                    $artist_counter{$artist} += $log_prob;
                }
                else
                {
                    # Claculating the frequency as Question 3
                    $frequency = ($artist_hash{$artist}{$key} + 1) / $sum;
                    $log_prob = log($sequence);
                    $artist_counter{$artist} += $log_prob;
                }
            }
        }
    }

    close $stdin;
}