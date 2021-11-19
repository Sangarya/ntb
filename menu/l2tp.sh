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
echo -e ""
cat /usr/bin/bannerL2TP | lolcat
echo -e "$red 1$bl.\e[m$bd Creating L2TP Account"
echo -e "$red 2$bl.\e[m$bd Deleting L2TP Account"
echo -e "$red 3$bl.\e[m$bd Renew L2TP Account"
echo -e   " $red x$bl.\e[m$bd Menu  "
echo -e ""
read -p "  Please Enter The Number  [1-3 or x] :  "  l2tp
echo -e ""
case "$l2tp" in
1)
add-l2tp
;;
2)
del-l2tp
;;
3)
renew-l2tp
;;
x)
paneli
;;
*)
echo "Masukkan Nomor Yang Ada!"
l2tp
;;
esac
