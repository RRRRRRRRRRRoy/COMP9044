#!/bin/dash

launch_1=$(seq 671 3999|perl speed.pl '8q');
correct_answer_1='671 672 673 674 675 676 677 678';
checking_answer_1=$(echo $launch_1);

echo "TEST_q_1: seq 671 3999|perl speed.pl '8q' "
if [ "$correct_answer_1" == "$checking_answer_1" ]; 
then
  echo "TEST_q_1: PASS"
else
  echo "TEST_q_1: FAIL"
  exit 1;
fi

echo "\n";

launch_2=$(seq 10 33|perl speed.pl '/.6/q');
correct_answer_2='10 11 12 13 14 15 16';
checking_answer_2=$(echo $launch_2);

echo "TEST_q_2: seq 10 33|perl speed.pl '/.6/q' "
if [ "$correct_answer_2" == "$checking_answer_2" ]; 
then
  echo "TEST_q_2: PASS"
else
  echo "TEST_q_2: FAIL"
  exit 1;
fi


echo "\n";

launch_3=$(seq 300 999 | perl speed.pl '/^3.5$/q');
correct_answer_3='300 301 302 303 304 305';
checking_answer_3=$(echo $launch_3);

echo "TEST_q_3: seq 300 999 | perl speed.pl '/^3.5$/q' "
if [ "$correct_answer_3" == "$checking_answer_3" ]; 
then
  echo "TEST_q_3: PASS"
else
  echo "TEST_q_3: FAIL"
  exit 1;
fi


echo "\n";

launch_4=$(seq 760 9999 | perl speed.pl '/7{3}/q');
correct_answer_4='760 761 762 763 764 765 766 767 768 769 770 771 772 773 774 775 776 777';
checking_answer_4=$(echo $launch_4);

echo "TEST_q_4: seq 760 9999 | perl speed.pl '/7{3}/q' "
if [ "$correct_answer_4" == "$checking_answer_4" ]; 
then
  echo "TEST_q_4: PASS"
else
  echo "TEST_q_4: FAIL"
  exit 1;
fi

echo "\n";

launch_5=$(seq 66 77 | perl speed.pl 'q');
correct_answer_5='66 67 68 69 70 71 72 73 74 75 76 77';
checking_answer_5=$(echo $launch_5);

echo "TEST_q_5: seq 66 77 | perl speed.pl 'q' "
if [ "$correct_answer_5" == "$checking_answer_5" ]; 
then
  echo "TEST_q_5: PASS"
  exit 0;
else
  echo "TEST_q_5: FAIL"
  exit 1;
fi