#!/usr/bin/perl -w

# This question is to write a perl program
# THis program can run perl program
# perl(perl(print))

# The kind of the perl program
# How to understanding the meaning of =~
# Source: https://stackoverflow.com/questions/10405868/what-does-mean-in-perl
print "#!/usr/bin/perl -w\n";
$input=$ARGV[0];
if($input =~ /\"/){
    $temp = $input;
    $a =~ s/"/\\"/g;
    print "print \"$a\\n\";";
}
if($input =~ /\\/){
    $temp = $input;
    $temp =! s/\\/\\\\/g;
    print "print \"$temp\\n\";"
}
print "print \"$input\\n\";";