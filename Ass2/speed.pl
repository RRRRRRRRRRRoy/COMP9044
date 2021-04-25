#!/usr/bin/perl -w


# function name
$speed_perl = $0;
# Create the usage function for speed
sub usage_speed {
    # This format is the nomal format for a function
    # notice here is speed-command not sed-command
    print "usage: $speed_perl [-i] [-n] [-f <script-file] [speed-command] <files> \n";
    exit 0;
}


# Reading the string by using GETOPT::LONG
# This can read several types of string
# Source: https://www.perl.com/article/195/2015/10/21/Professional-scripts-are-a-snap-with-Getopt-Long/
use Getopt::Long;
my $checking_default;
my $script_string_command;
sub parse_arguments {
    # The parameter of LONG::Configure
    # Source: https://perldoc.perl.org/Getopt::Long
    # Automatically provide support for the --version option if the application did not specify a handler for this option itself.
    # With pass_through anything that is unknown, ambiguous or supplied with an invalid option will not be flagged as an error.
    # This can help to bring the -f option and usage in speed
    GetOptions('f=s'=>\$script_string_command,
                'n'=>\$checking_default,
               'help|usage'=>\&usage_speed,
    );
}



# # This part of code is testing the getting arguments
# parse_arguments();
# if($no_default_setting){
#     print "test nd : $no_default_setting\n"; 
# }
# if($string_cmd){
#     print "test str_cmd: $string_cmd";
# }
# if(!$string_cmd or !$no_default_setting){
#     if( @ARGV ne "") {
#         my $command_line = shift @ARGV;
#         print "$command_line";
#     }
# }

# This function is to check the input command line's format
# Notice: using my in the function to differenciate with the global value
# 
# subset 0 has
# subset 1 has
sub parse_command_line {
    # the shift without parameters
    # Source: https://perlmaven.com/shift 
    my $command_line_t = shift;
    # This is to check the default option
    # This is the -n in the code
    $command_line_t =~ s/-n//g;
    # Checking 4 options provided by subset 0
    # p q s d
    my $regrex_subset0 = 'p|q|s|d';
    if ( $command_line_t =~ /$regrex_subset0/){
        # The current line is in correct format
        # This means it contains p q s d
        ;
    }else{
        # If the current line doesnot contian show the error
        # Then printing the usage
        print "Error command found in speed \n"; 
        usage_speed();
    }
    # start pointer
    my $start_pointer = 0;
    # end pointer
    my $finish_pointer = 0;
    # THis counter is used to counting the number of lines
    my $line_number_counter = 1;
    # using symbol ; to connect
    # This is tricky, ,.=-+ etc are used, therefore, using ; is better
    my @command_line_list = split /;/,$command_line_t;
    # Used to store the string which needed to print
    my $print_line_string = '';
    while(my $line_has_command = <>){
        if($line_number_counter == 1){
            # checking the current flag
            # if flag is 1 continue
            ;
        }else{
            # Checking the printing string is empty or not
            if(!$print_line_string){
                # current line is empty
                # Doing noting
                ;
            }else{
                # if the string is not empty and the line number is not 1
                # printing the result
                print $print_line_string;
            }
        }
        # If the finish flag is 1 reset the pointer
        if($finish_pointer !=1){
            ;
        }
        else{
            $finish_pointer = 0;
            $start_pointer=0;
        }
        # Checking the string needs print or not, default is 1
        my $string_needs_print = 1;
        # reset the print string
        $print_line_string = "";
        # Checking the string needs print for another time, defualt is 0
        my $string_needs_print_again = 0;
        my $current_line = $line_has_command;
        # looping the command in the list
        foreach my $command_in_list (@command_line_list){
            # Cutting the space in the command line
            chomp $command_in_list;
            # Check empty
            if(!$command_in_list){
                next;
            }
            # Checking p option in subset0
            if ( $command_in_list =~ /([0-9]+)p$/ || $command_in_list =~ /\/((.+)*)\/p$/){
                my $matches = $1;
                my $number_matches_pointer = 1;
                if ($command_in_list !~ /\//){
                    ;
                }else{
                    $number_matches_pointer = 0;
                }
                # qr in perl regrex
                # Source: https://stackoverflow.com/questions/30093272/what-is-the-meaning-of-qr-in-perl/30093915
                $match_pattern = qr/$matches/;
                # 2 situations needs to print again
                # 1. line counter is equal and matches pointer is no empty
                # 2. pattern is matches and the number pointer is empty
                if ($number_matches_pointer){
                    if($line_number_counter == $1){
                        $string_needs_print_again = 1;
                    }
                }
                elsif($current_line =~ /$match_pattern/){
                    if(!$number_matches_pointer){
                        $string_needs_print_again = 1;
                    }
                }
            }
            # This is to check there is only p without numbers
            # THis is for some test case in subset0 which only has p
            # THis will lead the error between == and eq, Therefore, need another to check 
            elsif ( $command_in_list eq 'p'){ 
                # Setting the flag to print again
                $string_needs_print_again = 1;
            }
            # This is for the q option in subset 0
            # Some of these codes are similar to p option in the previous part
            if ( $command_in_list =~ /([0-9]+)q$/ || $command_in_list =~ /\/((.+)*)\/q$/){ #quit
                my $matches = $1;
                my $number_matches_pointer = 1;
                if ($command_in_list !~ /\//){
                    ;
                }else{
                    $number_matches_pointer = 0;
                }
                # qr in perl regrex
                # Source: https://stackoverflow.com/questions/30093272/what-is-the-meaning-of-qr-in-perl/30093915
                $match_pattern = qr/$matches/;
                if ($number_matches_pointer){
                    if($line_number_counter != $matches){
                        ;
                    }else{
                    	# Do not forget to add exit to quit at the location
                        print $current_line;
                        exit 1;
                    }
                }
                elsif($current_line =~ /$match_pattern/){
                    if($number_matches_pointer){
                    	# exists and not equal to 0 or "" continue else quit
                        ;
                    }else{
                    	# Do not forget to add exit to quit at the location
                        print $current_line;
                        exit 1;
                    }
                }
            }
            # The following part is for d and addresses in subset 1
            # Combining d with address is due to these 2 part are similar  
            if ($command_in_list =~ /,/){
                if($command_in_list =~ /(.*?),(.*?)d/){
                    # Setting the address value 
                    # $1 is in the first position in the previous regrex
                    # $2 is in the second position in the previous regrex
                    (my $addresses_1,my $addresses_2) = ($1,$2);
                    # Setting the address pointer also the flag
                    # Which are the head pointer and the tail pointer
                    (my $addresses1_pointer,my $addresses2_pointer) = (0,0);
                    # Checking the addresses1 is digital here can also use \d
                    if ($addresses_1 =~ /[0-9]+$/){
                        $addresses1_pointer = 1;
                    }
                    # Checking the addresses1 is digital here can also use \d
                    if ($addresses_2 =~ /[0-9]+$/){
                        $addresses2_pointer = 1;
                    }

                	# Checking the address is string or not
                    if ($addresses1_pointer){
                    	# pointer is 1 which is digital number
                        ;
                    }else{
                    	# If the addresses1_pointer is string cutting the string
                        $addresses_1 = substr($addresses_1,1,-1);
                        # The usage of qr can seek the previous link
                        # Source: https://stackoverflow.com/questions/30093272/what-is-the-meaning-of-qr-in-perl/30093915
                        $addresses_1 = qr/$addresses_1/;
                    }

                    # This part of code is similar to addresses_1
                    if ($addresses2_pointer){
                        ;
                    }else{               
                        $addresses_2 = substr($addresses_2,1,-1);
                        $addresses_2 = qr/$addresses_2/;
                    }

                    # Checking the line number with the addresses number which are cutting from the input
                    if ($line_number_counter == $addresses_1){
                    	# Checking the pointer
                        if($addresses1_pointer){
                            if($start_pointer){
                                next;
                            }else{
                            	# Start pointer = 0 
                                # finish pointer != 0
                                if(!$finish_pointer){
                                	# reset the pointer and no needs for printing
                                    $start_pointer = 1;  
                                    $string_needs_print = 0;
                                }else{
                                    next;
                                }
                            }
                        }else{
                            next;
                        } # Pointer all 0
                    }elsif (!$addresses1_pointer && !$start_pointer && !$finish_pointer){
                        # current line Doing the comparison with the addresses_1
                        if(($current_line =~ /$addresses_1/)){
                            $start_pointer = 1; 
                            $string_needs_print = 0;
                            # Can also using the following code doing the testing
                            #print "At here $addresses_1\n";
                        }
                    }

                    # THis part of code is similar to addresses1_pointer
                    elsif ($line_number_counter == $addresses_2){
                        if ($addresses2_pointer){
                            if($finish_pointer){
                                next;
                            }else{
                            	# Start pointer is 0
                                if(!$start_pointer){
                                    next;
                                }else{
                                	# Notice addresses1 determines the start pointer
                                    # addresses2 determines the end pointer
                                    $string_needs_print = 0;
                                    $finish_pointer = 1; 
                                }
                            }
                        }	# This part of code is similar to the addresses1 part
                    } elsif (!$addresses2_pointer && ($current_line =~ /$addresses_2/) && !$finish_pointer && $start_pointer){
                        if(!$finish_pointer){
                            if($start_pointer){
                                $string_needs_print = 0;
                                $finish_pointer = 1; 
                            }else{
                                next;
                            }
                        }else{
                            next;
                        }
                    # start and finish_pointer all 1 need printing
                    } elsif( $start_pointer){
                        if($finish_pointer){ 
                            next;
                        }else{
                        	# start and finish_pointer all 0 no needs for printing
                            $string_needs_print = 0;
                        }
                    }
                    else { 
                    	# start pointer is 0 -> next
                        if(!$start_pointer){
                            next;
                        }else{
                        	# finish pointer is 0 -> next
                            if(!$finish_pointer){
                                next;
                            }else{
                            	# all pointers are not 0 printing
                                # Set the printing flag to 1
                                $string_needs_print = 1;
                            }
                        }
                    }
                }
            }
            # This part of code is the -d option in the subset 0
            # Writing the address in the previous is due to some of 2 part are overlap
            # The addresses is widely used to avoid the error Writing first
            # The first part is to match the digital eg seq 1 5 | 2041 speed '4d'
            # The second part is match // eg seq 11 20 | 2041 speed '/[2468]/d'
            elsif ( $command_in_list =~ /([0-9]+)d$/  || $command_in_list =~ /\/((.+)*)\/d$/){
                my $matches = $1;
                $match_pattern = qr/$matches/;
                # Checking the matches result is number or not, defualt is number
                my $match_number = 1;
                # if the matches are not number
                if ($matches  =~ /[^0-9]/){
                	# flag changes to 0
                    $match_number = 0;
                }
                # if the matches are numbers
                if ($match_number){
                	#  checking the line counter with the matches
                    if($line_number_counter != $matches){
                    	# printing
                        next;
                    }else{
                        # not printing
                        $string_needs_print = 0;
                    }
                }
                
                if($current_line !~ /$match_pattern/){
                	# format is not same
                    next;
                }else{
                	# format is same
                    $string_needs_print = 0;
                }
                
            }
            # checking 1 situation only d option in the command line
            if ( $command_in_list eq 'd'){ 
            	# only d -> no printing
                $string_needs_print = 0;
            }elsif( $command_in_list ne 'd'){
            	# has other sting in the command line
                ;
            }
            # This part of code is for -s option which are both in subset0 and subset1
            # Here is the format sample sXbbXbbX
            # This is similar to sed s///g
            # more info plz check: https://www.digitalocean.com/community/tutorials/the-basics-of-using-the-sed-stream-editor-to-manipulate-text-in-linux
           	$regrex_number_s = "([0-9]+)s(.)(.*)\2(.*)\2(g?)";
            if ($command_in_list =~ /\$regrex_number_s/){
                # Based on the if structure, cutting the following parts
                (my $number, my $item, my $string_in_replace, my $g_symbol) = ($1,$3,$4,$5);
                # checking the line number with the cutting number
                # Checking the number is same or not
                if ($line_number_counter != $number){
                    # not same
                    next;
                }else{
                   	# same
                    # notice checking whether there are g at the end
                    if (not $g_symbol){
                        # no g symbol at the end
                        $current_line =~ s#$item#$string_in_replace#;
                    }else{
                        # has g symbol at the end
                        $current_line =~ s#$item#$string_in_replace#g;
                    }
                }
            }
            # This situation option is similar to the previous one
            # THe previous match the digital numebr. This one match all characters
            $regrex_middle_s = "\/(.*?)\/s(.)(.*)\2(.*)\2(g?)";
            elsif ($command_in_list =~ /\$regrex_middle_s/){
                (my $number, my $item, my $string_in_replace, my $g_symbol) = ($1,$3,$4,$5);
                $match_pattern = qr/$number/;
                # Checking whether the string are matching
                if ( $current_line !~ /$match_pattern/){
                    next;
                }else{
                    if (not $g_symbol){
                        # no g symbol at the end
                        $current_line =~ s#$item#$string_in_replace#;
                    } else{
                        # has g symbol at the end
                        $current_line =~ s#$item#$string_in_replace#g;
                    }
                }
            }
            # This part is similar to the previous part
            # Difference no need doing comparison
            # Here is the difference between /1 and $1
            # Source: https://stackoverflow.com/questions/1068840/what-is-the-difference-between-1-and-1-in-a-perl-regex
            $regrex_with_3rd_situation = "s(.)(.*)\1(.*)\1(g?)";
            elsif ($command_in_list =~ /\$regrex_with_3rd_situation/){
                (my $item, my $string_in_replace, my $g_symbol) = ($2,$3,$4);
                
                    if (not $g_symbol){
                        # no g symbol at the end
                        $current_line =~ s#$item#$string_in_replace#;
                    } else{
                        # has g symbol at the end
                        $current_line =~ s#$item#$string_in_replace#g;
                    }
            }
            # This part is to checking s///g in the test case
            $regrex_with_slash = "s\/((.*)?)\/((.*)?)\/(g?)/";
            elsif ( $command_in_list =~ /\$regrex_with_slash/){
                (my $item, my $string_in_replace, my $g_symbol) = ($1,$2,$3);
                # print " *** $line $command_in_list ***\n";
                if (not $g_symbol){
                    # no g symbol at the end
                    $current_line =~ s/$item/$string_in_replace/;
                } else{
                    # has g symbol at the end
                    $current_line =~ s#$item#$string_in_replace#g;
                }
            }
        }
        if ($string_needs_print){
            if(!$checking_default){
                # Setting the printing line as the current line
                $print_line_string= $current_line;
            }else{
                # no need for printing -> pass
                ;
            }
        }

        # If the string need to print also needs to print again
        if ($string_needs_print_again){
            if($string_needs_print){
                # This is to print the result for another time
                print $current_line;
            }else{
                # no need for printing -> pass
                ;
            }
        }else{
            # no need for printing -> pass
            ;
        }
        # Counter adding 1
        $line_number_counter ++;
    }
    if( $command_line_t =~ /\$d/){
        # no need for printing -> pass
        ;
    }
    else{
        # printing the result
        print $print_line_string ;
    }
}

parse_arguments();
my $command;

# getopt::long is exists
if ($script_string_command){
    
    my @command_line_list=();
    open(my $stdin, '<', "$script_string_command") or die $!;
    foreach my $command_input (<$stdin>){
        push @command_line_list,$command_input;
    }
    # Using the ; to connect the string in the command list
    # Similar to python join
    # Source: https://www.geeksforgeeks.org/perl-join-function/
    $command = join(";",@command_line_list);

} else {
    # at here, we thought the command will be passed on command
    $command =shift @ARGV;
}
my @command_files = @ARGV;

# Here is similar to use \s in stead of the [\f\n\r\t\v]
$command =~ s/\s//g;

parse_command_line($command, @command_files);    
