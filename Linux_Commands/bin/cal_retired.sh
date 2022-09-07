#!/bin/bash
# Program:
#	Input your demobilization date to calculate when you finish demobilize.
# History:
# 2022/09/07	Louise	First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


echo "This program will try to calculate /n when you finish demobilize"
read -p "Input your demobilization date (YYYYMMDD e.g. 20220907): " date2

# Unsure
date_d=$(echo ${date2} | grep '[0-9]\{8\}')   
if [ "${date_d}" == "" ]; then
	echo "You input the wrong date format...."
	exit 1
fi


declare -i date_dem=$(date --date="${date2}" +%s)      
declare -i date_now=$(date +%s)                        
declare -i date_total_s=$((${date_dem}-${date_now}))   
declare -i date_d=$((${date_total_s}/60/60/24))        
if [ "${date_total_s}" -lt "0" ]; then                
	echo "You had been demobilization before: " $((-1*${date_d})) " ago"
else
	declare -i date_h=$(($((${date_total_s}-${date_d}*60*60*24))/60/60))
	echo "You will demobilize after ${date_d} days and ${date_h} hours."
fi