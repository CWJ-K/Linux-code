#!bin/bash
# Program:
#   Repeat questions until users input correct answers
# History:
# 2022/09/10    Louise First Release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

while [ "${yn}" != 'yes' -a "${yn}" != "YES" ]
do
    read -p "Please input yes/YES to stop the program" yn
done
echo "OK! you input the correct answer"