#!/bin/bash
# Program:
#       Use a function to repeat information
# History:
# 2022/09/09    Louise  First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

function print_contents(){
        echo -n "Your choice is ${1} "
}

echo "This program will print your selection !"
case ${1} in
"ONE")
        print_contents 1 | tr 'A-Z' 'a-z'
        ;;
"two")
        print_contents; echo ${1} | tr 'a-z' 'A-Z'
        ;;
"three")
        print_contents; echo ${1} | tr 'a-z' 'A-Z'
        ;;
*)
        echo "Use ${0} {one|two|three}"
        ;;
esac