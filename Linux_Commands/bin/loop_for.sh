#!/bin/bash
# Program:
#   Use for ... loop to print 3 animals
# History:
# 2022/09/10    Louise First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

for animal in dog cat elephant
do
    echo "There are ${animal}s..."
done

