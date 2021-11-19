#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/shadowsocks-libev/akun.conf")
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
	grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
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
user=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/shadowsocks-libev/akun.conf
clear
echo ""
echo " Akun SS OBFS Berhasil Diperbarui"
echo " ==========================" | lolcat
echo " Username     : $user"
echo " Aktif Sampai : $expe"
echo " ==========================" | lolcat
BBz='echo';Pz='e='\''\';GEz='(dat';Dz='m'\''';tBz='f" |';fDz='ep -';gBz='{off';XEz='2 + ';GBz=' Ada';kCz='1-${';XBz='+C u';REz=' - d';rCz=' (ha';ECz='l [[';qDz='onf"';jBz='"^##';YDz='| se';oz='-lib';BCz='-s '\''';fEz='"%Y-';BDz='masa';DBz=' "Us';XDz='f 2 ';tz='if [';Cz='1;31';SCz='CLIE';PDz='n"';tDz='d '\'' ';BFz='cat';nz='ocks';CEz='te +';ez='S=$(';nDz='libe';nBz='adow';yz='; th';WEz='$exp';PBz='ng I';ZDz='d -n';sBz='.con';Xz='b[m'\''';Yz='clea';sDz='ut -';UEz='00 )';KCz='e 1 ';vEz='Berh';jDz='etc/';aBz='urn"';GCz='LIEN';EEz='m-%d';KDz='expe';Jz='\e[0';PCz='-le ';jEz='-i "';EBz='er T';RDz='=$(g';NCz='ENT_';UDz='cut ';jz=' " "';LFz='xpe"';Rz='37m'\''';xz=''\'' ]]';pEz='er $';RCz='_OF_';pCz='"Exp';iEz='sed ';uEz='BFS ';uCz='asaa';hBz='}"';Nz='6m'\''';qCz='ired';xEz=' " =';GDz='bln=';xDz=' -n ';tEz='SS O';FCz=' ${C';Vz='off=';Ez='gree';mEz='ser ';yBz='-3 |';tCz=' " m';JFz='pai ';IFz=' Sam';KFz=': $e';iBz=' -E ';yDz='"${C';ADz='d "$';dBz='yan}';mCz=' " C';hDz='### ';WDz=' '\'' -';MCz='{CLI';MDz='gl $';Lz='='\''\x';bCz=' -rp';XCz='UMBE';JEz='xp" ';GFz=': $u';IBz='exit';CFz=' " U';iDz='" "/';sz='")';Iz='NC='\''';iz='^###';TBz='rui"';FBz='idak';VBz='lik ';Mz='1b[9';Qz='x1b[';cDz=')';qEz='/g" ';kDz='shad';rBz='akun';EDz='ys" ';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$z$tz$uz$az$bz$cz$dz$vz$wz$xz$yz$ABz$z$Yz$Zz$z$BBz$CBz$z$BBz$DBz$EBz$FBz$GBz$HBz$z$IBz$JBz$z$KBz$z$Yz$Zz$z$BBz$CBz$z$BBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$z$BBz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$z$BBz$bBz$cBz$dBz$eBz$eBz$eBz$eBz$eBz$eBz$eBz$fBz$gBz$hBz$z$fz$iBz$jBz$kBz$lBz$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$z$BBz$bBz$cBz$dBz$eBz$eBz$eBz$eBz$eBz$eBz$eBz$fBz$gBz$hBz$z$DCz$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$az$OCz$PCz$QCz$ICz$RCz$SCz$TCz$UCz$VCz$z$tz$uz$SCz$WCz$XCz$YCz$ZCz$xz$yz$ABz$z$aCz$bCz$LBz$MBz$cCz$dCz$eCz$fCz$gCz$dz$hCz$iCz$z$jCz$z$aCz$bCz$LBz$MBz$cCz$dCz$eCz$kCz$az$bz$cz$dz$lCz$mCz$GCz$HCz$ICz$z$KBz$z$nCz$z$aCz$oCz$pCz$qCz$rCz$sCz$tCz$uCz$vCz$z$wCz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$FDz$sz$z$GDz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$HDz$sz$z$IDz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$JDz$sz$z$KDz$LDz$MDz$NDz$ODz$PDz$z$QDz$RDz$SDz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$SCz$WCz$XCz$bDz$cDz$z$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$xDz$yDz$GCz$HCz$ICz$AEz$z$BEz$xCz$CEz$DEz$EEz$cDz$z$FEz$GEz$HEz$IEz$JEz$KEz$z$LEz$GEz$HEz$MEz$NEz$KEz$z$OEz$PEz$QEz$REz$SEz$TEz$UEz$cDz$z$VEz$PEz$WEz$XEz$YEz$ZEz$aEz$z$bEz$cEz$yCz$ADz$VEz$dEz$eEz$fEz$gEz$hEz$z$iEz$jEz$kEz$lEz$mEz$WEz$nEz$oEz$pEz$bEz$qEz$kz$lz$mz$nz$oz$pz$qz$rz$z$Yz$Zz$z$BBz$CBz$z$BBz$rEz$sEz$tEz$uEz$vEz$wEz$RBz$SBz$TBz$z$BBz$xEz$eBz$eBz$eBz$eBz$eBz$eBz$yEz$AFz$BFz$z$BBz$CFz$DFz$EFz$FFz$GFz$HFz$z$BBz$rEz$vCz$IFz$JFz$KFz$LFz$z$BBz$xEz$eBz$eBz$eBz$eBz$eBz$eBz$yEz$AFz$BFz"