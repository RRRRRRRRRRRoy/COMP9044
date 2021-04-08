#!/usr/bin/perl -w

%word_list=();

# getting the input
@input_value = @ARGV;
foreach$word(@input_value){
    if(! exists $word_list{$word}){
        $word_list{$word} = 1;
    }
    else{
        $word_list{$word}++;
    }
}

foreach $key(keys %word_list){
    print "$key "
}