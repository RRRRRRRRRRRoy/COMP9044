# #!/usr/bin/perl -w

# getting the filename from the input
$filename=$ARGV[1];
# getting the input type of whiles
$while_type=$ARGV[0];
# counting the number of pods
$pods=0;
# counting the individual_oberservation
$individual_oberservation=0;
# setting counter
$sum=0;

# setting filestream to read file from the filename
# Source: http://perltraining.com.au/tips/2005-11-17.html
open (my $stdin,'<',"$filename") or die "$!";

# list to store the data of input stream
@whale_list=();
while($line = <$stdin>){
    # push operation of array
    # Source: https://www.geeksforgeeks.org/perl-push-function/
    push @whale_list, $line;
}


foreach $line (@whale_list){
    # How to using m//
    # Source: https://stackoverflow.com/questions/10019049/what-does-do-in-perl
    if($line =~ m"$while_type"){
        $pods = $pods + 1;
        # This is samilar with the previous orca.pl
        @info = split / +/, $line;
        # print "@info";
        $individual_oberservation = $info[1] + $individual_oberservation;
    }
}
print "$while_type observations: $pods pods, $individual_oberservation individuals\n";
