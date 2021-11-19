#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
source /etc/wireguard/params
	NUMBER_OF_CLIENTS=$(grep -c -E "^### Client" "/etc/wireguard/$SERVER_WG_NIC.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "Anda Tidak Memiliki Klien!"
		exit 1
	fi

	clear
	echo ""
	echo ""
	echo " Pilih Klien Yang Ingin Diperbarui"
	echo " Klik CTRL+C untuk return"
	echo -e "${cyan}===============================${off}"
	echo "     No User Expired  "
	grep -E "^### Client" "/etc/wireguard/$SERVER_WG_NIC.conf" | cut -d ' ' -f 3-4 | nl -s ') '
	echo -e "${cyan}===============================${off}"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih Salah Satu [1]: " CLIENT_NUMBER
		else
			read -rp "Pilih Salah Satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done

	# match the selected number to a client name
	CLIENT_NAME=$(grep -E "^### Client" "/etc/wireguard/$SERVER_WG_NIC.conf" | cut -d ' ' -f 3-4 | sed -n "${CLIENT_NUMBER}"p)
	user=$(grep -E "^### Client" "/etc/wireguard/$SERVER_WG_NIC.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^### Client" "/etc/wireguard/$SERVER_WG_NIC.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)

	# remove [Peer] block matching $CLIENT_NAME
	sed -i "/^### Client $user $exp/,/^AllowedIPs/d" /etc/wireguard/wg0.conf
	# remove generated client file
	rm -f "/home/vps/public_html/$user.conf"

	# restart wireguard to apply changes
	systemctl restart "wg-quick@$SERVER_WG_NIC"
	service cron restart
clear
echo " Akun Wireguard Berhasil Dihapus"
echo " ==========================" | lolcat
echo " Nama : $user"
echo " Exp : $exp"
echo " ==========================" | lolcat
-n';iBz='CTRL';ICz='R_WG';cCz='&& $';xBz='er E';hEz='cron';EBz='[ ${';ZBz=' Kli';iz='ER_O';XCz='LIEN';WEz='er.c';eCz='ENT_';qBz='====';fDz='n "$';kEz=' " A';kDz='rep ';Cz='1;31';XEz='syst';MDz='### ';DEz='-i "';WCz=' ${C';aDz='d '\'' ';pz='^###';oBz='"${c';MCz=' cut';FEz=' $us';qEz='ihap';Vz='off=';Qz='x1b[';QEz='home';Kz='cyan';TCz=') '\''';mEz='Wire';Tz='='\''\0';KCz='.con';iDz='user';NBz='da T';NDz='Clie';OCz=''\'' '\'' ';rBz='===$';oDz=' '\'' -';nz=' -c ';UDz='VER_';cz='etc/';Wz=''\''\x1';FCz='" "/';gEz='ice ';XBz=' " P';kBz='ntuk';tEz='=" |';lCz=' ]];';ECz='ient';YBz='ilih';jz='F_CL';ez='guar';SDz='ard/';eBz='perb';bBz='ang ';sEz=' " =';uEz=' lol';YEz='emct';jDz='=$(g';VDz='WG_N';Oz='whit';qz=' Cli';Az='red=';Yz='clea';gBz=' " K';JDz='$(gr';GEz='er $';CEz='sed ';lz='S=$(';oCz='UMBE';nCz='NT_N';EDz='1-${';ACz='ed  ';xz='RVER';uDz=')';UBz='exit';tDz='R}"p';vBz='   N';HCz='ERVE';JBz='en';CBz='")';MBz=' "An';VCz='l [[';yCz='1]: ';CDz='BER';pBz='yan}';GCz='d/$S';RCz=' nl ';qCz='= '\''1';PBz=' Mem';fBz='arui';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$z$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$wz$xz$yz$ABz$BBz$CBz$z$DBz$EBz$hz$iz$jz$kz$FBz$GBz$HBz$IBz$JBz$z$Yz$Zz$z$KBz$LBz$z$KBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$z$UBz$VBz$z$WBz$z$Yz$Zz$z$KBz$LBz$z$KBz$LBz$z$KBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$fBz$TBz$z$KBz$gBz$hBz$iBz$jBz$kBz$lBz$mBz$z$KBz$nBz$oBz$pBz$qBz$qBz$qBz$qBz$qBz$qBz$qBz$rBz$sBz$tBz$z$KBz$uBz$vBz$wBz$xBz$yBz$ACz$TBz$z$mz$BCz$CCz$DCz$ECz$FCz$cz$dz$ez$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$z$KBz$nBz$oBz$pBz$qBz$qBz$qBz$qBz$qBz$qBz$qBz$rBz$sBz$tBz$z$UCz$VCz$WCz$XCz$YCz$ZCz$aCz$bCz$cCz$dCz$eCz$hz$fCz$gCz$hCz$ZCz$iCz$jCz$kCz$lCz$mCz$z$DBz$EBz$jCz$nCz$oCz$pCz$qCz$HBz$IBz$JBz$z$rCz$sCz$tCz$uCz$vCz$wCz$xCz$yCz$ADz$kz$BDz$CDz$z$DDz$z$rCz$sCz$tCz$uCz$vCz$wCz$xCz$EDz$hz$iz$jz$kz$FDz$GDz$XCz$YCz$ZCz$z$WBz$z$HDz$z$jCz$nCz$IDz$JDz$KDz$LDz$MDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$dCz$eCz$hz$gDz$hDz$z$iDz$jDz$kDz$oz$pz$qz$rz$sz$tz$uz$vz$wz$xz$yz$ABz$BBz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$jCz$nCz$oCz$tDz$uDz$z$vDz$JDz$KDz$LDz$MDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$bDz$wDz$xDz$yDz$AEz$XCz$YCz$ZCz$BEz$z$CEz$DEz$EEz$DCz$ECz$FEz$GEz$HEz$IEz$JEz$KEz$LEz$MEz$QDz$RDz$SDz$NEz$BBz$z$OEz$PEz$QEz$REz$SEz$TEz$UEz$VEz$WEz$XDz$z$XEz$YEz$ZEz$aEz$bEz$cEz$dEz$TDz$UDz$VDz$eEz$z$fEz$gEz$hEz$iEz$jEz$z$Yz$Zz$z$KBz$kEz$lEz$mEz$ez$nEz$oEz$pEz$qEz$rEz$z$KBz$sEz$qBz$qBz$qBz$qBz$qBz$qBz$tEz$uEz$vEz$z$KBz$wEz$xEz$yEz$AFz$z$KBz$BFz$CFz$DFz$EFz$z$KBz$sEz$qBz$qBz$qBz$qBz$qBz$qBz$tEz$uEz$vEz"