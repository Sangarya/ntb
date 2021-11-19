#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/v2ray/vless.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "Anda Tidak Memiliki Klien!"
		exit 1
	fi

	clear
	echo ""
	echo " Pilih Klien Yang Ingin Diperbarui"
	echo " Klik CTRL+C untuk return"
	echo -e "${cyan}===============================${off}"
	echo "     No User Expired  "
	grep -E "^### " "/etc/v2ray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
	echo -e "${cyan}===============================${off}"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih Salah Satu [1]: " CLIENT_NUMBER
		else
			read -rp "Pilih Salah Satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^### " "/etc/v2ray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/v2ray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/,/^},{/d" /etc/v2ray/vless.json
sed -i "/^### $user $exp/,/^},{/d" /etc/v2ray/vnone.json
systemctl restart v2ray@vless
systemctl restart v2ray@none
clear
echo " Akun Vless Berhasil Dihapus"
echo " ==========================" | lolcat
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " ==========================" | lolcat
Ez=' " =';ZDz=' "${';ABz=' "An';vBz='s.js';LEz=' $us';FBz='i Kl';bz='ER_O';KDz='E "^';Rz='37m'\''';iDz='/,/^';uz=''\'' ]]';nDz='syst';KEz='me :';FDz='ER}"';RDz='json';kBz='o Us';EDz='n "$';NDz='etc/';WCz='NTS}';aCz='UMBE';Cz='1;31';fz='grep';DEz='us"';ECz=' -s ';qz='if [';VCz='CLIE';wz='en';DDz='ed -';yCz=' -d ';eBz='====';ACz=' '\'' '\''';ZBz=' ret';NCz='e 1 ';Jz='\e[0';QCz='ENT_';Vz='off=';qBz='# " ';lDz='y/vn';HCz='l [[';yDz='s Be';hCz='Sala';gDz='ser ';XCz=' ]];';gCz='lih ';Xz='b[m'\''';QDz='ess.';yBz='t -d';lCz='" CL';xz='echo';hz='-E "';jDz='},{/';QEz=' $ex';Dz='m'\''';vz='; th';xBz='| cu';GDz='p)';eCz=' -rp';rDz='t v2';kz='/etc';cDz='sed ';JEz='t Na';Pz='e='\''\';JCz='LIEN';AEz='rhas';ODz='v2ra';RCz='ER} ';NEz=' " E';CCz='2-3 ';cCz='= '\''1';vCz='rep ';iBz=' "  ';iCz='h Sa';Kz='cyan';fCz=' "Pi';uCz='=$(g';tz='= '\''0';OCz='&& $';JDz='ep -';bCz='R} =';SDz='" | ';iz='^###';WBz='CTRL';Nz='6m'\''';HDz='exp=';az='NUMB';BDz='-f 2';UBz=' " K';CBz='idak';mz='ay/v';qDz='star';CDz=' | s';FCz=''\'') '\''';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$z$qz$rz$az$bz$cz$dz$sz$tz$uz$vz$wz$z$xz$yz$z$xz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$z$IBz$JBz$z$KBz$z$Yz$Zz$z$xz$yz$z$xz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$HBz$z$xz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$z$xz$bBz$cBz$dBz$eBz$eBz$eBz$eBz$eBz$eBz$eBz$fBz$gBz$hBz$z$xz$iBz$jBz$kBz$lBz$mBz$nBz$HBz$z$fz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$z$xz$bBz$cBz$dBz$eBz$eBz$eBz$eBz$eBz$eBz$eBz$fBz$gBz$hBz$z$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$az$RCz$SCz$TCz$LCz$UCz$VCz$WCz$XCz$YCz$z$qz$rz$VCz$ZCz$aCz$bCz$cCz$uz$vz$wz$z$dCz$eCz$fCz$gCz$hCz$iCz$jCz$kCz$lCz$dz$mCz$nCz$z$oCz$z$dCz$eCz$fCz$gCz$hCz$iCz$jCz$pCz$az$bz$cz$dz$qCz$rCz$JCz$KCz$LCz$z$KBz$z$sCz$z$tCz$uCz$vCz$hz$iz$jz$kz$lz$mz$nz$oz$wCz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$PCz$QCz$az$FDz$GDz$z$HDz$IDz$JDz$KDz$LDz$MDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$VCz$ZCz$aCz$aDz$bDz$z$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$NDz$ODz$PDz$QDz$RDz$z$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$NDz$ODz$lDz$mDz$RDz$z$nDz$oDz$pDz$qDz$rDz$sDz$uBz$tDz$z$nDz$oDz$pDz$qDz$rDz$sDz$uDz$z$Yz$Zz$z$xz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$DEz$z$xz$EEz$eBz$eBz$eBz$eBz$eBz$eBz$FEz$GEz$HEz$z$xz$rCz$IEz$JEz$KEz$LEz$MEz$z$xz$NEz$mBz$OEz$PEz$QEz$REz$z$xz$EEz$eBz$eBz$eBz$eBz$eBz$eBz$FEz$GEz$HEz"