#!/usr/bin/perl -w

@test = (1..199);
# print "@test";

# 求长度
$get_1 = push(@test, 200);
# 求长度
$get_2 = unshift(@test, 0);

print "@test";
print "\n";
# 取元素
$get_3 = pop(@test);
# 取元素
$get_4 = shift(@test);
print "\n";

print "get_1: $get_1\n";
print "get_2: $get_2\n";
print "get_3: $get_3\n";
print "get_4: $get_4\n";
print "\n"; 
print "@test";