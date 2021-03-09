#!/bin/sh
cut -d'|' -f2 | sort | uniq -c  | egrep -i "^.*(1|[2-9]).$"