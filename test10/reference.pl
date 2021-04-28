#!/usr/bin/perl -w

# creating the line list to store the line data
@line_list=();

foreach $line(<STDIN>){
    # Removing the new line symbol
    # Source: https://www.geeksforgeeks.org/perl-chomp-function/
    chomp($line);
    # Store the data in an array
    push @line_list,$line;
}

foreach $line(@line_list){
    if($line =~ /^.*\#([0-9]+).*$/){
        # Getting the first matching string
		$target_number = $1;
        # The index is the current location number minus 1 
        $line_list_index = $target_number -1;
        # Getting the target element
		$target = $line_list[$line_list_index];
        # number regrex
        #$num_regrex="#([0-9]*)";
		$line =~ s/#([0-9]+)/$target/;
	}else{
        next;
    }
    print "$line\n";
}