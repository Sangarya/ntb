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
cat /usr/bin/bannerSSH | lolcat
echo -e "${color1}1${color3}.$bd Create SSH & OpenVPN Account (${color2}USERNEW${color3})"
echo -e "${color1}2${color3}.$bd Trial Account SSH & OpenVPN (${color2}TRIAL${color3})"
echo -e "${color1}3${color3}.$bd Renew SSH & OpenVPN Account (${color2}RENEW${color3})"
echo -e "${color1}4${color3}.$bd Delete SSH & OpenVPN Account (${color2}DELUSER${color3})"
echo -e "${color1}5${color3}.$bd Check User Login SSH & OpenVPN (${color2}CEK${color3})"
echo -e "${color1}6${color3}.$bd List Member SSH & OpenVPN (${color2}MEMBER${color3})"
echo -e "${color1}7${color3}.$bd Delete User Expired SSH & OpenVPN (${color2}DELETE${color3})"
echo -e "${color1}8${color3}.$bd Set up Autokill SSH (${color2}AUTOKILL${color3})"
echo -e "${color1}9${color3}.$bd Cek Users Who Do Multi Login SSH (${color2}CEKLIM${color3})"
echo -e""
echo -e "${color1}x${color3}.$bd Menu"
echo -e""
read -p "  Please Enter The Number  [1-9 or x] :  "  ssh
echo -e ""
case $ssh in
1)
usernew
;;
2)
trial
;;
3)
renew
;;
4)
deluser
;;
5)
cek
;;
6)
member
;;
7)
delete
;;
8)
autokill
;;
9)
ceklim
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
ssh
;;
esac
