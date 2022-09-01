#!bin/bash
# Program:
#	Users input first names and last names. Program shows their full names
# History:
# 2022/09/01 Louise First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

read -p "Please input your first name: " firstname 
read -p "Please input your last name:  " lastname
echo "\n Your full name is: ${firstname} ${lastname}"

