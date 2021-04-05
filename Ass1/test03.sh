#!/bin/dash

sh ./girt-init
sh ./girt-checkout b1
echo COMP9044 looks Cool > a
echo perl is the best lang > b
sh ./girt-commit -m "commit-0"
sh ./girt-add a b
sh ./girt-commit -m "commit-1"
seq 1 23 > a
sh ./girt-commit -a -m "commit-2"
echo Shell is better >> b
sh ./girt-add b
sh ./girt-status
sh ./girt-commit -m "commit-3"
sh ./girt-show 0:b
sh ./girt-show 0:a
sh ./girt-show 1:a
sh ./girt-rm a
sh ./girt-rm b
sh ./girt-status