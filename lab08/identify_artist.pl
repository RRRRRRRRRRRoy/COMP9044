#!/usr/bin/perl -w

$keyword = $ARGV[0];

# filelist
@filelist = glob "lyrics/*.txt";


foreach my $file (@filelist){
    $artist = $file;
    # delete lyrics/
	$artist =~ s/lyrics\///g;
    # Delete the .txt
	$artist =~ s/\.txt//g;
    # replace the _ by space
	$artist =~ s/_/ /g;

    # # setting filestream to read file from the filename
    # # Source: http://perltraining.com.au/tips/2005-11-17.html
    open (my $stdin,'<',"$file") or die "$!";
    

    # Do not forget to close the file stream
    close $stdin;
}


