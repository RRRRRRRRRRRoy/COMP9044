#!/bin/sh

# check the input value number is 2
if test $# -lt  2 || test $# -gt 2
then
    echo "Usage: $0 <year> <course-prefix>" 1>&2
    exit 1
fi

# getting the number doing the following check
filename=$0
input_year=$1
input_code=$2

# The meaning 1>&2 and 2>/dev/null
# Source: https://askubuntu.com/questions/350208/what-does-2-dev-null-mean
if [[ $(echo $input_year | bc) -ne $input_year ]] 2>/dev/null
then
    echo "$filename: argument 1 must be an integer between 2019 and 2021" 1>&2
    exit 1

# Filter the bad input COMP COMP which will cause the wrong output
elif test $input_year -ge 2019 2>/dev/null && test $input_year -le 2021 2>/dev/null
then
    :

else
    echo "$filename: argument 1 must be an integer between 2019 and 2021" 1>&2
    exit 1
fi

year=$input_year
code=$input_code

# Copy the url from the website
undergraduate_current="https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:$code*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"
postgraduate_current="https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:$code*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0"

# '.contentlets[] |.code + " " + .title' is from https://jqplay.org
# By testing the data can finally get the output code and title
# Copy the data and input "".contentlets[].code + " " + .contentlets[].title"
# can get the filter result
# Source: https://jqplay.org

# How to use curl
# Source: https://curl.se/docs/httpscripting.html
curl -sL $undergraduate_current $postgraduate_current |2041 jq '.contentlets[] |.code + " " + .title'| sed "s/\"//g" | sort -k1,1 | uniq

