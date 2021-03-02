#!/bin/sh

if test $# -eq 2
then
    first=$1
    last=$2
else
    echo "Usage: $0 <first> <finish>"
    exit 1
fi

i="$first"
while test "$i" -le "$last"
do
    echo "$i"
    i=$((i+1))
done