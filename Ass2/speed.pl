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

usage_speed();