#!/bin/dash

# create the dir call girt
if [ -d ".girt" ]
then
    echo "girt-init: error: .girt already exist"
	exit 1
fi