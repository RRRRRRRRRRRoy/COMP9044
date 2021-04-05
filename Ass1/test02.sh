#!/bin/dash

sh ./girt-init
seq 1 7 > a
sh ./girt-add a
sh ./girt-commit -m "commit-a"
sh ./girt-branch b1
sh ./girt-checkout b1
seq 8 12 > b
echo hellohellohello >> a
sh ./girt-commit -a -m "commit-a/b"
echo worldworldworld > c
echo COMP9044COMP9044 > d
sh ./girt-add c d
sh ./girt-commit -m "commit-c/d"
sh ./girt-merge b1 -m "merging b1"
sh ./girt-checkout b1
echo 111 > a
echo 111 > b
echo 111 > c
echo 111 > d
sh ./girt-add a b d
sh ./girt-status
sh ./girt-rm c
sh ./girt-commit -m "4th time commit"
sh ./girt-show 0:a
