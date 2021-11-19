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
		echo "User Tidak Ada!"
		exit 1
	fi

	clear
	echo ""
	echo "Pilih Klien Yang Ingin Diperbarui"
	echo " Klik CTRL+C untuk return"
	echo -e "${cyan}===============================${off}"
	echo "     No  Expired   User"
	grep -E "^### Client" "/etc/wireguard/$SERVER_WG_NIC.conf" | cut -d ' ' -f 3-4 | nl -s ') '
	echo -e "${cyan}===============================${off}"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih Salah Satu [1]: " CLIENT_NUMBER
		else
			read -rp "Pilih Salah Satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (hari): " masaaktif
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
user=$(grep -E "^### Client" "/etc/wireguard/wg0.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### Client" "/etc/wireguard/wg0.conf" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### Client $user $exp/### Client $user $exp4/g" /etc/wireguard/wg0.conf
clear
echo ""
echo " Akun Wireguard Berhasil Diperbarui"
echo " ==========================" | lolcat
echo " Username     : $user"
echo " Aktif Sampai : $expe"
echo " ==========================" | lolcat
=';xBz='r"';PBz=' Ada';GDz='ired';Zz='r';CDz=' " C';ZFz=': $e';FCz='ERVE';nEz=' day';DBz='if [';SCz='unti';vz='uard';CCz='ient';XFz=' Sam';dCz='ER} ';sCz='h Sa';QBz='!"';fDz='user';ACz='"^##';bCz='{CLI';hEz='2 + ';pz='^###';ZCz='e 1 ';tCz='tu [';FFz='kun ';rEz='d"`';ZDz='expe';WFz='ser"';VBz='lih ';hBz='ntuk';QEz='(dat';pCz='read';kBz=' -e ';TBz='fi';oEz='s" +';FBz='S} =';YDz='+"%Y';UEz='+%s)';gCz='_OF_';eDz='n"';nBz='====';iBz=' ret';XEz='ow" ';qCz=' -rp';DFz='f';WDz='+"%b';bz='ce /';hCz='CLIE';WBz='Klie';fEz='exp3';OEz='m-%d';Lz='='\''\x';SEz=' "$e';HBz=''\'' ]]';RBz='exit';rDz='E "^';KDz='asaa';GEz='| se';PDz='d "$';DDz='done';mDz='ER}"';eBz='lik ';uBz='xpir';WEz=' "$n';HDz=' (ha';bBz='erba';IFz='rhas';CFz='" /e';wEz='er $';kCz=' do';hz='NUMB';Bz=''\''\e[';HCz='_NIC';gDz='=$(g';Jz='\e[0';SBz=' 1';jDz=' | s';HEz='d -n';MFz='i"';wz='/$SE';ECz='d/$S';yEz='nt $';qBz='}"';nz=' -c ';BCz='# Cl';KFz='iper';ICz='.con';Vz='off=';REz='e -d';LDz='ktif';Sz='bold';CEz='cut ';MDz='tgl=';OCz='-4 |';jEz='aakt';hDz='rep ';yBz=' -E ';cCz='ENT_';GCz='R_WG';YCz='} -g';Dz='m'\''';Iz='NC='\''';mCz='UMBE';Pz='e='\''\';gz='rams';aCz='&& $';RFz=' " U';NEz='%Y-%';aBz=' Dip';Cz='1;31';Qz='x1b[';yz='_WG_';uEz='s/##';rCz='Sala';LFz='baru';NBz='er T';uDz='nt" ';Xz='b[m'\''';xDz='regu';vEz=' $us';uCz='1]: ';QDz='masa';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$z$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$wz$xz$yz$ABz$BBz$CBz$z$DBz$EBz$hz$iz$jz$kz$FBz$GBz$HBz$IBz$JBz$z$Yz$Zz$z$KBz$LBz$z$KBz$MBz$NBz$OBz$PBz$QBz$z$RBz$SBz$z$TBz$z$Yz$Zz$z$KBz$LBz$z$KBz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$z$KBz$dBz$eBz$fBz$gBz$hBz$iBz$jBz$z$KBz$kBz$lBz$mBz$nBz$nBz$nBz$nBz$nBz$nBz$nBz$oBz$pBz$qBz$z$KBz$rBz$sBz$tBz$uBz$vBz$wBz$xBz$z$mz$yBz$ACz$BCz$CCz$DCz$cz$dz$ez$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$z$KBz$kBz$lBz$mBz$nBz$nBz$nBz$nBz$nBz$nBz$nBz$oBz$pBz$qBz$z$SCz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$aCz$bCz$cCz$hz$dCz$eCz$fCz$XCz$gCz$hCz$iCz$jCz$kCz$z$DBz$EBz$hCz$lCz$mCz$nCz$oCz$HBz$IBz$JBz$z$pCz$qCz$UBz$VBz$rCz$sCz$tCz$uCz$vCz$kz$wCz$xCz$z$yCz$z$pCz$qCz$UBz$VBz$rCz$sCz$tCz$ADz$hz$iz$jz$kz$BDz$CDz$VCz$WCz$XCz$z$TBz$z$DDz$z$pCz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$z$MDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$CBz$z$VDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$WDz$CBz$z$XDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$YDz$CBz$z$ZDz$aDz$bDz$cDz$dDz$eDz$z$fDz$gDz$hDz$oz$pz$qz$rz$sz$tz$uz$vz$iDz$ICz$JCz$KCz$LCz$MCz$NCz$jDz$kDz$lDz$bCz$cCz$hz$mDz$nDz$z$oDz$pDz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$xDz$yDz$AEz$BBz$BEz$CEz$DEz$EEz$FEz$GEz$HEz$IEz$hCz$lCz$mCz$JEz$KEz$z$LEz$NDz$MEz$NEz$OEz$KEz$z$PEz$QEz$REz$SEz$TEz$UEz$z$VEz$QEz$REz$WEz$XEz$UEz$z$YEz$ZEz$aEz$bEz$cEz$dEz$eEz$KEz$z$fEz$ZEz$gEz$hEz$iEz$jEz$kEz$z$lEz$mEz$ODz$PDz$fEz$nEz$oEz$pEz$qEz$rEz$z$sEz$tEz$uEz$BCz$CCz$vEz$wEz$xEz$sDz$tDz$yEz$fDz$AFz$BFz$CFz$tz$uz$vz$iDz$ICz$DFz$z$Yz$Zz$z$KBz$LBz$z$KBz$EFz$FFz$GFz$ez$HFz$IFz$JFz$KFz$LFz$MFz$z$KBz$NFz$nBz$nBz$nBz$nBz$nBz$nBz$OFz$PFz$QFz$z$KBz$RFz$SFz$TFz$UFz$VFz$WFz$z$KBz$EFz$LDz$XFz$YFz$ZFz$aFz$z$KBz$NFz$nBz$nBz$nBz$nBz$nBz$nBz$OFz$PFz$QFz"