#!/bin/bash

cd

#figlet -f slant Install WS | lolcat
# Install Template
wget -q -O /usr/local/bin/ws-drop "https://raw.githubusercontent.com/Sangarya/ntb/main/websocket/ws-dropbear.py"
wget -q -O /usr/local/bin/ws-openssh "https://raw.githubusercontent.com/Sangarya/ntb/main/websocket/ws-openssh.py"
wget -q -O /usr/local/bin/ws-ovpn "https://raw.githubusercontent.com/Sangarya/ntb/main/websocket/ws-ovpn.py"
wget -q -O /usr/local/bin/ws-tls "https://raw.githubusercontent.com/Sangarya/ntb/main/websocket/ws-tls.py"

chmod +x /usr/local/bin/ws-drop
chmod +x /usr/local/bin/ws-openssh
chmod +x /usr/local/bin/ws-ovpn
chmod +x /usr/local/bin/ws-tls

#figlet -f slant Configurating CDN | lolcat
# Dropbear
cat > /etc/systemd/system/ws-dropbear.service << END
[Unit]
Description=SSH Over CDN WS Dropbear
Documentation=https://dhans-project.xyz
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
Documentation=https://dhans-project.xyz
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
Documentation=https://dhans-project.xyz
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
Documentation=https://dhans-project.xyz
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
z$yCz$ADz$IBz$JBz$KBz$LBz$MBz$NBz$z$BDz$CDz$DDz$EDz$FDz$z$GDz$HDz$ICz$z$IDz$JDz$KDz$LDz$MDz$ECz$FCz$z$NDz$z$RBz$SBz$TBz$UBz$VBz$UBz$WBz$dz$ez$ODz$HCz$PDz$NDz$z$cBz$dBz$z$eBz$fBz$gBz$hBz$iBz$jBz$kBz$lBz$bz$z$mBz$nBz$oBz$pBz$gz$qBz$rBz$sBz$tBz$uBz$z$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$z$GCz$HCz$ICz$z$JCz$KCz$LCz$z$MCz$NCz$OCz$z$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$aCz$bCz$cCz$z$dCz$eCz$fCz$gCz$hCz$YCz$ZCz$iCz$jCz$VCz$kCz$lCz$mCz$nCz$z$oCz$pCz$qCz$rCz$sCz$z$tCz$uCz$vCz$wCz$xCz$yCz$ADz$IBz$JBz$KBz$LBz$vz$wz$OBz$z$BDz$CDz$DDz$EDz$FDz$z$GDz$HDz$ICz$z$IDz$JDz$KDz$LDz$MDz$ECz$FCz$z$NDz$z$RBz$SBz$TBz$UBz$VBz$UBz$WBz$dz$QDz$ODz$HCz$PDz$NDz$z$cBz$dBz$z$eBz$fBz$gBz$hBz$iBz$jBz$kBz$RDz$SDz$z$mBz$nBz$oBz$pBz$gz$qBz$rBz$sBz$tBz$uBz$z$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$z$GCz$HCz$ICz$z$JCz$KCz$LCz$z$MCz$NCz$OCz$z$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$aCz$bCz$cCz$z$dCz$eCz$fCz$gCz$hCz$YCz$ZCz$iCz$jCz$VCz$kCz$lCz$mCz$nCz$z$oCz$pCz$qCz$rCz$sCz$z$tCz$uCz$vCz$wCz$xCz$yCz$ADz$IBz$JBz$KBz$LBz$vz$PBz$z$BDz$CDz$DDz$EDz$FDz$z$GDz$HDz$ICz$z$IDz$JDz$KDz$LDz$MDz$ECz$FCz$z$NDz$z$RBz$SBz$TBz$UBz$VBz$UBz$WBz$TDz$UDz$ODz$HCz$PDz$NDz$z$cBz$dBz$z$eBz$fBz$gBz$hBz$iBz$jBz$kBz$VDz$WDz$z$mBz$nBz$oBz$pBz$gz$qBz$rBz$sBz$tBz$uBz$z$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$z$GCz$HCz$ICz$z$JCz$KCz$LCz$z$MCz$NCz$OCz$z$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$aCz$bCz$cCz$z$dCz$eCz$fCz$gCz$hCz$YCz$ZCz$iCz$jCz$VCz$kCz$lCz$mCz$nCz$z$oCz$pCz$qCz$rCz$sCz$z$tCz$uCz$vCz$wCz$xCz$yCz$ADz$IBz$JBz$KBz$LBz$EBz$QBz$z$BDz$CDz$DDz$EDz$FDz$z$GDz$HDz$ICz$z$IDz$JDz$KDz$LDz$MDz$ECz$FCz$z$NDz$z$XDz$YDz$ZDz$aDz$bDz$cDz$z$XDz$YDz$dDz$eDz$fDz$az$bz$ODz$HCz$z$XDz$YDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$z$XDz$YDz$dDz$eDz$fDz$gDz$kDz$iDz$jDz$z$XDz$YDz$dDz$eDz$fDz$lDz$mDz$iDz$jDz$z$XDz$YDz$nDz$oDz$pDz$Iz$XBz$YBz$ZBz$qDz$z$XDz$YDz$nDz$oDz$pDz$dz$ez$ODz$HCz$z$XDz$YDz$nDz$oDz$pDz$dz$QDz$ODz$HCz$z$XDz$YDz$nDz$oDz$pDz$TDz$UDz$ODz$HCz$z$rDz$sDz$tDz$uDz$vDz$wDz$OCz$z$xDz$yDz$tz$AEz$OBz"