#!/usr/bin/perl -w

# word list from the input
my @word_list = @ARGV;
my %words_counter=();
my @printing_array=();

# looping the word in the list
while($word=<@ARGV>){
    if(exists $words_counter{$word}){
        next;
    }else{
