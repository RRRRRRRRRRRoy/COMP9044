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

    foreach $file(@current_file){
		if($file ne "snapshot.pl"){
            if($file ne "snapshot-save.sh"){
                if($file ne "snapshot-load.sh"){
                    if($file ne "backup.pl"){
                        if($file ne "backup.pl"){
                            open my $stdin,'<',"$file" or die "$!";
			                open my $stdout,'>',"$filename_copy/$file" or die "$!";
                            foreach $content(<$stdin>){
				                print $stdout "$content";
			                }
                            close $stdin;
			                close $stdout;
                        }
                    }
                }
            }
		}
        print "Creating snapshot $counter\n";
	}
}
