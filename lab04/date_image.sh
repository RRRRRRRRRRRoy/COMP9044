#!/bin/dash

# exercise 3 date image in lab04

for img in "$@"
do
    # using awk to re-arrange the sequence of the time stamp
    # Source: https://www.howtogeek.com/562941/how-to-use-the-awk-command-on-linux/
    text=$(ls -l "$img" | tr -s ' ' | cut -d' ' -f6-8|awk '{print $2,$1,$3}')
    test_output="Q3_output.jpg"
    # The output of question is Q3_output.jpg
    # This command is copied from CS2041 Website
    # Source: https://cgi.cse.unsw.edu.au/~cs2041/21T1/lab/04/questions
    convert -gravity south -pointsize 36 -draw "text 0,10 '$text'" "$img" "$test_output"
    
done