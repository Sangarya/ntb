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
cat /usr/bin/bannerSSH | lolcat
echo -e "$red 1$bl.\e[m$bd Create SSH & OpenVPN Account"
echo -e "$red 2$bl.\e[m$bd Trial Account SSH & OpenVPN"
echo -e "$red 3$bl.\e[m$bd Renew SSH & OpenVPN Account"
echo -e "$red 4$bl.\e[m$bd Delete SSH & OpenVPN Account"
echo -e "$red 5$bl.\e[m$bd Check User Login SSH & OpenVPN"
echo -e "$red 6$bl.\e[m$bd List Member SSH & OpenVPN"
echo -e "$red 7$bl.\e[m$bd Delete User Expired SSH & OpenVPN"
echo -e "$red 8$bl.\e[m$bd Set up Autokill SSH"
echo -e "$red 9$bl.\e[m$bd Cek Users Who Do Multi Login SSH"
echo -e""
echo -e "$red x$bl.\e[m$bd Menu"
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
