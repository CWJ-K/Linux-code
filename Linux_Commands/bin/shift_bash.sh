#!/bin/bash
# Program:
#       Program shows the effect of shift function.
# History:
# 2022/09/06    Louise  First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo "Total parameter number is ==> $#"
echo "Your whole parameter is   ==> '$@'"
shift  
echo "Total parameter number is ==> $#"
echo "Your whole parameter is   ==> '$@'"
shift 3
echo "Total parameter number is ==> $#"
echo "Your whole parameter is   ==> '$@'"