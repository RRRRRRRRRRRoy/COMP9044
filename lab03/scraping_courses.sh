#!/bin/sh

if test $# -ne  2
then
    echo "Usage: $0 <year> <course-prefix>" 1>&2
    exit 1
fi

filename=$0
input_year=$1
input_code=$2

if [[ $(echo $input_year | bc) -ne $input_year ]] 2>/dev/null
then
    echo "$filename: argument 1 must be an integer between 2019 and 2021" 
    exit 1


elif test $input_year -ge 2019 2>/dev/null && test $input_year -le 2021 2>/dev/null
then
    :

else
    echo "$filename: argument 1 must be an integer between 2019 and 2021"
    exit 1
fi

year=$input_year
code=$input_code
 
undergraduate="https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:$code*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"
postgraduate="https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:$code*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"

curl -sL $undergraduate $postgraduate |2041 jq '.contentlets[] |.code + " " + .title'| sed "s/\"//g" | sort -k1,1 | uniq

