#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/var/lib/premium-script/data-user-sstp")
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
	grep -E "^### " "/var/lib/premium-script/data-user-sstp" | cut -d ' ' -f 2-3 | nl -s ') '
	echo -e "${cyan}===============================${off}"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih Salah Satu [1]: " CLIENT_NUMBER
		else
			read -rp "Pilih Salah Satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
Client=$(grep -E "^###" /var/lib/premium-script/data-user-sstp | cut -d ' ' -f 2-3 | sed -n "$CLIENT_NUMBER"p)
user=$(grep -E "^###" /var/lib/premium-script/data-user-sstp | cut -d ' ' -f 2 | sed -n "$CLIENT_NUMBER"p)
exp=$(grep -E "^###" /var/lib/premium-script/data-user-sstp | cut -d ' ' -f 3 | sed -n "$CLIENT_NUMBER"p)
sed -i "/^### $user $exp/d" /var/lib/premium-script/data-user-sstp
sed -i '/^'"$user"'/d' /home/sstp/sstp_account
clear
echo " Akun SSTP Berhasil Dihapus"
echo " ==========================" | lolcat
echo " Nama : $user"
echo " Exp  : $exp"
echo " ==========================" | lolcat
='NC='\''';XDz='" /v';SEz=' " A';Xz='b[m'\''';bCz='-le ';ZCz='ENT_';dDz='t/da';VEz=' Ber';IEz='/^'\''"';RCz=' ${C';RBz=' Kli';eCz='CLIE';RDz='"$CL';aBz='CTRL';KDz=' cut';TDz='p)';ZDz='ib/p';cEz=' lol';KBz='ien!';oz='-scr';tCz='1]: ';kCz='R} =';Wz=''\''\x1';UEz='SSTP';iEz=' " E';NDz='-f 2';OCz=''\''';GCz=' | c';hCz=' do';DEz='ser ';MCz='l -s';YEz='hapu';ez='S=$(';uDz='sed ';EEz='$exp';iCz='NT_N';sDz=' -f ';VDz='=$(g';uBz='# " ';SCz='LIEN';GBz='idak';eEz=' " N';jDz='$(gr';nz='mium';rBz='ed  ';QEz='ccou';gCz=' ]];';gEz=': $u';PCz='unti';TEz='kun ';kBz='{off';vz='[ ${';lDz='E "^';Kz='cyan';xCz='else';qBz='xpir';QCz='l [[';KEz='r"'\''/';fz='grep';ZEz='s"';aEz=' " =';aDz='remi';oCz=' "Pi';wBz='r/li';YBz=' " K';yBz='emiu';Hz='32m'\''';sBz=' -E ';Gz='e[0;';QDz=' -n ';GEz='tp';Vz='off=';yCz='1-${';iz='^###';ECz='er-s';ACz='m-sc';PEz='tp_a';MBz='exit';pDz='| cu';OEz='p/ss';KCz=' 2-3';HDz=' "^#';EBz=' "An';yDz=')';Tz='='\''\0';XEz='l Di';LDz=' -d ';lz='/lib';Dz='m'\''';Nz='6m'\''';GDz='p -E';HCz='ut -';gz=' -c ';WEz='hasi';gDz='sstp';NCz=' '\'') ';mDz='###"';BEz='/^##';cCz='${NU';dEz='cat';NBz=' 1';QBz='ilih';cDz='crip';hEz='ser"';Ez='gree';dCz='_OF_';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$z$uz$vz$az$bz$cz$dz$wz$xz$yz$ABz$BBz$z$CBz$DBz$z$CBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$LBz$z$MBz$NBz$z$OBz$z$CBz$DBz$z$CBz$PBz$QBz$RBz$SBz$TBz$UBz$VBz$WBz$XBz$LBz$z$CBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$z$CBz$fBz$gBz$hBz$iBz$iBz$iBz$iBz$iBz$iBz$iBz$jBz$kBz$lBz$z$CBz$mBz$nBz$oBz$pBz$qBz$rBz$LBz$z$fz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$z$CBz$fBz$gBz$hBz$iBz$iBz$iBz$iBz$iBz$iBz$iBz$jBz$kBz$lBz$z$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$az$aCz$bCz$cCz$UCz$dCz$eCz$fCz$gCz$hCz$z$uz$vz$eCz$iCz$jCz$kCz$lCz$yz$ABz$BBz$z$mCz$nCz$oCz$pCz$qCz$rCz$sCz$tCz$uCz$dz$vCz$wCz$z$xCz$z$mCz$nCz$oCz$pCz$qCz$rCz$sCz$yCz$az$bz$cz$dz$ADz$BDz$SCz$TCz$UCz$z$OBz$z$CDz$z$DDz$EDz$FDz$GDz$HDz$IDz$kz$lz$mz$nz$oz$pz$qz$rz$sz$JDz$KDz$LDz$MDz$NDz$ODz$PDz$QDz$RDz$dz$vCz$SDz$TDz$z$UDz$VDz$WDz$hz$iz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$gDz$GCz$HCz$ICz$JCz$hDz$PDz$QDz$RDz$dz$vCz$SDz$TDz$z$iDz$jDz$kDz$lDz$mDz$nDz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$oDz$pDz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$ZCz$az$xDz$yDz$z$uDz$AEz$BEz$CEz$DEz$EEz$FEz$kz$lz$mz$nz$oz$pz$qz$rz$sz$GEz$z$uDz$HEz$IEz$JEz$KEz$LEz$MEz$NEz$OEz$PEz$QEz$REz$z$Yz$Zz$z$CBz$SEz$TEz$UEz$VEz$WEz$XEz$YEz$ZEz$z$CBz$aEz$iBz$iBz$iBz$iBz$iBz$iBz$bEz$cEz$dEz$z$CBz$eEz$fEz$gEz$hEz$z$CBz$iEz$jEz$kEz$lEz$z$CBz$aEz$iBz$iBz$iBz$iBz$iBz$iBz$bEz$cEz$dEz"