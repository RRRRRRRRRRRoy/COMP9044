#!/bin/dash

sh ./girt-init
sh ./girt-commit -a -m "0 commit: testing nothing"
sh ./girt-add 
echo RRRRRRR > a
seq 1 15 > b
sh ./girt-add a b
sh ./girt-commit -m "1 commit: commit a b"
sh ./girt-branch b1
sh ./girt-checkout b1
echo ddddddd> d
sh ./girt-add d
sh ./girt-commit -a -m "2 commit: commit d"
sh ./girt-log
sh ./girt-status
sh ./girt-rm a
seq 6 12 > c
sh ./girt-add c
sh ./girt-rm c
sh ./girt-commit -m "3 commit: commit c"
sh ./girt-log
sh ./girt-status