#!/usr/bin/perl -w

# $major=$ARGV[0];

# Testing this function
# These part of code is from the website of COMP9044
# Source: https://cgi.cse.unsw.edu.au/~cs2041/21T1/lab/09/questions
# Documents for LWP 
# Source: https://metacpan.org/pod/LWP::Simple
use LWP::Simple;
$UNSW_COURSETABLE = "http://www.timetable.unsw.edu.au/current/$ARGV[0]KENS.html";
$web_source = get($UNSW_COURSETABLE) or die "Unable to get $UNSW_COURSETABLE";
print "$web_source";

@lines_in_web = split(/\n/, $web_source);

print "$lines_in_web[1]";