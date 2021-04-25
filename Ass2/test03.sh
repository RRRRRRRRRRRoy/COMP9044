#!/bin/dash

# This shell is for testing the s options in the ass2
# This script is written on macos Therefore, using perl speed.pl to run
# If one case is fail exit 1 printing fail
# If all cases pass printing pass exit 0

# The code structure of test script are similar!
# Test 's/[78]/zzz/'
launch_1=$(seq 6 9|perl speed.pl 's/[78]/zzz/');
correct_answer_1='6 zzz zzz 9';
checking_answer_1=$(echo $launch_1);

echo "TEST_s_1: seq 6 9|perl speed.pl 's/[78]/zzz/' "
if [ "$correct_answer_1" == "$checking_answer_1" ]; 
then
  echo "TEST_s_1: PASS the test case ^_^!";
elif [ "$correct_answer_1" != "$checking_answer_1" ];
then
  echo "TEST_s_1: FAIL the test case T_T!";
  exit 1;
fi

echo "\n";

# Test 's/10/zzz/'
launch_2=$(seq 100 110|perl speed.pl 's/10/zzz/');
correct_answer_2='zzz0 zzz1 zzz2 zzz3 zzz4 zzz5 zzz6 zzz7 zzz8 zzz9 1zzz';
checking_answer_2=$(echo $launch_2);

echo "TEST_s_2: seq 100 110|perl speed.pl 's/10/zzz/' "
if [ "$correct_answer_2" == "$checking_answer_2" ]; 
then
  echo "TEST_s_2: PASS the test case ^_^!"
elif [ "$correct_answer_2" != "$checking_answer_2" ];
then
  echo "TEST_s_2: FAIL the test case T_T!"
  exit 1;
fi

echo "\n";

# Test 's/o/OOOOOO/g'
launch_3=$(echo Hello, I am Roy | perl speed.pl 's/o/OOOOOO/g');
correct_answer_3='HellOOOOOO, I am ROOOOOOy';
checking_answer_3=$(echo $launch_3);

echo "TEST_s_3: echo Hello, I am Roy | perl speed.pl 's/o/OOOOOO/g' "
if [ "$correct_answer_3" == "$checking_answer_3" ]; 
then
  echo "TEST_s_3: PASS the test case ^_^!"
  exit 0;
elif [ "$correct_answer_3" != "$checking_answer_3" ];
then
  echo "TEST_s_3: FAIL the test case T_T!"
  exit 1;
fi