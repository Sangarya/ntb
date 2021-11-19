#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
datar=( `cat /var/log/trojan-go/trojan-go.log | grep -w 'authenticated as' | awk '{print $7}' | sort | uniq`);
echo -e "${red}============================${NC}";
echo -e "    TROJAN-GO USER LOGIN" | lolcat
echo -e "${red}============================${NC}";
for akuun in "${datar[@]}"
do
datat=( `lsof -n | grep -i ESTABLISHED | grep trojan-go | awk '{print $9}' | cut -d':' -f2 | grep -w 443 | cut -d- -f2 | grep -v '>127.0.0.1' | sort | uniq | cut -d'>' -f2`);
echo -n > /tmp/iptrojan-go.txt
for ip in "${datat[@]}"
do
jume=$(cat /var/log/trojan-go.log | grep -w $akun | awk '{print $4}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ -z "$jume" ]]; then
echo > /dev/null
else
echo "$jume" > /tmp/iptrojan-go.txt
fi
done
jumo=$(cat /tmp/iptrojan-go.txt | nl)
echo "User : $akuun";
echo "$jumo";
echo -e "${red}============================${NC}";
done
