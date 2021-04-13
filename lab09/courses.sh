#!/bin/sh 


# Source: https://cgi.cse.unsw.edu.au/~cs2041/21T1/lab/09/questions
UNSW_COURSETABLE="http://timetable.unsw.edu.au/2020/$1KENS.html"

major=$1
# This part of code is modified from the the following links
# SOurce: https://cgi.cse.unsw.edu.au/~cs2041/21T1/lab/09/questions
# curl --location --silent http://www.timetable.unsw.edu.au/current/COMPKENS.html|head
# adding the sort and uniq to clean the online data
# How to hide curl output
# Source: https://unix.stackexchange.com/questions/196549/hide-curl-output
curl --location --silent $UNSW_COURSETABLE | sort | uniq | while read line
do
    match_string=$(echo $line|egrep "^ *<td class=\"data\">.*\"$major[\d+]*.*\">.*</a></td>"|egrep -v ".*$major[\d+]*.*$major[\d+]*")
    echo $match_string
    if $match_string == ""
    then
        # no matches have been found
        :
    else
        # finding matches cutting the data
    fi
done
