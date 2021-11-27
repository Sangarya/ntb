#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
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
cat /usr/bin/bannerV2RAY | lolcat
echo -e "${color1}1${color3}.$bd Create Vmess Websocket Account (${color2}ADD-WS${color3})"
echo -e "${color1}2${color3}.$bd Delete Vmess Websocket Account (${color2}DEL-WS${color3})"
echo -e "${color1}3${color3}.$bd Renew Vmess Account (${color2}RENEW-WS${color3})"
echo -e "${color1}4${color3}.Check User Login Vmess (${color2}CEK-WS${color3})"
echo -e "${color1}5${color3}.Create Trial Vmess Websocket Account (${color2}TRIAL-WS${color3})"
echo -e "${color1}6${color3}.$bd Create Vless Websocket Account (${color2}ADD-VLESS${color3})"
echo -e "${color1}7${color3}.$bd Deleting Vless Websocket Account (${color2}DEL-VLESS${color3})"
echo -e "${color1}8${color3}.$bd Renew Vless Account (${color2}RENEW-VLESS${color3})"
echo -e "${color1}9${color3}.$bd Check User Login Vless (${color2}CEK-VLESS${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p " Please Enter The Number  [1-9 or x] :  "  v2ray
echo -e ""
case $v2ray in
1)
add-ws
;;
2)
del-ws
;;
3)
renew-ws
;;
4)
cek-ws
;;
5)
trialws
;;
6)
add-vless
;;
7)
del-vless
;;
8)
renew-vless
;;
9)
cek-vless
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
v2raay
;;
esac
