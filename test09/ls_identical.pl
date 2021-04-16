#!/usr/bin/perl -w

# file directory
$file_directory = $ARGV[0];
# the comparison directory --> target directory
$comparison_directory = $ARGV[1];
# using the glob function getting the file list
# Source https://perldoc.perl.org/functions/glob
@file_list = glob "$file_directory/*";
# Using the file comparison to check whether 2 files are equal
# The following link has the sample of compare
use File::Compare;
for $item (@file_list){
    # getting the file
	$file=$item=~s/.*\///gr;
    # if compare return is not 0 files are not same ---> sample of using compare
    # Source: https://docstore.mik.ua/orelly/perl2/prog/ch32_19.htm
	if(compare($item,"$comparison_directory/$file")!=0){    #equal file
		next;
	}else{
    # if compare return is 0 files are same
    # print the result
        print "$file\n";
    }
}