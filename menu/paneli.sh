#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/Sangarya/izin/main/ipvps | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi
clear
cat /usr/bin/panelVPN | lolcat
echo -e "$red 1$bl.\e[m$bd  Secure Socket Tunneling Protocol (MS-SSTP)"
echo -e "$red 2$bl.\e[m$bd  Layer Two Tunneling Protocol (L2TP)"
echo -e "$red 3$bl.\e[m$bd  Point-to-Point Tunneling Protocol (PPTP)"
echo -e "$red 4$bl.\e[m$bd  WireGuard® Protokol (Wireguard)"
echo -e""
echo -e "$red x$bl.\e[m$bd Menu"
echo -e ""
read -p " Please Enter The Number  [1-4 or x] :  "  lon
echo -e ""
case $lon in
1)
sstpp
;;
2)
l2tp
;;
3)
ppt
;;
4)
wgr
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
paneli
;;
esac
