#!/bin/bash

cd

# Install Template
wget -q -O /usr/local/bin/ws-drop "https://raw.githubusercontent.com/Sangarya/ntb/main/websocket/ws-dropbear.py"
wget -q -O /usr/local/bin/ws-openssh "https://raw.githubusercontent.com/Sangarya/ntb/main/websocket/ws-openssh.py"
wget -q -O /usr/local/bin/ws-ovpn "https://raw.githubusercontent.com/Sangarya/ntb/main/websocket/ws-ovpn.py"
wget -q -O /usr/local/bin/ws-tls "https://raw.githubusercontent.com/Sangarya/ntb/main/websocket/ws-tls.py"

chmod +x /usr/local/bin/ws-drop
chmod +x /usr/local/bin/ws-openssh
chmod +x /usr/local/bin/ws-ovpn
chmod +x /usr/local/bin/ws-tls

# Dropbear
cat > /etc/systemd/system/ws-dropbear.service << END
[Unit]
Description=SSH Over CDN WS Dropbear
Documentation=https://vpnkuy.site
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-drop
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

# OpenSSH
cat > /etc/systemd/system/ws-openssh.service << END
[Unit]
Description=SSH Over CDN WS Dropbear
Documentation=https://vpnkuy.site
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-openssh
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

# OpenVPN
cat > /etc/systemd/system/ws-openvpn.service << END
[Unit]
Description=SSH Over CDN WS OpenVPN
Documentation=https://vpnkuy.site
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

# Stunnel
cat > /etc/systemd/system/ws-stunnel.service << END
[Unit]
Description=SSH Over CDN WS Stunnel
Documentation=https://vpnkuy.site
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-tls
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

# Exec Start
systemctl daemon-reload

# Activated
systemctl enable ws-dropbear.service
systemctl enable ws-openssh.service
systemctl enable ws-openvpn.service
systemctl enable ws-stunnel.service

# Restart
systemctl restart ws-dropbear.service
systemctl restart ws-openssh.service
systemctl restart ws-openvpn.service
systemctl restart ws-stunnel.service

echo -e "SUKSES" | lolcat
rm -f websocket.sh
