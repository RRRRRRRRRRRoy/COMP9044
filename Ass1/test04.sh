#!/bin/dash

sh ./girt-init
seq 1 7 > a
sh ./girt-add a
sh ./girt-commit -m "commit-a"
sh ./girt-branch b1
sh ./girt-checkout b1