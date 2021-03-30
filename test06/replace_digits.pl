#!/usr/bin/perl -w

$file=$ARGV[0]

# copy from the question 2
open my $stdin_stream,'<',$file or die "$!";


# copy from the question 1
open my $stdout_stream,'>',$file or die "$!";