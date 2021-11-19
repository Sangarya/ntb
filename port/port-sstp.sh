#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
sstp="$(cat ~/log-install.txt | grep -i SSTP | cut -d: -f2|sed 's/ //g')"
echo -e "${green}Ubah Port SSTP Saat Ini${off} ${cyan}[ $sstp ]${off}"
echo -e ""
echo -e "${green}"
read -p "Masukkan Port Baru SSTP :  " sstp2
echo -e "${off}"
if [ -z $sstp2 ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $sstp2)
if [[ -z $cek ]]; then
sed -i "s/$sstp/$sstp2/g" /etc/accel-ppp.conf
sed -i "s/   - SSTP VPN                : $sstp/   - SSTP VPN                : $sstp2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $sstp -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $sstp -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $sstp2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $sstp2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart accel-ppp> /dev/null
echo -e "${cyan}Port SSTP Berhasil Diganti Menjadi :${off} ${green} $sstp2 ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $sstp2 ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi

l';YBz='ff}"';yz='h Po';GDz='/etc';FBz='f} $';xBz='rep ';nBz='slee';az='sstp';IBz='$sst';fEz='akan';PEz='een}';pCz='p -p';FEz='{gre';tCz='tp -';NBz='read';NEz='ff} ';Yz='clea';MCz='-ppp';HCz='stp/';cz='cat ';uCz='j AC';OBz=' -p ';pBz='menu';ODz=' -t ';BDz='-j A';TDz='up.r';VCz='tp/ ';dz='~/lo';fDz='oad ';SEz='off}';jz=' -i ';qz='s/ /';Tz='='\''\0';GBz='{cya';uDz='yan}';Lz='='\''\x';BBz='STP ';Bz=''\''\e[';iBz='k Di';DDz='T';uBz='t -n';DEz='enja';ABz='rt S';Dz='m'\''';Kz='cyan';HBz='n}[ ';CDz='CCEP';Xz='b[m'\''';GEz='en} ';MEz='rt{o';PDz='< /e';OEz='${gr';PCz='s/  ';cDz='/nul';Uz='33[1';qDz=' /de';fBz='ed}P';vDz='Port';jBz='masu';MBz='""';sBz='$(ne';Gz='e[0;';yCz=' -I ';yDz='rhas';JCz='" /e';HEz='p2 $';qBz='fi';hBz='Tida';lDz='l re';ECz='sed ';HDz='/ipt';iCz='T -m';WDz='ilte';JEz='ed}E';vz='"${g';dCz='t';AEz='il D';gEz=' Por';QDz='tc/i';jDz='syst';YDz='rsis';XEz='oper';iEz='in..';VDz='netf';XBz='"${o';fz='stal';rBz='cek=';SBz='rt B';LCz='ccel';cBz='; th';aBz=' -z ';SDz='les.';GCz='s/$s';iDz='ull';UDz='ules';QCz=' - S';tBz='tsta';EBz='${of';PBz='"Mas';xDz='P Be';eDz=' rel';Ez='gree';Rz='37m'\''';WBz='tp2';kDz='emct';bCz='/roo';DCz='k ]]';oDz='cel-';kBz='kkan';mDz='star';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$z$tz$uz$vz$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$LBz$z$tz$uz$MBz$z$tz$uz$vz$wz$LBz$z$NBz$OBz$PBz$QBz$RBz$SBz$TBz$kz$UBz$VBz$WBz$z$tz$uz$XBz$YBz$z$ZBz$aBz$IBz$bBz$cBz$dBz$z$tz$uz$eBz$fBz$gBz$hBz$iBz$jBz$kBz$lBz$EBz$mBz$z$nBz$oBz$z$Yz$Zz$z$pBz$z$qBz$z$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$az$ACz$z$ZBz$BCz$CCz$DCz$cBz$dBz$z$ECz$FCz$GCz$HCz$IBz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$z$ECz$FCz$PCz$QCz$BBz$RCz$SCz$SCz$SCz$TCz$UCz$VCz$WCz$kz$XCz$SCz$SCz$SCz$SCz$YCz$ZCz$aCz$bCz$cCz$ez$fz$gz$dCz$z$eCz$fCz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$rCz$sCz$UCz$tCz$uCz$vCz$z$eCz$fCz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$wCz$pCz$xCz$rCz$sCz$UCz$tCz$uCz$vCz$z$eCz$fCz$yCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$rCz$sCz$UCz$ADz$BDz$CDz$DDz$z$eCz$fCz$yCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$wCz$pCz$xCz$rCz$sCz$UCz$ADz$BDz$CDz$DDz$z$eCz$fCz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$z$eCz$fCz$MDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$z$VDz$WDz$XDz$YDz$ZDz$aDz$FDz$bDz$cDz$dDz$z$VDz$WDz$XDz$YDz$ZDz$eDz$fDz$gDz$hDz$iDz$z$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$z$tz$uz$tDz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$DEz$EEz$EBz$FBz$FEz$GEz$IBz$HEz$KBz$LBz$z$IEz$z$tz$uz$eBz$JEz$KEz$LEz$MEz$NEz$OEz$PEz$QEz$ZCz$REz$SEz$TEz$UEz$VEz$WEz$XEz$YEz$ZEz$aEz$bEz$EBz$mBz$z$tz$uz$tDz$uDz$cEz$dEz$eEz$fEz$gEz$hEz$iEz$jEz$YBz$z$nBz$kEz$z$lEz$mEz$z$qBz"