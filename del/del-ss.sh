#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/shadowsocks-libev/akun.conf")
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
	grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	echo -e "${cyan}===============================${off}"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih Salah Satu [1]: " CLIENT_NUMBER
		else
			read -rp "Pilih Salah Satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
	# match the selected number to a client name
	CLIENT_NAME=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
	user=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)

	# remove [Peer] block matching $CLIENT_NAME
	sed -i "/^### $user $exp/,/^port_http/d" "/etc/shadowsocks-libev/akun.conf"
	# remove generated client file
service cron restart
systemctl disable shadowsocks-libev-server@$user-tls.service
	systemctl disable shadowsocks-libev-server@$user-http.service
	systemctl stop shadowsocks-libev-server@$user-tls.service
	systemctl stop shadowsocks-libev-server@$user-http.service
	rm -f "/etc/shadowsocks-libev/$user-tls.json"
	rm -f "/etc/shadowsocks-libev/$user-http.json"
clear
echo " Akun SS OBFS Berhasil Dihapus"
echo " ==========================" | lolcat
echo " Nama : $user"
echo " Exp  : $exp"
echo " ==========================" | lolcat
z='-E "';lEz='r-ht';CDz='ep -';NBz='fi';vBz='c/sh';MDz='un.c';BFz='SS O';XBz=' " K';wEz='.jso';uCz='else';RCz='MBER';fz='grep';Uz='33[1';hCz='R} =';ABz='en';Gz='e[0;';FEz='wsoc';yEz=' " A';jz=' " "';JEz='n.co';KBz='"';qCz='1]: ';UCz='&& $';eDz=' '\'' -';HDz='shad';vDz='ser ';cz='F_CL';lBz=' "  ';Xz='b[m'\''';Mz='1b[9';cDz='cut ';XEz='-tls';cEz='rvic';tBz='# " ';DCz='f" |';ICz='-3 |';fCz='NT_N';BEz='p/d"';yDz='port';Wz=''\''\x1';Nz='6m'\''';HEz='ibev';rDz='sed ';Cz='1;31';Iz='NC='\''';Lz='='\''\x';XDz='p)';GDz='etc/';GCz=''\'' '\'' ';mCz='lih ';vCz='1-${';jBz='{off';ZEz='vice';cBz=' ret';KDz='libe';ez='S=$(';kz='/etc';tDz='/^##';GFz='apus';Rz='37m'\''';jDz='R}"p';HFz=' " =';qDz='}"p)';SCz='} -g';dz='IENT';FCz=' -d ';LCz=') '\''';uDz='# $u';QEz='syst';pBz='xpir';OCz=' ${C';dEz='e';KCz='-s '\''';HCz='-f 2';Qz='x1b[';ZDz='=$(g';RBz='en Y';eCz=' do';WBz='arui';OBz=' " P';ADz='AME=';TBz='Ingi';xz=''\'' ]]';cCz='NTS}';PEz='tart';Vz='off=';LDz='v/ak';dCz=' ]];';CEz=' "/e';oEz='ce';EFz='asil';oCz='h Sa';kDz=')';FBz='idak';MCz='unti';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$z$tz$uz$az$bz$cz$dz$vz$wz$xz$yz$ABz$z$Yz$Zz$z$BBz$CBz$z$BBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$z$LBz$MBz$z$NBz$z$Yz$Zz$z$BBz$CBz$z$BBz$OBz$PBz$QBz$RBz$SBz$TBz$UBz$VBz$WBz$KBz$z$BBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$z$BBz$eBz$fBz$gBz$hBz$hBz$hBz$hBz$hBz$hBz$hBz$iBz$jBz$kBz$z$BBz$lBz$mBz$nBz$oBz$pBz$qBz$KBz$z$fz$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$z$BBz$eBz$fBz$gBz$hBz$hBz$hBz$hBz$hBz$hBz$hBz$iBz$jBz$kBz$z$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$az$XCz$YCz$ZCz$RCz$aCz$bCz$cCz$dCz$eCz$z$tz$uz$bCz$fCz$gCz$hCz$iCz$xz$yz$ABz$z$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$rCz$dz$sCz$tCz$z$uCz$z$jCz$kCz$lCz$mCz$nCz$oCz$pCz$vCz$az$bz$cz$dz$wCz$xCz$PCz$QCz$RCz$z$NBz$z$yCz$z$bCz$fCz$ADz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$MDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$VCz$WCz$az$WDz$XDz$z$YDz$ZDz$aDz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$bDz$cDz$dDz$eDz$fDz$gDz$hDz$iDz$bCz$fCz$gCz$jDz$kDz$z$lDz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$MDz$NDz$ODz$PDz$QDz$RDz$mDz$nDz$oDz$pDz$PCz$QCz$RCz$qDz$z$rDz$sDz$tDz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$DEz$EEz$FEz$GEz$HEz$IEz$JEz$KEz$z$LEz$MEz$NEz$OEz$PEz$z$QEz$REz$SEz$TEz$UEz$wBz$xBz$yBz$VEz$LEz$WEz$YDz$XEz$YEz$ZEz$z$QEz$REz$SEz$TEz$UEz$wBz$xBz$yBz$VEz$LEz$WEz$YDz$aEz$bEz$cEz$dEz$z$QEz$REz$eEz$fEz$EEz$FEz$GEz$HEz$gEz$hEz$iEz$jEz$kEz$cEz$dEz$z$QEz$REz$eEz$fEz$EEz$FEz$GEz$HEz$gEz$hEz$iEz$lEz$mEz$nEz$oEz$z$pEz$qEz$GDz$HDz$IDz$JDz$KDz$rEz$sEz$tEz$uEz$KBz$z$pEz$qEz$GDz$HDz$IDz$JDz$KDz$rEz$sEz$vEz$wEz$xEz$z$Yz$Zz$z$BBz$yEz$AFz$BFz$CFz$DFz$EFz$FFz$GFz$KBz$z$BBz$HFz$hBz$hBz$hBz$hBz$hBz$hBz$IFz$JFz$KFz$z$BBz$LFz$MFz$NFz$OFz$z$BBz$PFz$QFz$RFz$SFz$z$BBz$HFz$hBz$hBz$hBz$hBz$hBz$hBz$IFz$JFz$KFz"