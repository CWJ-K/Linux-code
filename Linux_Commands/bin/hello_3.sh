#!/bin/bash
# Program: 
#       Show "Hello" from $1 ... by using case .. esac
# History:
# 2022/09/09    Louise First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

case ${1} in
        "hello")
        echo "Hello, how are you?"
        ;;
        "")
        echo "You must input parameters, e.g. {${0} somewords}"        
        ;;
*)
        echo "Use ${0} {hello}"
        ;;
esac