#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "           ${green}PORT V2RAY VMESS${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Ubah Port VMess TLS $tls"
echo -e "     2 ⸩  Ubah Port VMess NON-TLS $none"
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
read -p "Port Baru VMess TLS : " tls1
echo -e "${off}"
if [ -z $tls1 ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $tls1)
if [[ -z $cek ]]; then
sed -i "s/$tls/$tls1/g" /etc/v2ray/config.json
sed -i "s/   - V2RAY Vmess TLS         : $tls/   - V2RAY Vmess TLS         : $tls1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart v2ray > /dev/null
echo -e "\e[032;1mPort $tls1 Berhasil Diperbarui\e[0m"
else
echo "Port $tls1 Sudah Digunakan"
fi
;;
2)
echo -e "${cyan}Masukkan Hanya Dua Angka (ex : 77)${off}"
echo -e ""
echo -e "${green}"
read -p "Port Baru VMess NON-TLS : " none1
echo -e "${off}"
if [ -z $none1 ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $none1)
if [[ -z $cek ]]; then
sed -i "s/$none/$none1/g" /etc/v2ray/none.json
sed -i "s/   - V2RAY Vmess None TLS    : $none/   - V2RAY Vmess None TLS    : $none1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart v2ray@none > /dev/null
echo -e "${cyan}Port VMess TLS Berhasil Diganti Menjadi :${off} ${green} $none1 ${off}"
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
6m'\''';kz='Vmes';mFz='one1';VCz='ru V';sFz='-j A';ZBz='"   ';Mz='1b[9';sDz=' --d';QFz='-TLS';oGz='da!$';Iz='NC='\''';oz=' -d:';PEz='tc/i';rFz='ne1 ';XFz='e1/g';pz=' -f2';WBz='====';kFz='None';vFz='ray@';Kz='cyan';RBz='echo';OGz=' ]${';PGz=' ${r';CDz=' $ce';pGz='{off';SCz='1)';BCz='"${o';nGz='ng A';yEz='else';VEz='ilte';sCz='cek=';pCz='p 1';xCz='-w $';PDz='g.js';ZEz=' sav';SGz='oper';HCz='Nomo';iBz='f}"';sBz='LS $';iGz='*)';SFz='e1';DDz='k ]]';XGz='Sila';mDz='-sta';cBz='een}';FBz='"Vme';aEz='/dev';UEz='netf';tz=''\'')"';WGz='tem!';aDz='oot/';bCz='if [';aFz='2ray';vCz='t -n';gDz='bles';NCz='ot';fz='tall';cz='at ~';Bz=''\''\e[';qz='|sed';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$z$uz$vz$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$LBz$MBz$NBz$OBz$PBz$QBz$z$RBz$SBz$TBz$z$RBz$SBz$UBz$VBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$XBz$YBz$QBz$z$RBz$SBz$ZBz$aBz$aBz$bBz$cBz$dBz$eBz$fBz$gBz$hBz$iBz$z$RBz$SBz$UBz$VBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$XBz$YBz$QBz$z$RBz$SBz$jBz$kBz$lBz$z$RBz$SBz$ZBz$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$z$RBz$SBz$ZBz$uBz$nBz$oBz$pBz$qBz$GBz$vBz$sBz$uz$QBz$z$RBz$SBz$ZBz$wBz$xBz$yBz$ACz$z$RBz$SBz$BCz$CCz$z$RBz$SBz$UBz$VBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$WBz$XBz$YBz$QBz$z$RBz$SBz$jBz$kBz$lBz$z$DCz$ECz$ZBz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$z$RBz$SBz$BCz$CCz$z$OCz$PCz$QCz$RCz$z$SCz$z$RBz$SBz$TBz$z$RBz$SBz$jBz$kBz$lBz$z$DCz$ECz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$aCz$z$RBz$SBz$BCz$CCz$z$bCz$cCz$dCz$eCz$fCz$RCz$z$RBz$SBz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$hBz$iBz$z$oCz$pCz$z$Yz$Zz$z$qCz$z$rCz$z$sCz$tCz$uCz$vCz$wCz$hz$iz$xCz$yCz$ADz$z$bCz$BDz$CDz$DDz$EDz$FDz$z$GDz$HDz$IDz$JDz$yCz$KDz$LDz$MDz$NDz$ODz$PDz$QDz$z$GDz$HDz$RDz$SDz$TDz$UDz$rBz$VDz$aBz$WDz$XDz$RDz$SDz$TDz$UDz$rBz$VDz$aBz$WDz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$z$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$tDz$XDz$uDz$vDz$wDz$z$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$xDz$qDz$yDz$sDz$tDz$XDz$uDz$vDz$wDz$z$fDz$gDz$AEz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$tDz$XDz$BEz$CEz$DEz$z$fDz$gDz$AEz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$xDz$qDz$yDz$sDz$tDz$XDz$BEz$CEz$DEz$z$fDz$gDz$EEz$FEz$LDz$GEz$HEz$IEz$JEz$KEz$z$fDz$gDz$LEz$MEz$NEz$OEz$PEz$QEz$REz$SEz$TEz$z$UEz$VEz$WEz$XEz$YEz$ZEz$FEz$aEz$bEz$cEz$z$UEz$VEz$WEz$XEz$YEz$dEz$eEz$fEz$gEz$hEz$z$iEz$jEz$kEz$lEz$mEz$nEz$fEz$gEz$hEz$z$RBz$SBz$oEz$pEz$qEz$rEz$yCz$sEz$tEz$uEz$vEz$wEz$Jz$xEz$z$yEz$z$RBz$AFz$rEz$yCz$BFz$CFz$DFz$EFz$QBz$z$rCz$z$FFz$z$GFz$z$RBz$SBz$UBz$VBz$HFz$mCz$IFz$JFz$KFz$LFz$MFz$NFz$OFz$YBz$QBz$z$RBz$SBz$TBz$z$RBz$SBz$jBz$kBz$lBz$z$DCz$ECz$TCz$UCz$VCz$WCz$PFz$QFz$YCz$RFz$SFz$z$RBz$SBz$BCz$CCz$z$bCz$cCz$TFz$UFz$EDz$FDz$z$RBz$SBz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$hBz$iBz$z$oCz$pCz$z$Yz$Zz$z$qCz$z$rCz$z$sCz$tCz$uCz$vCz$wCz$hz$iz$xCz$uz$SCz$z$bCz$BDz$CDz$DDz$EDz$FDz$z$GDz$HDz$VFz$WFz$TFz$XFz$YFz$ZFz$aFz$bFz$cFz$QDz$z$GDz$HDz$RDz$SDz$TDz$UDz$GBz$HBz$dFz$WDz$eFz$fFz$gFz$hFz$iFz$jFz$kFz$XCz$aBz$lFz$mFz$KDz$nFz$oFz$yz$ABz$BBz$pFz$z$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$tDz$eFz$qFz$CEz$DEz$z$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$xDz$qDz$yDz$sDz$tDz$eFz$qFz$CEz$DEz$z$fDz$gDz$AEz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$tDz$eFz$rFz$sFz$tFz$uFz$z$fDz$gDz$AEz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$xDz$qDz$yDz$sDz$tDz$eFz$rFz$sFz$tFz$uFz$z$fDz$gDz$EEz$FEz$LDz$GEz$HEz$IEz$JEz$KEz$z$fDz$gDz$LEz$MEz$NEz$OEz$PEz$QEz$REz$SEz$TEz$z$UEz$VEz$WEz$XEz$YEz$ZEz$FEz$aEz$bEz$cEz$z$UEz$VEz$WEz$XEz$YEz$dEz$eEz$fEz$gEz$hEz$z$iEz$jEz$kEz$lEz$mEz$vFz$uz$wFz$xFz$yFz$z$RBz$SBz$UBz$VBz$pBz$qBz$rBz$AGz$BGz$CGz$DGz$EGz$FGz$GGz$HGz$IGz$bBz$cBz$eFz$rFz$hBz$iBz$z$yEz$z$RBz$SBz$gCz$JGz$KGz$LGz$MGz$IGz$bBz$cBz$NGz$mFz$OGz$YBz$PGz$QGz$RGz$sEz$SGz$TGz$UGz$VGz$WGz$hBz$iBz$z$RBz$SBz$UBz$VBz$XGz$YGz$ZGz$EFz$aGz$bGz$cGz$dGz$CCz$z$oCz$eGz$z$fGz$gGz$z$rCz$z$FFz$z$hGz$z$fGz$z$qCz$z$FFz$z$iGz$z$RBz$SBz$gCz$jGz$kGz$lGz$HCz$mGz$nGz$oGz$pGz$lBz$z$oCz$pCz$z$Yz$Zz$z$qCz$z$FFz$z$qGz"