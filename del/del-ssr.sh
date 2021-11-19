#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/shadowsocksr/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
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
	grep -E "^### " "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	echo -e "${cyan}===============================${off}"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih Salah Satu [1]: " CLIENT_NUMBER
		else
			read -rp "Pilih Salah Satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done

	# match the selected number to a client name
	CLIENT_NAME=$(grep -E "^### " "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
	user=$(grep -E "^### " "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^### " "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)

	# remove [Peer] block matching $CLIENT_NAME
	sed -i "/^### $CLIENT_NAME/d" "/usr/local/shadowsocksr/akun.conf"
cd /usr/local/shadowsocksr
match_del=$(python mujson_mgr.py -d -u "${user}"|grep -w "delete user")
cd
service cron restart
/etc/init.d/ssrmu restart
clear
echo " Akun Shadowsocks-R Berhasil Dihapus"
echo " ==========================" | lolcat
echo " Nama : $user"
echo " Exp  : $exp"
echo " ==========================" | lolcat
 '\'' ';yEz=': $e';TBz='Ingi';bEz='ssrm';GEz='ujso';REz='r")';jEz='R Be';QBz=' Kli';LDz='sr/a';Jz='\e[0';qz='akun';VEz='cron';PBz='ilih';PEz='lete';sBz='"^##';PCz='LIEN';NCz='l [[';bDz='rep ';sEz=' " N';Pz='e='\''\';ez='S=$(';HBz='ilik';XEz='tart';Dz='m'\''';BDz='$(gr';YBz='lik ';Tz='='\''\0';qDz=' "${';nCz='Sala';qBz='ed  ';yCz='done';cBz=' ret';xCz=' " C';Lz='='\''\x';CBz=' ""';uEz=': $u';SDz='f 2-';nDz='f 3 ';gCz='UMBE';fz='grep';jCz='read';DBz=' "An';rEz='cat';oz='wsoc';hDz=' | s';ZCz='${NU';oEz=' " =';tCz='BER';Vz='off=';LBz='exit';yBz='owso';YEz='/etc';JEz='-u "';PDz='cut ';YCz='-le ';kDz='ER}"';uDz='/^##';dBz='urn"';iCz='= '\''1';vEz='ser"';NDz='conf';Hz='32m'\''';uCz='else';CEz='h_de';dDz=' cut';mCz='lih ';GDz='usr/';aBz='+C u';Xz='b[m'\''';bz='ER_O';LEz='er}"';cz='F_CL';HDz='loca';Qz='x1b[';UDz='sed ';xEz='xp  ';iz='^###';ODz='" | ';ZEz='/ini';wz='= '\''0';UEz='ice ';ADz='AME=';oCz='h Sa';QEz=' use';gEz='kun ';qCz='1]: ';OBz=' " P';tBz='# " ';cCz='NTS}';LCz=''\'') '\''';OEz=' "de';VDz='-n "';CCz='n.co';KEz='${us';WCz='ENT_';ABz='en';Fz='n='\''\';fBz='"${c';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$z$tz$uz$az$bz$cz$dz$vz$wz$xz$yz$ABz$z$Yz$Zz$z$BBz$CBz$z$BBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$z$LBz$MBz$z$NBz$z$Yz$Zz$z$BBz$CBz$z$BBz$OBz$PBz$QBz$RBz$SBz$TBz$UBz$VBz$WBz$KBz$z$BBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$z$BBz$eBz$fBz$gBz$hBz$hBz$hBz$hBz$hBz$hBz$hBz$iBz$jBz$kBz$z$BBz$lBz$mBz$nBz$oBz$pBz$qBz$KBz$z$fz$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$z$BBz$eBz$fBz$gBz$hBz$hBz$hBz$hBz$hBz$hBz$hBz$iBz$jBz$kBz$z$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$az$XCz$YCz$ZCz$RCz$aCz$bCz$cCz$dCz$eCz$z$tz$uz$bCz$fCz$gCz$hCz$iCz$xz$yz$ABz$z$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$rCz$dz$sCz$tCz$z$uCz$z$jCz$kCz$lCz$mCz$nCz$oCz$pCz$vCz$az$bz$cz$dz$wCz$xCz$PCz$QCz$RCz$z$NBz$z$yCz$z$bCz$fCz$ADz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$MDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$WDz$dz$sCz$XDz$YDz$z$ZDz$aDz$bDz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$VCz$WCz$az$kDz$lDz$z$mDz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$MDz$NDz$ODz$PDz$QDz$RDz$nDz$oDz$pDz$qDz$bCz$fCz$gCz$rDz$sDz$z$UDz$tDz$uDz$vDz$PCz$wDz$xDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$MDz$NDz$KBz$z$yDz$GDz$HDz$IDz$JDz$KDz$AEz$z$BEz$CEz$DEz$EEz$FEz$GEz$HEz$IEz$eDz$JEz$KEz$LEz$MEz$NEz$OEz$PEz$QEz$REz$z$SEz$z$TEz$UEz$VEz$WEz$XEz$z$YEz$ZEz$aEz$bEz$cEz$dEz$eEz$z$Yz$Zz$z$BBz$fEz$gEz$hEz$yBz$iEz$jEz$kEz$lEz$mEz$nEz$z$BBz$oEz$hBz$hBz$hBz$hBz$hBz$hBz$pEz$qEz$rEz$z$BBz$sEz$tEz$uEz$vEz$z$BBz$wEz$xEz$yEz$AFz$z$BBz$oEz$hBz$hBz$hBz$hBz$hBz$hBz$pEz$qEz$rEz"