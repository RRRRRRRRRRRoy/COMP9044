#!/usr/bin/perl -w

$counter = 0;

foreach $line (<STDIN>){
    # This regrex is same as the final_q1
    $regrex = '^.+3711/.+$';
    # Doing the compare
    if($line =~ /$regrex/){
        # Adding the result to the counter
        $counter += 1;
    }
}
print "$counter\n";
