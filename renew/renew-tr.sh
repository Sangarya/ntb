#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan/akun.conf")
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
	grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
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
user=$(grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/trojan-go/akun.conf
sed -i "s/### $user $exp/### $user $exp4/g" /etc/trojan/akun.conf
clear
echo ""
echo " Akun Trojan Berhasil Diperbarui"
echo " ==========================" | lolcat
echo " Username     : $user"
echo " Aktif Sampai : $expe"
echo " ==========================" | lolcat
Ez='ow" ';ADz='")';uCz='masa';Mz='1b[9';MDz='=$(g';mDz=' '\'' -';oCz='asaa';JEz=' (d1';LCz='_OF_';YDz='exp=';wBz='unti';mz='jan/';dz='IENT';CFz='sern';rBz=' -f ';xBz='l [[';SDz='-f 2';qEz='an B';gBz='"^##';QBz='rui"';tBz='| nl';Hz='32m'\''';iBz='"/et';cDz='### ';HDz='gl $';tDz='now=';PDz=' cut';az='NUMB';jBz='c/tr';iEz='er $';EFz='    ';Wz=''\''\x1';Az='red=';Fz='n='\''\';RDz=''\'' '\'' ';sEz='sil ';qCz='tgl=';ECz='e 1 ';ez='S=$(';UCz='read';lz='/tro';BEz=' "$e';nz='akun';BFz=' " U';dEz='s/##';kCz='ired';CDz='+"%b';EEz='d2=$';OCz=' ]];';aBz='yan}';VCz=' -rp';Oz='whit';gDz='an/a';bCz='_NUM';wz='en';WBz=' ret';Bz=''\''\e[';GFz='ser"';vDz='%Y-%';pBz='t -d';uDz='te +';sCz='te -';XEz='s" +';Jz='\e[0';RCz='UMBE';eDz='etc/';Cz='1;31';SCz='R} =';UDz='ed -';wEz=' " =';Pz='e='\''\';CCz='MBER';qDz=' "${';CBz='idak';PCz=' do';CEz='xp" ';TDz=' | s';kEz='jan-';IEz='=$((';FDz='expe';UEz='exp4';MBz='ng I';wCz='f da';EDz='+"%Y';lCz=' (ha';uBz=' -s ';Iz='NC='\''';hDz='kun.';xDz='d1=$';gCz=' " C';pDz='d -n';Zz='r';EBz='!"';RBz=' " K';eEz='# $u';vBz=''\'') '\''';nCz=' " m';TBz='CTRL';KFz='xpe"';YCz='tu [';Vz='off=';cz='F_CL';lBz='/aku';ACz='LIEN';kz='/etc';HEz='exp2';tCz='d "$';KCz='${NU';OBz=' Dip';uEz='rbar';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$z$qz$rz$az$bz$cz$dz$sz$tz$uz$vz$wz$z$Yz$Zz$z$xz$yz$z$xz$ABz$BBz$CBz$DBz$EBz$z$FBz$GBz$z$HBz$z$Yz$Zz$z$xz$yz$z$xz$IBz$JBz$KBz$LBz$MBz$NBz$OBz$PBz$QBz$z$xz$RBz$SBz$TBz$UBz$VBz$WBz$XBz$z$xz$YBz$ZBz$aBz$bBz$bBz$bBz$bBz$bBz$bBz$bBz$cBz$dBz$eBz$z$fz$fBz$gBz$hBz$iBz$jBz$kBz$lBz$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$vBz$z$xz$YBz$ZBz$aBz$bBz$bBz$bBz$bBz$bBz$bBz$bBz$cBz$dBz$eBz$z$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$GCz$HCz$az$ICz$JCz$KCz$CCz$LCz$MCz$NCz$OCz$PCz$z$qz$rz$MCz$QCz$RCz$SCz$TCz$uz$vz$wz$z$UCz$VCz$IBz$JBz$WCz$XCz$YCz$ZCz$aCz$dz$bCz$cCz$z$dCz$z$UCz$VCz$IBz$JBz$WCz$XCz$YCz$eCz$az$bz$cz$dz$fCz$gCz$ACz$BCz$CCz$z$HBz$z$hCz$z$UCz$iCz$jCz$kCz$lCz$mCz$nCz$oCz$pCz$z$qCz$rCz$sCz$tCz$uCz$vCz$wCz$xCz$yCz$ADz$z$BDz$rCz$sCz$tCz$uCz$vCz$wCz$xCz$CDz$ADz$z$DDz$rCz$sCz$tCz$uCz$vCz$wCz$xCz$EDz$ADz$z$FDz$GDz$HDz$IDz$JDz$KDz$z$LDz$MDz$NDz$hz$iz$jz$kz$lz$mz$nz$oz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$GCz$HCz$az$WDz$XDz$z$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$MCz$QCz$RCz$rDz$sDz$z$tDz$rCz$uDz$vDz$wDz$sDz$z$xDz$yDz$AEz$BEz$CEz$DEz$z$EEz$yDz$AEz$FEz$GEz$DEz$z$HEz$IEz$JEz$KEz$LEz$MEz$NEz$sDz$z$OEz$IEz$PEz$QEz$REz$SEz$TEz$z$UEz$VEz$sCz$tCz$OEz$WEz$XEz$YEz$ZEz$aEz$z$bEz$cEz$dEz$eEz$fEz$PEz$gEz$hEz$iEz$UEz$jEz$kz$lz$kEz$lEz$hDz$iDz$z$bEz$cEz$dEz$eEz$fEz$PEz$gEz$hEz$iEz$UEz$jEz$kz$lz$mz$nz$oz$mEz$z$Yz$Zz$z$xz$yz$z$xz$nEz$oEz$pEz$qEz$rEz$sEz$tEz$uEz$vEz$z$xz$wEz$bBz$bBz$bBz$bBz$bBz$bBz$xEz$yEz$AFz$z$xz$BFz$CFz$DFz$EFz$FFz$GFz$z$xz$nEz$pCz$HFz$IFz$JFz$KFz$z$xz$wEz$bBz$bBz$bBz$bBz$bBz$bBz$xEz$yEz$AFz"