#!/bin/sh

url="https://cgi.cse.unsw.edu.au/~cs2041/21T1/flask.cgi//web/cs2041/21T1"
while curl -s "$url"|grep COMP2041
do
    echo "."
done