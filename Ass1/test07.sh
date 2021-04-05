#!/bin/dash

sh ./girt-init
sh ./girt-branch a1
sh ./girt-checkout a1
echo z5241868 > a
sh ./girt-add a
sh ./girt-commit -m "1 st: commit a"
sh ./girt-log
sh ./girt-status
echo COMP9044 >> a
sh ./girt-commit -a -m "2 st: commit new a"
seq 1 11 > a
sh ./girt-add a
sh ./girt-commit -m "3 rd: commit sequence a"
sh ./girt-log
sh ./girt-status
sh ./girt-merge a1 -m 'merging branch a1'
sh ./girt-log
sh ./girt-status
