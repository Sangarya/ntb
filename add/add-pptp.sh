#!/bin/bash
grey='\x1b[90m'
red='\x1b[91m'
green='\x1b[92m'
yellow='\x1b[93m'
blue='\x1b[94m'
purple='\x1b[95m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'
flag='\x1b[47;41m'

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
COUNTRY=$(curl -s ipinfo.io/country )

MYIP=$(wget -qO- ipinfo.io/ip);
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
PUBLIC_IP=$(cat /etc/v2ray/domain);
else
PUBLIC_IP=$IP
fi
until [[ $VPN_USER =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username: " -e VPN_USER
		CLIENT_EXISTS=$(grep -w $VPN_USER /var/lib/premium-script/data-user-pptp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Nama User Sudah Ada, Harap Masukkan Nama Lain!"
			exit 1
		fi
	done
read -p "Password: " VPN_PASSWORD
read -p "Expired (hari): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
clear

# Add or update VPN user
cat >> /etc/ppp/chap-secrets <<EOF
"$VPN_USER" pptpd "$VPN_PASSWORD" *
EOF

# Update file attributes
chmod 600 /etc/ppp/chap-secrets*
echo -e "### $VPN_USER $exp">>"/var/lib/premium-script/data-user-pptp"

echo -e ""
echo -e "${red}================================${off}"
echo -e "${white}    PPTP VPN    ${off}"
echo -e "${red}================================${off}"
echo -e " ${white}ISP   : $ISP"
echo -e " CITY          : $CITY"
echo -e " COUNTRY       : $COUNTRY"
echo -e " Server IP     : $MYIP"
echo -e " Server Host   : $PUBLIC_IP"
echo -e " Username      : $VPN_USER"
echo -e " Password      : $VPN_PASSWORD${off}"
echo -e "${red}================================${off}"
echo -e " ${white}Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe${off}"
echo -e "${red}=================================${off}"
echo -e ""
='~ ^[';Nz='ow='\''';NBz='-qO-';Az='grey';AFz='user';NFz=' PPT';CDz=' "Na';KDz='ukka';VDz='d: "';ZFz='    ';GFz='====';nEz='tc/p';jCz='ib/p';iBz='= ""';yDz='")';NDz='ain!';jEz='EOF';QBz='io/i';qz='| cu';ZEz='-sec';Yz='whit';ZDz='"Exp';PFz='N   ';fEz='VPN_';wCz=''\'' ]]';PEz='tngg';RCz='read';gz='flag';BCz='l [[';bEz=' <<E';vEz='exp"';xEz='pt/d';EBz='y )';Kz='x1b[';LGz='buat';GBz='TRY=';OFz='P VP';CGz='ORD$';tEz='"###';nz='info';PGz='" Be';WFz='SP"';CBz='o.io';SGz='ada ';hCz='R /v';lz='rl -';gFz='RY"';LBz='=$(w';DFz='""';yCz='en';ZCz='R';SDz=' -p ';Ez='red=';SCz=' -rp';jDz=' "$m';TEz='$thn';TFz='e}IS';Fz=''\''\x1';MFz='}   ';gBz='[ "$';UEz='2"';mCz='crip';Zz='e='\''\';bCz='NT_E';cFz='" CO';LFz='hite';sBz='ay/d';QDz=' 1';Uz='le='\''';lDz='s" +';sEz=' -e ';ZBz='ium-';dDz=' " m';qDz='$(da';wFz='" Pa';dBz='.con';RGz='ir P';BBz='pinf';VEz='>> /';iEz='" *';XCz=' VPN';qEz='secr';eBz='f';CCz=' $VP';Sz='4m'\''';qFz='C_IP';FGz='Sela';vCz='= '\''1';iDz='e -d';JBz=')';aCz='CLIE';gDz='exp=';HDz='a, H';Oz='\x1b';JFz='}"';Iz='gree';DBz='/cit';Vz='[95m';MDz='ma L';IEz=' $th';Wz='cyan';pFz='UBLI';rBz='/v2r';CEz='thn=';NEz='bln2';IFz='{off';kDz=' day';sCz='c -l';lCz='um-s';bFz='ITY"';mBz='PUBL';Jz='n='\''\';iFz='rver';kEz='chmo';PBz='nfo.';tFz=': $V';QEz='l="$';oCz='ta-u';IDz='arap';bBz='pt/i';CFz='p"';UDz='swor';HCz='-Z0-';ECz='ER =';MBz='get ';pCz='ser-';vDz='f da';JEz='n"';ABz='-s i';Bz='='\''\x';MGz=' Pad';iz='7;41';XDz='SWOR';UFz='P   ';cz='='\''\0';LCz='LIEN';Lz='92m'\''';jBz=' ]];';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Kz$Lz$z$Mz$Nz$Oz$Pz$Qz$z$Rz$Bz$Cz$Sz$z$Tz$Uz$Oz$Vz$Qz$z$Wz$Bz$Cz$Xz$z$Yz$Zz$Kz$az$z$bz$cz$dz$Hz$z$ez$Fz$fz$z$gz$Bz$hz$iz$Hz$z$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$z$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$z$FBz$GBz$kz$lz$mz$nz$oz$HBz$IBz$JBz$z$KBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$z$SBz$TBz$z$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$z$fBz$gBz$hBz$iBz$jBz$kBz$lBz$z$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$z$vBz$z$mBz$nBz$wBz$xBz$z$yBz$z$ACz$BCz$CCz$DCz$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$jBz$QCz$z$RCz$SCz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$z$aCz$bCz$cCz$dCz$eCz$fCz$gCz$YCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$rCz$sCz$JBz$z$fBz$tCz$aCz$bCz$cCz$uCz$vCz$wCz$xCz$yCz$z$ADz$BDz$z$ADz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$MDz$NDz$ODz$z$PDz$QDz$z$yBz$z$RDz$z$RCz$SDz$TDz$UDz$VDz$XCz$WDz$XDz$YDz$z$RCz$SDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$z$gDz$hDz$iDz$jDz$eDz$fDz$kDz$lDz$mDz$nDz$oDz$z$pDz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$xDz$yDz$z$AEz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$BEz$yDz$z$CEz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$DEz$yDz$z$EEz$FEz$GEz$HEz$IEz$JEz$z$KEz$LEz$MEz$xDz$yDz$z$NEz$LEz$MEz$BEz$yDz$z$OEz$LEz$MEz$DEz$yDz$z$PEz$QEz$KEz$REz$SEz$TEz$UEz$z$SBz$TBz$z$pBz$VEz$WEz$XEz$YEz$ZEz$aEz$bEz$cEz$z$dEz$DCz$eEz$qCz$sDz$fEz$gEz$hEz$iEz$z$jEz$z$kEz$lEz$mEz$nEz$oEz$pEz$qEz$rEz$z$ADz$sEz$tEz$CCz$DCz$uEz$vEz$wEz$WBz$XBz$YBz$ZBz$aBz$xEz$yEz$AFz$BFz$CFz$z$ADz$sEz$DFz$z$ADz$sEz$EFz$FFz$GFz$GFz$GFz$GFz$GFz$GFz$GFz$HFz$IFz$JFz$z$ADz$sEz$KFz$LFz$MFz$NFz$OFz$PFz$QFz$RFz$z$ADz$sEz$EFz$FFz$GFz$GFz$GFz$GFz$GFz$GFz$GFz$HFz$IFz$JFz$z$ADz$sEz$SFz$Yz$TFz$UFz$VFz$WFz$z$ADz$sEz$XFz$YFz$ZFz$ZFz$aFz$bFz$z$ADz$sEz$cFz$dFz$eFz$ZFz$aFz$fFz$gFz$z$ADz$sEz$hFz$iFz$jFz$ZFz$kFz$lFz$z$ADz$sEz$hFz$iFz$mFz$nFz$oFz$pFz$qFz$ODz$z$ADz$sEz$rFz$UCz$sFz$ZFz$tFz$uFz$vFz$z$ADz$sEz$wFz$xFz$yFz$ZFz$tFz$AGz$BGz$CGz$IFz$JFz$z$ADz$sEz$EFz$FFz$GFz$GFz$GFz$GFz$GFz$GFz$GFz$HFz$IFz$JFz$z$ADz$sEz$SFz$Yz$DGz$EGz$FGz$GGz$HGz$tDz$uDz$IGz$JGz$z$ADz$sEz$KGz$LGz$MGz$NGz$HGz$PEz$OGz$z$ADz$sEz$PGz$QGz$RGz$SGz$HGz$EEz$TGz$UGz$z$ADz$sEz$EFz$FFz$GFz$GFz$GFz$GFz$GFz$GFz$GFz$GFz$TGz$UGz$z$ADz$sEz$DFz"