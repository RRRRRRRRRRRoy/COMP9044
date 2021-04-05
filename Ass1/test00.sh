#!/bin/dash

sh ./girt-init
sh ./girt-commit -m 'commit 0'
touch a b c d e f g h i j
seq 1 3 > a
seq 4 6 > b
seq 7 8 > c
sh ./girt-add a b h i 
seq 9 10 > a
seq 10 11 > d
sh ./girt-add a b
sh ./girt-log
rm e 
rm f
rm g
sh ./girt-rm h
sh ./girt-rm i
rm j
sh ./girt-commit -m 'commit 2'
sh ./girt-status