#!/bin/dash

sh ./girt-init
sh ./girt-branch 111
sh ./girt-checkout 111
sh ./girt-branch crab
sh ./girt-checkout crab
echo codeOncrab > a
sh ./girt-add a
sh ./girt-commit -m "1 st: commit a"
echo testnewb > b
echo modifya >> a
sh ./girt-add b
sh ./girt-commit -a -m "2 nd: commit a b"
sh ./girt-rm a
sh ./girt-status
sh ./girt-merge crab -m 'merging branch crab'
sh ./girt-status
sh ./girt-log
sh ./girt-show :a