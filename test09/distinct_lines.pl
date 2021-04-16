#!/usr/bin/perl -w

$counter = 0;
$distinct = 0;
$input_value = $ARGV[0];
my %words_dict;

foreach $line(<STDIN>){
	$counter++;
	$line = uc($line);
    # delete the extra space
	$line =~ s/ *//g ;
	$words_dict{$line}++;
	$distinct = scalar keys %words_dict;

	if(lc($distinct) == lc($input_value)){
		print "$input_value distinct lines seen after $counter lines read.\n";
		exit 0;
	}
}

print "End of input reached after $counter lines read - $input_value different lines not seen.\n";