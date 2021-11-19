#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
MYIP=$(wget -qO- ipinfo.io/ip);
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "             ${green}PORT OPENVPN${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Ubah Port OVPN TCP $ovpn"
echo -e "     2 ⸩  Ubah Port OVPN UDP $ovpn2"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor  [1-2 / x] :  " prot
echo -e "${off}"

case $prot in
1)
echo -e "${green}"
read -p "Masukkan Port Baru OpenVPN TCP :  " vpn
echo -e "${off}"

if [ -z $vpn ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
rm -f /etc/openvpn/server/server-tcp-$ovpn.conf
rm -f /etc/openvpn/client-tcp-$ovpn.ovpn
rm -f /home/vps/public_html/TCP.ovpn
cat > /etc/openvpn/server/server-tcp-$vpn.conf<<END
port $vpn
proto tcp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
verify-client-cert none
username-as-common-name
server 10.6.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
keepalive 5 30
comp-lzo
persist-key
persist-tun
status openvpn-tcp.log
verb 3
END
cat > /etc/openvpn/client-tcp-$vpn.ovpn <<-END
client
dev tun
proto tcp
remote $MYIP $vpn
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END
echo '<ca>' >> /etc/openvpn/client-tcp-$vpn.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/client-tcp-$vpn.ovpn
echo '</ca>' >> /etc/openvpn/client-tcp-$vpn.ovpn
cp /etc/openvpn/client-tcp-$vpn.ovpn /home/vps/public_html/UDP.ovpn
systemctl disable --now openvpn-server@server-tcp-$ovpn > /dev/null
systemctl enable --now openvpn-server@server-tcp-$vpn > /dev/null
sed -i "s/   - OpenVPN                 : TCP $ovpn, UDP $ovpn2, SSL 442/   - OpenVPN                 : TCP $vpn, UDP $ovpn2, SSL 442/g" /root/log-install.txt
sed -i "s/$ovpn/$vpn/g" /etc/stunnel/stunnel.conf
echo -e "${cyan}Port OpenVPN TCP Berhasil Diganti Menjadi :${off} ${green} $vpn ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $vpn ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi
;;
2)

echo -e "${green}"
read -p "Masukkan Port Baru OpenVPN UDP :  " vpn
echo -e "${off}"
if [ -z $vpn ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
rm -f /etc/openvpn/server/server-udp-$ovpn2.conf
rm -f /etc/openvpn/client-udp-$ovpn2.ovpn
rm -f /home/vps/public_html/TCP.ovpn
cat > /etc/openvpn/server/server-udp-$vpn.conf<<END
port $vpn
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
verify-client-cert none
username-as-common-name
server 10.7.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
keepalive 5 30
comp-lzo
persist-key
persist-tun
status openvpn-udp.log
verb 3
explicit-exit-notify
END
cat > /etc/openvpn/client-udp-$vpn.ovpn <<-END
client
dev tun
proto udp
remote $MYIP $vpn
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END
echo '<ca>' >> /etc/openvpn/client-udp-$vpn.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/client-udp-$vpn.ovpn
echo '</ca>' >> /etc/openvpn/client-udp-$vpn.ovpn
cp /etc/openvpn/client-udp-$vpn.ovpn /home/vps/public_html/UDP.ovpn
systemctl disable --now openvpn-server@server-udp-$ovpn2 > /dev/null
systemctl enable --now openvpn-server@server-udp-$vpn > /dev/null
sed -i "s/   - OpenVPN                 : TCP $ovpn, UDP $ovpn2, SSL 442/   - OpenVPN                 : TCP $ovpn, UDP $vpn, SSL 442/g" /root/log-install.txt
echo -e "${cyan}Port OpenVPN UDP Berhasil Diganti Menjadi :${off} ${green} $vpn ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $vpn ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi
;;
x)
exit
menu
;;
*)
echo -e "${red}Masukkan Nomor Yang Ada!${off}"
sleep 1
clear
menu
;;
esac

LEz='crt';DHz='r@se';CEz='p';JIz='${gr';gGz='me/v';YFz='e 5 ';xDz='port';XDz='pn/s';PCz='  Pi';HIz='rt{o';uDz='n.co';gIz='exit';sEz='0.0 ';RJz='kan ';WEz='usr/';qFz='nt';EBz='d: -';VIz='yste';kCz='TCP ';gBz='"${c';vBz='  1 ';xGz='l en';cBz='"';fGz=' /ho';Iz='NC='\''';vEz='ifco';NGz='etc/';VGz='rt >';XBz=' $4}';xIz='nt-u';sCz='"${r';DGz=' exe';dEz='so l';TJz='ng A';cFz='pers';az='MYIP';TDz='rm -';VCz=' :  ';dDz='pn.c';tDz='-$vp';sDz='> /e';ZHz='nVPN';gFz='pn-t';EGz='nobi';cIz='t La';IGz='r-pa';wIz='tify';kHz='g-in';qz='open';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$z$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$FBz$z$iz$GBz$HBz$IBz$JBz$KBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$z$dBz$eBz$fBz$z$dBz$eBz$gBz$hBz$iBz$iBz$iBz$iBz$iBz$iBz$iBz$iBz$iBz$jBz$kBz$cBz$z$dBz$eBz$lBz$mBz$mBz$nBz$Ez$oBz$pBz$qBz$rBz$kBz$cBz$z$dBz$eBz$gBz$hBz$iBz$iBz$iBz$iBz$iBz$iBz$iBz$iBz$iBz$jBz$kBz$cBz$z$dBz$eBz$sBz$tBz$uBz$z$dBz$eBz$lBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$z$dBz$eBz$lBz$ECz$wBz$xBz$yBz$ACz$FCz$CCz$GCz$cBz$z$dBz$eBz$lBz$HCz$ICz$JCz$KCz$z$dBz$eBz$LCz$MCz$z$dBz$eBz$gBz$hBz$iBz$iBz$iBz$iBz$iBz$iBz$iBz$iBz$iBz$jBz$kBz$cBz$z$dBz$eBz$sBz$tBz$uBz$z$NCz$OCz$lBz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$z$dBz$eBz$LCz$MCz$z$YCz$ZCz$aCz$bCz$z$cCz$z$dBz$eBz$sBz$tBz$uBz$z$NCz$OCz$dCz$eCz$fCz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$z$dBz$eBz$LCz$MCz$z$nCz$oCz$pCz$qCz$rCz$z$dBz$eBz$sCz$tCz$uCz$vCz$wCz$xCz$yCz$ADz$BDz$CDz$z$DDz$EDz$z$Yz$Zz$z$FDz$z$GDz$z$HDz$IDz$JDz$KDz$LDz$PBz$QBz$MDz$NDz$z$nCz$ODz$PDz$QDz$RDz$SDz$z$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$z$TDz$UDz$VDz$WDz$fDz$gDz$hDz$iDz$jDz$iz$z$TDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$iz$z$rDz$sDz$VDz$WDz$XDz$YDz$ZDz$aDz$bDz$tDz$uDz$vDz$wDz$z$xDz$yDz$bCz$z$AEz$BEz$CEz$z$DEz$EEz$z$FEz$GEz$HEz$z$IEz$JEz$KEz$LEz$z$MEz$NEz$OEz$PEz$z$QEz$REz$SEz$TEz$z$UEz$VEz$WEz$XEz$qz$YEz$qz$ZEz$UEz$aEz$bEz$cEz$dEz$eEz$z$fEz$gEz$gDz$hEz$iEz$jEz$z$kEz$lEz$mEz$nEz$oEz$pEz$z$NEz$qEz$rEz$sEz$tEz$tEz$tEz$uEz$z$vEz$wEz$xEz$yEz$AFz$BFz$CFz$HEz$z$DFz$EFz$FFz$GFz$HFz$IFz$JFz$KFz$LFz$MFz$z$DFz$NFz$OFz$PFz$QFz$RFz$SFz$TFz$z$DFz$NFz$OFz$PFz$QFz$RFz$UFz$VFz$z$WFz$XFz$YFz$ZFz$z$aFz$bFz$z$cFz$dFz$eFz$z$cFz$dFz$EEz$z$IBz$fFz$WDz$gFz$hFz$iFz$z$jFz$kFz$z$wDz$z$rDz$sDz$VDz$WDz$fDz$gDz$hDz$lFz$mFz$rz$nFz$oFz$z$pFz$qFz$z$DEz$EEz$z$AEz$BEz$CEz$z$rFz$sFz$az$yDz$bCz$z$tFz$uFz$vFz$wFz$xFz$yFz$z$AGz$BGz$CGz$DGz$z$EGz$FGz$z$cFz$dFz$eFz$z$cFz$dFz$EEz$z$GGz$HGz$IGz$JGz$z$aFz$bFz$z$jFz$kFz$z$wDz$z$dBz$KGz$LGz$MGz$NGz$qz$YEz$pFz$OGz$PGz$jDz$iz$z$rDz$QGz$RGz$OBz$SGz$TGz$UGz$VGz$sDz$VDz$WDz$fDz$gDz$hDz$lFz$mFz$WGz$z$dBz$XGz$YGz$ZGz$QGz$RGz$OBz$aGz$bGz$cGz$pCz$dGz$bCz$z$eGz$NGz$qz$YEz$pFz$OGz$PGz$jDz$iz$fGz$gGz$hGz$iGz$jGz$kGz$lGz$WGz$z$mGz$nGz$oGz$pGz$qGz$rGz$qz$ZEz$NEz$sGz$YDz$tGz$iDz$rz$uGz$vGz$wGz$z$mGz$nGz$xGz$yGz$AHz$BHz$WDz$CHz$YDz$DHz$aDz$bDz$tDz$EHz$FHz$GHz$HHz$z$IHz$JHz$KHz$LHz$MHz$NHz$mBz$mBz$mBz$OHz$PHz$QHz$RHz$SHz$THz$UHz$VHz$WHz$XHz$YHz$ZHz$mBz$mBz$mBz$mBz$aHz$bHz$cHz$dHz$QHz$eHz$fHz$gHz$hHz$iHz$jHz$kHz$lHz$mHz$HEz$z$IHz$JHz$nHz$YEz$pCz$hHz$QGz$oHz$pHz$oHz$pHz$qHz$rHz$z$dBz$eBz$gBz$hBz$yBz$YHz$ZHz$PHz$sHz$tHz$uHz$vHz$wHz$xHz$yHz$AIz$BIz$Ez$CIz$rz$BDz$CDz$z$DIz$z$dBz$eBz$sCz$EIz$FIz$GIz$HIz$IIz$JIz$KIz$LIz$MIz$BDz$NIz$OIz$PIz$QIz$RIz$SIz$TIz$UIz$VIz$WIz$kBz$cBz$z$dBz$eBz$gBz$hBz$XIz$YIz$ZIz$aIz$bIz$cIz$dIz$eIz$MCz$z$DDz$fIz$z$gIz$hIz$z$GDz$z$iIz$z$jIz$z$dBz$eBz$sBz$tBz$uBz$z$NCz$OCz$dCz$eCz$fCz$gCz$hCz$iCz$jCz$SHz$lCz$mCz$z$dBz$eBz$LCz$MCz$z$nCz$oCz$pCz$qCz$rCz$z$dBz$eBz$sCz$tCz$uCz$vCz$wCz$xCz$yCz$ADz$BDz$CDz$z$DDz$EDz$z$Yz$Zz$z$FDz$z$GDz$z$HDz$IDz$JDz$KDz$LDz$PBz$QBz$MDz$NDz$z$nCz$ODz$PDz$QDz$RDz$SDz$z$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$kIz$cDz$lIz$mIz$z$TDz$UDz$VDz$WDz$fDz$gDz$nIz$iDz$GCz$dGz$bCz$z$TDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$iz$z$rDz$sDz$VDz$WDz$XDz$YDz$ZDz$aDz$kIz$tDz$uDz$vDz$wDz$z$xDz$yDz$bCz$z$AEz$oIz$CEz$z$DEz$EEz$z$FEz$GEz$HEz$z$IEz$JEz$KEz$LEz$z$MEz$NEz$OEz$PEz$z$QEz$REz$SEz$TEz$z$UEz$VEz$WEz$XEz$qz$YEz$qz$ZEz$UEz$aEz$bEz$cEz$dEz$eEz$z$fEz$gEz$gDz$hEz$iEz$jEz$z$kEz$lEz$mEz$nEz$oEz$pEz$z$NEz$qEz$pIz$sEz$tEz$tEz$tEz$uEz$z$vEz$wEz$xEz$yEz$AFz$BFz$CFz$HEz$z$DFz$EFz$FFz$GFz$HFz$IFz$JFz$KFz$LFz$MFz$z$DFz$NFz$OFz$PFz$QFz$RFz$SFz$TFz$z$DFz$NFz$OFz$PFz$QFz$RFz$UFz$VFz$z$WFz$XFz$YFz$ZFz$z$aFz$bFz$z$cFz$dFz$eFz$z$cFz$dFz$EEz$z$IBz$fFz$WDz$qIz$rIz$iFz$z$jFz$kFz$z$sIz$tIz$uIz$vIz$wIz$z$wDz$z$rDz$sDz$VDz$WDz$fDz$gDz$nIz$lFz$mFz$rz$nFz$oFz$z$pFz$qFz$z$DEz$EEz$z$AEz$oIz$CEz$z$rFz$sFz$az$yDz$bCz$z$tFz$uFz$vFz$wFz$xFz$yFz$z$AGz$BGz$CGz$DGz$z$EGz$FGz$z$cFz$dFz$eFz$z$cFz$dFz$EEz$z$GGz$HGz$IGz$JGz$z$aFz$bFz$z$jFz$kFz$z$wDz$z$dBz$KGz$LGz$MGz$NGz$qz$YEz$pFz$xIz$yIz$jDz$iz$z$rDz$QGz$RGz$OBz$SGz$TGz$UGz$VGz$sDz$VDz$WDz$fDz$gDz$nIz$lFz$mFz$WGz$z$dBz$XGz$YGz$ZGz$QGz$RGz$OBz$aGz$bGz$AJz$pCz$dGz$bCz$z$eGz$NGz$qz$YEz$pFz$xIz$yIz$jDz$iz$fGz$gGz$hGz$iGz$jGz$kGz$lGz$WGz$z$mGz$nGz$oGz$pGz$qGz$rGz$qz$ZEz$NEz$sGz$YDz$BJz$iDz$GCz$CJz$DJz$EJz$z$mGz$nGz$xGz$yGz$AHz$BHz$WDz$CHz$YDz$DHz$aDz$kIz$tDz$EHz$FHz$GHz$HHz$z$IHz$JHz$KHz$LHz$MHz$NHz$mBz$mBz$mBz$OHz$PHz$QHz$RHz$SHz$THz$UHz$VHz$WHz$XHz$YHz$ZHz$mBz$mBz$mBz$mBz$aHz$bHz$iz$FJz$GJz$RHz$VHz$WHz$HJz$IJz$JJz$KJz$LJz$MJz$z$dBz$eBz$gBz$hBz$yBz$YHz$ZHz$dHz$sHz$tHz$uHz$vHz$wHz$xHz$yHz$AIz$BIz$Ez$CIz$rz$BDz$CDz$z$DIz$z$dBz$eBz$sCz$EIz$FIz$GIz$HIz$IIz$JIz$KIz$LIz$MIz$BDz$NIz$OIz$PIz$QIz$RIz$SIz$TIz$UIz$VIz$WIz$kBz$cBz$z$dBz$eBz$gBz$hBz$XIz$YIz$ZIz$aIz$bIz$cIz$dIz$eIz$MCz$z$DDz$fIz$z$gIz$hIz$z$GDz$z$iIz$z$NJz$z$gIz$z$FDz$z$iIz$z$OJz$z$dBz$eBz$sCz$PJz$QJz$RJz$RCz$SJz$TJz$UJz$AIz$uBz$z$DDz$EDz$z$Yz$Zz$z$FDz$z$iIz$z$VJz"