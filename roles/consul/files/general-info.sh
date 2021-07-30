#!/usr/bin/env bash

TIME=`date +%k:%M:%S`
printf "Last check: %s\n\n" $TIME


localosname=$(cat /etc/os-release | grep 'PRETTY_NAME=' | awk -F '"' '{print $2}')
kernelrelease=$(uname -r)
localuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
consulversion=$(/usr/bin/consul version | awk 'NR==1; END{exit}'| awk '{print $2}')

printf "Consul Version : %s\n" "$consulversion"
printf "\n"
printf "OS Version     : %s\n" "$localosname"
printf "Kernel Release : %s\n" "$kernelrelease"
printf "Uptime         : %s\n" "$localuptime"


printf "\n"
printf "*************************************************************\n"
printf "Top 5 memory using processes/applications\n"
printf "*************************************************************\n"

printf "%-10s %-6s %-10s %s\n" "PID" "%MEM" "RSS" "COMMAND"
ps aux | awk '{printf "%-10s %-6s %-10s %s\n", $2, $4, $6, $11}' | sort -k3rn | head -n 5


printf "\n"
printf "*************************************************************\n"
printf "Memory Statistics\n"
printf "*************************************************************\n"

printf "%-8s %-8s %-8s %-8s %-8s\n" "Total" "Used" "Free" "Cache" "Available"
free -gh | awk 'FNR == 2 {printf "%-8s %-8s %-8s %-8s %-10s\n", $2, $3, $4, $6, $7}'

printf "\n"
free -m | awk 'NR==2{printf "Memory Usage : %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
