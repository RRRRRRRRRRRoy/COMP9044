#!/bin/sh
cut -d'|' -f3 | cut -d' ' -f2 | sort | uniq -c | sort -n | tail -1| sed "s/^.*[0-9].//g"


