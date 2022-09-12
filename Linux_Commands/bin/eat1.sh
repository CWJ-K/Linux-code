#!/bin/bash
# Program:
#       Tell you what you may eat.
# History:
# 2022/09/12    Louise First Release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/loacl/sbin:~/bin
export PATH

eat[1]='Mc'
eat[2]='KFC'
eat[3]='PizzaHot'
eat[4]='BigMac'

number=4


check=$(( ${RANDOM} * ${number} / 32767 + 1 ))

echo "You may eat ${eat[${check}]}"