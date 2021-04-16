#!/bin/sh 

major=$1
# Source: https://cgi.cse.unsw.edu.au/~cs2041/21T1/lab/09/questions
UNSW_COURSETABLE="http://timetable.unsw.edu.au/current/"$major"KENS.html"

# <td class="data"><a href="VISN1101.html">Seeing the World: Perspectives from Vision Science</a></td>
# <td class="data"><a href="VISN1111.html">Geometrical and Physical Optics</a></td>
# <td class="data"><a href="VISN1221.html">Visual Optics</a></td>
# <td class="data"><a href="VISN2111.html">Ocular Anatomy and Physiology</a></td>

# This part of code is modified from the the following links
# SOurce: https://cgi.cse.unsw.edu.au/~cs2041/21T1/lab/09/questions
# curl --location --silent http://www.timetable.unsw.edu.au/current/COMPKENS.html|head
# adding the sort and uniq to clean the online data
# How to hide curl output
# Source: https://unix.stackexchange.com/questions/196549/hide-curl-output
curl --location --silent $UNSW_COURSETABLE | sort -r | uniq | sort| while read line
do
    # The briefly structure is similar to the HTML structure
    # egrep -v
    # Source: https://www.unix.com/unix-for-dummies-questions-and-answers/115385-grep-v-option.html
    # The course number is COMP9044 which has 4 numbers
    match_string=$(echo $line|egrep "^.*<.*>.*($major[\d+]).*>.*<.*>"|egrep -v ".*($major[\d+]).*($major[\d+])")
    # checking the brief structure of the online data
    # echo $match_string
    if [ "$match_string" == "" ]
    then
        :
    else
        # finding matches cutting the data
        course_info=$(echo $match_string|sed "s/.*\($major[\d+]\)\.html[^>]*> *\([^<]*\).*/\1 \2/")
		echo $course_info
    fi
done

