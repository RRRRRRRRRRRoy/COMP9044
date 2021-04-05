#!/bin/dash

sh ./girt-init
seq 1 39 > a
sh ./girt-commit -a -m "commit: a"
sh ./girt-branch 111
sh ./girt-branch branch1
sh ./girt-checkout branch1
seq 8 34 > b
echo hello world>> a
sh ./girt-add a b
sh ./girt-commit -m "commit: changed a and b"
sh ./girt-checkout branch1
echo ccccccccccc > c
echo COMP9044_21T1 > d
sh ./girt-add c d
sh ./girt-status
sh ./girt-rm d
sh ./girt-commit -a "commit: new c commit and rm delete d"
sh ./girt-log
sh ./girt-merge b1 -m "merging b1"
sh ./girt-checkout b1
sh ./girt-show 0:a
sh ./girt-show 0:b
sh ./girt-show 0:c
sh ./girt-show 0:d
sh ./girt-merge branch1 -m 'merging branch 1'
sh ./girt-log 