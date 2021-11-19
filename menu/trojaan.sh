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
cat /usr/bin/bannerTROJAN | lolcat
echo -e "$red 1$bl.\e[m $bd Create Trojan Account"
echo -e "$red 2$bl.\e[m $bd Deleting Trojan Account"
echo -e "$red 3$bl.\e[m $bd Renew Trojan Account"
echo -e "$red 4$bl.\e[m $bd Check User Login Trojan"
echo -e "$red 5$bl.\e[m $bd Create TrojanGO Account"
echo -e "$red 6$bl.\e[m $bd Deleting TrojanGO Account"
echo -e "$red 7$bl.\e[m $bd Renew TrojanGO Account"
echo -e "$red 8$bl.\e[m $bd Check User TrojanGO Trojan"
echo -e""
echo -e "$red x$bl.\e[m$bd Menu"
echo -e""
read -p " Please Enter The Number  [1-8 or x] :  "  trojan
echo -e ""
case $trojan in
1)
add-tr
;;
2)
del-tr
;;
3)
renew-tr
;;
4)
cek-tr
;;
5)
add-trgo
;;
6)
del-trgo
;;
7)
renew-trgo
;;
8)
cek-trgo
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
trojaan
;;
esac
