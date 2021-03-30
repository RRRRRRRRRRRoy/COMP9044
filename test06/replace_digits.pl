#!/usr/bin/perl -w

$file=$ARGV[0]

# copy from the question 2
open my $stdin_stream,'<',$file or die "$!";
foreach $line(@stdin_stream){
    # How to select the digital 
    # Source: https://perldoc.perl.org/5.8.9/perlre
    $line =~ s/\\d/\#/g;
    # push options for perl array
    # Source: https://www.geeksforgeeks.org/perl-push-function/
    push @new_contents,$line;
}

# copy from the question 1
open my $stdout_stream,'>',$file or die "$!";
foreach $line(@new_contents){
    print $stdout_stream "$line";
}

close($stdin_stream);
close($stdout_stream);