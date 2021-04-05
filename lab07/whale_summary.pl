#!/usr/bin/perl -w

# getting the filename from the input
$filename=$ARGV[0];
# setting the array for name storage
@name_array=();
# setting the hash also dictionary to store the data of each name1
# Tutorial for using dictionary in perl
# Source: https://www.tutorialspoint.com/perl/perl_hashes.htm
# counting the number of pods the key is whale name
%whale_pods=();
# counting the number of individuals key is whale name
%whale_individual=();


# setting filestream to read file from the filename
# Source: http://perltraining.com.au/tips/2005-11-17.html
open ($stdin,"<","$filename") or die "$!";

# whale_data to store the data of input stream
@whale_data=();
while($line = <$stdin>){
    # push operation of array
    # Source: https://www.geeksforgeeks.org/perl-push-function/
    push @whale_data, $line;
}


foreach $line (@whale_data){
    # cutting the from space
    $line =~ s/^\s+//;
    # cutting the back space
    $line =~ s/\s+$//;
    # split the line like species_count
    @info = split / +/, $line;
    # getting the individual number
    # print "@info\n";
    $individual_oberservation = $info[1];
    $whale_name = substr($line,12);
    $whale_name =~ s/^\s+//;
    $whale_name =~ s/\s+$//;
    # changing to lower case
    # Source: https://perldoc.perl.org/functions/lc
    $whale_name = lc($whale_name);
    # This is to remove the s and get the type name of whale
    $whale_name =~ s/s$//;
    # how to use chomp
    # Source: https://perldoc.perl.org/functions/chomp
    # chomp $whale_name;

    # exists is for checking the array or hash exists or not
    # Source: https://perldoc.perl.org/functions/exists
    # checking whale_pods is exist or not
    if( ! exists($whale_pods{$whale_name})){
        # checking whale_individual is exist or not
        if ( ! exists($whale_individual{$whale_name})){
            # new whale
            # print "Has not been observed before\n";
            # create a new tag
            push @name_array, $whale_name;
            # setting the new tag value as 1
            $whale_pods{$whale_name} = 1;
            # setting the invidual as the first individual_oberservation value
            $whale_individual{$whale_name} = $individual_oberservation;
        }
    }else{
        # pods in increasing 1
        $whale_pods{$whale_name} = $whale_pods{$whale_name} + 1;
        # adding the the current individual_oberservation value
        $whale_individual{$whale_name} = $whale_individual{$whale_name} + $individual_oberservation;
         
    }
}

# output the data in alphabetical order
# @name_array = sort(@name_array);
# How to use sort to sort array
# Source: https://perldoc.perl.org/functions/sort
foreach $whale_name(sort(@name_array)){
    # printing the result
    print "$whale_name observations: $whale_pods{$whale_name} pods, $whale_individual{$whale_name} individuals\n";
}