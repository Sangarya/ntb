#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

clear

echo -e "${cyan}---------------------------------------------------${off}"
echo -e "USERNAME          EXP DATE          STATUS" | lolcat
echo -e "${cyan}---------------------------------------------------${off}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e ""
echo -e "${cyan}---------------------------------------------------${off}"
echo -e "  ${red}Jumlah :${off} ${green}[ $JUMLAH ]${off} ${red}User${off}"
echo -e "${cyan}---------------------------------------------------${off}"
echo -e ""

echo -e "${green}"
read -p " Username       :  " User
echo -e "${off}"
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
echo -e "${green}"
read -p "         Perpanjang (hari) :  " Days
echo -e "${off}"

Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e ""
echo " ==========================" | lolcat
echo -e " Username          :  $User"
echo -e " Aktif Sampai       :  $Expiration_Display"
echo " ==========================" | lolcat
else
clear
echo -e ""
echo -e "   ${red}User Tidak Ditemukan!${off} "
sleep 2
menu
fi
 " ';Jz='\e[0';UFz='" Ak';KDz='ff} ';lBz=''\''{pr';Vz='off=';ECz='[ "$';Nz='6m'\''';SDz='User';jz='RNAM';mz='   E';sCz='!= "';yEz='ser';VFz='tif ';MDz='een}';oz='ATE ';lz='    ';SBz='body';oBz=')"';UBz='ut -';nBz='$2}'\''';JDz=':${o';EDz='""';CCz=']; t';qz='TUS"';LCz='tf "';mEz='MT" ';cBz='N | ';qDz='0 ];';fz='---$';uEz=' %b ';QFz='=" |';kz='E   ';TEz='($To';hz='}"';xz='xpir';jEz='ire_';iBz=' awk';TCz='UN" ';DDz=' -l)';rz=' | l';CEz='s';Rz='37m'\''';TFz=':  $';xBz='[ $I';ABz='do';jFz='slee';nDz='l';BCz='00 ]';hBz='s" |';MCz='%-17';YFz='ion_';CBz='="$(';TDz='${of';VEz='+ $D';tCz='nobo';DBz=' $ex';FFz='"$Pa';yDz='ri) ';QBz='ep -';UEz='day ';qBz='us="';pDz='-eq ';WEz='ays_';PBz='| gr';bBz='$AKU';HBz='-d: ';lEz='ec G';vz='e re';eBz=' "Ac';hEz='-01 ';HCz='" ]]';GCz='= "L';RCz='\n" ';RDz='red}';RBz='v no';TBz=' | c';vEz='%Y'\'')';BDz='swd ';yCz='/etc';GBz='cut ';Az='red=';KFz='r &>';QCz='%2s ';ODz='UMLA';bDz='me  ';gBz='t ex';Bz=''\''\e[';LEz='( $D';Zz='r';PEz='))';pz=' STA';XEz='Deta';mCz='k -F';KEz='d=$(';kFz='p 2';sz='olca';Mz='1b[9';wCz='nt $';eFz='idak';Pz='e='\''\';cCz='D"';nEz='+%Y/';fBz='coun';NBz='expi';gDz='egre';cz='"${c';SEz='n=$(';FDz='"  $';QDz='} ${';SFz='cat';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Dz$z$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$ez$ez$ez$ez$ez$ez$ez$ez$ez$ez$ez$fz$gz$hz$z$az$bz$iz$jz$kz$lz$mz$nz$oz$lz$lz$pz$qz$rz$sz$tz$z$az$bz$cz$dz$ez$ez$ez$ez$ez$ez$ez$ez$ez$ez$ez$ez$fz$gz$hz$z$uz$vz$wz$xz$yz$z$ABz$z$BBz$CBz$az$DBz$EBz$FBz$GBz$HBz$IBz$JBz$z$KBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$UBz$VBz$WBz$z$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$fBz$gBz$EBz$hBz$iBz$jBz$kBz$lBz$mBz$nBz$oBz$z$pBz$qBz$rBz$sBz$tBz$bBz$cBz$uBz$lBz$mBz$nBz$vBz$z$wBz$xBz$yBz$ACz$BCz$CCz$DCz$z$wBz$ECz$pBz$FCz$GCz$HCz$ICz$JCz$z$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$YCz$z$ZCz$z$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$aCz$bCz$cCz$z$dCz$z$dCz$z$eCz$fCz$gCz$hCz$iCz$z$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$rCz$sCz$tCz$uCz$vCz$wCz$xCz$yCz$ADz$BDz$CDz$DDz$JBz$z$az$bz$EDz$z$az$bz$cz$dz$ez$ez$ez$ez$ez$ez$ez$ez$ez$ez$ez$ez$fz$gz$hz$z$az$bz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$MDz$NDz$ODz$PDz$gz$QDz$RDz$SDz$TDz$UDz$z$az$bz$cz$dz$ez$ez$ez$ez$ez$ez$ez$ez$ez$ez$ez$ez$fz$gz$hz$z$az$bz$EDz$z$az$bz$VDz$WDz$hz$z$XDz$YDz$ZDz$aDz$bDz$lz$cDz$ZDz$dDz$z$az$bz$eDz$fDz$z$gDz$hDz$iDz$jDz$gCz$hCz$kDz$lDz$mDz$nDz$z$wBz$oDz$pDz$qDz$rDz$sDz$z$az$bz$VDz$WDz$hz$z$XDz$YDz$tDz$lz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$z$az$bz$eDz$fDz$z$DEz$EEz$FEz$GEz$z$HEz$IEz$JEz$KEz$LEz$MEz$NEz$OEz$PEz$z$QEz$REz$SEz$TEz$UEz$VEz$WEz$XEz$YEz$PEz$z$QEz$ZEz$aEz$bEz$cEz$dEz$eEz$fEz$gEz$hEz$iEz$jEz$kEz$lEz$mEz$nEz$oEz$pEz$z$QEz$ZEz$qEz$rEz$sEz$bEz$cEz$dEz$eEz$fEz$gEz$hEz$iEz$jEz$kEz$lEz$mEz$tEz$uEz$vEz$z$hCz$wEz$xEz$yEz$z$AFz$BFz$CFz$iEz$DFz$EFz$iDz$Zz$z$gDz$hDz$iDz$jDz$gCz$hCz$kDz$lDz$mDz$nDz$z$az$bz$FFz$GFz$HFz$IFz$JFz$BDz$iDz$KFz$LFz$MFz$NFz$z$Yz$Zz$z$az$bz$EDz$z$az$OFz$PFz$PFz$PFz$PFz$PFz$PFz$QFz$RFz$SFz$z$az$bz$ZDz$aDz$bDz$lz$lz$TFz$SDz$JBz$z$az$bz$UFz$VFz$WFz$XFz$lz$cDz$iEz$DFz$YFz$ZFz$aFz$z$az$OFz$PFz$PFz$PFz$PFz$PFz$PFz$QFz$RFz$SFz$z$ZCz$z$Yz$Zz$z$az$bz$EDz$z$az$bz$tDz$bFz$cFz$dFz$eFz$fFz$gFz$hFz$gz$iFz$z$jFz$kFz$z$lFz$z$dCz"