#!/usr/bin/perl -w

while($line=<STDIN>){
    @ls_line = split(/\|/, $line);
    #print $ls_line;
    $name = $ls_line[2];
    ($firstname , $lastname) = split(/, /, $name);
    while($s =~ / $/){
        $s =~ s/ $//;
    }
    $line =~ s/$f, $s/$s $f/;
    print $line;
}