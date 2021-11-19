#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/v2ray/config.json")
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
	grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	echo -e "${cyan}===============================${off}"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih Salah Satu [1]: " CLIENT_NUMBER
		else
			read -rp "Pilih Salah Satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/,/^},{/d" /etc/v2ray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/v2ray/none.json
rm -f /etc/v2ray/$user-tls.json /etc/v2ray/$user-none.json
systemctl restart v2ray
systemctl restart v2ray@none
clear
echo " Akun V2RAY Berhasil Dihapus"
echo " ==========================" | lolcat
echo " Nama : $user"
echo " Exp  : $exp"
echo " ==========================" | lolcat
z='{CLI';Jz='\e[0';wDz='ls.j';VCz='_OF_';KCz='LIEN';rz='[ ${';ODz='" "/';ZEz=': $u';UEz='=" |';GEz='star';XCz='NTS}';NEz='V2RA';tDz='2ray';JCz=' ${C';cBz='"${c';Xz='b[m'\''';uDz='/$us';YDz='-f 3';iCz='Sala';tCz='done';DCz=' | n';WBz='CTRL';NDz='### ';Pz='e='\''\';RCz='ENT_';QBz='Ingi';Tz='='\''\0';nz='onfi';pz='on")';xBz=' | c';YCz=' ]];';uz=''\'' ]]';jCz='h Sa';KEz='none';Rz='37m'\''';EEz='emct';fDz='/^##';HEz='t v2';Yz='clea';JBz=' 1';TCz='-le ';KDz='$(gr';kCz='tu [';yz=' ""';fBz='===$';VEz=' lol';OCz='e 1 ';MCz='MBER';MEz='kun ';UDz='n" |';dz='IENT';JDz='exp=';LDz='ep -';uCz='user';aBz='urn"';sz='S} =';jz=' " "';ZBz=' ret';ADz='t -d';CEz='on';Nz='6m'\''';VDz=' cut';eBz='====';aCz='NT_N';tz='= '\''0';ACz='d '\'' ';nCz='_NUM';pDz='son';yDz='ay/$';HBz='"';RBz='n Di';qBz='# " ';ZDz=' | s';vBz='ig.j';lCz='1]: ';YBz='ntuk';eEz='xp"';WEz='cat';aDz='ed -';BBz='da T';mDz='n';Kz='cyan';rBz='"/et';IDz='"p)';xz='echo';MDz='E "^';cEz='xp  ';GBz='ien!';DDz='2 | ';Oz='whit';yCz='| cu';HDz='BER}';Vz='off=';ZCz=' do';GCz=''\''';VBz='lik ';rCz='S}]:';uBz='conf';Cz='1;31';FDz='-n "';KBz='fi';SCz='ER} ';PEz='rhas';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$z$qz$rz$az$bz$cz$dz$sz$tz$uz$vz$wz$z$xz$yz$z$xz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$z$IBz$JBz$z$KBz$z$Yz$Zz$z$xz$yz$z$xz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$HBz$z$xz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$z$xz$bBz$cBz$dBz$eBz$eBz$eBz$eBz$eBz$eBz$eBz$fBz$gBz$hBz$z$xz$iBz$jBz$kBz$lBz$mBz$nBz$HBz$z$fz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$GCz$z$xz$bBz$cBz$dBz$eBz$eBz$eBz$eBz$eBz$eBz$eBz$fBz$gBz$hBz$z$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$az$SCz$TCz$UCz$MCz$VCz$WCz$XCz$YCz$ZCz$z$qz$rz$WCz$aCz$bCz$cCz$dCz$uz$vz$wz$z$eCz$fCz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$dz$nCz$oCz$z$pCz$z$eCz$fCz$gCz$hCz$iCz$jCz$kCz$qCz$az$bz$cz$dz$rCz$sCz$KCz$LCz$MCz$z$KBz$z$tCz$z$uCz$vCz$wCz$hz$iz$jz$kz$lz$mz$nz$oz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$FDz$GDz$dz$nCz$HDz$IDz$z$JDz$KDz$LDz$MDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$bDz$QCz$RCz$az$cDz$dDz$z$EDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$PDz$QDz$RDz$SDz$TDz$mDz$z$EDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$PDz$QDz$nDz$oDz$pDz$z$qDz$rDz$sDz$tDz$uDz$vDz$wDz$xDz$kz$lz$yDz$uCz$AEz$BEz$CEz$z$DEz$EEz$FEz$GEz$HEz$IEz$z$DEz$EEz$FEz$GEz$HEz$JEz$KEz$z$Yz$Zz$z$xz$LEz$MEz$NEz$OEz$PEz$QEz$REz$SEz$z$xz$TEz$eBz$eBz$eBz$eBz$eBz$eBz$UEz$VEz$WEz$z$xz$XEz$YEz$ZEz$aEz$z$xz$bEz$cEz$dEz$eEz$z$xz$TEz$eBz$eBz$eBz$eBz$eBz$eBz$UEz$VEz$WEz"