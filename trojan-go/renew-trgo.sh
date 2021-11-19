#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan-go/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "Name : Renew Trojan Account"
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "Name : Renew Trojan Account"
	echo ""
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo ""
	echo -e "===============================" | lolcat
	grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
user=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/trojan-go/akun.conf
clear
echo ""
echo " Trojan-go Account Was Successfully Renewed"
echo " ==========================" | lolcat
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " ==========================" | lolcat
EFz='p4"';MCz=' ${C';CDz='ys):';uEz=' lol';kCz=' cli';RCz='e 1 ';FDz='ktif';xBz='-go/';XBz='g cl';rCz='BER_';PDz=' "${';NDz='| se';dCz='NT_N';tz='= '\''0';CFz='n  :';dEz='/###';UDz='ep -';KDz='-d '\''';Ez='gree';eBz=' " P';DEz='=$((';cDz='un.c';EBz='n Ac';PBz='exit';fz=' -c ';lDz='"${C';uz=''\'' ]]';WCz='-le ';kBz='n"';gDz='d '\'' ';sBz='"^##';rz='[ ${';aEz='s/##';AFz='xpir';nDz='now=';QCz='} -g';QDz='R}"p';SEz='d "$';YDz='etc/';lz='jan-';KBz='o ex';kEz='ount';Qz='ip.c';nBz='====';BEz='ow" ';BDz=' (da';cEz='ser ';ez='grep';lEz=' Was';VBz=' exi';aDz='an-g';fDz='ut -';Xz='clea';pDz='te +';BFz='ed O';NBz='lien';HBz=' "Yo';Fz='n='\''\';UCz='ENT_';sDz='d1=$';DCz=' -d ';jDz=' sed';xz=' ""';MBz='ng c';gCz='= '\''1';ZDz='troj';YBz='ient';aCz='NTS}';ZEz='-i "';mBz='"===';fCz='R} =';bBz='t to';wDz='xp" ';Wz='PS"';iz=' " "';QEz='=`da';uCz=': " ';Oz=' ica';XEz='d"`';qz='if [';mDz='}"p)';qDz='%Y-%';jCz=' one';cBz=' ren';oz='conf';SDz='exp=';Kz='MYIP';tCz='TS}]';HEz=' 864';tEz='=" |';iEz='n-go';VDz='E "^';xDz='+%s)';rDz='m-%d';Rz='om);';IDz='rep ';bDz='o/ak';RDz=')';OCz='T_NU';YCz='_OF_';EEz=' (d1';sEz=' " =';CBz='ew T';vEz='cat';vz='; th';oDz='$(da';BBz=' Ren';gz='-E "';tDz='(dat';mCz='[1]:';jBz='etur';az='ER_O';Lz='=$(w';yCz='"Exp';Pz='nhaz';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Vz$Wz$z$Xz$Yz$z$Zz$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$z$qz$rz$Zz$az$bz$cz$sz$tz$uz$vz$wz$z$Xz$Yz$z$Sz$xz$z$Sz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$z$Sz$xz$z$Sz$HBz$IBz$JBz$KBz$LBz$MBz$NBz$OBz$z$PBz$QBz$z$RBz$z$Xz$Yz$z$Sz$xz$z$Sz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$z$Sz$xz$z$Sz$SBz$TBz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$z$Sz$eBz$fBz$gBz$hBz$iBz$jBz$kBz$z$Sz$xz$z$Sz$lBz$mBz$nBz$nBz$nBz$nBz$nBz$nBz$nBz$oBz$pBz$qBz$z$ez$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$GCz$HCz$ICz$JCz$z$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$Zz$VCz$WCz$XCz$PCz$YCz$ZCz$aCz$bCz$cCz$z$qz$rz$ZCz$dCz$eCz$fCz$gCz$uz$vz$wz$z$hCz$iCz$SBz$TBz$jCz$kCz$lCz$mCz$nCz$NCz$OCz$PCz$z$oCz$z$hCz$iCz$SBz$TBz$jCz$kCz$lCz$pCz$qCz$rCz$sCz$NCz$tCz$uCz$ZCz$dCz$eCz$vCz$z$RBz$z$wCz$z$hCz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$FDz$z$GDz$HDz$IDz$gz$hz$iz$jz$kz$lz$mz$nz$oz$oBz$JDz$KDz$LDz$MDz$NDz$ODz$PDz$ZCz$dCz$eCz$QDz$RDz$z$SDz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$NCz$OCz$PCz$mDz$z$nDz$oDz$pDz$qDz$rDz$RDz$z$sDz$tDz$uDz$vDz$wDz$xDz$z$yDz$tDz$uDz$AEz$BEz$xDz$z$CEz$DEz$EEz$FEz$GEz$HEz$IEz$RDz$z$JEz$DEz$KEz$LEz$MEz$NEz$OEz$z$PEz$QEz$REz$SEz$JEz$TEz$UEz$VEz$WEz$XEz$z$YEz$ZEz$aEz$bEz$cEz$KEz$dEz$eEz$fEz$PEz$gEz$jz$kz$lz$mz$nz$oz$z$Xz$Yz$z$Sz$xz$z$Sz$hEz$DBz$iEz$jEz$kEz$lEz$mEz$nEz$oEz$pEz$qEz$rEz$z$Sz$sEz$nBz$nBz$nBz$nBz$nBz$nBz$tEz$uEz$vEz$z$Sz$nCz$NBz$wEz$ABz$eEz$xEz$z$Sz$yEz$AFz$BFz$CFz$DFz$EFz$z$Sz$sEz$nBz$nBz$nBz$nBz$nBz$nBz$tEz$uEz$vEz"