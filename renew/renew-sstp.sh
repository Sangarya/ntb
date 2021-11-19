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
	grep -E "^### " "/var/lib/premium-script/data-user-sstp" | cut -d ' ' -f 2-3 | nl -s ') '
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
user=$(grep -E "^### " "/var/lib/premium-script/data-user-sstp" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/var/lib/premium-script/data-user-sstp" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /var/lib/premium-script/data-user-sstp
clear
echo ""
echo " Akun SSTP Berhasil Diperbarui"
echo " ==========================" | lolcat
echo " Username     : $user"
echo " Aktif Sampai : $expe"
echo " ==========================" | lolcat
';lEz='s" +';MFz=' " U';GFz='arui';KDz='bln=';FCz=''\''';mBz='"/va';OEz='e -d';oEz='d"`';yEz=' " A';HDz='ys" ';FFz='perb';YDz='| cu';tEz='/###';mEz='"%Y-';QBz='ng I';bBz='urn"';HBz=' Ada';xCz='asaa';EFz='l Di';GDz='f da';Iz='NC='\''';LDz='+"%b';OCz='&& $';DEz='ed -';QDz='gl $';ZCz='NT_N';jCz='" CL';VBz=' " K';pBz='emiu';wDz='p" |';JDz='")';cCz='= '\''1';TDz='n"';QEz='xp" ';ZEz='2) /';uz='if [';az='NUMB';BCz=' 2-3';rz='-use';Ez='gree';HEz='now=';YBz='+C u';nDz='" "/';JFz='=" |';uEz=' $us';GEz='p)';nEz='%m-%';nBz='r/li';Yz='clea';IFz=' " =';KEz='m-%d';LCz='MBER';dDz='sed ';Nz='6m'\''';iz='^###';CBz='echo';PFz='    ';XDz='tp" ';wBz=' | c';ez='S=$(';LFz='cat';dBz='"${c';SDz=' $th';fz='grep';RCz='ER} ';aBz=' ret';MEz='d1=$';TCz='${NU';RBz='ngin';oz='-scr';bDz=' -f ';JBz='exit';pCz=' " C';IDz='+"%d';dCz='read';rEz='# $u';hEz='if))';rDz='ium-';Dz='m'\''';yz=''\'' ]]';NBz='lih ';gDz='BER}';PBz='n Ya';iEz='exp4';RDz='bln,';TBz='erba';cDz='2 | ';VEz='exp2';wCz=' " m';hBz='{off';qEz='s/##';iBz='}"';wz='S} =';gCz='h Sa';QCz='ENT_';VCz='CLIE';YEz=' - d';LEz=')';Fz='n='\''\';aDz=' '\'' '\''';nCz='1-${';KFz=' lol';vEz='er $';tBz='a-us';WBz='lik ';VDz='=$(g';DCz='l -s';oCz='S}]:';yDz=' -d ';YCz=' do';CFz=' Ber';Mz='1b[9';Hz='32m'\''';UCz='_OF_';MBz=' "Pi';fCz='Sala';REz='+%s)';hDz='"p)';hz='-E "';UEz='ow" ';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$z$uz$vz$az$bz$cz$dz$wz$xz$yz$ABz$BBz$z$Yz$Zz$z$CBz$DBz$z$CBz$EBz$FBz$GBz$HBz$IBz$z$JBz$KBz$z$LBz$z$Yz$Zz$z$CBz$DBz$z$CBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$UBz$z$CBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$z$CBz$cBz$dBz$eBz$fBz$fBz$fBz$fBz$fBz$fBz$fBz$gBz$hBz$iBz$z$fz$jBz$kBz$lBz$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$z$CBz$cBz$dBz$eBz$fBz$fBz$fBz$fBz$fBz$fBz$fBz$gBz$hBz$iBz$z$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$az$RCz$SCz$TCz$LCz$UCz$VCz$WCz$XCz$YCz$z$uz$vz$VCz$ZCz$aCz$bCz$cCz$yz$ABz$BBz$z$dCz$eCz$MBz$NBz$fCz$gCz$hCz$iCz$jCz$dz$kCz$lCz$z$mCz$z$dCz$eCz$MBz$NBz$fCz$gCz$hCz$nCz$az$bz$cz$dz$oCz$pCz$JCz$KCz$LCz$z$LBz$z$qCz$z$dCz$rCz$sCz$tCz$uCz$vCz$wCz$xCz$yCz$z$ADz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$JDz$z$KDz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$LDz$JDz$z$MDz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$NDz$JDz$z$ODz$PDz$QDz$RDz$SDz$TDz$z$UDz$VDz$WDz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$dz$kCz$gDz$hDz$z$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$tDz$uDz$UDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$DEz$EEz$PCz$QCz$az$FEz$GEz$z$HEz$BDz$IEz$JEz$KEz$LEz$z$MEz$NEz$OEz$PEz$QEz$REz$z$SEz$NEz$OEz$TEz$UEz$REz$z$VEz$WEz$XEz$YEz$ZEz$aEz$bEz$LEz$z$cEz$WEz$dEz$eEz$fEz$gEz$hEz$z$iEz$jEz$CDz$DDz$cEz$kEz$lEz$mEz$nEz$oEz$z$dDz$pEz$qEz$rEz$sEz$dEz$tEz$uEz$vEz$iEz$wEz$kz$lz$mz$nz$oz$pz$qz$rz$sz$xEz$z$Yz$Zz$z$CBz$DBz$z$CBz$yEz$AFz$BFz$CFz$DFz$EFz$FFz$GFz$HFz$z$CBz$IFz$fBz$fBz$fBz$fBz$fBz$fBz$JFz$KFz$LFz$z$CBz$MFz$NFz$OFz$PFz$QFz$RFz$z$CBz$yEz$yCz$SFz$TFz$UFz$VFz$z$CBz$IFz$fBz$fBz$fBz$fBz$fBz$fBz$JFz$KFz$LFz"