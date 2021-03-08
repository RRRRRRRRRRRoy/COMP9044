#!/bin/sh
cut -d'|' -f2-3 | sort -k1,1 | uniq | cut -d" " -f2,2 | sort -k1,1