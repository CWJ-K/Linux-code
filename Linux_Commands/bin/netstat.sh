#!/bin/bash
# Program:
#       Using netstat and grep to detect WWW, SSH, FTP and Mail services
# History:
# 2022/09/07 Louise First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo "Now, start to detect your Linux server's services!"
echo -e "The www, ftp, ssh, and mail(smtp) will be deteced! \n"        

testfile=/netstat_checking.txt
netstat -tuln > ${testfile}
testing=$(grep ":80 " ${testfile})

if [ "${testing}" != "" ]; then
        echo "www is running on your system"
else
        echo "www is not running on your system"
fi

testing=$(grep ":22 " ${testfile})
if [ "${testing}" != "" ]; then
        echo "SSH is running in your system"
else
        echo "SSH is not running on your system"

fi

testing=$(grep ":25 " ${testfile})
if [ "${testing}" != "" ]; then

        echo "Mail is running in your system"
else
        echo "Mail is not running on your system"

fi