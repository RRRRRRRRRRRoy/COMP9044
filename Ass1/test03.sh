#!/bin/dash

sh ./girt-init
sh ./girt-checkout b1
echo COMP9044 looks Cool > good.txt
sh ./girt-add good.txt
sh ./girt-commit -m "commit-a"
sh ./girt-branch b1
sh ./girt-checkout b1