#!/bin/dash

# This shell is for testing the input files options in the ass2
# This script is written on macos Therefore, using perl speed.pl to run
# If one case is fail exit 1 printing fail
# If all cases pass printing pass exit 0

# The code structure of test script are similar!

# Test ' 3, 15  d  # delete; 3 q   # quit'
launch_1=$(seq 1 20 | perl speed.pl ' 3, 15  d  # delete; 3 q   # quit');
correct_answer_1='33 34 35';
checking_answer_1=$(echo $launch_1);

echo "TEST_commentandspace_1: seq 1 20 | perl speed.pl ' 3, 15  d  # delete; 3 q   # quit' "
if [ "$correct_answer_1" == "$checking_answer_1" ]; 
then
  echo "TEST_commentandspace_files_1: PASS the test case ^_^!";
elif [ "$correct_answer_1" != "$checking_answer_1" ];
then
  echo "TEST_commentandspace_files_1: FAIL the test case T_T!";
  exit 1;
fi
