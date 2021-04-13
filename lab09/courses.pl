#!/usr/bin/perl -w

# Testing this function
use LWP::Simple;
$major = $ARGV[0];
$url = 'http://www.timetable.unsw.edu.au/current/{$ARGV[0]"KENS.html';
$web_page = get($url) or die "Unable to get $url";
print $web_page;
print $major;