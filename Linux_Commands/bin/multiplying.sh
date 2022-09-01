#!/bin/bash
# Program:
#	User inputs 2 integer numbers; program wll cross these two numbers
# History:
# 2022/09/01 Louise First Release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr:/local/bin:/usr/local/sbin:~/bin
export PATH
echo -e "You SHOULD input 2 numbers, I will multiply them! \n"
read -p "first number:  " num1
read -p "second number: " num2
total=$((${num1}*${num2}))
echo -r "\nThe result of ${num1} x ${num2} is ==> ${total}"
