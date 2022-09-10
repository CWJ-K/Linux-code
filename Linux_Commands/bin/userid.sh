#!/bin/bash
# Program
#   Users id, check system account's information
# History
# 2022/09/10    Louise first release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
users=$(cut -d ':' -f1 /etc/passwd)
for username in ${users}
do
    id ${username}
done