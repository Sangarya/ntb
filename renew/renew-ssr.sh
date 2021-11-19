#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/shadowsocksr/akun.conf")
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
	grep -E "^### " "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
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
user=$(grep -E "^### " "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/shadowsocksr/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
tgl=$(echo "$exp4" | cut -d- -f3)
bln=$(echo "$exp4" | cut -d- -f2)
sed -i "s/### $user $exp/### $user $exp4/g" /usr/local/shadowsocksr/akun.conf
clear
echo ""
echo "  Akun SSR Berhasil Diperbarui"
echo " ==========================" | lolcat
echo " Username      : $user"
echo " Aktif Sampai  : $expe"
echo " ==========================" | lolcat
ER} ';QCz='${NU';tEz='# $u';dDz='p)';BCz=' -s ';Xz='b[m'\''';jz=' " "';YBz='ntuk';az='NUMB';Jz='\e[0';NEz='d2=$';ZBz=' ret';qz='akun';iBz=' -E ';FDz='+"%d';yBz='2-3 ';EDz='ys" ';rDz='conf';hz='-E "';Iz='NC='\''';NCz='ENT_';kCz='1-${';xCz='$(da';gCz='" CL';XEz='exp3';kz='/usr';pBz='owso';LEz='xp" ';CEz=')';vBz='t -d';gEz='s" +';VEz=' 864';rEz='-i "';HCz='T_NU';ADz='d "$';WDz=' -d ';ZCz='= '\''1';YCz='R} =';hBz='}"';IEz='(dat';HFz='perb';xBz=' -f ';lz='/loc';EEz='te +';PFz='sern';bCz=' -rp';TFz=' " A';mz='al/s';lBz='"/us';OEz=' "$n';yDz='d -n';fDz='$(gr';jEz='d"`';yz='; th';Lz='='\''\x';GEz='m-%d';AEz=' "${';Yz='clea';lCz='S}]:';KDz='+"%Y';Uz='33[1';xDz='| se';VCz=' do';qCz='ired';PBz='ng I';JDz='thn=';Vz='off=';tDz='cut ';YEz='$exp';QFz='ame ';vDz=' '\'' -';XDz=''\'' '\'' ';yCz='te -';nEz=' -d-';Nz='6m'\''';CFz='Akun';aBz='urn"';bBz=' -e ';FBz='idak';tBz='nf" ';vEz='/###';mDz='l/sh';SFz=' : $';MDz='="$t';JBz=' 1';Zz='r';Bz=''\''\e[';CDz='akti';Tz='='\''\0';uDz='-d '\''';nDz='adow';uBz='| cu';Pz='e='\''\';uCz='asaa';Wz=''\''\x1';oz='wsoc';gDz='ep -';QBz='ngin';MEz='+%s)';OBz='n Ya';iz='^###';REz='=$((';xEz='er $';pCz='"Exp';hCz='_NUM';UEz='2) /';Gz='e[0;';XCz='UMBE';PEz='ow" ';LBz=' "Pi';MBz='lih ';WCz='NT_N';tCz=' " m';Ez='gree';nCz='done';jBz='"^##';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$z$tz$uz$az$bz$cz$dz$vz$wz$xz$yz$ABz$z$Yz$Zz$z$BBz$CBz$z$BBz$DBz$EBz$FBz$GBz$HBz$z$IBz$JBz$z$KBz$z$Yz$Zz$z$BBz$CBz$z$BBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$z$BBz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$z$BBz$bBz$cBz$dBz$eBz$eBz$eBz$eBz$eBz$eBz$eBz$fBz$gBz$hBz$z$fz$iBz$jBz$kBz$lBz$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$z$BBz$bBz$cBz$dBz$eBz$eBz$eBz$eBz$eBz$eBz$eBz$fBz$gBz$hBz$z$DCz$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$az$OCz$PCz$QCz$ICz$RCz$SCz$TCz$UCz$VCz$z$tz$uz$SCz$WCz$XCz$YCz$ZCz$xz$yz$ABz$z$aCz$bCz$LBz$MBz$cCz$dCz$eCz$fCz$gCz$dz$hCz$iCz$z$jCz$z$aCz$bCz$LBz$MBz$cCz$dCz$eCz$kCz$az$bz$cz$dz$lCz$mCz$GCz$HCz$ICz$z$KBz$z$nCz$z$aCz$oCz$pCz$qCz$rCz$sCz$tCz$uCz$vCz$z$wCz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$FDz$GDz$z$HDz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$IDz$GDz$z$JDz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$KDz$GDz$z$LDz$MDz$NDz$ODz$PDz$QDz$z$RDz$SDz$TDz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$bDz$MCz$NCz$az$cDz$dDz$z$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$xDz$yDz$AEz$SCz$WCz$XCz$BEz$CEz$z$DEz$xCz$EEz$FEz$GEz$CEz$z$HEz$IEz$JEz$KEz$LEz$MEz$z$NEz$IEz$JEz$OEz$PEz$MEz$z$QEz$REz$SEz$TEz$UEz$VEz$WEz$CEz$z$XEz$REz$YEz$ZEz$aEz$bEz$cEz$z$dEz$eEz$yCz$ADz$XEz$fEz$gEz$hEz$iEz$jEz$z$wCz$kEz$lEz$YEz$mEz$VDz$nEz$oEz$CEz$z$HDz$kEz$lEz$YEz$mEz$VDz$nEz$pEz$CEz$z$qEz$rEz$sEz$tEz$uEz$YEz$vEz$wEz$xEz$dEz$yEz$kz$lz$mz$nz$oz$pz$qz$rz$AFz$z$Yz$Zz$z$BBz$CBz$z$BBz$BFz$CFz$DFz$EFz$FFz$GFz$HFz$IFz$JFz$z$BBz$KFz$eBz$eBz$eBz$eBz$eBz$eBz$LFz$MFz$NFz$z$BBz$OFz$PFz$QFz$RFz$SFz$RDz$JFz$z$BBz$TFz$vCz$UFz$VFz$SFz$LDz$JFz$z$BBz$KFz$eBz$eBz$eBz$eBz$eBz$eBz$LFz$MFz$NFz"