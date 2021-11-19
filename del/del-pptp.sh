#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'
clear
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/var/lib/premium-script/data-user-pptp")
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
	grep -E "^### " "/var/lib/premium-script/data-user-pptp" | cut -d ' ' -f 2-3 | nl -s ') '
	echo -e "${cyan}===============================${off}"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih Salah Satu [1]: " CLIENT_NUMBER
		else
			read -rp "Pilih Salah Satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
	# match the selected number to a client name
	VPN_USER=$(grep -E "^### " "/var/lib/premium-script/data-user-pptp" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^### " "/var/lib/premium-script/data-user-pptp" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
# Delete VPN user
sed -i '/^"'"$VPN_USER"'" pptpd/d' /etc/ppp/chap-secrets
sed -i "/^### $VPN_USER $exp/d" /var/lib/premium-script/data-user-pptp
# Update file attributes
chmod 600 /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*
clear
echo " Akun PPTP Berhasil Dihapus"
echo " ==========================" | lolcat
echo " Nama : $VPN_USER"
echo " Exp  : $exp"
echo " ==========================" | lolcat
'ama ';nz='in:/';mCz='e 1 ';lDz='E "^';Wz=''\''\x1';GFz=': $V';qz='NUMB';SDz='done';oEz='d/pa';AFz=' " =';Jz='\e[0';dDz='sed ';BEz=''\'' '\'' ';ez='r/lo';Qz='x1b[';PEz='d'\'' /';wz=' -c ';fBz=' " P';VDz='=$(g';SEz='chap';UDz='USER';ZDz='t -d';BBz='/var';aCz=' 2-3';JDz='tu [';EFz=' " N';REz='ppp/';JCz=' -E ';TCz='a-us';tz='IENT';gz='sbin';lBz='n Di';wBz='"${c';KBz='tp")';lEz=' /et';pCz='ENT_';xz='-E "';Az='red=';GBz='ipt/';gCz='l [[';TBz=' ""';Dz='m'\''';sCz='${NU';cBz='exit';VCz='ptp"';cEz='tp';HBz='data';XDz='tp" ';vCz='NTS}';qCz='ER} ';oz=':/bi';Hz='32m'\''';Pz='e='\''\';uEz=' Ber';WCz=' | c';BDz='R} =';jz='/usr';Tz='='\''\0';pz='n"';dz='"/us';FCz='o Us';nEz='sec.';LBz='if [';QCz='m-sc';bEz='/d" ';UEz='rets';iCz='LIEN';uDz='ata-';ACz='===$';lCz='} -g';Gz='e[0;';jCz='T_NU';wCz=' ]];';qEz='*';NCz='r/li';MBz='[ ${';uCz='CLIE';TDz='VPN_';eDz='-n "';aEz='$exp';rDz='ium-';MDz='_NUM';vEz='hasi';eEz='d 60';IBz='-use';tDz='pt/d';IEz='-i '\''';Ez='gree';BCz='{off';SBz='echo';Lz='='\''\x';CDz='= '\''1';rEz=' " A';yDz=' cut';lz='n:/u';ODz='else';HFz='SER"';uBz='urn"';ABz=' " "';iEz='hap-';hDz='"p)';LCz='# " ';sEz='kun ';Uz='33[1';gBz='ilih';Kz='cyan';OCz='b/pr';Zz='r';mDz='### ';KCz='"^##';wEz='l Di';Nz='6m'\''';mBz='perb';vBz=' -e ';ZBz='i Kl';xEz='hapu';Rz='37m'\''';YCz='d '\'' ';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$ez$fz$iz$jz$kz$lz$mz$nz$gz$oz$pz$z$qz$rz$sz$tz$uz$vz$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$z$LBz$MBz$qz$rz$sz$tz$NBz$OBz$PBz$QBz$RBz$z$SBz$TBz$z$SBz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$z$cBz$dBz$z$eBz$z$SBz$TBz$z$SBz$fBz$gBz$hBz$iBz$jBz$kBz$lBz$mBz$nBz$bBz$z$SBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$z$SBz$vBz$wBz$xBz$yBz$yBz$yBz$yBz$yBz$yBz$yBz$ACz$BCz$CCz$z$SBz$DCz$ECz$FCz$GCz$HCz$ICz$bBz$z$vz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$aCz$bCz$cCz$dCz$eCz$z$SBz$vBz$wBz$xBz$yBz$yBz$yBz$yBz$yBz$yBz$yBz$ACz$BCz$CCz$z$fCz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qz$qCz$rCz$sCz$kCz$tCz$uCz$vCz$wCz$xCz$z$LBz$MBz$uCz$yCz$ADz$BDz$CDz$PBz$QBz$RBz$z$DDz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$tz$MDz$NDz$z$ODz$z$DDz$EDz$FDz$GDz$HDz$IDz$JDz$PDz$qz$rz$sz$tz$QDz$RDz$iCz$jCz$kCz$z$eBz$z$SDz$z$TDz$UDz$VDz$WDz$xz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$tz$MDz$gDz$hDz$z$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$DEz$EEz$FEz$oCz$pCz$qz$GEz$HEz$z$dDz$IEz$JEz$KEz$LEz$MEz$NEz$OEz$PEz$QEz$REz$SEz$TEz$UEz$z$dDz$VEz$WEz$XEz$YEz$ZEz$aEz$bEz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$cEz$z$dEz$eEz$fEz$gEz$hEz$iEz$jEz$kEz$lEz$mEz$nEz$oEz$pEz$qEz$z$Yz$Zz$z$SBz$rEz$sEz$tEz$uEz$vEz$wEz$xEz$yEz$z$SBz$AFz$yBz$yBz$yBz$yBz$yBz$yBz$BFz$CFz$DFz$z$SBz$EFz$FFz$GFz$YEz$HFz$z$SBz$IFz$JFz$KFz$LFz$z$SBz$AFz$yBz$yBz$yBz$yBz$yBz$yBz$BFz$CFz$DFz"