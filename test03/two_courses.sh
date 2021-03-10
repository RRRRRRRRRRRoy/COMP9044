#!/bin/sh
cut -d'|' -f2,2 | sort | uniq -c  |sort -k1,1| egrep ' 2 [0-9]*' | tr -s " " | cut -d' ' -f3,3 | sort -k1,1
