#!/bin/sh

if test $# -ne  2
then
    echo "Usage: $0 <year> <course-prefix>" 1>&2
    exit 1
fi

if [[ $(echo $1 | bc) -ne $1 ]] 2>/dev/null
then
    echo "$0: argument 1 must be an integer between 2019 and 2021" 1>&2
    exit 1


elif test $1 -ge 2019 && test $1 -le 2021
then
    :

else
    echo "$0: argument 1 must be an integer between 2019 and 2021"
    exit 1
fi

year=$1
code=$2
 
undergraduate="https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:$code*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"
postgraduate="https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:$code*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"

curl -sL $undergraduate $postgraduate |2041 jq '.contentlets[] |.code + " " + .title'| sed "s/\"//g" | sort |uniq
