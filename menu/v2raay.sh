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
cat /usr/bin/bannerV2RAY | lolcat
echo -e "$red 1$bl.\e[m $bd Create Vmess Websocket Account"
echo -e "$red 2$bl.\e[m $bd Delete Vmess Websocket Account"
echo -e "$red 3$bl.\e[m $bd Renew Vmess Account"
echo -e "$red 4$bl.\e[m $bd Check User Login Vmess"
echo -e "$red 5$bl.\e[m $bd Create Trial Vmess Websocket Account"
echo -e "$red 6$bl.\e[m $bd Create Vless Websocket Account"
echo -e "$red 7$bl.\e[m $bd Deleting Vless Websocket Account"
echo -e "$red 8$bl.\e[m $bd Renew Vless Account "
echo -e "$red 9$bl.\e[m $bd Check User Login Vless"
echo -e""
echo -e "$red x$bl.\e[m$bd Menu"
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
