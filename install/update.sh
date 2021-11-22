#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo -e  "${RED}Checking VPS${NC}"
sleep 2
IZIN=$( curl https://raw.githubusercontent.com/Sangarya/izin/main/ipvps | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${GREEN}Permission Accepted...${NC}"
sleep 2 
else
clear
echo -e ""
echo -e "======================================="
echo -e ""
echo -e "${RED}PERMINTAAN DITOLAK...!!! ${NC}"
echo -e "IP VPS ANDA BELUM TERDAFTAR"
echo -e "Contact WA https//wa.me/+6282339191527"
echo -e "For Registration IP VPS"
echo -e ""
echo -e "======================================="
echo -e ""
exit 0
fi
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
clear
echo "Untuk Melakukan Tindakan Ini, Anda Harus Laporan Terlebih Dahulu Kepada Pihak Admin."
echo "Agar Diberikan Akses Pembaruan Pada Script VPS Anda!"
read -p "Sudah Laporan? [Y/N]:" arg
if [[ $arg == 'Y' ]]; then
  echo "Tindakan Diteruskan!"
  figlet -f slant Memperbarui... | lolcat
elif [[ $arg == 'y' ]]; then
  echo "Tindakan Diteruskan!"
  figlet -f slant Memperbarui... | lolcat
elif [[ $arg == 'N' ]]; then
  echo "Tindakan Dihentikan!"
  sleep 1
  clear
  neofetch
  exit 0
elif [[ $arg == 'n' ]]; then
  echo "Tindakan Dihentikan!"
  sleep 1
  clear
  neofetch
  exit 0
else
  echo "Argumen Tidak Diketahui!"
  sleep 1
  clear
  neofetch
  exit 0
fi
sleep 1

if [ ! -e /home/vps/public_html/TCP.ovpn ]; then
cp /etc/openvpn/client-tcp-1194.ovpn /home/vps/public_html/tcp.ovpn
cp /etc/openvpn/client-udp-2200.ovpn /home/vps/public_html/udp.ovpn
cp /etc/openvpn/client-tcp-ssl.ovpn /home/vps/public_html/ssl.ovpn

mkdir /root/OpenVPN
cp -r /etc/openvpn/client-tcp-ssl.ovpn OpenVPN/ssl.ovpn
cp -r /etc/openvpn/client-udp-2200.ovpn OpenVPN/udp.ovpn
cp -r /etc/openvpn/client-tcp-1194.ovpn OpenVPN/tcp.ovpn
cd /root
zip -r openvpn.zip OpenVPN > /dev/null 2>&1
cp -r /root/openvpn.zip /home/vps/public_html/geo.zip
rm -rf /root/OpenVPN
rm -f /root/openvpn.zip
fi
# text gambar
apt-get install boxes

# color text
cd
#rm -rf /root/.bashrc
#wget -O /root/.bashrc "https://raw.githubusercontent.com/Sangarya/ntb/main/install/.bashrc"

figlet -f slant WRBSOCKET | lolcat
#WEBSOCKET
rm -rf websocket.sh && apt install curl && wget https://raw.githubusercontent.com/Sangarya/ntb/main/websocket/websocket.sh && apt update && apt install dos2unix && dos2unix websocket.sh && chmod +x websocket.sh && ./websocket.sh

figlet -f slant Waiting Update... | lolcat
sleep 1
#ssr
wget -O /usr/bin/ssr https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/ssrmu && chmod +x /usr/bin/ssr
wget -O /usr/bin/add-ssr https://raw.githubusercontent.com/Sangarya/ntb/main/add/add-ssr.sh && chmod +x /usr/bin/add-ssr
wget -O /usr/bin/del-ssr https://raw.githubusercontent.com/Sangarya/ntb/main/del/del-ssr.sh && chmod +x /usr/bin/del-ssr
wget -O /usr/bin/renew-ssr https://raw.githubusercontent.com/Sangarya/ntb/main/renew/renew-ssr.sh && chmod +x /usr/bin/renew-ssr

#SSLH
apt-get install sslh -y
#Forward 443 = ws-ssl-stunnel4-dropbear
wget -O /etc/default/sslh "https://raw.githubusercontent.com/Sangarya/ntb/main/websocket/sslh.conf"
service sslh restart

#l2tp
figlet -f slant Module L2TP | lolcat
sleep 1
cd /usr/bin
wget -O /usr/bin/add-l2tp https://raw.githubusercontent.com/Sangarya/ntb/main/add/add-l2tp.sh && chmod +x /usr/bin/add-l2tp
wget -O /usr/bin/del-l2tp https://raw.githubusercontent.com/Sangarya/ntb/main/del/del-l2tp.sh && chmod +x /usr/bin/del-l2tp
wget -O /usr/bin/renew-l2tp https://raw.githubusercontent.com/Sangarya/ntb/main/renew/renew-l2tp.sh && chmod +x /usr/bin/renew-l2tp

#pptp
figlet -f slant Module PPTP | lolcat
sleep 1
wget -O /usr/bin/add-pptp https://raw.githubusercontent.com/Sangarya/ntb/main/add/add-pptp.sh && chmod +x /usr/bin/add-pptp
wget -O /usr/bin/del-pptp https://raw.githubusercontent.com/Sangarya/ntb/main/del/del-pptp.sh && chmod +x /usr/bin/del-pptp
wget -O /usr/bin/renew-pptp https://raw.githubusercontent.com/Sangarya/ntb/main/renew/renew-pptp.sh && chmod +x /usr/bin/renew-pptp

#sstp
figlet -f slant Module SSTP | lolcat
sleep 1
wget -O /usr/bin/add-sstp https://raw.githubusercontent.com/Sangarya/ntb/main/add/add-sstp.sh && chmod +x /usr/bin/add-sstp
wget -O /usr/bin/del-sstp https://raw.githubusercontent.com/Sangarya/ntb/main/del/del-sstp.sh && chmod +x /usr/bin/del-sstp
wget -O /usr/bin/cek-sstp https://raw.githubusercontent.com/Sangarya/ntb/main/cek/cek-sstp.sh && chmod +x /usr/bin/cek-sstp
wget -O /usr/bin/renew-sstp https://raw.githubusercontent.com/Sangarya/ntb/main/renew/renew-sstp.sh && chmod +x /usr/bin/renew-sstp

#SHADOWSOCKS
figlet -f slant SHADOWSOCKS-R | lolcat
sleep 1
cd /usr/bin
wget -O /usr/bin/bebek https://raw.githubusercontent.com/Sangarya/ntb/main/menu/bebek.sh && chmod +x /usr/bin/bebek
wget -O /usr/bin/ppt https://raw.githubusercontent.com/Sangarya/ntb/main/menu/ppt.sh && chmod +x /usr/bin/ppt
wget -O /usr/bin/menu https://raw.githubusercontent.com/Sangarya/ntb/main/menu/menu.sh && chmod +x /usr/bin/menu
wget -O /usr/bin/paneli https://raw.githubusercontent.com/Sangarya/ntb/main/menu/paneli.sh && chmod +x /usr/bin/paneli
wget -O add-ss "https://raw.githubusercontent.com/Sangarya/ntb/main/add/add-ss.sh"
wget -O del-ss "https://raw.githubusercontent.com/Sangarya/ntb/main/del/del-ss.sh"
wget -O cek-ss "https://raw.githubusercontent.com/Sangarya/ntb/main/cek/cek-ss.sh"
wget -O renew-ss "https://raw.githubusercontent.com/Sangarya/ntb/main/renew/renew-ss.sh"
chmod +x add-ss
chmod +x del-ss
chmod +x cek-ss
chmod +x renew-ss

#PANEL-PORT
figlet -f slant Module Port | lolcat
sleep 1
cd /usr/bin
wget -O port-ovpn "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-vless.sh"
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-tr
chmod +x port-sstp
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless

#PANEL SSH
figlet -f slant Module SSH | lolcat
sleep 1
cd /usr/bin
wget -O speedtest "https://github.com/Sangarya/ntb/raw/main/bahan/speedtest_cli.py"
wget -O usernew "https://raw.githubusercontent.com/Sangarya/ntb/main/ssh-vpn/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/Sangarya/ntb/main/ssh-vpn/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/Sangarya/ntb/main/ssh-vpn/hapus.sh"
wget -O member "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/member.sh"
wget -O delete "https://raw.githubusercontent.com/Sangarya/ntb/main/del/delete.sh"
wget -O cek "https://raw.githubusercontent.com/Sangarya/ntb/main/cek/cek.sh"
wget -O renew "https://raw.githubusercontent.com/Sangarya/ntb/main/renew/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/autokill.sh"
wget -O /usr/bin/ceklim https://raw.githubusercontent.com/Sangarya/ntb/main/cek/ceklim.sh && chmod +x /usr/bin/ceklim && cd /usr/bin && apt install -y dos2unix && dos2unix ceklim
wget -O tendang "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/tendang.sh"
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x renew
chmod +x autokill
chmod +x ceklim
chmod +x tendang

#PANEL V2RAY VMESS
figlet -f slant Module Vmess | lolcat
cd /usr/bin
wget -O add-ws "https://raw.githubusercontent.com/Sangarya/ntb/main/add/add-ws.sh"
wget -O del-ws "https://raw.githubusercontent.com/Sangarya/ntb/main/del/del-ws.sh"
wget -O cek-ws "https://raw.githubusercontent.com/Sangarya/ntb/main/cek/cek-ws.sh"
wget -O renew-ws "https://raw.githubusercontent.com/Sangarya/ntb/main/renew/renew-ws.sh"
wget -O trialws "https://raw.githubusercontent.com/Sangarya/ntb/main/add/trialws.sh"
chmod +x add-ws
chmod +x del-ws
chmod +x cek-ws
chmod +x renew-ws
chmod +x trialws

#PANEL V2RAY VLESS
figlet -f slant Module Vless | lolcat
sleep 1
cd /usr/bin
wget -O add-vless "https://raw.githubusercontent.com/Sangarya/ntb/main/add/add-vless.sh"
wget -O del-vless "https://raw.githubusercontent.com/Sangarya/ntb/main/del/del-vless.sh"
wget -O cek-vless "https://raw.githubusercontent.com/Sangarya/ntb/main/cek/cek-vless.sh"
wget -O renew-vless "https://raw.githubusercontent.com/Sangarya/ntb/main/renew/renew-vless.sh"
chmod +x add-vless
chmod +x del-vless
chmod +x cek-vmess
chmod +x renew-vless

#PANEL-TROJAN
figlet -f slant Module Trojan | lolcat
sleep 1
cd /usr/bin
wget -O add-tr "https://raw.githubusercontent.com/Sangarya/ntb/main/add/add-tr.sh"
wget -O del-tr "https://raw.githubusercontent.com/Sangarya/ntb/main/del/del-tr.sh"
wget -O renew-tr "https://raw.githubusercontent.com/Sangarya/ntb/main/renew/renew-tr.sh"
wget -O cek-tr "https://raw.githubusercontent.com/Sangarya/ntb/main/cek/cek-tr.sh"
chmod +x add-tr
chmod +x del-tr
chmod +x renew-tr
chmod +x cek-tr

#PANEL WIREGUARD
figlet -f slant wireguard | lolcat
sleep 1
cd /usr/bin
wget -O add-wg "https://raw.githubusercontent.com/Sangarya/ntb/main/add/add-wg.sh"
wget -O del-wg "https://raw.githubusercontent.com/Sangarya/ntb/main/del/del-wg.sh"
wget -O cek-wg "https://raw.githubusercontent.com/Sangarya/ntb/main/cek/cek-wg.sh"
wget -O renew-wg "https://raw.githubusercontent.com/Sangarya/ntb/main/renew/renew-wg.sh"
chmod +x add-wg
chmod +x del-ws
chmod +x cek-wg
chmod +x renew-wg

#bahan
sleep 1
cd /usr/bin
wget -O add-host "https://raw.githubusercontent.com/Sangarya/ntb/main/add/add-host.sh"
wget -O about "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/about.sh"
wget -O menu "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/menu.sh"
wget -O ram "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/ram.sh"
wget -O wbmn "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/wbmn.sh"
wget -O xp "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/xp.sh"
chmod +x add-host
chmod +x about
chmod +x menu
chmod +x ram
chmod +x wbmn
chmod +x xp
wget -O restart "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/restart.sh"
wget -O info "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/info.sh"
wget -O speedtest "https://raw.githubusercontent.com/Sangarya/ntb/main/cek/speedtest_cli.py"
#wget -O update "https://raw.githubusercontent.com/Sangarya/ntb/main/install/update.sh"
wget -O host "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/domain/host.sh"
wget -O autoreboot "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/autoreboot.sh"
wget -O status "https://raw.githubusercontent.com/Sangarya/ntb/main/install/status.sh"
wget -O bw "https://raw.githubusercontent.com/Dimas1441/gaskeun/main/bahan/bw.sh"
wget -O clear-log "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/clear-log.sh"
chmod +x restart
chmod +x info
chmod +x speedtest
chmod +x update
chmod +x host
chmod +x autoreboot
chmod +x status
chmod +x bw
chmod +x clear-log

#rm -rf websocket.sh && apt install curl && wget https://raw.githubusercontent.com/Sangarya/ntb/main/websocket/websocket.sh && apt update && apt install lolcat && apt install dos2unix && dos2unix websocket.sh && chmod +x websocket.sh && ./websocket.sh
wget -O /usr/bin/status https://github.com/Sangarya/ntb/raw/main/install/status.sh && chmod +x /usr/bin/status && cd /usr/bin && apt install -y dos2unix && dos2unix status
wget -O /usr/bin/system https://github.com/Sangarya/ntb/raw/main/menu/system.sh && chmod +x /usr/bin/system && cd /usr/bin && apt install -y dos2unix && dos2unix system
wget -O /usr/bin/del-ws https://raw.githubusercontent.com/Sangarya/ntb/main/del/del-ws.sh && chmod +x /usr/bin/del-ws
wget -O /usr/bin/add-cf https://raw.githubusercontent.com/Sangarya/ntb/main/domain/add-cf.sh && chmod +x /usr/bin/add-cf && cd /usr/bin && apt install -y dos2unix && dos2unix add-cf
wget -O /usr/bin/bw https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/bw.sh && chmod +x /usr/bin/bw && cd /usr/bin && apt install -y dos2unix && dos2unix bw
wget -O bengkel "https://raw.githubusercontent.com/Sangarya/ntb/main/edit/bengkel.sh"
wget -O /usr/bin/bengkel https://raw.githubusercontent.com/Sangarya/ntb/main/edit/bengkel.sh && chmod +x /usr/bin/bengkel && cd /usr/bin && apt install -y dos2unix && dos2unix bengkel
wget -O panel-domain "https://raw.githubusercontent.com/Sangarya/ntb/main/domain/panel-domain.sh"
wget -O /usr/bin/panel-domain https://raw.githubusercontent.com/Sangarya/ntb/main/domain/panel-domain.sh && chmod +x /usr/bin/panel-domain && cd /usr/bin && apt install -y dos2unix && dos2unix panel-domain
wget -O user-generate "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/user-generate"
wget -O user-password "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/user-password"
wget -O /etc/shadowsocks-libev/tls.json https://github.com/Sangarya/ntb/raw/main/menu/tls.json && chmod +x /etc/shadowsocks-libev/tls.json
wget -O /etc/shadowsocks-libev/http.json https://github.com/Sangarya/ntb/raw/main/menu/http.json && chmod +x /etc/shadowsocks-libev/http.json
systemctl restart shadowsocks-libev-server@tls
systemctl restart shadowsocks-libev-server@http
wget -O /usr/bin/host https://raw.githubusercontent.com/Sangarya/ntb/main/domain/host.sh && chmod +x /usr/bin/host && cd /usr/bin && apt install -y dos2unix && dos2unix host
wget -O /usr/bin/clear-log https://github.com/Sangarya/ntb/raw/main/bahan/clear-log.sh && chmod +x /usr/bin/clear-log && cd /usr/bin && apt install -y dos2unix && dos2unix clear-log
wget -O /usr/bin/pointing https://github.com/Sangarya/ntb/raw/main/bahan/pointing.sh && chmod +x /usr/bin/pointing && cd /usr/bin && apt install -y dos2unix && dos2unix pointing
#wget -O /usr/bin/speedtest_cli.py https://github.com/Sangarya/ntb/raw/main/bahan/speedtest_cli.py && chmod +x /usr/bin/speedtest_cli.py && cd /usr/bin && apt install -y dos2unix && dos2unix speedtest_cli.py
rm -rf antiabuse.sh && apt install curl && wget https://github.com/Sangarya/ntb/raw/main/bahan/antiabuse.sh && apt update && apt install dos2unix && dos2unix antiabuse.sh && chmod +x antiabuse.sh && ./antiabuse.sh
rm -rf go.sh && apt install curl && wget raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/go.sh && chmod +x go.sh && ./go.sh
wget -O /usr/bin/renew-trgo raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/renew-trgo.sh && chmod +x /usr/bin/renew-trgo && cd /usr/bin && apt install -y dos2unix && dos2unix renew-trgo
wget -O /usr/bin/del-trgo raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/del-trgo.sh && chmod +x /usr/bin/del-trgo && cd /usr/bin && apt install -y dos2unix && dos2unix del-trgo
wget -O /usr/bin/cek-trgo raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/cek-trgo.sh && chmod +x /usr/bin/cek-trgo && cd /usr/bin && apt install -y dos2unix && dos2unix cek-trgo
wget -O /usr/bin/add-trgo raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/add-trgo.sh && chmod +x /usr/bin/add-trgo && cd /usr/bin && apt install -y dos2unix && dos2unix add-trgo
wget -O /usr/bin/port-trgo raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/port-trgo.sh && chmod +x /usr/bin/port-trgo && cd /usr/bin && apt install -y dos2unix && dos2unix port-trgo
#wget -O /usr/bin/enc https://github.com/Sangarya/ntb/raw/main/install/enc.sh && chmod +x /usr/bin/enc && cd /usr/bin && apt install -y dos2unix && dos2unix enc
#rm -rf enc.sh && apt install curl && wget https://github.com/Sangarya/ntb/raw/main/install/enc.sh && apt update && apt install dos2unix && dos2unix enc.sh && chmod +x enc.sh && ./enc.sh
wget -O /usr/bin/bannerBACKUP https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerBACKUP && chmod +x /usr/bin/bannerBACKUP
wget -O /usr/bin/bannerL2TP https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerL2TP && chmod +x /usr/bin/bannerL2TP
wget -O /usr/bin/bannerPPTP https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerPPTP && chmod +x /usr/bin/bannerPPTP
wget -O /usr/bin/bannerSHADOWSOCK https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerSHADOWSOCK && chmod +x /usr/bin/bannerSHADOWSOCK
wget -O /usr/bin/bannerSSH https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerSSH && chmod +x /usr/bin/bannerSSH
wget -O /usr/bin/bannerSSTP https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerSSTP && chmod +x /usr/bin/bannerSSTP
wget -O /usr/bin/bannerTROJAN https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerTROJAN && chmod +x /usr/bin/bannerTROJAN
wget -O /usr/bin/bannerV2RAY https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerV2RAY && chmod +x /usr/bin/bannerV2RAY
wget -O /usr/bin/bannerWIREGUARD https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerWIREGUARD && chmod +x /usr/bin/bannerWIREGUARD
wget -O /usr/bin/bannerSYSTEM https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerSYSTEM && chmod +x /usr/bin/bannerSYSTEM
wget -O /usr/bin/panelVPN https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/panelVPN && chmod +x /usr/bin/panelVPN
wget -O /usr/bin/bebek https://raw.githubusercontent.com/Sangarya/ntb/main/menu/bebek.sh && chmod +x /usr/bin/bebek
wget -O /usr/bin/l2tp https://raw.githubusercontent.com/Sangarya/ntb/main/menu/l2tp.sh && chmod +x /usr/bin/l2tp
wget -O /usr/bin/paneli https://raw.githubusercontent.com/Sangarya/ntb/main/menu/paneli.sh && chmod +x /usr/bin/paneli
wget -O /usr/bin/ppt https://raw.githubusercontent.com/Sangarya/ntb/main/menu/ppt.sh && chmod +x /usr/bin/ppt
wget -O /usr/bin/ssh https://raw.githubusercontent.com/Sangarya/ntb/main/menu/ssh.sh && chmod +x /usr/bin/ssh
wget -O /usr/bin/ssssr https://raw.githubusercontent.com/Sangarya/ntb/main/menu/ssssr.sh && chmod +x /usr/bin/ssssr
wget -O /usr/bin/sstpp https://raw.githubusercontent.com/Sangarya/ntb/main/menu/sstpp.sh && chmod +x /usr/bin/sstpp
#wget -O /usr/bin/system https://raw.githubusercontent.com/Sangarya/ntb/main/menu/system.sh && chmod +x /usr/bin/system
wget -O /usr/bin/trojaan https://raw.githubusercontent.com/Sangarya/ntb/main/menu/trojaan.sh && chmod +x /usr/bin/trojaan
wget -O /usr/bin/v2raay https://raw.githubusercontent.com/Sangarya/ntb/main/menu/v2raay.sh && chmod +x /usr/bin/v2raay
wget -O /usr/bin/vleess https://raw.githubusercontent.com/Sangarya/ntb/main/menu/vleess.sh && chmod +x /usr/bin/vleess
wget -O /usr/bin/wgr https://raw.githubusercontent.com/Sangarya/ntb/main/menu/wgr.sh && chmod +x /usr/bin/wgr
wget -O /usr/bin/user-generate https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/user-generate && chmod +x /usr/bin/user-generate && cd /usr/bin && apt install -y dos2unix && dos2unix user-generate
#BACKUP
wget -O /usr/bin/add-l2tp https://raw.githubusercontent.com/Sangarya/ntb/main/add/add-l2tp.sh && chmod +x /usr/bin/add-l2tp && cd /usr/bin && apt install -y dos2unix && dos2unix add-l2tp
#wget https://raw.githubusercontent.com/Sangarya/ntb/main/backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh
#rm -f /root/set-br.sh
#wget https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/sstp.sh && chmod +x sstp.sh && ./sstp.sh
wget -O /home/vps/public_html/index.html https://raw.githubusercontent.com/Sangarya/ntb/main/install/index.html && chmod +x /home/vps/public_html/index.html && cd /home/vps/public_html/index.html && apt install -y dos2unix && dos2unix index.html
echo "0 0 * * * root clear-log && xp" >> /etc/crontab
echo "*/10 * * * * root xp-ws" >> /etc/crontab
cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh
rm -f /root/websocket.sh
rm -f /root/master.zip
rm -f /root/badvpn-master

apt install dnsutils jq -y
apt-get install net-tools -y
apt-get install tcpdump -y
apt-get install dsniff -y
apt install grepcidr -y

cd
systemctl restart cron
echo "1.0.1" > /home/ver
clear
figlet -f slant SUKSES | lolcat
rm -f update.sh
sleep 2
clear
neofetch
