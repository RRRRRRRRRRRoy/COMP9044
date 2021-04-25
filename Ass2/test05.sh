#!/bin/dash

# This shell is for testing the s options in the subset1 ass2
# This script is written on macos Therefore, using perl speed.pl to run
# If one case is fail exit 1 printing fail
# If all cases pass printing pass exit 0

# The code structure of test script are similar!
# Test -n 'sX[23]XzzzX'
launch_1=$(seq 11 20|perl speed.pl 'sX[23]XzzzX');
correct_answer_1='11 1zzz 1zzz 14 15 16 17 18 19 zzz0';
checking_answer_1=$(echo $launch_1);

echo "TEST_s_1: seq 11 20|perl speed.pl 'sX[23]XzzzX' "
if [ "$correct_answer_1" == "$checking_answer_1" ]; 
then
  echo "TEST_s_1: PASS the test case ^_^!";
elif [ "$correct_answer_1" != "$checking_answer_1" ];
then
  echo "TEST_s_1: FAIL the test case T_T!";
  exit 1;
fi

echo "\n";

# Test -n 's?[56]?zzz?'
launch_2=$(seq 11 25 | perl speed.pl 's?[56]?zzz?');
correct_answer_2='11 12 13 14 1zzz 1zzz 17 18 19 20 21 22 23 24 2zzz';
checking_answer_2=$(echo $launch_2);

echo "TEST_s_2: seq 11 25 | perl speed.pl 's?[56]?zzz?' "
if [ "$correct_answer_2" == "$checking_answer_2" ]; 
then
  echo "TEST_s_2: PASS the test case ^_^!"
elif [ "$correct_answer_2" != "$checking_answer_2" ];
then
  echo "TEST_s_2: FAIL the test case T_T!"
  exit 1;
fi

echo "\n";

# Test 's#[45]#Roy/rOy/roY#'
launch_3=$(seq 11 17 | perl speed.pl 's#[45]#Roy/rOy/roY#');
correct_answer_3='11 12 13 1Roy/rOy/roY 1Roy/rOy/roY 16 17';
checking_answer_3=$(echo $launch_3);

echo "TEST_s_3: seq 11 17 | perl speed.pl 's#[45]#Roy/rOy/roY#' "
if [ "$correct_answer_3" == "$checking_answer_3" ]; 
then
  echo "TEST_s_3: PASS the test case ^_^!"
  exit 0;
elif [ "$correct_answer_3" != "$checking_answer_3" ];
then
  echo "TEST_s_3: FAIL the test case T_T!"
  exit 1;
fi