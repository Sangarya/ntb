#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'

clear
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "            ${green}PENGATURAN PORT${off}"
echo -e "${cyan}======================================${off}"
echo -e "$red 1$bl.\e[m$bd Ubah Port Stunnel4"
echo -e "$red 2$bl.\e[m$bd Ubah Port OpenVPN"
echo -e "$red 3$bl.\e[m$bd Ubah Port Wireguard"
echo -e "$red 4$bl.\e[m$bd Ubah Port Vmess"
echo -e "$red 5$bl.\e[m$bd Ubah Port Vless"
echo -e "$red 6$bl.\e[m$bd Ubah Port Trojan"
echo -e "$red 7$bl.\e[m$bd Ubah Port Squid"
echo -e "$red 8$bl.\e[m$bd Ubah Port SSTP"
echo -e""
echo -e "$red x$bl.\e[m$bd Menu"
echo -e""
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p " Please Enter The Number  [1-8 or x] :  " port
echo -e "${off}"

case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-wg
;;
4)
port-ws
;;
5)
port-vless
;;
6)
port-tr
;;
7)
port-squid
;;
8)
port-sstp
;;
x)
clear
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
change-port
;;
esac
