#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear
echo -e ""
cat /usr/bin/bannerDOMAIN | lolcat
echo -e "${color1}1${color3}.$bd Add Subdomain Host For VPS (${color2}add-host${color3})"
echo -e "${color1}1${color3}.$bd Add ID Cloudflare (${color2}id-cloudflare${color3})"
echo -e "${color1}1${color3}.$bd Cloudflare Add-Ons (${color2}Add-Ons${color3})"
echo -e "${color1}1${color3}.$bd Pointing BUG (${color2}bug-point${color3})"
echo -e "${color1}1${color3}.$bd Renew Certificate V2RAY (${color2}certv2ray${color3})"
echo -e "${color1}1${color3}.$bd Add Multi Domain (${color2}host${color3})"
echo -e "${color1}1${color3}.$bd Add cf (${color2}add-cf${color3})"
echo -e ""
echo -e "${color1}x${color3}.$bd MENU"
echo -e ""
read -p "  Please Enter The Number  [1-7 or x] :  "  key
echo -e ""
case $key in
1)
 add-host
 ;;
 2)
 cff
 ;;
 3)
 cfd
 ;;
 4)
 cfh
 ;;
 5)
 certv2ray
 ;;
 6)
 host
 ;;
 7)
 add-cf
 ;;
 x)
 exit
 ;;
 *)
 clear
 menu
 ;;
 esac
