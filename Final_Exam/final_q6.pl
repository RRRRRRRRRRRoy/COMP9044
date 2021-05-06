#!/usr/bin/perl -w

while($line=<STDIN>){
    @ls_line = split(/\|/, $line);
    print $ls_line;
}