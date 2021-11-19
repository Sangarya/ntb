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
cat /usr/bin/bannerSSTP | lolcat
echo -e "$red 1$bl.\e[m$bd Create Account SSTP"
echo -e "$red 2$bl.\e[m$bd Delete SSTP Account"
echo -e "$red 3$bl.\e[m$bd Renew SSTP Account"
echo -e "$red 4$bl.\e[m$bd Check User Login SSTP"
echo -e""
echo -e "$red x$bl.\e[m$bd Menu"
echo -e""
read -p " Please Enter The Number  [1-4 or x] :  "  sstpp
echo -e ""
case $sstpp in
1)
add-sstp
;;
2)
del-sstp
;;
3)
renew-sstp
;;
4)
cek-sstp
;;
x)
paneli
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
sstpp
;;
esac
