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

    # Go through the files in the current list
    foreach $file(@current_file){
        # avoiding copy the same current file in lab05
		if($file ne "snapshot.pl"){
            # avoiding copy the same current file in lab05
            if($file ne "snapshot-save.sh"){
                # avoiding copy the same current file in lab05
                if($file ne "snapshot-load.sh"){
                    # avoiding copy the same current file in lab05
                    if($file ne "backup.pl"){
                        # avoiding copy the same current file in lab05
                        if($file ne "backup.pl"){
                            # Same way reading the file 
                            open my $stdin,'<',"$file" or die "$!";
                            # Same way writing the file 
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
	}
    print "Creating snapshot $counter\n";
}

# This part is to implemete the load part
if($condition eq "load"){
    # backup counter
    $backup_counter = $ARGV[1];
    $backup_directory = ".snapshot.$backup_counter";
    print "Restoring snapshot $backup_counter\n";
}