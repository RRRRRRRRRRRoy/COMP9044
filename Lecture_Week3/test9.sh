#!/bin/sh

url='https://webcms3.cse.unsw.edu.au/COMP9517/21T1/'
while test $(curl -s "$url"|grep COMP9044|sed 's?</td>.*?? ; s/.*>//') -eq 0
do
    echo -n .
    sleep 1
done

echo enroll COMP9044 has vacancies