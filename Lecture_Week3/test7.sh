#!/bin/sh

case $# in
2)
    first=$1
    last=$2
    ;;
1)
    first=1
    last=$1
    ;;
0)
    echo "Usage: $0 <first> <finish> or $0 <finish>" 1>&2
    exit
esac

i="$first"
while ((i < last))
do
    echo "$i"
    i=$((i + 1))
done
