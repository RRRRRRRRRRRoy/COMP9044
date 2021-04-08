#!/usr/bin/perl -w

$maximum = -999999999;
@result = ();
@lines = <STDIN>;

foreach $line (@lines)
{
    #checking digital in the line
    # Source: https://perldoc.perl.org/functions/chomp
    # chomp $line;
    # checking the integer and float
    #$line =~ /[--]/g;
    while ($line =~ /([-]?[(\d)]+(\.([\d]+))?)/g)
    {
        # getting the previous mathcing line
        # SOurce: https://stackoverflow.com/questions/1036285/what-does-1-mean-in-perl
        $current_number = $1;
        # check the number is null or not
        if (! $current_number){
            next;
        }
        # The number isn ot null
        else
        {
            # if current number is smaller the the m
            if ($current_number < $maximum)
            {
                next;
            }
            # current nunumber is same push to the result list
            elsif ($current_number == $maximum)
            {
                # Using push
                # Source: https://www.geeksforgeeks.org/perl-push-function/
                push @result, $line;
            }
            else
            {   # current nunumber is larger push to the result list
                # updating the maximum value 
                $maximum = $current_number;
                # getting the line 
                @result = ($line);
            }
        }
    }
}
print @result;