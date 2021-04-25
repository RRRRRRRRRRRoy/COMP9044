#!/bin/dash

# This shell is for testing the p options in the ass2
# This script is written on macos Therefore, using perl speed.pl to run
# If one case is fail exit 1 printing fail
# If all cases pass printing pass exit 0

# Test 4p
launch_1=$(seq 5 15|perl speed.pl '4p');
correct_answer_1='5 6 7 8 8 9 10 11 12 13 14 15';
checking_answer_1=$(echo $launch_1);

echo "TEST_p_1: seq 5 15|perl speed.pl '4p' "
if [ "$correct_answer_1" == "$checking_answer_1" ]; 
then
  echo "TEST_p_1: PASS"
else
  echo "TEST_p_1: FAIL"
  exit 1;
fi

echo "\n";

# Test /3$/p
launch_2=$(seq 50 66|perl speed.pl '/3$/p');
correct_answer_2='50 51 52 53 53 54 55 56 57 58 59 60 61 62 63 63 64 65 66';
checking_answer_2=$(echo $launch_2);

echo "TEST_p_2: seq 50 66|perl speed.pl '/3$/p "
if [ "$correct_answer_2" == "$checking_answer_2" ]; 
then
  echo "TEST_p_2: PASS"
else
  echo "TEST_p_2: FAIL"
  exit 1;
fi

echo "\n";

# Test p only
launch_3=$(seq 15 20|perl speed.pl 'p');
correct_answer_3='15 15 16 16 17 17 18 18 19 19 20 20';
checking_answer_3=$(echo $launch_3);

echo "TEST_p_3: seq 15 20|perl speed.pl 'p' "
if [ "$correct_answer_3" == "$checking_answer_3" ]; 
then
  echo "TEST_p_3: PASS"
  exit 0;
else
  echo "TEST_p_3: FAIL"
  exit 1;
fi