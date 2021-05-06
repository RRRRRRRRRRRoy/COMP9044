#!/usr/bin/perl -w

$counter = 0;

while($line = <STDIN>){
    $regrex = '^.+3711/.+$';
    if($line =~ /$regrex/){
        $counter += 1;
    }
}
print "$counter\n";
