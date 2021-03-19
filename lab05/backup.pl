#!/usr/bin/perl -w

$filename_input = $ARGV[0];
#@filename_cut=();
$counter = 0;
@filename_cut=split('\.',$filename_input);
$filename= $filename_cut[0];
# Test the filename is cut
# print "$filename_cut[0]";
$filename_copy=".$filename.txt.$counter";

# check whether the backup is exist
# Source: https://alvinalexander.com/blog/post/perl/how-test-file-exists-perl/
while(-e "$filename_copy"){
    $counter = $counter + 1;
    $filename_copy=".$filename.txt.$counter";
}

# How to use the file stream in perl?
# Source: https://perldoc.perl.org/functions/open
# If exist read in, otherwise do not read in
open my $stdin,'<',"$filename_input" or die ("$!");
open my $stdout,'>',"$filename_copy" or die ("$!");

foreach $content($stdin){
    print $stdout "$content";
}

print "Backup of '$filename_input' saved as '$filename_copy'\n";
# close the file stream
close $stdin;
close $stdout;