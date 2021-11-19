#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
sqd="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | head -n1)"
sqd2="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | tail -n1)"
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "             ${green}PORT SQUID${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Ubah Port Squid $sqd"
echo -e "     2 ⸩  Ubah Port Squid $sqd2"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor  [1-2 / x] :  " prot
echo -e "${off}"

case $prot in
1)
echo -e "${green}"
read -p "Masukkan Port Baru Squid :  " squid
echo -e "${off}"
if [ -z $squid ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $squid)
if [[ -z $cek ]]; then
sed -i "s/$sqd/$squid/g" /etc/squid/squid.conf
sed -i "s/$sqd/$squid/g" /root/log-install.txt
/etc/init.d/squid restart > /dev/null
echo -e "${cyan}Port Squid Berhasil Diganti Menjadi :${off} ${green} $squid ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $squid ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi
;;
2)
echo -e "${green}"
read -p "Masukkan Port Baru Squid :  " squid
echo -e "${off}"
if [ -z $squid ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $squid)
if [[ -z $cek ]]; then
sed -i "s/$sqd2/$squid/g" /etc/squid/squid.conf
sed -i "s/$sqd2/$squid/g" /root/log-install.txt
/etc/init.d/squid restart > /dev/null
echo -e "${cyan}Port Squid Berhasil Diganti Menjadi :${off} ${green} $squid ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $squid ]${off} ${red}Sudah Beroperasi Pada System!${off}"
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

Hz='32m'\''';sBz='  2 ';JBz='t | ';kz='-i h';Sz='bold';FCz='r  [';uDz='ed}S';mDz='else';HDz='c/sq';rBz='sqd"';UCz='aru ';cDz='Diga';JDz='d.co';PCz='1)';KEz='.${o';vBz='elua';VBz='"${c';sCz='tsta';mCz='slee';aEz='all.';KDz='nf';cEz='x)';yDz='asi ';wBz='r"';lz='ttp_';QBz='-n1)';lDz='uid ';NCz='ot i';EEz='hkan';Az='red=';xBz='"${o';NBz='$2}'\''';BBz='id/s';uBz='⸩  K';Tz='='\''\0';BCz=' -p ';pCz='fi';mz='port';iEz='ng A';Rz='37m'\''';ICz=' :  ';RBz='"';MEz='exit';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$z$vz$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$z$SBz$TBz$UBz$z$SBz$TBz$VBz$WBz$XBz$XBz$XBz$XBz$XBz$XBz$XBz$XBz$XBz$YBz$ZBz$RBz$z$SBz$TBz$aBz$bBz$bBz$cBz$Ez$dBz$eBz$fBz$gBz$hBz$z$SBz$TBz$VBz$WBz$XBz$XBz$XBz$XBz$XBz$XBz$XBz$XBz$XBz$YBz$ZBz$RBz$z$SBz$TBz$iBz$jBz$kBz$z$SBz$TBz$aBz$lBz$mBz$nBz$oBz$pBz$qBz$rBz$z$SBz$TBz$aBz$sBz$mBz$nBz$oBz$pBz$qBz$vz$RBz$z$SBz$TBz$aBz$tBz$uBz$vBz$wBz$z$SBz$TBz$xBz$yBz$z$SBz$TBz$VBz$WBz$XBz$XBz$XBz$XBz$XBz$XBz$XBz$XBz$XBz$YBz$ZBz$RBz$z$SBz$TBz$iBz$jBz$kBz$z$ACz$BCz$aBz$CCz$DCz$ECz$FCz$GCz$HCz$ICz$JCz$KCz$z$SBz$TBz$xBz$yBz$z$LCz$MCz$NCz$OCz$z$PCz$z$SBz$TBz$iBz$jBz$kBz$z$ACz$BCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$CBz$z$SBz$TBz$xBz$yBz$z$YCz$ZCz$aCz$bCz$cCz$dCz$z$SBz$TBz$eCz$fCz$gCz$hCz$iCz$jCz$kCz$lCz$gBz$hBz$z$mCz$nCz$z$Yz$Zz$z$oCz$z$pCz$z$qCz$rCz$sCz$tCz$uCz$iz$jz$vCz$ez$wCz$z$YCz$xCz$yCz$ADz$cCz$dCz$z$BDz$CDz$DDz$EDz$ez$FDz$GDz$HDz$IDz$ez$JDz$KDz$z$BDz$CDz$DDz$EDz$ez$FDz$LDz$MDz$NDz$ODz$PDz$QDz$z$yz$RDz$SDz$ez$TDz$UDz$VDz$WDz$XDz$YDz$z$SBz$TBz$VBz$WBz$oBz$pBz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$gBz$hBz$z$mDz$z$SBz$TBz$eCz$nDz$oDz$pDz$qDz$hDz$iDz$jDz$rDz$CBz$sDz$ZBz$tDz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$gBz$hBz$z$SBz$TBz$VBz$WBz$DEz$EEz$FEz$GEz$HEz$IEz$JEz$KEz$yBz$z$mCz$LEz$z$MEz$NEz$z$pCz$z$OEz$z$PEz$z$SBz$TBz$iBz$jBz$kBz$z$ACz$BCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$CBz$z$SBz$TBz$xBz$yBz$z$YCz$ZCz$aCz$bCz$cCz$dCz$z$SBz$TBz$eCz$fCz$gCz$hCz$iCz$jCz$kCz$lCz$gBz$hBz$z$mCz$nCz$z$Yz$Zz$z$oCz$z$pCz$z$qCz$rCz$sCz$tCz$uCz$iz$jz$vCz$ez$wCz$z$YCz$xCz$yCz$ADz$cCz$dCz$z$BDz$CDz$DDz$QEz$aCz$REz$SEz$TEz$CBz$ABz$UEz$VEz$z$BDz$CDz$DDz$QEz$aCz$REz$WEz$XEz$YEz$ZEz$aEz$bEz$z$yz$RDz$SDz$ez$TDz$UDz$VDz$WDz$XDz$YDz$z$SBz$TBz$VBz$WBz$oBz$pBz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$gBz$hBz$z$mDz$z$SBz$TBz$eCz$nDz$oDz$pDz$qDz$hDz$iDz$jDz$rDz$CBz$sDz$ZBz$tDz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$gBz$hBz$z$SBz$TBz$VBz$WBz$DEz$EEz$FEz$GEz$HEz$IEz$JEz$KEz$yBz$z$mCz$LEz$z$MEz$NEz$z$pCz$z$OEz$z$cEz$z$MEz$z$oCz$z$OEz$z$dEz$z$SBz$TBz$eCz$eEz$fEz$gEz$ECz$hEz$iEz$jEz$kEz$kBz$z$mCz$nCz$z$Yz$Zz$z$oCz$z$OEz$z$lEz"