#!/bin/sh
cut -d'|' -f2 | sort | uniq -c | sort -k1,1 sed "s/^.*[0-9].//g"