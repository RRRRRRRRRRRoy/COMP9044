#!/bin/dash

# This shell is for testing the d options in the ass2
# This script is written on macos Therefore, using perl speed.pl to run
# If one case is fail exit 1 printing fail
# If all cases pass printing pass exit 0

# Test 4p
launch_1=$(seq 6 22|perl speed.pl '1,7d');
correct_answer_1='13 14 15 16 17 18 19 20 21 22';
checking_answer_1=$(echo $launch_1);

echo "TEST_d_1: seq 6 22|perl speed.pl '1,7d' "
if [ "$correct_answer_1" == "$checking_answer_1" ]; 
then
  echo "TEST_d_1: PASS"
else
  echo "TEST_d_1: FAIL"
  exit 1;
fi

echo "\n";

# Test /3$/p
launch_2=$(seq 1 20|perl speed.pl '5,/19/d');
correct_answer_2='1 2 3 4 20';
checking_answer_2=$(echo $launch_2);

echo "TEST_d_2: seq 1 20|perl speed.pl '5,/19/d' "
if [ "$correct_answer_2" == "$checking_answer_2" ]; 
then
  echo "TEST_d_2: PASS"
else
  echo "TEST_d_2: FAIL"
  exit 1;
fi

echo "\n";

# Test p only
launch_3=$(seq 90 110 | perl speed.pl '/10/,4d');
correct_answer_3='90 91 92 93 94 95 96 97 98 99';
checking_answer_3=$(echo $launch_3);

echo "TEST_d_3: seq 90 110 | perl speed.pl '/10/,4d' "
if [ "$correct_answer_3" == "$checking_answer_3" ]; 
then
  echo "TEST_d_3: PASS"
  exit 0;
else
  echo "TEST_d_3: FAIL"
  exit 1;
fi