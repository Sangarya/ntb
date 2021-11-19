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
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/var/lib/premium-script/data-user-l2tp")
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
	grep -E "^### " "/var/lib/premium-script/data-user-l2tp" | cut -d ' ' -f 2-3 | nl -s ') '
	echo -e "${cyan}===============================${off}"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih Salah Satu [1]: " CLIENT_NUMBER
		else
			read -rp "Pilih Salah Satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
	# match the selected number to a client name
	VPN_USER=$(grep -E "^### " "/var/lib/premium-script/data-user-l2tp" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
	exp=$(grep -E "^### " "/var/lib/premium-script/data-user-l2tp" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
# Delete VPN user
sed -i '/^"'"$VPN_USER"'" l2tpd/d' /etc/ppp/chap-secrets
# shellcheck disable=SC2016
sed -i '/^'"$VPN_USER"':\$1\$/d' /etc/ipsec.d/passwd
sed -i "/^### $VPN_USER $exp/d" /var/lib/premium-script/data-user-l2tp
# Update file attributes
chmod 600 /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*
clear
echo " Akun L2TP Berhasil Dihapus"
echo " ==========================" | lolcat
echo " Nama : $VPN_USER"
echo " Exp  : $exp"
echo " ==========================" | lolcat
;BCz='{off';XCz='ut -';bEz=' /et';MCz='"/va';Hz='32m'\''';rDz='ium-';WBz='idak';eBz='fi';rEz='tc/p';MFz=': $V';DDz='read';iEz='# $V';dDz='sed ';Cz='1;31';tEz='hap-';xEz=' " A';ZBz='i Kl';qDz='prem';NEz='" l2';mEz='/d" ';PCz='emiu';JEz='/^"'\''';yBz='====';XEz='_USE';qCz='ER} ';lDz='E "^';Nz='6m'\''';rz='ER_O';Lz='='\''\x';JCz=' -E ';Rz='37m'\''';kEz='SER ';Dz='m'\''';PEz='d'\'' /';MBz='[ ${';TEz='-sec';lBz='n Di';WCz=' | c';TDz='VPN_';sz='F_CL';rCz='-le ';bBz='"';IEz='-i '\''';RBz='en';vEz='ets*';Ez='gree';LCz='# " ';nz='in:/';ICz='ed  ';gEz='-i "';DFz='l Di';Zz='r';Iz='NC='\''';Qz='x1b[';BFz=' Ber';LFz='ama ';QBz='; th';sDz='scri';VEz='/^'\''"';yCz='NT_N';oz=':/bi';jDz='$(gr';hz=':/us';oDz='var/';PFz='xp  ';WEz='$VPN';xDz='p" |';Mz='1b[9';Fz='n='\''\';OBz='= '\''0';qBz='CTRL';FFz='s"';BEz=''\'' '\'' ';qEz='0 /e';lEz='$exp';mDz='### ';jBz='ang ';KFz=' " N';uBz='urn"';xz='-E "';wz=' -c ';hBz=' Kli';OEz='tpd/';uDz='ata-';IFz=' lol';eEz='d/pa';iCz='LIEN';Jz='\e[0';YEz='R"'\'':';yEz='kun ';cz='ATH=';cCz='l -s';cDz='2 | ';FCz='o Us';nDz='" "/';DBz='/pre';YBz='ilik';JFz='cat';UDz='USER';jCz='T_NU';FEz='n "$';mCz='e 1 ';wEz='*';PDz='1-${';jz='/usr';gBz='ilih';QDz='S}]:';RDz=' " C';CBz='/lib';sEz='pp/c';OFz=' " E';pBz='lik ';PBz=''\'' ]]';eDz='-n "';Wz=''\''\x1';HCz='xpir';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$ez$fz$iz$jz$kz$lz$mz$nz$gz$oz$pz$z$qz$rz$sz$tz$uz$vz$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$z$LBz$MBz$qz$rz$sz$tz$NBz$OBz$PBz$QBz$RBz$z$SBz$TBz$z$SBz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$z$cBz$dBz$z$eBz$z$SBz$TBz$z$SBz$fBz$gBz$hBz$iBz$jBz$kBz$lBz$mBz$nBz$bBz$z$SBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$z$SBz$vBz$wBz$xBz$yBz$yBz$yBz$yBz$yBz$yBz$yBz$ACz$BCz$CCz$z$SBz$DCz$ECz$FCz$GCz$HCz$ICz$bBz$z$vz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$aCz$bCz$cCz$dCz$eCz$z$SBz$vBz$wBz$xBz$yBz$yBz$yBz$yBz$yBz$yBz$yBz$ACz$BCz$CCz$z$fCz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qz$qCz$rCz$sCz$kCz$tCz$uCz$vCz$wCz$xCz$z$LBz$MBz$uCz$yCz$ADz$BDz$CDz$PBz$QBz$RBz$z$DDz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$tz$MDz$NDz$z$ODz$z$DDz$EDz$FDz$GDz$HDz$IDz$JDz$PDz$qz$rz$sz$tz$QDz$RDz$iCz$jCz$kCz$z$eBz$z$SDz$z$TDz$UDz$VDz$WDz$xz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$tz$MDz$gDz$hDz$z$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$DEz$EEz$FEz$oCz$pCz$qz$GEz$HEz$z$dDz$IEz$JEz$KEz$LEz$MEz$NEz$OEz$PEz$QEz$REz$SEz$TEz$UEz$z$dDz$IEz$VEz$WEz$XEz$YEz$ZEz$aEz$bEz$cEz$dEz$eEz$fEz$z$dDz$gEz$hEz$iEz$jEz$kEz$lEz$mEz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$nEz$z$oEz$pEz$qEz$rEz$sEz$tEz$uEz$vEz$bEz$cEz$dEz$eEz$fEz$wEz$z$Yz$Zz$z$SBz$xEz$yEz$AFz$BFz$CFz$DFz$EFz$FFz$z$SBz$GFz$yBz$yBz$yBz$yBz$yBz$yBz$HFz$IFz$JFz$z$SBz$KFz$LFz$MFz$jEz$NFz$z$SBz$OFz$PFz$QFz$RFz$z$SBz$GFz$yBz$yBz$yBz$yBz$yBz$yBz$HFz$IFz$JFz"