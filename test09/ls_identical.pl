#!/usr/bin/perl -w

# file directory
$file_directory = $ARGV[0];
# the comparison directory --> target directory
$comparison_directory = $ARGV[1];
# filelist
@file_list = glob "$file_directory/*";
# Using the file comparison to check whether 2 files are equal
use File::Compare;
for $item (@file_list){
	$file=$item=~s/.*\///gr;
    # if compare return is not 0 files are not same
	if(compare($item,"$comparison_directory/$file")!=0){    #equal file
		next;
	}else{
    # if compare return is 0 files are same
    # print the result
        print "$file\n";
    }
}