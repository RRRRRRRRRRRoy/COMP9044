#!/bin/sh 

major=$1
# Source: https://cgi.cse.unsw.edu.au/~cs2041/21T1/lab/09/questions
UNSW_COURSETABLE="http://timetable.unsw.edu.au/2020/"$major"KENS.html"


# This part of code is modified from the the following links
# SOurce: https://cgi.cse.unsw.edu.au/~cs2041/21T1/lab/09/questions
# curl --location --silent http://www.timetable.unsw.edu.au/current/COMPKENS.html|head
# adding the sort and uniq to clean the online data
# How to hide curl output
# Source: https://unix.stackexchange.com/questions/196549/hide-curl-output
curl --location --silent $UNSW_COURSETABLE | sort | uniq | while read line
do
    # Inverse matching Selected lines are those not matching any of the specified patterns.
    # Source: https://www.unix.com/unix-for-dummies-questions-and-answers/115385-grep-v-option.html
    # match_string=$(echo $line|egrep "^ *<td class=\"data\">.*\"$major[[0-9]+]*.*\">.*</a></td>"|egrep -v ".*$major[[0-9]+]*.*$major[[0-9]+]*")
    match_string=`echo $line|egrep "^ *<td class=\"data\">.*\"$1[0-9]*.*\">.*</a></td>"|egrep -v ".*$1[0-9]*.*$1[0-9]*"`;
    # checking the brief structure of the online data
    # echo $match_string
    if [ "$match_string" == "" ]
    then
        :
    else
        # finding matches cutting the data
        course_info=$(echo $match_string|sed "s/.*\($major[0-9][0-9][0-9][0-9]*\)\.html[^>]*> *\([^<]*\).*/\1 \2/")
		echo $course_info
    fi
done

