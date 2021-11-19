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
cat /usr/bin/bannerBACKUP | lolcat
echo -e "$red 1$bl.\e[m$bd Autobackup Data VPS"
echo -e "$red 2$bl.\e[m$bd Backup Manual Data VPS "
echo -e "$red 3$bl.\e[m$bd Restore Data VPS  "
echo -e "$red x$bl.\e[m$bd Menu"
echo -e""
echo -e "$red x$bl.\e[m$bd Menu"
echo -e""
read -p " Please Enter The Number  [1-3 or x] :  "  gok
echo -e ""
case $gok in
1)
autobackup
;;
2)
backup
;;
3)
restore
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
bebek
;;
esac
