<h2 align="center">AutoScript Install SSH & OpenVPN & V2rayXray & SSR & Trojan & WireGuard For Debian VPS By InternetVPN <img src="https://img.shields.io/badge/Version-2.0.4-blue.svg"></h2>


<h2 align="center"> Supported Linux Distribution</h2>
<p align="center"><img src="https://d33wubrfki0l68.cloudfront.net/5911c43be3b1da526ed609e9c55783d9d0f6b066/9858b/assets/img/debian-ubuntu-hover.png"></p> 
<p align="center"><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%209&message=Stretch&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2010&message=Buster&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2018&message=18.04 LTS&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2020&message=20.04 LTS&color=red"></p>

<p align="center"><img src="https://img.shields.io/badge/Service-OpenSSH-success.svg">  <img src="https://img.shields.io/badge/Service-Dropbear-success.svg">  <img src="https://img.shields.io/badge/Service-BadVPN-success.svg">  <img src="https://img.shields.io/badge/Service-Stunnel-success.svg">  <img src="https://img.shields.io/badge/Service-OpenVPN-success.svg">  <img src="https://img.shields.io/badge/Service-Squid3-success.svg">  <img   src="https://img.shields.io/badge/Service-Webmin-success.svg">  <img src="https://img.shields.io/badge/Service-Privoxy-green.svg">   <img
src="https://img.shields.io/badge/Service-V2rayXray-success.svg">  <img src= "https://img.shields.io/badge/Service-SSR-success.svg">  <img src="https://img.shields.io/badge/Service-Trojan-success.svg">  <img src="https://img.shields.io/badge/Service-WireGuard-success.svg">


# ntb
```
rm -rf setup.sh && apt install curl && wget https://raw.githubusercontent.com/Sangarya/ntb/main/install/setup.sh && apt update && apt install lolcat -y && apt install dos2unix && dos2unix setup.sh && chmod +x setup.sh && ./setup.sh
```
## Description :

> Service Port                                                
   - OpenSSH                 : 22
   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442
   - Stunnel4                : 443, 171                            
   - Dropbear                : 443, 109, 143
   - WebSocket Dropbear      : 2052
   - WebSocket OpenSSH       : 2095                               
   - WebSocket OpenVPN       : 2082
   - WebSocket TLS           : 443                                 
   - SSLH Multiplexer        : 443
   - Squid Proxy             : 3128, 8080 (limit to IP SSH)
   - Badvpn                  : 7100, 7200, 7300
   - Nginx                   : 81                                  
   - Wireguard               : 7070
   - L2TP/IPSEC VPN          : 1701
   - PPTP VPN                : 1732
   - SSTP VPN                : 444
   - Shadowsocks-R           : 1443-1543
   - SS-OBFS TLS             : 2443-2543
   - SS-OBFS HTTP            : 3443-3543
   - V2RAY Vmess TLS         : 8443
   - V2RAY Vmess None TLS    : 80
   - V2RAY Vless TLS         : 2083
   - V2RAY Vless None TLS    : 8880
   - TrojanGFW               : 2087
   - TrojanGO                : 2053

   >>> Server Information & Other Features
   - Timezone                : Asia/Jakarta (GMT +7)
   - Fail2Ban                : [ON]
   - Dflate                  : [ON]
   - IPtables                : [ON]
   - Auto-Reboot             : [ON]
   - IPv6                    : [OFF]

## Credit :
  
*   Horas Marolop Amsal Siregar
