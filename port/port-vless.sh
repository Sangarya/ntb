#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "           ${green}PORT V2RAY VLESS${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Ubah Port VLess TLS $tls"
echo -e "     2 ⸩  Ubah Port VLess NON-TLS $none"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor  [1-2 / x] :  " prot
echo -e "${off}"

case $prot in
1)
echo -e ""
echo -e "${green}"
read -p "Port Baru VLess TLS : " tls1
echo -e "${off}"
if [ -z $tls1 ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tls/$tls1/g" /etc/v2ray/vless.json
sed -i "s/   - V2RAY Vless TLS         : $tls/   - V2RAY Vless TLS         : $tls1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart v2ray@vless > /dev/null
echo -e "${cyan}Port VLess TLS Berhasil Diganti Menjadi :${off} ${green} $tls1 ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $tls1 ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi
;;
2)
echo -e "${green}"
read -p "Port Baru VLess NON-TLS : " none1
echo -e "${off}"
if [ -z $none1 ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /etc/v2ray/vnone.json
sed -i "s/   - V2RAY Vless None TLS    : $none/   - V2RAY Vless None TLS    : $none1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart v2ray@vnone > /dev/null
echo -e "${cyan}Port VLess TLS Berhasil Diganti Menjadi :${off} ${green} $none1 ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $none1 ]${off} ${red}Sudah Beroperasi Pada System!${off}"
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
    ';PFz='ada ';dCz='$tls';aCz='1';Qz='x1b[';ICz='r  [';oBz='bah ';hFz=' non';cEz=' rel';VDz='   :';UDz='LS  ';FBz='"Vle';mEz='ray@';qBz=' VLe';vBz='ON-T';CFz='ed}E';jz='-w "';LEz='tore';CEz='CEPT';sEz='Diga';MEz=' -t ';OEz='tc/i';yz='g-in';Lz='='\''\x';rEz='sil ';iBz='f}"';rCz='fi';UEz='ilte';IEz='.rul';az='tls=';CDz=' $ce';cz='at ~';dBz='PORT';pCz='p 1';NEz='< /e';iFz='e1';lCz='masu';kFz='e1 ]';cDz='all.';lDz='-sta';XDz='s1/g';TGz=' Ber';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$z$uz$vz$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$LBz$MBz$NBz$OBz$PBz$QBz$z$RBz$SBz$TBz$z$RBz$SBz$UBz$VBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$XBz$YBz$QBz$z$RBz$SBz$ZBz$aBz$aBz$bBz$cBz$dBz$eBz$fBz$gBz$hBz$iBz$z$RBz$SBz$UBz$VBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$XBz$YBz$QBz$z$RBz$SBz$jBz$kBz$lBz$z$RBz$SBz$ZBz$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$z$RBz$SBz$ZBz$uBz$nBz$oBz$pBz$qBz$GBz$vBz$sBz$uz$QBz$z$RBz$SBz$ZBz$wBz$xBz$yBz$ACz$z$RBz$SBz$BCz$CCz$z$RBz$SBz$UBz$VBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$XBz$YBz$QBz$z$RBz$SBz$jBz$kBz$lBz$z$DCz$ECz$ZBz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$z$RBz$SBz$BCz$CCz$z$OCz$PCz$QCz$RCz$z$SCz$z$RBz$SBz$TBz$z$RBz$SBz$jBz$kBz$lBz$z$DCz$ECz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$aCz$z$RBz$SBz$BCz$CCz$z$bCz$cCz$dCz$eCz$fCz$RCz$z$RBz$SBz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$hBz$iBz$z$oCz$pCz$z$Yz$Zz$z$qCz$z$rCz$z$sCz$tCz$uCz$vCz$wCz$hz$iz$xCz$yCz$ADz$z$bCz$BDz$CDz$DDz$EDz$FDz$z$GDz$HDz$IDz$JDz$yCz$KDz$LDz$MDz$NDz$ODz$PDz$RCz$z$GDz$HDz$QDz$RDz$SDz$TDz$rBz$UDz$aBz$VDz$WDz$QDz$RDz$SDz$TDz$rBz$UDz$aBz$VDz$WDz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$z$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$WDz$tDz$uDz$vDz$z$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$wDz$pDz$xDz$rDz$sDz$WDz$tDz$uDz$vDz$z$eDz$fDz$yDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$WDz$AEz$BEz$CEz$z$eDz$fDz$yDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$wDz$pDz$xDz$rDz$sDz$WDz$AEz$BEz$CEz$z$eDz$fDz$DEz$EEz$LDz$FEz$GEz$HEz$IEz$JEz$z$eDz$fDz$KEz$LEz$MEz$NEz$OEz$PEz$QEz$REz$SEz$z$TEz$UEz$VEz$WEz$XEz$YEz$EEz$ZEz$aEz$bEz$z$TEz$UEz$VEz$WEz$XEz$cEz$dEz$eEz$fEz$gEz$z$hEz$iEz$jEz$kEz$lEz$mEz$nEz$oEz$ZEz$aEz$bEz$z$RBz$SBz$UBz$VBz$pBz$qBz$rBz$pEz$qEz$rEz$sEz$tEz$uEz$vEz$wEz$xEz$bBz$cBz$WDz$yEz$AFz$lBz$z$BFz$z$RBz$SBz$gCz$CFz$DFz$EFz$FFz$xEz$bBz$cBz$GFz$HFz$IFz$xEz$JFz$KFz$LFz$MFz$NFz$OFz$PFz$QFz$RFz$AFz$lBz$z$RBz$SBz$UBz$VBz$SFz$TFz$UFz$VFz$WFz$XFz$YFz$ZFz$CCz$z$oCz$aFz$z$bFz$cFz$z$rCz$z$dFz$z$eFz$z$RBz$SBz$jBz$kBz$lBz$z$DCz$ECz$TCz$UCz$VCz$WCz$fFz$gFz$YCz$hFz$iFz$z$RBz$SBz$BCz$CCz$z$bCz$cCz$jFz$kFz$EDz$FDz$z$RBz$SBz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$hBz$iBz$z$oCz$pCz$z$Yz$Zz$z$qCz$z$rCz$z$sCz$tCz$uCz$vCz$wCz$hz$iz$xCz$uz$SCz$z$bCz$BDz$CDz$DDz$EDz$FDz$z$GDz$HDz$lFz$mFz$jFz$nFz$oFz$pFz$qFz$rFz$sFz$tFz$z$GDz$HDz$QDz$RDz$SDz$TDz$GBz$HBz$uFz$VDz$vFz$wFz$xFz$yFz$AGz$BGz$CGz$XCz$aBz$DGz$EGz$KDz$FGz$GGz$yz$ABz$BBz$HGz$z$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$vFz$IGz$BEz$CEz$z$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$wDz$pDz$xDz$rDz$sDz$vFz$IGz$BEz$CEz$z$eDz$fDz$yDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$vFz$JGz$KGz$LGz$MGz$z$eDz$fDz$yDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$wDz$pDz$xDz$rDz$sDz$vFz$JGz$KGz$LGz$MGz$z$eDz$fDz$DEz$EEz$LDz$FEz$GEz$HEz$IEz$JEz$z$eDz$fDz$KEz$LEz$MEz$NEz$OEz$PEz$QEz$REz$SEz$z$TEz$UEz$VEz$WEz$XEz$YEz$EEz$ZEz$aEz$bEz$z$TEz$UEz$VEz$WEz$XEz$cEz$dEz$eEz$fEz$gEz$z$hEz$iEz$jEz$kEz$lEz$mEz$NGz$EEz$ZEz$aEz$bEz$z$RBz$SBz$UBz$VBz$pBz$qBz$rBz$pEz$qEz$rEz$sEz$tEz$uEz$vEz$wEz$xEz$bBz$cBz$vFz$JGz$hBz$iBz$z$BFz$z$RBz$SBz$gCz$CFz$DFz$EFz$FFz$xEz$bBz$cBz$OGz$EGz$PGz$YBz$QGz$RGz$SGz$TGz$UGz$VGz$WGz$XGz$YGz$hBz$iBz$z$RBz$SBz$UBz$VBz$SFz$TFz$UFz$VFz$WFz$XFz$YFz$ZFz$CCz$z$oCz$aFz$z$bFz$cFz$z$rCz$z$dFz$z$ZGz$z$bFz$z$qCz$z$dFz$z$aGz$z$RBz$SBz$gCz$bGz$cGz$dGz$HCz$eGz$fGz$gGz$AFz$lBz$z$oCz$pCz$z$Yz$Zz$z$qCz$z$dFz$z$hGz"