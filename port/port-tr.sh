#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
tr="$(cat ~/log-install.txt | grep -i TrojanGFW | cut -d: -f2|sed 's/ //g')"
trg="$(cat ~/log-install.txt | grep -i TrojanGO | cut -d: -f2|sed 's/ //g')"
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "           ${green}PORT TROJAN${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Ubah Port Trojan-GFW $tr"
echo -e "     2 ⸩  Ubah Port Trojan-GO $trg"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor  [1-2 / x] :  " prot
echo -e "${off}"
case $prot in
1)
echo -e "${green}"
read -p "Masukkan Port Baru Trojan-GFW :  " tr2
echo -e "${off}"
if [ -z $tr2 ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $tr2)
if [[ -z $cek ]]; then
sed -i "s/$tr/$tr2/g" /etc/trojan/config.json
sed -i "s/   - TrojanGFW               : $tr/   - TrojanGFW               : $tr2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tr -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tr -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tr2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tr2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trojan > /dev/null
echo -e "${cyan}Port Trojan-GFW Berhasil Diganti Menjadi :${off} ${green} $tr2 ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $tr2 ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi
;;
2)
echo -e "${green}"
read -p "Masukkan Port Baru Trojan-GO :  " trg2
echo -e "${off}"
if [ -z $trg2 ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek2=$(netstat -nutlp | grep -w $trg2)
if [[ -z $cek2 ]]; then
sed -i "s/$trg/$trg2/g" /etc/trojan-go/config.json
sed -i "s/   - TrojanGO                : $tr/   - TrojanGO                : $tr2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $trg -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $trg -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $trg2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $trg2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trojan > /dev/null
echo -e "${cyan}Port Trojan-GO Berhasil Diganti Menjadi :${off} ${green} $tr2 ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $tr2 ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 1
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
ng A';TFz='p 2';lDz=' -j ';rCz='[ -z';dFz=' the';ECz='ot i';cBz='bah ';MBz='==${';UDz='l.tx';ZEz='ull';EGz='sil ';wz='/log';TDz='stal';mFz='k2 ]';QFz='t La';eBz=' Tro';xCz='-i "';rEz='r2 $';fBz='jan-';aCz='k Di';RFz='in..';QCz='tr2';qDz=' -I ';az='tr="';dz='log-';ZFz=' " t';vCz='en';sBz='  Pi';KGz='2 ${';IDz=' - T';EBz='roja';hDz='p -p';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$z$tz$uz$vz$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$FBz$mz$nz$oz$pz$qz$rz$sz$z$GBz$HBz$IBz$z$GBz$HBz$JBz$KBz$LBz$LBz$LBz$LBz$LBz$LBz$LBz$LBz$LBz$MBz$NBz$OBz$z$GBz$HBz$PBz$QBz$QBz$RBz$SBz$TBz$UBz$VBz$WBz$XBz$z$GBz$HBz$JBz$KBz$LBz$LBz$LBz$LBz$LBz$LBz$LBz$LBz$LBz$MBz$NBz$OBz$z$GBz$HBz$YBz$ZBz$XBz$z$GBz$HBz$PBz$aBz$bBz$cBz$dBz$eBz$fBz$lz$gBz$z$GBz$HBz$PBz$hBz$bBz$cBz$dBz$eBz$fBz$iBz$jBz$z$GBz$HBz$PBz$kBz$lBz$mBz$nBz$z$GBz$HBz$oBz$pBz$z$GBz$HBz$JBz$KBz$LBz$LBz$LBz$LBz$LBz$LBz$LBz$LBz$LBz$MBz$NBz$OBz$z$GBz$HBz$YBz$ZBz$XBz$z$qBz$rBz$PBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$z$GBz$HBz$oBz$pBz$z$CCz$DCz$ECz$FCz$z$GCz$z$GBz$HBz$YBz$ZBz$XBz$z$qBz$rBz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$z$GBz$HBz$oBz$pBz$z$RCz$SCz$TCz$UCz$VCz$z$GBz$HBz$WCz$XCz$YCz$ZCz$aCz$bCz$cCz$dCz$eCz$fCz$z$gCz$hCz$z$Yz$Zz$z$iCz$z$jCz$z$kCz$lCz$mCz$nCz$oCz$BBz$CBz$pCz$qCz$z$RCz$rCz$sCz$tCz$uCz$vCz$z$wCz$xCz$yCz$ADz$BDz$CDz$DDz$EBz$EDz$FDz$GDz$FCz$z$wCz$xCz$HDz$IDz$EBz$JDz$QBz$QBz$QBz$KDz$LDz$MDz$NDz$kz$lz$QBz$QBz$QBz$ODz$TCz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$z$WDz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$LDz$lDz$mDz$nDz$z$WDz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$oDz$hDz$pDz$jDz$kDz$LDz$lDz$mDz$nDz$z$WDz$XDz$qDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$LDz$rDz$sDz$tDz$z$WDz$XDz$qDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$oDz$hDz$pDz$jDz$kDz$LDz$rDz$sDz$tDz$z$WDz$XDz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$z$WDz$XDz$DEz$EEz$FEz$GEz$HEz$IEz$JEz$KEz$LEz$z$MEz$NEz$OEz$PEz$QEz$REz$vDz$SEz$TEz$UEz$z$MEz$NEz$OEz$PEz$QEz$VEz$WEz$XEz$YEz$ZEz$z$aEz$bEz$cEz$dEz$eEz$kz$fEz$gEz$hEz$z$GBz$HBz$JBz$KBz$dBz$eBz$fBz$lz$iEz$jEz$kEz$lEz$mEz$nEz$oEz$NBz$pEz$ZBz$qEz$rEz$WBz$XBz$z$sEz$z$GBz$HBz$WCz$tEz$uEz$vEz$wEz$xEz$RBz$SBz$yEz$AFz$eCz$BFz$CFz$DFz$EFz$FFz$GFz$HFz$IFz$JFz$KFz$NBz$OBz$z$GBz$HBz$JBz$KBz$LFz$MFz$NFz$OFz$PFz$QFz$RFz$SFz$pBz$z$gCz$TFz$z$UFz$VFz$z$jCz$z$WFz$z$XFz$z$GBz$HBz$YBz$ZBz$XBz$z$qBz$rBz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$YFz$ZFz$aFz$z$GBz$HBz$oBz$pBz$z$RCz$SCz$bFz$cFz$dFz$FCz$z$GBz$HBz$WCz$XCz$YCz$ZCz$aCz$bCz$cCz$dCz$eCz$fCz$z$gCz$hCz$z$Yz$Zz$z$iCz$z$jCz$z$eFz$fFz$gFz$hFz$iFz$jFz$kFz$lFz$bFz$XFz$z$RCz$rCz$sCz$mFz$nFz$oFz$z$wCz$xCz$yCz$pFz$qFz$PDz$wDz$rFz$fBz$sFz$tFz$uFz$vFz$z$wCz$xCz$HDz$IDz$EBz$FBz$QBz$QBz$QBz$KDz$LDz$MDz$NDz$kz$wFz$QBz$QBz$QBz$ODz$TCz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$z$WDz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$LDz$xFz$sDz$tDz$z$WDz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$oDz$hDz$pDz$jDz$kDz$LDz$xFz$sDz$tDz$z$WDz$XDz$qDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$LDz$yFz$AGz$BGz$z$WDz$XDz$qDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$oDz$hDz$pDz$jDz$kDz$LDz$yFz$AGz$BGz$z$WDz$XDz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$z$WDz$XDz$DEz$EEz$FEz$GEz$HEz$IEz$JEz$KEz$LEz$z$MEz$NEz$OEz$PEz$QEz$REz$vDz$SEz$TEz$UEz$z$MEz$NEz$OEz$PEz$QEz$VEz$WEz$XEz$YEz$ZEz$z$aEz$bEz$cEz$dEz$eEz$kz$fEz$gEz$hEz$z$GBz$HBz$JBz$KBz$dBz$eBz$fBz$CGz$DGz$EGz$FGz$GGz$HGz$IGz$JGz$xEz$RBz$SBz$LDz$KGz$NBz$OBz$z$sEz$z$GBz$HBz$WCz$tEz$uEz$vEz$wEz$xEz$RBz$SBz$yEz$AFz$eCz$BFz$CFz$DFz$EFz$FFz$GFz$HFz$IFz$JFz$KFz$NBz$OBz$z$GBz$HBz$JBz$KBz$LFz$MFz$NFz$OFz$PFz$QFz$RFz$SFz$pBz$z$gCz$hCz$z$UFz$VFz$z$jCz$z$WFz$z$LGz$z$UFz$z$iCz$z$WFz$z$MGz$z$GBz$HBz$WCz$NGz$OGz$PGz$uBz$QGz$RGz$SGz$WBz$XBz$z$gCz$hCz$z$Yz$Zz$z$iCz$z$WFz$z$TGz"