#!/bin/bash
# Trojan Go Auto Setup 
# =========================

apt update -y
apt upgrade -y
apt install wget -y
apt install screen -y
apt install curl -y
apt install zip
# Domain 
domain=$(cat /etc/v2ray/domain)

# Uuid Service
uuid=$(cat /proc/sys/kernel/random/uuid)

# Yahaha
mkdir -p "/usr/bin/trojan-go"
mkdir -p "/etc/trojan-go"

# Installing Trojan Go
wget -O /usr/bin/trojan-go/trojan-go https://raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/trojan-go
chmod +x /usr/bin/trojan-go/trojan-go
wget -O /etc/trojan-go/geoip.dat https://raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/geoip.dat
wget -O /etc/trojan-go/geosite.dat https://raw.githubusercontent.com/Sangarya/ntb/main/trojan-go/geosite.dat
mkdir /var/log/trojan-go/
touch /etc/trojan-go/akun.conf
touch /etc/trojan-go/trojan-go.pid
touch /var/log/trojan-go/trojan-go.log

# Config
cat > /etc/trojan-go/config.json << END
{
  "run_type": "server",
  "local_addr": "0.0.0.0",
  "local_port": 2053,
  "remote_addr": "127.0.0.1",
  "remote_port": 81,
  "log_level": 1,
  "log_file": "/var/log/trojan-go/trojan-go.log",
  "password": [
        "$uuid"
  ],
  "disable_http_check": true,
  "udp_timeout": 60,
  "ssl": {
    "verify": false,
    "verify_hostname": false,
    "cert": "/etc/v2ray/v2ray.crt",
    "key": "/etc/v2ray/v2ray.key",
    "key_password": "",
    "cipher": "",
    "curves": "",
    "prefer_server_cipher": false,
    "sni": "$domain",
    "alpn": [
      "http/1.1"
    ],
    "session_ticket": true,
    "reuse_session": true,
    "plain_http_response": "",
    "fallback_addr": "127.0.0.1",
    "fallback_port": 0,
    "fingerprint": "firefox"
  },
  "tcp": {
    "no_delay": true,
    "keep_alive": true,
    "prefer_ipv4": true
  },
  "mux": {
    "enabled": false,
    "concurrency": 8,
    "idle_timeout": 60
  },
  "websocket": {
    "enabled": true,
    "path": "/trojango",
    "host": "$domain"
  },
    "api": {
    "enabled": false,
    "api_addr": "",
    "api_port": 0,
    "ssl": {
      "enabled": false,
      "key": "",
      "cert": "",
      "verify_client": false,
      "client_cert": []
    }
  }
}
END

# Service
cat > /etc/systemd/system/trojan-go.service << END
[Unit]
Description=Trojan Go Script By Geo Gabut
Documentation=https://t.me/sampiiiiu
Documentation=https://github.com/p4gefau1t/trojan-go
After=network.target nss-lookup.target

[Service]
Type=simple
StandardError=journal
PIDFile=/etc/trojan-go/trojan-go.pid
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/trojan-go/trojan-go -config /etc/trojan-go/config.json
LimitNOFILE=51200
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target
END

# Uuid Trojan Go
cat > /etc/trojan-go/uuid.txt << END
$uuid
END

# Iptables Port Trojan Go
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2096 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 81 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2096 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 81 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
# Enable & Start & Restart Trojan Go
systemctl enable trojan-go
systemctl daemon-reload
systemctl start trojan-go
systemctl restart trojan-go

cd
rm -f /root/go.sh
