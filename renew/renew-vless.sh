#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/v2ray/vless.json")
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
	grep -E "^### " "/etc/v2ray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
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
user=$(grep -E "^### " "/etc/v2ray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/v2ray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/v2ray/vless.json
sed -i "s/### $user $exp/### $user $exp4/g" /etc/v2ray/vnone.json
service cron restart
clear
echo ""
echo " Akun VLESS Berhasil Diperbarui"
echo " ==========================" | lolcat
echo " Client Name : $user"
echo " Expired On  : $expe"
echo " ==========================" | lolcat
# ';XBz='urn"';DBz=' Ada';rBz=' -f ';oDz='| se';aCz='" CL';AFz='i"';CBz='idak';Jz='\e[0';yCz='+"%d';TCz='= '\''1';ZEz='%m-%';yEz='baru';LDz='user';IFz='er"';NFz=' $ex';lDz='-d '\''';nCz=' " m';DFz=' lol';nDz='f 3 ';iEz='er $';cCz='BER';dz='IENT';rEz=' " A';aDz='ep -';GCz='{CLI';dBz='{off';FBz='exit';Zz='r';bz='ER_O';MDz='=$(g';gz=' -c ';tz='= '\''0';nz='less';rCz='$(da';SBz='lik ';HEz='exp2';nEz='ice ';FCz='&& $';YCz='tu [';fBz=' -E ';OCz=' ]];';MCz='CLIE';uBz=' -s ';iCz=' -p ';YBz=' -e ';ZCz='1]: ';TBz='CTRL';EBz='!"';YDz='exp=';SEz='aakt';Sz='bold';BCz='T_NU';Oz='whit';qBz=' '\'' '\''';DEz='+%s)';uEz='S Be';UBz='+C u';IBz=' "Pi';fCz='S}]:';UEz='exp4';LFz='ed O';XEz='s" +';Vz='off=';yDz='(dat';jz=' " "';sEz='kun ';vEz='rhas';aEz='d"`';CFz='=" |';Dz='m'\''';IDz='bln,';lBz='vles';UDz='ed -';fz='grep';Nz='6m'\''';xz='echo';dEz='s/##';EFz='cat';LCz='_OF_';hCz='done';KEz=' - d';hBz='# " ';iDz='json';RCz='UMBE';Mz='1b[9';VEz='=`da';tBz='| nl';ZBz='"${c';WBz=' ret';eBz='}"';Hz='32m'\''';SDz='-f 2';JDz=' $th';OEz='exp3';VBz='ntuk';gCz=' " C';Kz='cyan';BFz=' " =';qCz='tgl=';TDz=' | s';wBz='unti';JBz='lih ';MFz='n  :';vDz='%Y-%';QDz=' -d ';hDz='ess.';az='NUMB';Fz='n='\''\';wz='en';cz='F_CL';NDz='rep ';Pz='e='\''\';YEz='"%Y-';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$z$qz$rz$az$bz$cz$dz$sz$tz$uz$vz$wz$z$Yz$Zz$z$xz$yz$z$xz$ABz$BBz$CBz$DBz$EBz$z$FBz$GBz$z$HBz$z$Yz$Zz$z$xz$yz$z$xz$IBz$JBz$KBz$LBz$MBz$NBz$OBz$PBz$QBz$z$xz$RBz$SBz$TBz$UBz$VBz$WBz$XBz$z$xz$YBz$ZBz$aBz$bBz$bBz$bBz$bBz$bBz$bBz$bBz$cBz$dBz$eBz$z$fz$fBz$gBz$hBz$iBz$jBz$kBz$lBz$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$vBz$z$xz$YBz$ZBz$aBz$bBz$bBz$bBz$bBz$bBz$bBz$bBz$cBz$dBz$eBz$z$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$GCz$HCz$az$ICz$JCz$KCz$CCz$LCz$MCz$NCz$OCz$PCz$z$qz$rz$MCz$QCz$RCz$SCz$TCz$uz$vz$wz$z$UCz$VCz$IBz$JBz$WCz$XCz$YCz$ZCz$aCz$dz$bCz$cCz$z$dCz$z$UCz$VCz$IBz$JBz$WCz$XCz$YCz$eCz$az$bz$cz$dz$fCz$gCz$ACz$BCz$CCz$z$HBz$z$hCz$z$UCz$iCz$jCz$kCz$lCz$mCz$nCz$oCz$pCz$z$qCz$rCz$sCz$tCz$uCz$vCz$wCz$xCz$yCz$ADz$z$BDz$rCz$sCz$tCz$uCz$vCz$wCz$xCz$CDz$ADz$z$DDz$rCz$sCz$tCz$uCz$vCz$wCz$xCz$EDz$ADz$z$FDz$GDz$HDz$IDz$JDz$KDz$z$LDz$MDz$NDz$hz$iz$jz$kz$lz$mz$nz$oz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$GCz$HCz$az$WDz$XDz$z$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$MCz$QCz$RCz$rDz$sDz$z$tDz$rCz$uDz$vDz$wDz$sDz$z$xDz$yDz$AEz$BEz$CEz$DEz$z$EEz$yDz$AEz$FEz$GEz$DEz$z$HEz$IEz$JEz$KEz$LEz$MEz$NEz$sDz$z$OEz$IEz$PEz$QEz$REz$SEz$TEz$z$UEz$VEz$sCz$tCz$OEz$WEz$XEz$YEz$ZEz$aEz$z$bEz$cEz$dEz$eEz$fEz$PEz$gEz$hEz$iEz$UEz$jEz$kz$lz$mz$nz$oz$kEz$z$bEz$cEz$dEz$eEz$fEz$PEz$gEz$hEz$iEz$UEz$jEz$kz$lz$mz$lEz$oz$kEz$z$mEz$nEz$oEz$pEz$qEz$z$Yz$Zz$z$xz$yz$z$xz$rEz$sEz$tEz$uEz$vEz$wEz$xEz$yEz$AFz$z$xz$BFz$bBz$bBz$bBz$bBz$bBz$bBz$CFz$DFz$EFz$z$xz$gCz$FFz$GFz$HFz$hEz$IFz$z$xz$JFz$KFz$LFz$MFz$NFz$OFz$z$xz$BFz$bBz$bBz$bBz$bBz$bBz$bBz$CFz$DFz$EFz"