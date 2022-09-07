#!/bin/bash
# Program:
#	Check $1 is equal to "hello"
# History:
# 2022/09/07    Louise	First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

if [ "${1}" == "hello" ]; then
    echo "Hello, how are you?"
elif [ "${1}" == "" ]; then
    echo "You must input parameters, e.g. {${0} someword}"
else
    echo "The only parameter is 'hello', e.g. {${0} hello}"
fi
