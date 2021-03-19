#!/usr/bin/perl -w

# Getting the files in the current directory
# Source: https://perldoc.perl.org/functions/glob
@current_file = glob("*");
condition=ARGV[0];
if (($condition eq "save") or ($condition eq "load")){
    # STEP 1 create the directory
    $counter = 0;
	$filename_copy = ".snapshot.$counter";
	while(-e "$filename_copy"){
		$counter = $counter + 1;
		$filename_copy = ".snapshot.$counter";
	}
	mkdir $cp_dir;
}
