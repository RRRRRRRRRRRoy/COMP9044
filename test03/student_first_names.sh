#!/bin/sh
cut -d'|' -f3 | egrep  "^, [a-zA-Z]* $" 