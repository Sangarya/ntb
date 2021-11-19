#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
wg="$(cat ~/log-install.txt | grep -i Wireguard | cut -d: -f2|sed 's/ //g')"
echo -e "${green}Ubah Port Wireguard Saat Ini${off} ${cyan}[ $wg ]${off}"
echo -e ""
echo -e "${green}"
read -p "Masukkan Port Baru Wireguard :  " wg2
echo -e "${off}"
if [ -z $wg2 ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $wg2)
if [[ -z $cek ]]; then
sed -i "s/$wg/$wg2/g" /etc/wireguard/wg0.conf
sed -i "s/$wg/$wg2/g" /etc/wireguard/params
sed -i "s/   - Wireguard               : $wg/   - Wireguard               : $wg2/g" /root/log-install.txt
iptables -D INPUT -i $NIC -p udp --dport $wg -j ACCEPT
iptables -I INPUT -i $NIC -p udp --dport $wg2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl reload wg-quick@wg0 > /dev/null
echo -e "${cyan}Port SSTP Berhasil Diganti Menjadi :${off} ${green} $wg2 ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $wg2 ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi
='"${c';CCz=' | g';HDz='able';bBz='"${o';REz='ah B';LCz='sed ';PDz='tc/i';rDz='yan}';uCz='port';ZEz='hkan';KBz=' ]${';UCz='f';TEz='eras';Jz='\e[0';QEz='}Sud';VDz='ilte';Bz=''\''\e[';JDz='.rul';eCz='/g" ';gDz='ev/n';DDz='-sav';Xz='b[m'\''';XCz='s/  ';qCz=' $NI';gCz='t/lo';yBz='tsta';bEz='akan';FCz='wg2)';Cz='1;31';OEz='g2 ]';iz='ep -';fz='all.';BDz=' ACC';iEz=' 0';EBz='t In';yz='h Po';jDz='emct';hCz='g-in';Rz='37m'\''';iBz='"${r';gEz='p 2';JCz='; th';nCz=' -D ';VBz='aru ';aCz='   :';AEz='enja';OBz='}"';lBz='Tida';FDz='/etc';Dz='m'\''';UDz='netf';dEz='t La';eEz='in..';sCz=' udp';ADz='2 -j';UEz='i Pa';LBz='off}';VCz='/par';GCz='[ -z';JEz='! Po';GEz='else';RBz='"Mas';QCz='" /e';hDz='ull';wCz='ACCE';Iz='NC='\''';ECz='-w $';NBz='""';tCz=' --d';DEz='{gre';Lz='='\''\x';KCz='en';nBz='masu';Vz='off=';hBz='then';Mz='1b[9';CDz='EPT';qBz='${of';dDz=' rel';HCz=' $ce';DCz='rep ';cEz=' Por';MCz='-i "';xCz='PT';Zz='r';YCz=' - W';YBz='d : ';bCz='/   ';dBz='if [';ez='inst';MEz='een}';tDz=' SST';XDz='rsis';sz='g'\'')"';oCz='INPU';WCz='ams';TBz='n Po';NEz='[ $w';gBz=' ]; ';lDz='load';dz='log-';pDz='0 > ';LDz='-res';xz='}Uba';Az='red=';tBz='p 1';gz='txt ';DBz=' Saa';EDz='e > ';lz='ard ';jCz='l.tx';cBz='ff}"';xBz='$(ne';ACz='t -n';kDz='l re';PEz='{red';cz='t ~/';ZDz=' sav';TCz='.con';EEz='en} ';MBz='"';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$z$tz$uz$vz$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$LBz$MBz$z$tz$uz$NBz$z$tz$uz$vz$wz$OBz$z$PBz$QBz$RBz$SBz$TBz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$z$tz$uz$bBz$cBz$z$dBz$eBz$fBz$gBz$hBz$z$tz$uz$iBz$jBz$kBz$lBz$mBz$nBz$oBz$pBz$qBz$rBz$z$sBz$tBz$z$Yz$Zz$z$uBz$z$vBz$z$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$z$dBz$GCz$HCz$ICz$JCz$KCz$z$LCz$MCz$NCz$OCz$PCz$QCz$RCz$BBz$CBz$SCz$TCz$UCz$z$LCz$MCz$NCz$OCz$PCz$QCz$RCz$BBz$CBz$VCz$WCz$z$LCz$MCz$XCz$YCz$BBz$CBz$ZCz$ZCz$ZCz$aCz$JBz$bCz$cCz$kz$lz$ZCz$ZCz$ZCz$dCz$fBz$eCz$fCz$gCz$hCz$iCz$jCz$kCz$z$lCz$mCz$nCz$oCz$pCz$qCz$rCz$sCz$tCz$uCz$JBz$vCz$wCz$xCz$z$lCz$mCz$yCz$oCz$pCz$qCz$rCz$sCz$tCz$uCz$JBz$ADz$BDz$CDz$z$lCz$mCz$DDz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$z$lCz$mCz$LDz$MDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$z$UDz$VDz$WDz$XDz$YDz$ZDz$EDz$aDz$bDz$cDz$z$UDz$VDz$WDz$XDz$YDz$dDz$eDz$fDz$gDz$hDz$z$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$aDz$bDz$cDz$z$tz$uz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$qBz$CEz$DEz$EEz$fBz$FEz$cBz$z$GEz$z$tz$uz$iBz$HEz$IEz$JEz$KEz$GBz$LEz$MEz$NEz$OEz$qBz$CEz$PEz$QEz$REz$SEz$TEz$UEz$VEz$WEz$XEz$LBz$MBz$z$tz$uz$qDz$rDz$YEz$ZEz$aEz$bEz$cEz$dEz$eEz$fEz$cBz$z$sBz$gEz$z$hEz$iEz$z$vBz"