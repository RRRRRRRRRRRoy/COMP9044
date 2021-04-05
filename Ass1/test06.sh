#!/bin/dash

echo aaaaaaaa> a
echo rrrrrrrr> r
echo bbbbbbbb> b
sh ./girt-add
sh ./girt-commit -m '1st commit: test without .girt'
sh ./girt-init
sh ./girt-add a b r
sh ./girt-commit -m '2nd commit: a b'
echo royyyyy>> r
sh ./girt-commit -a -m '3nd commit: r'
sh ./girt-log
echo testrrr >> r
sh ./girt-add r
sh ./girt-branch branch1
sh ./girt-checkout branch1
echo update >> r
sh ./girt-add r
sh ./girt-commit -m '4th commit: r'
sh ./girt-show 0:r
sh ./girt-show 1:r
sh ./girt-merge branch1 -m 'merging branch 1'
sh ./girt-log 
sh ./girt-status