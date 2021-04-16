#!/usr/bin/perl -w

$counter = 0;
$distinct = 0;
$input_value = $ARGV[0];
my %words_dict;

foreach $line(<STDIN>){
	$counter++;
	$line = uc($line);
    # delete the extra space
	$line =~ s/ *//g ;
