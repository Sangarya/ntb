#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bd='\e[1m'
bl='\e[36;1m'
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
echo -e "$red 1$bl.\e[m$bd  Create SSR Account"
echo -e "$red 2$bl.\e[m$bd  Create Shadowsocks Account"
echo -e "$red 3$bl.\e[m$bd  Deleting SSR Account"
echo -e "$red 4$bl.\e[m$bd  Delete Shadowsocks Account"
echo -e "$red 5$bl.\e[m$bd  Renew SSR Account Active"
echo -e "$red 6$bl.\e[m$bd  Renew Shadowsocks Account"
echo -e "$red 7$bl.\e[m$bd  Check User Login Shadowsocks"
echo -e "$red 8$bl.\e[m$bd  Show Other SSR Menu"
echo -e""
echo -e "$red x$bl.\e[m$bd Menu"
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
