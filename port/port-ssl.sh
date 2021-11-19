#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
ssl="$(cat /etc/stunnel/stunnel.conf | grep -i accept | head -n 2 | cut -d= -f2 | sed 's/ //g' | tr '\n' ' ' | awk '{print $1}')"
ssl2="$(cat /etc/stunnel/stunnel.conf | grep -i accept | head -n 2 | cut -d= -f2 | sed 's/ //g' | tr '\n' ' ' | awk '{print $2}')"
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "            ${green}PORT STUNNEL${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Ubah Port Stunnel $ssl"
echo -e "     2 ⸩  Ubah Port Stunnel $ssl2"
echo -e "     x ⸩  Keluar"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor  [1-2 / x] :  " prot
echo -e "${off}"

case $prot in
1)
echo -e "${green}"
read -p "Masukkan Port Baru Stunnel4 :  " stl
echo -e "${off}"
if [ -z $stl ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $stl)
if [[ -z $cek ]]; then
sed -i "s/$ssl/$stl/g" /etc/stunnel/stunnel.conf
sed -i "s/   - Stunnel4                : $ssl, $ssl2/   - Stunnel4                : $stl, $ssl2/g" /root/log-install.txt
/etc/init.d/stunnel4 restart > /dev/null
echo -e "${cyan}Port Stunnel4 Berhasil Diganti Menjadi :${off} ${green} $stl ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $stl ]${off} ${red}Sudah Beroperasi Pada System!${off}"
echo -e "${cyan}Silahkan Gunakan Port Lain...${off}"
sleep 2
exit 0
fi
;;
2)
echo -e "${green}"
read -p "Masukkan Port Baru Stunnel4 :  " stl
echo -e "${off}"
if [ -z $stl ]; then
echo -e "${red}Port Tidak Dimasukkan !!!${off}"
sleep 1
clear
menu
fi
cek=$(netstat -nutlp | grep -w $stl)
if [[ -z $cek ]]; then
sed -i "s/$ssl2/$stl/g" /etc/stunnel/stunnel.conf
sed -i "s/   - Stunnel4                : $ssl, $ssl2/   - Stunnel4                : $ssl, $stl/g" /root/log-install.txt
/etc/init.d/stunnel4 restart > /dev/null
echo -e "${cyan}Port Stunnel4 Berhasil Diganti Menjadi :${off} ${green} $stl ${off}"
else
echo -e "${red}ERROR! Port{off} ${green}[ $stl ]${off} ${red}Sudah Beroperasi Pada System!${off}"
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
Cz='bah ';UDz='[ -z';pDz='  : ';sDz='root';kz='-i a';rz='-d= ';Hz='32m'\''';Lz='='\''\x';AFz='tl/g';kEz='hkan';YBz=' -f2';MFz='r Ya';IDz='f}"';FCz='}"';KBz='/etc';Sz='bold';PEz=' ${o';oDz='l4  ';gEz='da S';BDz='ort ';iz=' | g';Yz='clea';lDz='/   ';hCz='ot i';wCz=' ]; ';LCz=' $ss';Tz='='\''\0';Kz='cyan';FEz='4 Be';OFz='da!$';nEz=' Por';jEz='Sila';TCz='"${o';Mz='1b[9';VCz=' -p ';OEz='en} ';KCz=' Stu';FFz='all.';CCz='L${o';VBz=' 2 |';CBz='wk '\''';gz='nel.';yBz='}POR';ZCz='r  [';MEz='f} $';dDz='stl/';vDz='tall';rDz='sl2/';Ez='gree';GDz=' !!!';pEz='in..';bz='"$(c';ACz='T ST';rBz='====';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$ez$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$z$HBz$IBz$JBz$KBz$LBz$MBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$fBz$gBz$hBz$iBz$jBz$kBz$lBz$z$mBz$nBz$oBz$z$mBz$nBz$pBz$qBz$rBz$rBz$rBz$rBz$rBz$rBz$rBz$rBz$rBz$sBz$tBz$GBz$z$mBz$nBz$uBz$vBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$z$mBz$nBz$pBz$qBz$rBz$rBz$rBz$rBz$rBz$rBz$rBz$rBz$rBz$sBz$tBz$GBz$z$mBz$nBz$ECz$xBz$FCz$z$mBz$nBz$uBz$GCz$HCz$ICz$JCz$KCz$MBz$LCz$MCz$z$mBz$nBz$uBz$NCz$HCz$ICz$JCz$KCz$MBz$LCz$OCz$z$mBz$nBz$uBz$PCz$QCz$RCz$SCz$z$mBz$nBz$TCz$DCz$z$mBz$nBz$pBz$qBz$rBz$rBz$rBz$rBz$rBz$rBz$rBz$rBz$rBz$sBz$tBz$GBz$z$mBz$nBz$ECz$xBz$FCz$z$UCz$VCz$uBz$WCz$XCz$YCz$ZCz$aCz$bCz$cCz$dCz$eCz$z$mBz$nBz$TCz$DCz$z$fCz$gCz$hCz$iCz$z$jCz$z$mBz$nBz$ECz$xBz$FCz$z$UCz$VCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$cCz$rCz$sCz$z$mBz$nBz$TCz$DCz$z$tCz$uCz$vCz$wCz$xCz$z$mBz$nBz$yCz$ADz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$z$JDz$KDz$z$Yz$Zz$z$LDz$z$MDz$z$NDz$ODz$PDz$QDz$RDz$iz$jz$SDz$TDz$z$tCz$UDz$VDz$WDz$XDz$YDz$z$ZDz$aDz$bDz$cDz$dDz$eDz$dz$ez$fz$ez$gz$hz$z$ZDz$aDz$fDz$gDz$hDz$iDz$vBz$vBz$vBz$jDz$LCz$kDz$HBz$lDz$mDz$nDz$oDz$vBz$vBz$vBz$pDz$vCz$qDz$rDz$eDz$sDz$tDz$uDz$vDz$wDz$z$KBz$xDz$yDz$ez$qCz$AEz$BEz$CEz$DEz$EEz$z$mBz$nBz$pBz$qBz$JCz$KCz$MBz$FEz$GEz$HEz$IEz$JEz$KEz$LEz$HDz$MEz$NEz$OEz$vCz$PEz$DCz$z$QEz$z$mBz$nBz$yCz$REz$SEz$TEz$UEz$VEz$WEz$XEz$YEz$ZEz$HDz$MEz$aEz$bEz$cEz$dEz$eEz$fEz$gEz$hEz$iEz$tBz$GBz$z$mBz$nBz$pBz$qBz$jEz$kEz$lEz$mEz$nEz$oEz$pEz$qEz$DCz$z$JDz$rEz$z$sEz$tEz$z$MDz$z$uEz$z$vEz$z$mBz$nBz$ECz$xBz$FCz$z$UCz$VCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$cCz$rCz$sCz$z$mBz$nBz$TCz$DCz$z$tCz$uCz$vCz$wCz$xCz$z$mBz$nBz$yCz$ADz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$z$JDz$KDz$z$Yz$Zz$z$LDz$z$MDz$z$NDz$ODz$PDz$QDz$RDz$iz$jz$SDz$TDz$z$tCz$UDz$VDz$WDz$XDz$YDz$z$ZDz$aDz$bDz$rDz$vCz$wEz$KBz$LBz$MBz$LBz$MBz$NBz$xEz$z$ZDz$aDz$fDz$gDz$hDz$iDz$vBz$vBz$vBz$jDz$LCz$kDz$HBz$lDz$mDz$nDz$oDz$vBz$vBz$vBz$pDz$yEz$qDz$AFz$BFz$CFz$DFz$EFz$FFz$GFz$z$KBz$xDz$yDz$ez$qCz$AEz$BEz$CEz$DEz$EEz$z$mBz$nBz$pBz$qBz$JCz$KCz$MBz$FEz$GEz$HEz$IEz$JEz$KEz$LEz$HDz$MEz$NEz$OEz$vCz$PEz$DCz$z$QEz$z$mBz$nBz$yCz$REz$SEz$TEz$UEz$VEz$WEz$XEz$YEz$ZEz$HDz$MEz$aEz$bEz$cEz$dEz$eEz$fEz$gEz$hEz$iEz$tBz$GBz$z$mBz$nBz$pBz$qBz$jEz$kEz$lEz$mEz$nEz$oEz$pEz$qEz$DCz$z$JDz$rEz$z$sEz$tEz$z$MDz$z$uEz$z$HFz$z$sEz$z$LDz$z$uEz$z$IFz$z$mBz$nBz$yCz$JFz$KFz$LFz$YCz$MFz$NFz$OFz$PFz$FCz$z$JDz$KDz$z$Yz$Zz$z$LDz$z$uEz$z$QFz"