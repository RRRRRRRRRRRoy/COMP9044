#!/bin/dash

sh ./girt-init
sh ./girt-add
echo test01 > a
echo test01 > b
echo z5241868 > c
sh ./girt-add a b
sh ./girt-commit -m '1st commit'
echo change01 >> a
sh ./girt-add a c
sh ./girt-commit -m '2nd commit'
sh ./girt-log
echo Roy >> a
echo HY > d
sh ./girt-add a d
sh ./girt-show 1:b
sh ./girt-show 1:c
sh ./girt-commit -m '3nd commit'
sh ./girt-rm a b d
sh ./girt-status
