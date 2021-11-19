#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/var/lib/premium-script/data-user-l2tp")
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
	grep -E "^### " "/var/lib/premium-script/data-user-l2tp" | cut -d ' ' -f 2-3 | nl -s ') '
	echo -e "${cyan}===============================${off}"
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih Salah Satu [1]: " CLIENT_NUMBER
		else
			read -rp "Pilih Salah Satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
done
read -p "Expired (days): " masaaktif
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
user=$(grep -E "^### " "/var/lib/premium-script/data-user-l2tp" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/var/lib/premium-script/data-user-l2tp" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /var/lib/premium-script/data-user-l2tp
clear
echo ""
echo " Akun L2TP Berhasil Diperbarui"
echo " ==========================" | lolcat
echo " Username     : $user"
echo " Aktif Sampai : $expe"
echo " ==========================" | lolcat
| cu';ZEz='2) /';TCz='${NU';kz='/var';hz='-E "';uBz='er-l';cEz='exp3';GDz='f da';KBz=' 1';Iz='NC='\''';Tz='='\''\0';jCz='" CL';EDz='masa';QEz='xp" ';fz='grep';pDz='lib/';HDz='ys" ';XEz=' (d1';jDz='$(gr';SFz=' Sam';cBz=' -e ';Dz='m'\''';cz='F_CL';kBz='"^##';mEz='"%Y-';nDz='" "/';uCz=' (da';QBz='ng I';Zz='r';rBz='ript';HBz=' Ada';xz='= '\''0';sCz='"Exp';xBz='ut -';pCz=' " C';IFz=' " =';ZBz='ntuk';cDz='2 | ';MEz='d1=$';iz='^###';GCz='unti';fBz='====';TBz='erba';xCz='asaa';OCz='&& $';BEz='-f 3';Fz='n='\''\';dEz='$exp';jEz='=`da';OEz='e -d';QDz='gl $';wDz='p" |';hBz='{off';az='NUMB';GEz='p)';tDz='pt/d';yDz=' -d ';uz='if [';vCz='ys):';jz=' " "';ECz=' '\'') ';AEz=''\'' '\'' ';PEz=' "$e';Cz='1;31';JCz='LIEN';ICz=' ${C';wBz=' | c';Sz='bold';BBz='en';sEz='ser ';Lz='='\''\x';YCz=' do';AFz='kun ';hEz='if))';Ez='gree';aEz=' 864';KCz='T_NU';TEz=' "$n';gCz='h Sa';ADz='tgl=';XBz='CTRL';WDz='rep ';JDz='")';NCz='e 1 ';bEz='00 )';VEz='exp2';gEz='aakt';cCz='= '\''1';ZCz='NT_N';tBz='a-us';aBz=' ret';WCz='NTS}';NFz='sern';TDz='n"';iDz='exp=';bz='ER_O';SEz='d2=$';Qz='x1b[';aDz=' '\'' '\''';vz='[ ${';oBz='b/pr';Wz=''\''\x1';nEz='%m-%';ZDz='t -d';HFz='"';UDz='user';PDz='="$t';kDz='ep -';lz='/lib';eDz='-n "';PBz='n Ya';Gz='e[0;';Xz='b[m'\''';FCz=''\''';ez='S=$(';RCz='ER} ';qBz='m-sc';qEz='s/##';JBz='exit';Rz='37m'\''';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$z$uz$vz$az$bz$cz$dz$wz$xz$yz$ABz$BBz$z$Yz$Zz$z$CBz$DBz$z$CBz$EBz$FBz$GBz$HBz$IBz$z$JBz$KBz$z$LBz$z$Yz$Zz$z$CBz$DBz$z$CBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$UBz$z$CBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$z$CBz$cBz$dBz$eBz$fBz$fBz$fBz$fBz$fBz$fBz$fBz$gBz$hBz$iBz$z$fz$jBz$kBz$lBz$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$z$CBz$cBz$dBz$eBz$fBz$fBz$fBz$fBz$fBz$fBz$fBz$gBz$hBz$iBz$z$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$az$RCz$SCz$TCz$LCz$UCz$VCz$WCz$XCz$YCz$z$uz$vz$VCz$ZCz$aCz$bCz$cCz$yz$ABz$BBz$z$dCz$eCz$MBz$NBz$fCz$gCz$hCz$iCz$jCz$dz$kCz$lCz$z$mCz$z$dCz$eCz$MBz$NBz$fCz$gCz$hCz$nCz$az$bz$cz$dz$oCz$pCz$JCz$KCz$LCz$z$LBz$z$qCz$z$dCz$rCz$sCz$tCz$uCz$vCz$wCz$xCz$yCz$z$ADz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$JDz$z$KDz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$LDz$JDz$z$MDz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$NDz$JDz$z$ODz$PDz$QDz$RDz$SDz$TDz$z$UDz$VDz$WDz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$dz$kCz$gDz$hDz$z$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$tDz$uDz$UDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$DEz$EEz$PCz$QCz$az$FEz$GEz$z$HEz$BDz$IEz$JEz$KEz$LEz$z$MEz$NEz$OEz$PEz$QEz$REz$z$SEz$NEz$OEz$TEz$UEz$REz$z$VEz$WEz$XEz$YEz$ZEz$aEz$bEz$LEz$z$cEz$WEz$dEz$eEz$fEz$gEz$hEz$z$iEz$jEz$CDz$DDz$cEz$kEz$lEz$mEz$nEz$oEz$z$dDz$pEz$qEz$rEz$sEz$dEz$tEz$uEz$vEz$iEz$wEz$kz$lz$mz$nz$oz$pz$qz$rz$sz$xEz$z$Yz$Zz$z$CBz$DBz$z$CBz$yEz$AFz$BFz$CFz$DFz$EFz$FFz$GFz$HFz$z$CBz$IFz$fBz$fBz$fBz$fBz$fBz$fBz$JFz$KFz$LFz$z$CBz$MFz$NFz$OFz$PFz$QFz$RFz$z$CBz$yEz$yCz$SFz$TFz$UFz$VFz$z$CBz$IFz$fBz$fBz$fBz$fBz$fBz$fBz$JFz$KFz$LFz"