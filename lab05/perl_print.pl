#!/usr/bin/perl -w

# This question is to write a perl program
# THis program can run perl program
# perl(perl(print))

# The kind of the perl program
# How to understanding the meaning of =~
# Source: https://stackoverflow.com/questions/10405868/what-does-mean-in-perl
print "#!/usr/bin/perl -w\n";
$input=$ARGV[0];
# check the double quotes
if($input =~ /\"/){
    $double_quotes = $input;
    # Use s///g to do the replacement
    # Source: https://perldoc.perl.org/perlrequick
    $double_quotes =~ s/\"/\\"/g;
    print "print \"$double_quotes\n\";";
}
# check the backslash
elsif($input =~ /\\/){
    $backslash = $input;
    # Use s///g to do the replacement
    # Source: https://perldoc.perl.org/perlrequick
    $backslash =~ s/\\/\\\\/g;
    print "print \"$backslash\\n\";";
}
# print the string
else{
    print "print \"$input\\n\";";
}
