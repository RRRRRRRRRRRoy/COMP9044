#!/usr/bin/perl -w

$a[0] = "first string";
$a[1] = "2nd string";
$a[2] = 123;

# 定义一个数组
@a = ("first string", "2nd string", 123);

# #----> last index ----> #+1 length
print "Index of last element is $#a\n";
print "The number of element is ", $#a+1, "\n";

