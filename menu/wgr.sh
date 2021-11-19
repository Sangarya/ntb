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
cat /usr/bin/bannerWIREGUARD | lolcat
echo -e "$red 1$bl.\e[m $bd Create Wireguard Account"
echo -e "$red 2$bl.\e[m $bd Delete Wireguard Account"
echo -e "$red 3$bl.\e[m $bd Check User Login Wireguard"
echo -e "$red 4$bl.\e[m $bd Renew Wireguard Account"
echo -e""
echo -e "$red x$bl.\e[m$bd Menu"
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
