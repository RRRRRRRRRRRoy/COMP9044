#!/usr/bin/perl -w

# # file directory
# $file_directory = $ARGV[0];
# # the comparison directory --> target directory
# $comparison_directory = $ARGV[1];
# # filelist
# @file_list = glob "$file_directory/*"
# # Using the file comparison to check whether 2 files are equal
# use File::Compare;
# for $item (@file_list){
# 	$file=$item=~s/.*\///gr;
#     # if compare return is not 0 files are not same
# 	if(compare($item,"$comparison_directory/$file")!=0){    #equal file
# 		next;
# 	}else{
#     # if compare return is 0 files are same
#     # print the result
#         print "$file\n";
#     }
# }

use strict;
use File::Compare;
use experimental 'smartmatch';

die "Usage: $0 <number_list>\n" if @ARGV != 2;

my $dirname1 = shift @ARGV;
my $dirname2 = shift @ARGV;

my @all_files = glob("$dirname1/*");
foreach my $filename (@all_files)
{
    # filename = "dirname1/example.c"
    $filename =~ s/.*\///;
    if (-e "$dirname2/$filename")  # $dirname2/$filename exists
    {
        if (compare("$dirname1/$filename", "$dirname2/$filename") == 0)
        {
            print "$filename\n";
        }
    }
}