#!/usr/bin/perl -w

# function name
$speed_perl = $0;
# Create the usage function for speed
sub usage_speed {
    # This format is the nomal format for a function
    # notice here is speed-command not sed-command
    print "usage: $speed_perl [-f <script-file] [speed-command] <files> \n";
    exit 0;
}

# Testing the usage_speed function
# usage_speed();

# Reading the string by using GETOPT::LONG
# This can read several types of string
# Source: https://www.perl.com/article/195/2015/10/21/Professional-scripts-are-a-snap-with-Getopt-Long/
use Getopt::Long;
my $no_default_setting="No default";
# checking whether there is other situation of -
my $string_cmd;
sub parse_arguments {
    # The parameter of LONG::Configure
    # Source: https://perldoc.perl.org/Getopt::Long
    # Automatically provide support for the --version option if the application did not specify a handler for this option itself.
    # With pass_through anything that is unknown, ambiguous or supplied with an invalid option will not be flagged as an error.
    Getopt::Long::Configure( 'auto_version', 'pass_through', 'permute', 'no_ignore_case' );
    GetOptions('nd|no-default'=>\$no_default_setting,
               'c|command=s'=>\$string_cmd,
               'help|usage' => \&usage_speed,
    ) or usage_speed();
}

parse_arguments();
if($no_default_setting){
    print "test nd : $no_default_setting\n"; 
}
if($string_cmd){
    print "test str_cmd: $string_cmd";
}
if(!$string_cmd or !$no_default_setting){
    if( @ARGV ne "") {
        my $command_line = shift @ARGV;
        print "$command_line";
    }
}
