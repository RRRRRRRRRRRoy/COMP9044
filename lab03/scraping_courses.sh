#!/bin/sh

if test $# -ne  2
then
    echo "Usage: $0 <year> <course-prefix>" 1>&2
    exit 1
fi

if test $1 -lt 2019 2>/dev/null && test $1 -gt 2021 2>/dev/null
then
    echo "$0: argument 1 must be an integer between 2019 and 2021"
    exit 1
fi

year=$1
code=$2
 
undergraduate='https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:$code*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0'
postgraduate='https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:$code*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0'

curl -sL $undergraduate $postgraduate | jq '.contentlets[] |.code + .title'
