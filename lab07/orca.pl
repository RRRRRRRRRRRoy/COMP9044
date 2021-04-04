#!/usr/bin/perl -w

$filename=$ARGV[0];

$sum=0;

open my $stdin,'<',"$filename" or die "$!";

@whale_records=();
while($line = <$stdin>){
    push @whale_records, $line;
}

foreach $record (@whale_records){
    # print($record);
    $record_name=substr($record,12);
    # print($record_name);
    if ("$record_name" eq "Orcas"){
        @info = split / /, $record;
        # print $info[1];
        $sum+=$info[1];
    }
}

print "$sum Orcas reported in whales.txt";
