#!/bin/bash
# Program:
# 	Tell you what you may eat.
# History:
# 2022/09/13	Louise	First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

eat[1]="KFC"
eat[2]="Mc"
eat[3]="Pizza Hot"
eat[4]="Burger King"

number=9

candidate_number=0
while [ "${candidate_number}" -lt 3 ]; do
        random_option=$(( ${RANDOM} * ${number} / 32767 + 1 ))
        duplicate=0
        if [ "${candidate_number}" -ge 1 ]; then
                for i in $(seq 1 ${candidate_number} )
                do
                        if [ ${candidates[$i]} == $random_option ]; then
                                duplicate=1
                        fi
                done
        fi
        if [ ${duplicate} == 0 ]; then
                echo "you may eat ${eat[${random_option}]}"
                candidate_number=$(( ${candidate_number} + 1 ))
                candidates[${candidate_number}]=${random_option}
        fi
done 
    

