#!/usr/bin/perl -w

# These part of code is from the website of COMP9044
# Source: https://cgi.cse.unsw.edu.au/~cs2041/21T1/lab/09/questions
# Documents for LWP 
# Source: https://metacpan.org/pod/LWP::Simple
use LWP::Simple;
$UNSW_COURSETABLE = "http://www.timetable.unsw.edu.au/current/$ARGV[0]KENS.html";
$web_source = get($UNSW_COURSETABLE) or die "Unable to get $UNSW_COURSETABLE";
# clean up the empty lines and spaces
chomp $web_source;
# split the source data into different lines
@lines_in_web = split /\n/, $web_source;
# print "$lines_in_web[1]";

$major=$ARGV[0];

my @match_result;

for $line (@lines_in_web){
    # testing the current data reading is successful
    # print "$line";
    # print $line;
	if($line =~ /^.*$major[0-9][0-9][0-9][0-9]*.*">.*<\/a>/){
		if($line =~ /.*$major[0-9][0-9][0-9][0-9].*$major[0-9][0-9][0-9][0-9]/){
			#print "$line";
			next;
		}
		$line =~ /^.*($major[0-9][0-9][0-9][0-9])\.html.*">(..*)<\/a>/;
		# $1 is the first matching string
		# $2 is the second matching string
		$course_info = "$1 $2";
		push @match_result,$course_info;
	}
}

# How to get the value in the array with uniq
# Source: https://perlmaven.com/unique-values-in-an-array-in-perl
use List::MoreUtils qw(uniq);
# Doing the unique operation ----> cleaning the extra data
@match_result = uniq @match_result;
# Sorting the result array
@match_result = sort @match_result;

$index = 0;
while($index < @match_result){
	print "$match_result[$index]\n";
	$index = $index + 1;
}


