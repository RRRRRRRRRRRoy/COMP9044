# #!/usr/bin/perl -w

# getting the filename from the input
$filename=$ARGV[1];

# setting filestream to read file from the filename
# Source: http://perltraining.com.au/tips/2005-11-17.html
open (my $stdin,'<',"$filename") or die "$!";

# whale_data to store the data of input stream
@whale_data=();
while($line = <$stdin>){
    # push operation of array
    # Source: https://www.geeksforgeeks.org/perl-push-function/
    push @whale_data, $line;
}

# setting the array for name storage
@whale_name=();
# setting the hash also dictionary to store the data of each name1
# Tutorial for using dictionary in perl
# Source: https://www.tutorialspoint.com/perl/perl_hashes.htm
%whale_pods=();
%whale_individual=();

foreach $line (@whale_data){
    # cutting the from space
    $line =~ s/^\s+//;
    # cutting the back space
    $line =~ s/\s+$//;
    # split the line like species_count
    @info = split / +/, $line;
    @info_len = @info;

    $individual_ob = $info[0];
    foreach $item(@info){
        # join the whale elements as string
        $whale_name = join(" ", $item)
    }
    # This is to remove the s and get the type name of whale
    $whale_name =~ s/s$//;
    # how to use chomp
    # Source: https://perldoc.perl.org/functions/chomp
    chomp $whale_name;

    # exists is for checking the array or hash exists or not
    # Source: https://perldoc.perl.org/functions/exists
    if(exists
    
}