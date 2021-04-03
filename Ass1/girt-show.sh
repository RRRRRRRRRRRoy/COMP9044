#!/bin/dash
#!/usr/bin/env dash

# checking the .girt is exist or not
# copy girt-commit.sh checking the .girt
if ! test -d .girt/
then
    # Do not forget to change to girt-show function
    echo "girt-show: error: no .girt directory containing girt repository exists";
    exit 1;
fi