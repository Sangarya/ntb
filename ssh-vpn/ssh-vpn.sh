#!/bin/bash
#
# ==================================================

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=www.geogabut.com
organizationalunit=www.geogabut.com
commonname=www.geogabut.com
email=paoandest@gmail.com

# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/password"
chmod +x /etc/pam.d/common-password

# go to root
cd
# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

apt install shc -y

#figlet
apt-get install figlet -y
apt-get install ruby -y
gem install lolcat

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "figlet -f slant GEO GABUT | lolcat" >> .profile
echo "sleep 0.2" >> .profile
echo "clear" >> .profile
echo "neofetch" >> .profile
echo "echo -e \" - Script Mod By Geo Gabut\" | lolcat" >> .profile
echo "echo -e \"\x1b[96m - Silahkan Ketik\x1b[m \x1b[92mMENU\x1b[m \x1b[96mUntuk Melihat daftar Perintah\x1b[m\"" >> .profile

# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "raw.githubusercontent.com/Sangarya/ntb/main/bahan/nginx.conf"
mkdir -p /home/vps/public_html
echo "<br><b><center><a href=\"https://wa.me/6282339191527\">GEO</a> - <a href=\"https://wa.me/6287756116610\">NURJANAH</a> GEO VPN STORE</center></b></br>" >> /home/vps/public_html/index.html
wget -O /etc/nginx/conf.d/vps.conf "raw.githubusercontent.com/Sangarya/ntb/main/bahan/vps.conf"
/etc/init.d/nginx restart

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "raw.githubusercontent.com/Sangarya/ntb/main/bahan/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 69 -p 77"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# install squid
cd
apt -y install squid3
wget -O /etc/squid/squid.conf "raw.githubusercontent.com/Sangarya/ntb/main/bahan/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 222
connect = 127.0.0.1:109

[openssh]
accept = 171
connect = 127.0.0.1:22

[ws-stunnel]
accept = 2096
connect = 127.0.0.1:443

[dropbear]
accept = 777
connect = 127.0.0.1:109

[openvpn]
accept = 442
connect = 127.0.0.1:1194

END

#SSLH
apt-get install sslh -y
#Forward 443 = ws-ssl-stunnel4-dropbear
wget -O /etc/default/sslh "https://raw.githubusercontent.com/Sangarya/ntb/main/websocket/error"
service sslh restart

# certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

#OpenVPN
wget https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Tolong  Uninstall Versi Sebelumnya!"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/banner.conf"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin
wget -O add-host "https://raw.githubusercontent.com/Sangarya/ntb/main/add/add-host.sh"
wget -O about "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/about.sh"
wget -O menu "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/Sangarya/ntb/main/ssh-vpn/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/Sangarya/ntb/main/ssh-vpn/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/Sangarya/ntb/main/ssh-vpn/hapus.sh"
wget -O member "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/member.sh"
wget -O delete "https://raw.githubusercontent.com/Sangarya/ntb/main/del/delete.sh"
wget -O cek "https://raw.githubusercontent.com/Sangarya/ntb/main/cek/cek.sh"
wget -O restart "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/restart.sh"
wget -O speedtest "https://raw.githubusercontent.com/Sangarya/ntb/main/cek/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/info.sh"
wget -O ram "https://raw.githubusercontent.com/Sangarya/ntb/main/backup/ram.sh"
wget -O renew "https://raw.githubusercontent.com/Sangarya/ntb/main/renew/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/Sangarya/ntb/main/cek/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/tendang.sh"
wget -O clear-log "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/clear-log.sh"
wget -O change-port "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/Sangarya/ntb/main/port/port-vless.sh"
wget -O wbmn "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/webmin.sh"
wget -O clear-log "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/clear-log.sh"
wget -O xp "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/xp.sh"
wget -O /usr/bin/user-limit https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/user-limit.sh && chmod +x /usr/bin/user-limit
wget -O cfd "https://raw.githubusercontent.com/Sangarya/ntb/main/domain/cfd.sh"
wget -O cff "https://raw.githubusercontent.com/Sangarya/ntb/main/domain/cff.sh"
wget -O cfh "https://raw.githubusercontent.com/Sangarya/ntb/main/domain/cfh.sh"
wget -O trialws "https://raw.githubusercontent.com/Sangarya/ntb/main/domain/trialws.sh"
wget -O autoreboot "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/autoreboot.sh"
wget -0 running "https://github.com/Sangarya/ntb/raw/main/menu/running.sh"
wget -O bannerku "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/bannerku"
wget -O bbr "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/bbr.sh"
wget -O menu "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/menu.sh"
wget -O trojaan "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/trojaan.sh"
wget -O vleess "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/vleess.sh"
wget -O wgr "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/wgr.sh"
wget -O l2tp "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/l2tp.sh"
wget -O v2raay "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/v2raay.sh"
wget -O ssh "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/ssh.sh"
wget -O sstpp "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/sstpp.sh"
wget -O ssssr "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/ssssr.sh"
wget -O update "https://raw.githubusercontent.com/Sangarya/ntb/main/install/update.sh"
wget -O running "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/running.sh"
wget -O status "https://raw.githubusercontent.com/Sangarya/ntb/main/install/status.sh"
wget -O add-trgo "https://raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/add-trgo.sh"
wget -O cek-trgo "https://raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/cek-trgo.sh"
wget -O del-trgo "https://raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/del-trgo.sh"
wget -O port-trgo "https://raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/port-trgo.sh"
wget -O renew-trgo "https://raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/renew-trgo.sh"
wget -O bannerBACKUP "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerBACKUP"
wget -O bannerL2TP "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerL2TP"
wget -O bannerPPTP "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerPPTP"
wget -O bannerSHADOWSOCK "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerSHADOWSOCK"
wget -O bannerSSH "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerSSH"
wget -O bannerSSTP "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerSSTP"
wget -O bannerTROJAN "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerTROJAN"
wget -O bannerV2RAY "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerV2RAY"
wget -O bannerWIREGUARD "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerWIREGUARD"
wget -O bannerSYSTEM "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/bannerSYSTEM"
wget -O panelVPN "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/banner/panelVPN"
wget -O bebek "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/bebek.sh"
wget -O l2tp "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/l2tp.sh"
wget -O paneli "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/paneli.sh"
wget -O ppt "https://raw.githubusercontent.com/Sangarya/ntb/main/menu/ppt.sh"
wget -O panel-domain "https://raw.githubusercontent.com/Sangarya/ntb/main/domain/panel-domain.sh"
wget -0 user-generate "https://raw.githubusercontent.com/Sangarya/ntb/main/bahan/user-generate"
chmod +x trialws
chmod +x add-host
chmod +x menu
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x clear-log
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x clear-log
chmod +x xp
chmod +x cfd
chmod +x cff
chmod +x cfh
chmod +x autoreboot
chmod +x bannerku
chmod +x bbr
chmod +x menu
chmod +x trojaan
chmod +x vleess
chmod +x wgr
chmod +x l2tp
chmod +x v2raay
chmod +x ssh
chmod +x sstpp
chmod +x ssssr
chmod +x update
chmod +x running
chmod +x status
chmod +x add-trgo
chmod +x cek-trgo
chmod +x del-trgo
chmod +x port-trgo
chmod +x renew-trgo
chmod +x bannerBACKUP
chmod +x bannerL2TP
chmod +x bannerPPTP
chmod +x bannerSHADOWSOCK
chmod +x bannerSSH
chmod +x bannerSSTP
chmod +x bannerTROJAN
chmod +x bannerV2RAY
chmod +x bannerWIREGUARD
chmod +x bannerSYSTEM
chmod +x panelVPN
chmod +x bebek
chmod +x l2tp
chmod +x paneli
chmod +x ppt
chmod +x panel-domain
chmod +x user-generate
echo "0 5 * * * root clear-log && reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

apt install dnsutils jq -y
apt-get install net-tools -y
apt-get install tcpdump -y
apt-get install dsniff -y
apt install grepcidr -y

echo -e "Done Install SSH Services" | lolcat
figlet -f slant GEO GABUT | lolcat
sleep 1
# finihsing
clear
