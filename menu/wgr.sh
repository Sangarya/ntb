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
echo -e ""
cat /usr/bin/bannerWIREGUARD | lolcat
echo -e""
echo -e "${color1}1${color3}.$bd Create Wireguard Account (${color2}add-wg${color3})"
echo -e "${color1}2${color3}.$bd Delete Wireguard Account (${color2}del-wg${color3})"
echo -e "${color1}3${color3}.$bd Check User Login Wireguard (${color2}cek-wg${color3})"
echo -e "${color1}4${color3}.$bd Renew Wireguard Account (${color2}renew-wg${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p "  Please Enter The Number  [1-4 or x] :  "  wgr
echo -e ""
case $wgr in
1)
add-wg
;;
2)
del-wg
;;
3)
cek-wg
;;
4)
renew-wg
;;
x)
paneli
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
wgr
;;
esac
