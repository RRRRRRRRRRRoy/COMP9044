#!/bin/dash

# This shell is for testing the -f options in the ass2
# This script is written on macos Therefore, using perl speed.pl to run
# If one case is fail exit 1 printing fail
# If all cases pass printing pass exit 0

# The code structure of test script are similar!

echo 5q > test07.speed
echo /4/d >> test07.speed
echo 3p >> test07.speed

# Test -f test07.speed
launch_1=$(seq 13 22 | perl speed.pl -f test07.speed);
correct_answer_1='13 14 15 15 17';
checking_answer_1=$(echo $launch_1);

echo "TEST_f_1: seq 13 22 | perl speed.pl -f test07.speed "
if [ "$correct_answer_1" == "$checking_answer_1" ]; 
then
  echo "TEST_f_1: PASS the test case ^_^!";
elif [ "$correct_answer_1" != "$checking_answer_1" ];
then
  echo "TEST_f_1: FAIL the test case T_T!";
  exit 1;
fi

echo "\n";



echo 9d > test07_2.speed
echo 7p > test07_2.speed

# Test -f test07_2.speed
launch_2=$(seq 11 21 | perl speed.pl -f test07_2.speed);
correct_answer_2='11 12 13 14 15 16 17 17 18 19 20 21';
checking_answer_2=$(echo $launch_2);

echo "TEST_f_2: seq 11 21 | perl speed.pl -f test07_2.speed "
if [ "$correct_answer_2" == "$checking_answer_2" ]; 
then
  echo "TEST_f_2: PASS the test case ^_^!"
  exit 0;
elif [ "$correct_answer_2" != "$checking_answer_2" ];
then
  echo "TEST_f_2: FAIL the test case T_T!"
  exit 1;
fi