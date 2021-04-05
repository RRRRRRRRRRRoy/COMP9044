#!/bin/dash

echo IamA> a
echo IamC> c
echo IamB> b
sh ./girt-init
sh ./girt-add a b c
sh ./girt-rm a
sh ./girt-commit -m "1st commit: delete a commit b c"
sh ./girt-status
sh ./girt-log
echo addingbbbb >> b
sh ./girt-commit -a -m "2nd commit: updating b"
sh ./girt-rm c
sh ./girt-add c
sh ./girt-commit -a -m "3rd commit: deleting c"
sh ./girt-log
sh ./girt-status
echo bbbbbbbbbbbbb >> b
sh ./girt-add b
sh ./girt-commit -m "4th commit: updating b"
sh ./girt-log
sh ./girt-show :b
sh ./girt-status
