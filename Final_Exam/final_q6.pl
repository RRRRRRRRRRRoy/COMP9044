#!/usr/bin/perl -w

while($line=<STDIN>){
    $separator = "\|";
    @ls_line = split(/\|/, $line);
    # print $ls_line;
    $name = $ls_line[2];
    # print $name;
    $separator = ', ';
    @name_list = split(/$separator/, $name);
    $firstname = $name_list[0];
    $lastname = $name_list[1];
    #print $lastname;
    #print $firstname;
    while($lastname =~ / $/){
        $regrex = ' $';
        $lastname =~ s/$regrex//;
    }
    # Swapping the name in the list
    $line =~ s/$firstname, $lastname/$lastname $firstname/;
    print $line;
}