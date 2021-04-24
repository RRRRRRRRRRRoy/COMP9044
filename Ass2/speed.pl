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
    GetOptions( 'help|usage'=>\&usage_speed,
                'f=s'=>\$script_string_command,
                'n'=>\$checking_default,  
    );
}



# This part of code is for local test
# parse_arguments();
# if($checking_default){
#     print "test nd : $checking_default\n"; 
# }
# if($script_string_command){
#     print "test str_cmd: $script_string_command";
# }
# if(!$script_string_command or !$checking_default){
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
    my $regrex_subset0 = "p|q|s|d"
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
        if( $line_number_counter == 1){
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
                # 2 situation needs to print again
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
            if ($command_in_list =~ /,/){
                if($command_in_list =~ /(.*?),(.*?)d/){
                    #print "At here\n";
                    (my $addresses_1,my $addresses_2) = ($1,$2);
                    #my $addresses_2 = $2;
                    (my $addresses1_pointer,my $addresses2_pointer) = (0,0);
                    if ($addresses_1 =~ /[0-9]+$/){
                        $addresses1_pointer = 1;
                    }
                    if ($addresses_2 =~ /[0-9]+$/){
                        $addresses2_pointer = 1;
                    }
                
                    if ($addresses1_pointer){
                        ;
                    }else{
                        $addresses_1 = substr($addresses_1,1,-1);
                        $addresses_1 = qr/$addresses_1/;
                    }

        }
    }
}
