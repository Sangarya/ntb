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
cat /usr/bin/bannerSYSTEM | lolcat
echo -e   " $red  1$bl.\e[m$bd Change Port All Account"
echo -e   " $red  2$bl.\e[m$bd Webmin Menu"
echo -e   " $red  3$bl.\e[m$bd Limit Bandwith Speed Server"
echo -e   " $red  4$bl.\e[m$bd Check Usage of VPS Ram" 
echo -e   " $red  5$bl.\e[m$bd Reboot VPS"
echo -e   " $red  6$bl.\e[m$bd Speedtest VPS"
echo -e   " $red  7$bl.\e[m$bd Information Display System" 
echo -e   " $red  8$bl.\e[m$bd Info Script Auto Install"
echo -e   " $red  9$bl.\e[m$bd Clear Log"
echo -e   " $red 10$bl.\e[m$bd Auto Reboot"
echo -e   " $red 11$bl.\e[m$bd Pointing VPS"
echo -e   " $red 12$bl.\e[m$bd Service Status"
echo -e   " $red 13$bl.\e[m$bd Cek Bandwidth VPS"
echo -e   " $red 14$bl.\e[m$bd Install BBR"
echo -e   " $red 15$bl.\e[m$bd Edit Banner SSH"
echo -e   " $red 16$bl.\e[m$bd Generate SSH"
echo -e   " $red 17$bl.\e[m$bd Ganti Pass VPS"
echo -e   " $red 18$bl.\e[m$bd Domain Section"
echo -e""
echo -e "$red x$bl.\e[m$bd Menu"
echo -e""
read -p "  Please Enter The Number  [1-18 or x] :  "  sis
echo -e ""
case $sis in
1)
change-port
;;
2)
wbmn
;;
3)
limit-speed
;;
4)
ram
;;
5)
reboot
;;
6)
speedtest
;;
7)
info
;;
8)
about
;;
9)
clear-log
;;
10)
autoreboot
;;
11)
pointing
;;
12)
status
;;
13)
bw
;;
14)
bbr
;;
15)
nano /etc/issue.net
;;
16)
user-generate
;;
17)
wget https://raw.githubusercontent.com/Sangarya/root/main/root.sh && chmod +x root.sh && ./root.sh
;;
18)
panel-domain
;;
x)
menu
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
sleep 1
system
;;
esac
