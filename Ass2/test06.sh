#!/bin/dash

# This shell is for testing the multiple line options in the ass2
# This script is written on macos Therefore, using perl speed.pl to run
# If one case is fail exit 1 printing fail
# If all cases pass printing pass exit 0

# The code structure of test script are similar!
# Test '3q;/1/d;2p'
launch_1=$(seq 92 9999 | perl speed.pl '3q;/1/d;2p');
correct_answer_1='93 93 94';
checking_answer_1=$(echo $launch_1);

echo "TEST_multiple_1: seq 92 9999 | perl speed.pl '3q;/1/d;2p' "
if [ "$correct_answer_1" == "$checking_answer_1" ]; 
then
  echo "TEST_multiple_1: PASS the test case ^_^!";
elif [ "$correct_answer_1" != "$checking_answer_1" ];
then
  echo "TEST_multiple_1: FAIL the test case T_T!";
  exit 1;
fi

echo "\n";

# Test '/5/d;sX[1]Xz5241868RoyX;3q'
launch_2=$(seq 11 25 | perl speed.pl '/5/d;sX[1]Xz5241868RoyX;3q');
correct_answer_2='z5241868Roy1 z5241868Roy2 z5241868Roy3';
checking_answer_2=$(echo $launch_2);

echo "TEST_multiple_2: seq 11 25 | perl speed.pl '/5/d;sX[1]Xz5241868RoyX;3q' "
if [ "$correct_answer_2" == "$checking_answer_2" ]; 
then
  echo "TEST_multiple_2: PASS the test case ^_^!"
  exit 0;
elif [ "$correct_answer_2" != "$checking_answer_2" ];
then
  echo "TEST_multiple_2: FAIL the test case T_T!"
  exit 1;
fi