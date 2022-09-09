#!/bin/bash
# Program: 
#       This scipt only accepts the following paramter: one, two or three
# History:
# 2022/09/09    Louise First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin  
export PATH

echo "This program will print contents based on your selection !"        
read -p "Input your choice: " choice
case ${choice} in
"one")
                echo "Your choice is one"
        ;;
"two")
                echo "Your choice is two"
        ;;
"three")
                echo "Your choice is three"
        ;;
*)
                echo "Usage ${0} {one|two|three}"
esac