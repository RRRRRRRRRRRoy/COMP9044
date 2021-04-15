#!/usr/bin/perl -w

$major=$ARGV[0];

my @match_result;

# How to get the value in the array with uniq
# Source: https://perlmaven.com/unique-values-in-an-array-in-perl
use List::MoreUtils qw(uniq);
# Testing this function
# These part of code is from the website of COMP9044
# Source: https://cgi.cse.unsw.edu.au/~cs2041/21T1/lab/09/questions
# Documents for LWP 
# Source: https://metacpan.org/pod/LWP::Simple
use LWP::Simple;
$UNSW_COURSETABLE = "http://www.timetable.unsw.edu.au/current/$ARGV[0]KENS.html";
$web_source = get($UNSW_COURSETABLE) or die "Unable to get $UNSW_COURSETABLE";

# Testing whether getting the web source successfully
# print "$web_source";

# cutting each line of the websource and testing
@lines_in_web = split /\n/, $web_source;
# print "$lines_in_web[1]";

foreach $line (@lines_in_web){
    # testing the current data reading is successful
    # print "$line";
    # print $line;
	if($line =~ /^.*$major[0-9][0-9][0-9][0-9]*.*">.*<\/a>/){
		if($line =~ /.*$major[0-9][0-9][0-9][0-9].*$major[0-9][0-9][0-9][0-9]/){
			#print "$line";
			next;
		}

