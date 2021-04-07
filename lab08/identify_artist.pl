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
            $artist_hash{"$artist"}{"$key"} = $artist_hash{"$artist"}{"$key"} + 1;
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
            $key = lc($word);
        }
    }
}