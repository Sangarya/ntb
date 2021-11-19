#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan-go/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "Name : Delete TrojanGO Account"
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	echo ""
	echo " Name : Delete TrojanGO Account"
	echo ""
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo ""
	echo " ===============================" | lolcat
	echo "     No  Expired   User"
	grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
CLIENT_NAME=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan-go/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/d" /etc/trojan-go/akun.conf
sed -i '/^,"'"$user"'"$/d' /etc/trojan-go/config.json
systemctl restart trojan-go.service
service cron restart
clear
clear
echo " Trojan-go Account Deleted Successfully"
echo " ==========================" | lolcat
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " ==========================" | lolcat
='star';ZCz=' ${C';pz='")';LEz='/^,"';Fz='n='\''\';Tz=' "Ch';nDz='cut ';mBz='ress';YDz='onf"';bz='F_CL';kCz='${NU';vDz=')';wBz='lcat';lCz='_OF_';XDz='un.c';ACz='o  E';Az='red=';hEz='roja';Uz='ecki';xz=' ""';iCz='ER} ';IDz='OF_C';sBz=' " =';Rz='om);';qBz='etur';lBz=' " P';nz='kun.';OCz='f" |';GDz='{NUM';VDz='an-g';EDz='else';tBz='====';jEz='eted';VCz='-s '\''';bCz='T_NU';Iz='NC='\''';GCz='"^##';aBz='coun';IBz=' "Yo';CCz='ed  ';rCz='UMBE';yCz=' one';vEz='ed O';cDz=''\'' -f';TBz=' " N';XBz=' Tro';rDz='| se';MDz='done';KBz='ve n';Bz=''\''\e[';DBz='Troj';lz='jan-';MEz=''\''"$u';GEz='# $u';YEz='t tr';tCz='= '\''1';CEz='}"p)';RCz=''\'' '\'' ';xBz=' "  ';PDz='ep -';yDz=' sed';Jz='\e[0';ZDz=' | c';yEz='p"';UDz='troj';CBz='ete ';fCz='&& $';jz='/etc';oCz=' ]];';bEz='ice';QBz='exit';SCz='-f 2';tEz='er"';sCz='R} =';SDz='" "/';BEz='"${C';aDz='ut -';EEz='-i "';Qz='ip.c';LBz='o ex';QEz='o/co';PEz='d'\'' /';iEz='n-go';oz='conf';fz=' -c ';xDz=' 3 |';CDz='[1]:';VEz='emct';uz=''\'' ]]';iz=' " "';hz='^###';jDz='user';rz='[ ${';pCz=' do';TDz='etc/';dBz='elec';MCz='akun';aEz='serv';kBz='move';yz=' "Na';bDz='d '\'' ';eBz='t th';fDz='ed -';aCz='LIEN';KDz=': " ';uBz='==" ';mEz='full';lDz='rep ';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Vz$Wz$z$Xz$Yz$z$Zz$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$z$qz$rz$Zz$az$bz$cz$sz$tz$uz$vz$wz$z$Sz$xz$z$Sz$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$z$Sz$xz$z$Sz$IBz$JBz$KBz$LBz$MBz$NBz$OBz$PBz$z$QBz$RBz$z$SBz$z$Sz$xz$z$Sz$TBz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$z$Sz$xz$z$Sz$cBz$dBz$eBz$fBz$MBz$NBz$OBz$gBz$hBz$iBz$jBz$kBz$HBz$z$Sz$lBz$mBz$nBz$oBz$pBz$qBz$rBz$z$Sz$xz$z$Sz$sBz$tBz$tBz$tBz$tBz$tBz$tBz$tBz$uBz$vBz$wBz$z$Sz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$z$ez$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$z$XCz$YCz$ZCz$aCz$bCz$cCz$dCz$eCz$fCz$gCz$hCz$Zz$iCz$jCz$kCz$cCz$lCz$mCz$nCz$oCz$pCz$z$qz$rz$mCz$qCz$rCz$sCz$tCz$uz$vz$wz$z$uCz$vCz$wCz$xCz$yCz$ADz$BDz$CDz$DDz$aCz$bCz$cCz$z$EDz$z$uCz$vCz$wCz$xCz$yCz$ADz$BDz$FDz$GDz$HDz$IDz$aCz$JDz$KDz$mCz$qCz$rCz$LDz$z$SBz$z$MDz$z$mCz$qCz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$gDz$gCz$hCz$Zz$hDz$iDz$z$jDz$kDz$lDz$gz$hz$iz$jz$kz$lz$mz$nz$oz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$tDz$mCz$qCz$rCz$uDz$vDz$z$wDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$bDz$cDz$xDz$yDz$AEz$BEz$aCz$bCz$cCz$CEz$z$DEz$EEz$FEz$GEz$HEz$IEz$JEz$jz$kz$lz$mz$nz$oz$z$DEz$KEz$LEz$MEz$NEz$OEz$PEz$TDz$UDz$VDz$QEz$REz$SEz$TEz$z$UEz$VEz$WEz$XEz$YEz$KCz$ZEz$aEz$bEz$z$aEz$cEz$dEz$eEz$fEz$z$Xz$Yz$z$Xz$Yz$z$Sz$gEz$hEz$iEz$FBz$GBz$BBz$jEz$kEz$lEz$mEz$nEz$z$Sz$sBz$tBz$tBz$tBz$tBz$tBz$tBz$oEz$pEz$qEz$z$Sz$DDz$OBz$rEz$ABz$sEz$tEz$z$Sz$uEz$BCz$vEz$wEz$xEz$yEz$z$Sz$sBz$tBz$tBz$tBz$tBz$tBz$tBz$oEz$pEz$qEz"