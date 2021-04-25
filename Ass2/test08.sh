#!/bin/dash

# This shell is for testing the input files options in the ass2
# This script is written on macos Therefore, using perl speed.pl to run
# If one case is fail exit 1 printing fail
# If all cases pass printing pass exit 0

# The code structure of test script are similar!

seq 1 10 > ten.txt
seq 20 100 > eighty.txt
 
# Test input_files perl speed.pl '20q;8p;/2/d' ten.txt eighty.txt
launch_1=$(perl speed.pl '20q;8p;/2/d' ten.txt eighty.txt);
correct_answer_1='1 3 4 5 6 7 8 8 9 10 29';
checking_answer_1=$(echo $launch_1);

echo "TEST_input_files_1: perl speed.pl '20q;8p;/2/d' ten.txt eighty.txt "
if [ "$correct_answer_1" == "$checking_answer_1" ]; 
then
  echo "TEST_input_files_1: PASS the test case ^_^!";
elif [ "$correct_answer_1" != "$checking_answer_1" ];
then
  echo "TEST_input_files_1: FAIL the test case T_T!";
  exit 1;
fi
