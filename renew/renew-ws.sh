#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/v2ray/config.json")
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
	grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
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
user=$(grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/v2ray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/v2ray/config.json
sed -i "s/### $user $exp/### $user $exp4/g" /etc/v2ray/none.json
service cron restart
clear
echo ""
echo " Akun VMESS Berhasil Diperbarui"
echo " ==========================" | lolcat
echo " Username     : $user"
echo " Aktif Sampai : $expe"
echo " ==========================" | lolcat
C';Zz='r';mz='ay/c';FDz='+"%Y';kz='/etc';FBz='exit';cz='F_CL';ZDz='"p)';sEz='cron';pEz='json';oEz='one.';nCz='ri):';bDz='$(gr';BFz='il D';iDz='y/co';wDz='te +';LFz='ame ';gDz='etc/';pCz='asaa';SEz='$exp';ABz=' "Us';kCz='"Exp';dDz='E "^';FCz='e 1 ';hDz='v2ra';rBz=''\'' -f';JDz='bln,';XBz='urn"';DDz='+"%b';pDz='-f 3';fDz='" "/';Rz='37m'\''';Lz='='\''\x';qBz='d '\'' ';Hz='32m'\''';HFz=' lol';uEz='tart';SFz='xpe"';RDz='t -d';pz='on")';cCz='_NUM';fCz='1-${';XEz='exp4';iz='^###';eDz='### ';KEz='exp2';Bz=''\''\e[';Fz='n='\''\';vEz=' " A';UEz='$mas';xBz='unti';PEz=' 864';VDz='sed ';xDz='%Y-%';aEz='s" +';nDz=' -d ';lEz='/g" ';DEz='e -d';YBz=' -e ';wCz='akti';ZCz='tu [';vz='; th';tz='= '\''0';Iz='NC='\''';LDz='n"';QDz='| cu';SDz=' '\'' '\''';Yz='clea';Dz='m'\''';TCz='R} =';iEz='/###';GBz=' 1';BDz='")';oz='g.js';kDz='.jso';uDz='p)';oDz=''\'' '\'' ';uCz='d "$';lCz='ired';Nz='6m'\''';aDz='exp=';yBz='l [[';OFz='ser"';SCz='UMBE';hz='-E "';hCz=' " C';gCz='S}]:';NBz='ngin';oBz=' | c';jBz='c/v2';dBz='{off';LEz='=$((';GEz='+%s)';mDz=' cut';xEz='VMES';hBz='# " ';fz='grep';RFz=': $e';kBz='ray/';tCz='te -';Gz='e[0;';XDz='${CL';PFz=' Sam';Tz='='\''\0';HCz='{CLI';wEz='kun ';RBz=' " K';VEz='aakt';wz='en';GCz='&& $';CDz='bln=';wBz=''\''';KCz='-le ';YEz='=`da';HDz='="$t';HBz='fi';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$z$qz$rz$az$bz$cz$dz$sz$tz$uz$vz$wz$z$Yz$Zz$z$xz$yz$z$xz$ABz$BBz$CBz$DBz$EBz$z$FBz$GBz$z$HBz$z$Yz$Zz$z$xz$yz$z$xz$IBz$JBz$KBz$LBz$MBz$NBz$OBz$PBz$QBz$z$xz$RBz$SBz$TBz$UBz$VBz$WBz$XBz$z$xz$YBz$ZBz$aBz$bBz$bBz$bBz$bBz$bBz$bBz$bBz$cBz$dBz$eBz$z$fz$fBz$gBz$hBz$iBz$jBz$kBz$lBz$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$vBz$wBz$z$xz$YBz$ZBz$aBz$bBz$bBz$bBz$bBz$bBz$bBz$bBz$cBz$dBz$eBz$z$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$GCz$HCz$ICz$az$JCz$KCz$LCz$DCz$MCz$NCz$OCz$PCz$QCz$z$qz$rz$NCz$RCz$SCz$TCz$UCz$uz$vz$wz$z$VCz$WCz$IBz$JBz$XCz$YCz$ZCz$aCz$bCz$dz$cCz$dCz$z$eCz$z$VCz$WCz$IBz$JBz$XCz$YCz$ZCz$fCz$az$bz$cz$dz$gCz$hCz$BCz$CCz$DCz$z$HBz$z$iCz$z$VCz$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$z$rCz$sCz$tCz$uCz$vCz$wCz$xCz$yCz$ADz$BDz$z$CDz$sCz$tCz$uCz$vCz$wCz$xCz$yCz$DDz$BDz$z$EDz$sCz$tCz$uCz$vCz$wCz$xCz$yCz$FDz$BDz$z$GDz$HDz$IDz$JDz$KDz$LDz$z$MDz$NDz$ODz$hz$iz$jz$kz$lz$mz$nz$oz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$WDz$XDz$dz$cCz$YDz$ZDz$z$aDz$bDz$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$HCz$ICz$az$tDz$uDz$z$vDz$sCz$wDz$xDz$yDz$AEz$z$BEz$CEz$DEz$EEz$FEz$GEz$z$HEz$CEz$DEz$IEz$JEz$GEz$z$KEz$LEz$MEz$NEz$OEz$PEz$QEz$AEz$z$REz$LEz$SEz$TEz$UEz$VEz$WEz$z$XEz$YEz$tCz$uCz$REz$ZEz$aEz$bEz$cEz$dEz$z$VDz$eEz$fEz$gEz$hEz$SEz$iEz$jEz$kEz$XEz$lEz$kz$lz$mz$nz$oz$mEz$z$VDz$eEz$fEz$gEz$hEz$SEz$iEz$jEz$kEz$XEz$lEz$kz$lz$nEz$oEz$pEz$z$qEz$rEz$sEz$tEz$uEz$z$Yz$Zz$z$xz$yz$z$xz$vEz$wEz$xEz$yEz$AFz$BFz$CFz$DFz$EFz$z$xz$FFz$bBz$bBz$bBz$bBz$bBz$bBz$GFz$HFz$IFz$z$xz$JFz$KFz$LFz$MFz$NFz$OFz$z$xz$vEz$qCz$PFz$QFz$RFz$SFz$z$xz$FFz$bBz$bBz$bBz$bBz$bBz$bBz$GFz$HFz$IFz"