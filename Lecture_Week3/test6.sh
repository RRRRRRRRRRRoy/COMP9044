#!/bin/sh

if test $# -eq 2
then
    first=$1
    last=$2
elif test $# -eq 1
then
    first=1
    last=$1
else
    echo "Usage: $0 <first> <finish> or $0 <finish>" 1>&2
    exit 1
fi

i="$first"
while ((i < last))
do
    echo "$i"
    i=$((i + 1))
done