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
cat /usr/bin/bannerSYSTEM | lolcat
echo -e "${color1} 1${color3}.$bd Change Port All Account (${color2}change-port${color3})"
echo -e "${color1} 2${color3}.$bd Webmin Menu (${color2}wbmn${color3})"
echo -e "${color1} 3${color3}.$bd Limit Bandwith Speed Server (${color2}limit-speed${color3})"
echo -e "${color1} 4${color3}.$bd Check Usage of VPS Ram (${color2}RAM${color3})"
echo -e "${color1} 5${color3}.$bd Reboot VPS (${color2}reboot${color3})"
echo -e "${color1} 6${color3}.$bd Speedtest VPS (${color2}SPEEDTEST${color3})"
echo -e "${color1} 7${color3}.$bd Information Display System (${color2}INFO${color3})"
echo -e "${color1} 8${color3}.$bd Info Script Auto Install (${color2}ABOUT${color3})"
echo -e "${color1} 9${color3}.$bd Clear Log (${color2}CLEAR-LOG${color3})"
echo -e "${color1}10${color3}.$bd Auto Reboot (${color2}AUTOREBOOT${color3})"
echo -e "${color1}11${color3}.$bd Pointing VPS (${color2}POINTING${color3})"
echo -e "${color1}12${color3}.$bd Service Status (${color2}STATUS${color3})"
echo -e "${color1}13${color3}.$bd Cek Bandwidth VPS (${color2}BW${color3})"
echo -e "${color1}14${color3}.$bd Install BBR (${color2}BBR${color3})"
echo -e "${color1}15${color3}.$bd Edit Banner SSH (${color2}BANNER${color3})"
echo -e "${color1}16${color3}.$bd Generate SSH (${color2}USER-GENERATE${color3})"
echo -e "${color1}17${color3}.$bd Ganti Pass VPS (${color2}ROOT${color3})"
echo -e "${color1}18${color3}.$bd Domain Section (${color2}PANEL-DOMAIN${color3})"
echo -e""
echo -e "${color1}1${color3}.$bd Menu"
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
