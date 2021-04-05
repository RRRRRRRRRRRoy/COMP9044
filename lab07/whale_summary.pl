# #!/usr/bin/perl -w

# getting the filename from the input
$filename=$ARGV[0];

# setting filestream to read file from the filename
# Source: http://perltraining.com.au/tips/2005-11-17.html
open $stdin,"<","$filename" or die "$!";

# whale_data to store the data of input stream
@whale_data=();
while($line = <$stdin>){
    # push operation of array
    # Source: https://www.geeksforgeeks.org/perl-push-function/
    push @whale_data, $line;
}

# setting the array for name storage
@name_array=();
# setting the hash also dictionary to store the data of each name1
# Tutorial for using dictionary in perl
# Source: https://www.tutorialspoint.com/perl/perl_hashes.htm
# counting the number of pods the key is whale name
%whale_pods=();
# counting the number of individuals key is whale name
%whale_individual=();

foreach $line (@whale_data){
    # cutting the from space
    $line =~ s/^\s+//;
    # cutting the back space
    $line =~ s/\s+$//;
    # split the line like species_count
    @info = split / +/, $line;
    # getting the individual number
    $individual_oberservation = $info[1];
    $get_whale_name = @info[2];
    # This is to remove the s and get the type name of whale
    $get_whale_name =~ s/s$//;
    # how to use chomp
    # Source: https://perldoc.perl.org/functions/chomp
    chomp $get_whale_name;

    # exists is for checking the array or hash exists or not
    # Source: https://perldoc.perl.org/functions/exists
    if(exists($whale_pods{$get_whale_name})){
        $whale_pods{$get_whale_name} = $whale_pods{$get_whale_name} + 1;
        $whale_individual{$get_whale_name} = $whale_individual{$get_whale_name} + $individual_oberservation;
    }else{ 
        # new whale
        # print "Has not been observed before\n";
        push @name_array, $get_whale_name;
        $whale_pods{$get_whale_name} = 1;
        $whale_individual{$get_whale_name} = $individual_oberservation;
    }
}

# output the data in alphabetical order
@name_array = sort(@name_array);
foreach $get_whale_name(@name_array){
    print "$get_whale_name observations: $whale_pods{$get_whale_name} pods, $whale_individual{$get_whale_name} individuals\n";
}