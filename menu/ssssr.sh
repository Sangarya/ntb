#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bd='\e[1m'
bl='\e[36;1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
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
cat /usr/bin/bannerSHADOWSOCK | lolcat
echo -e "${color1}1${color3}.$bd  Create SSR Account (${color2}ADD-SSR${color3})"
echo -e "${color1}2${color3}.$bd  Create Shadowsocks Account (${color2}ADD-SS${color3})"
echo -e "${color1}3${color3}.$bd  Deleting SSR Account (${color2}DEL-SSR${color3})"
echo -e "${color1}4${color3}.$bd  Delete Shadowsocks Account (${color2}DEL-SS${color3})"
echo -e "${color1}5${color3}.$bd  Renew SSR Account Active (${color2}RENEW-SSR${color3})"
echo -e "${color1}6${color3}.$bd  Renew Shadowsocks Account (${color2}RENEW-SS${color3})"
echo -e "${color1}7${color3}.$bd  Check User Login Shadowsocks (${color2}CEK-SS${color3})"
echo -e "${color1}8${color3}.$bd  Show Other SSR Menu (${color2}SSR${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p " Please Enter The Number  [1-8 or x] :  "  ssssr
echo -e ""
case $ssssr in
1)
add-ssr
;;
2)
add-ss
;;
3)
del-ssr
;;
4)
del-ss
;;
5)
renew-ssr
;;
6)
renew-ss
;;
7)
cek-ss
;;
8)
ssr
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
ssssr
;;
esac
