#!/bin/sh

if test $# -ne  2
then
    echo "Usage: scraping_courses.sh <year> <course-prefix>" 1>&2
    exit 1
fi

if test $1 -gt 2021 && test $1 -lt 2019
then
    echo "scraping_courses.sh: argument 1 must be an integer between 2019 and 2021"
    exit 1
fi