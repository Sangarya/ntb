#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "Anda Tidak Memiliki Klien!"
		exit 1
	fi

	echo ""
	echo " Pilih Klien Yang Ingin Diperbarui"
	echo " Klik CTRL+C untuk return"
	echo -e "${cyan}===============================${off}"
	echo "     No User Expired  "
	grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	echo -e "${cyan}===============================${off}"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih Salah Satu [1]: " CLIENT_NUMBER
		else
			read -rp "Pilih Salah Satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
CLIENT_NAME=$(grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/d" /etc/trojan/akun.conf
sed -i '/^,"'"$user"'"$/d' /etc/trojan/config.json
systemctl restart trojan
service cron restart
clear
clear
echo " Trojan Account Deleted Successfully"
echo " ==========================" | lolcat
echo " Nama : $user"
echo " Exp  : $exp"
echo " ==========================" | lolcat
z='= '\''0';QEz='t De';LDz='sed ';Nz='6m'\''';aCz='UMBE';NCz='e 1 ';REz='lete';cDz='p)';Xz='b[m'\''';jz=' " "';yCz='" "/';lDz='/^##';bEz='ama ';HCz='l [[';dEz=' " E';bz='ER_O';Tz='='\''\0';fDz='| se';DDz='kun.';wBz='nf" ';TBz='arui';xDz='an/c';hBz='}"';XBz='+C u';gBz='{off';GDz='cut ';Gz='e[0;';NDz='${CL';vz='; th';JBz=' 1';Wz=''\''\x1';GBz='ien!';Ez='gree';WBz='CTRL';XDz='-f 2';VBz='lik ';RBz='n Di';OCz='&& $';KCz='T_NU';PDz='"p)';Iz='NC='\''';yz=' ""';Sz='bold';VEz='ly"';yDz='onfi';nBz='ed  ';iDz='R}"p';LEz='tart';mDz='# $u';ez='S=$(';CCz='2-3 ';nDz='ser ';rz='[ ${';XCz=' ]];';Az='red=';SCz='-le ';gDz='d -n';MBz='ilih';ZEz='cat';uBz='/aku';PEz='coun';wDz='d'\'' /';HEz='serv';nz='akun';mz='jan/';Hz='32m'\''';pz='f")';lCz='" CL';fCz=' "Pi';jCz='tu [';WEz=' " =';lz='/tro';sz='S} =';xBz='| cu';UBz=' " K';xCz='### ';aDz='n "$';EDz='conf';AEz='g.js';bDz='ER}"';LBz=' " P';IDz=' '\'' -';DBz=' Mem';NBz=' Kli';MDz='-n "';gCz='lih ';iBz=' "  ';tBz='ojan';YDz=' | s';uCz='$(gr';Mz='1b[9';ABz=' "An';OBz='en Y';SBz='perb';DEz='emct';QCz='ENT_';VCz='CLIE';qz='if [';pCz='1-${';GEz='t tr';vBz='n.co';sCz='done';xz='echo';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$z$qz$rz$az$bz$cz$dz$sz$tz$uz$vz$wz$z$xz$yz$z$xz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$z$IBz$JBz$z$KBz$z$xz$yz$z$xz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$HBz$z$xz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$z$xz$bBz$cBz$dBz$eBz$eBz$eBz$eBz$eBz$eBz$eBz$fBz$gBz$hBz$z$xz$iBz$jBz$kBz$lBz$mBz$nBz$HBz$z$fz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$z$xz$bBz$cBz$dBz$eBz$eBz$eBz$eBz$eBz$eBz$eBz$fBz$gBz$hBz$z$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$az$RCz$SCz$TCz$LCz$UCz$VCz$WCz$XCz$YCz$z$qz$rz$VCz$ZCz$aCz$bCz$cCz$uz$vz$wz$z$dCz$eCz$fCz$gCz$hCz$iCz$jCz$kCz$lCz$dz$mCz$nCz$z$oCz$z$dCz$eCz$fCz$gCz$hCz$iCz$jCz$pCz$az$bz$cz$dz$qCz$rCz$JCz$KCz$LCz$z$KBz$z$sCz$z$VCz$ZCz$tCz$uCz$vCz$wCz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$MDz$NDz$dz$mCz$ODz$PDz$z$QDz$RDz$SDz$hz$iz$jz$kz$lz$mz$nz$oz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$PCz$QCz$az$bDz$cDz$z$dDz$uCz$vCz$wCz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$eDz$fDz$gDz$hDz$VCz$ZCz$aCz$iDz$jDz$z$LDz$kDz$lDz$mDz$nDz$oDz$pDz$kz$lz$mz$nz$oz$qDz$z$LDz$rDz$sDz$tDz$uDz$vDz$wDz$ADz$BDz$xDz$yDz$AEz$BEz$z$CEz$DEz$EEz$FEz$GEz$tBz$z$HEz$IEz$JEz$KEz$LEz$z$Yz$Zz$z$Yz$Zz$z$xz$MEz$NEz$OEz$PEz$QEz$REz$SEz$TEz$UEz$VEz$z$xz$WEz$eBz$eBz$eBz$eBz$eBz$eBz$XEz$YEz$ZEz$z$xz$aEz$bEz$cEz$uDz$z$xz$dEz$eEz$fEz$gEz$z$xz$WEz$eBz$eBz$eBz$eBz$eBz$eBz$XEz$YEz$ZEz"