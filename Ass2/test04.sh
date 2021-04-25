#!/bin/dash

# This shell is for testing the -n and address options in the ass2
# This script is written on macos Therefore, using perl speed.pl to run
# If one case is fail exit 1 printing fail
# If all cases pass printing pass exit 0

# The code structure of test script are similar!
# Test -n '/6$/p'
launch_1=$(seq 10 40|perl speed.pl -n '/6$/p');
correct_answer_1='16 26 36';
checking_answer_1=$(echo $launch_1);

echo "TEST_n_1: seq 10 40|perl speed.pl -n '/6$/p' "
if [ "$correct_answer_1" == "$checking_answer_1" ]; 
then
  echo "TEST_n_1: PASS the test case ^_^!";
elif [ "$correct_answer_1" != "$checking_answer_1" ];
then
  echo "TEST_n_1: FAIL the test case T_T!";
  exit 1;
fi

echo "\n";

# Test -n '/^77/p'
launch_2=$(seq 100 1000|perl speed.pl -n '/^77/p');
correct_answer_2='770 771 772 773 774 775 776 777 778 779';
checking_answer_2=$(echo $launch_2);

echo "TEST_n_2: seq 100 1000|perl speed.pl -n '/^77/p' "
if [ "$correct_answer_2" == "$checking_answer_2" ]; 
then
  echo "TEST_n_2: PASS the test case ^_^!"
elif [ "$correct_answer_2" != "$checking_answer_2" ];
then
  echo "TEST_n_2: FAIL the test case T_T!"
  exit 1;
fi

echo "\n";

# Test '$d'
launch_3=$(seq 27 37 | perl speed.pl '$d');
correct_answer_3='27 28 29 30 31 32 33 34 35 36';
checking_answer_3=$(echo $launch_3);

echo "TEST_address_3: seq 27 37 | perl speed.pl ($)d "
if [ "$correct_answer_3" == "$checking_answer_3" ]; 
then
  echo "TEST_address_3: PASS the test case ^_^!"
  exit 0;
elif [ "$correct_answer_3" != "$checking_answer_3" ];
then
  echo "TEST_address_3: FAIL the test case T_T!"
  exit 1;
fi