#!/usr/bin/perl -w

# setting the counter
$counter = 0;
# counting the distinct
$distinct = 0;
$input_value = $ARGV[0];
# checking whether the word is distinct
my %words_dict;

# This part of code is similar to the previous lab
# Read from the terminal
foreach $line(<STDIN>){
	$counter++;
	# change all the word to upper case
	# Source : https://www.geeksforgeeks.org/perl-uc-function/
	$line = uc($line);
	chomp $line;
    # delete the extra space
	$line =~ s/ *//g;
	$words_dict{$line} += 1;
	# Using scalar to checking the keys
	# Source: https://www.tutorialspoint.com/perl/perl_scalar.htm
	$distinct = scalar keys %words_dict;

	# If same
	if(lc($distinct) == lc($input_value)){
		print "$input_value distinct lines seen after $counter lines read.\n";
		exit 0;
	}
}

# not found the difference
print "End of input reached after $counter lines read - $input_value different lines not seen.\n";