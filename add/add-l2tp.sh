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
		CLIENT_EXISTS=$(grep -w $VPN_USER /var/lib/premium-script/data-user-l2tp | wc -l)

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
"$VPN_USER" l2tpd "$VPN_PASSWORD" *
EOF

VPN_PASSWORD_ENC=$(openssl passwd -1 "$VPN_PASSWORD")
cat >> /etc/ipsec.d/passwd <<EOF
$VPN_USER:$VPN_PASSWORD_ENC:xauth-psk
EOF

# Update file attributes
chmod 600 /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*
echo -e "### $VPN_USER $exp">>"/var/lib/premium-script/data-user-l2tp"

echo -e ""
echo -e "${red}================================${off}"
echo -e "         L2TP/IPSEC${off}"
echo -e "${red}================================${off}"
echo -e " ${white}ISP   : $ISP"
echo -e " CITY          : $CITY"
echo -e " COUNTRY       : $COUNTRY"
echo -e " Server IP     : $MYIP"
echo -e " Server Host   : $PUBLIC_IP"
echo -e " IPSec PSK     : myvpn"
echo -e " Username      : $VPN_USER"
echo -e " Password      : $VPN_PASSWORD${off}"
echo -e "${red}================================${off}"
echo -e " ${white}Aktif Selama : $masaaktif Hari"
echo -e " Dibuat Pada   : $tnggl"
echo -e " Berakhir Pada : $expe${off}"
echo -e "${red}=================================${off}"
echo -e ""
'd"`';JGz=' IP ';aCz='CLIE';UCz='erna';CGz='" CO';NFz='ets*';BDz=' ""';Fz=''\''\x1';DFz='xaut';nGz='buat';Qz=''\''';iBz='= ""';tFz='e}IS';FCz='~ ^[';hGz='Sela';eCz='grep';qz='| cu';ADz='echo';PFz='c/ip';cFz='-l2t';iDz='e -d';LFz='hap-';nFz='  L2';Oz='\x1b';pDz='tgl=';pGz='a   ';WEz='etc/';KEz='tgl2';Vz='[95m';cBz='pvps';FBz='COUN';eBz='f';kFz='}"';SDz=' -p ';VCz='me: ';ICz='9_]+';NGz='t   ';NCz='ISTS';WCz='" -e';PBz='nfo.';wGz=': $e';HGz='" Se';tCz='[ ${';rGz='nggl';RGz='" IP';iCz='ar/l';nEz='sl p';Mz='yell';pBz='cat ';UFz=' -e ';rDz='te -';qDz='$(da';XFz='exp"';Wz='cyan';OCz='} ==';VBz='ce /';jGz=' $ma';xBz='P';IBz='try ';KFz='pp/c';UGz=': my';KCz=' ${C';pEz='d -1';nz='info';OEz='thn2';LEz='=$(d';wCz=''\'' ]]';fGz='e}Ak';hBz='IP" ';EDz='ser ';hCz='R /v';bDz=' (ha';GDz='h Ad';REz=' $bl';vBz='else';wFz='SP"';SCz=' -rp';gFz='ed}=';az='37m'\''';wz='CITY';ZDz='"Exp';Tz='purp';KGz=': $M';HCz='-Z0-';bEz=' <<E';YCz='_USE';wDz='ys" ';pFz='PSEC';uCz='S} =';jFz='{off';PDz='exit';aDz='ired';BBz='pinf';hDz='`dat';hEz='WORD';HDz='a, H';tEz='ORD"';EEz='expe';ECz='ER =';OGz=': $P';SBz='clea';aFz='ata-';eGz='ORD$';rCz=' | w';rFz='f}"';rEz='PN_P';TCz=' "Us';GFz='chmo';XBz='lib/';ez='off=';Hz='m'\''';QFz='sec.';gz='flag';yEz='<EOF';ABz='-s i';dBz='.con';BGz='ITY"';JDz=' Mas';NEz='bln2';vCz='= '\''1';MCz='T_EX';RBz='p);';LDz='n Na';yDz='")';Iz='gree';xFz='" CI';Lz='92m'\''';xz='=$(c';cDz='ri):';GEz='gl $';LCz='LIEN';bz='bold';cCz='XIST';YDz='D';PCz=' '\''0'\''';ACz='unti';MBz='get ';fz='b[m'\''';XEz='ppp/';jz='ISP=';wEz='pass';IFz='0 /e';TEz='$thn';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Kz$Lz$z$Mz$Nz$Oz$Pz$Qz$z$Rz$Bz$Cz$Sz$z$Tz$Uz$Oz$Vz$Qz$z$Wz$Bz$Cz$Xz$z$Yz$Zz$Kz$az$z$bz$cz$dz$Hz$z$ez$Fz$fz$z$gz$Bz$hz$iz$Hz$z$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$z$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$z$FBz$GBz$kz$lz$mz$nz$oz$HBz$IBz$JBz$z$KBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$z$SBz$TBz$z$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$z$fBz$gBz$hBz$iBz$jBz$kBz$lBz$z$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$z$vBz$z$mBz$nBz$wBz$xBz$z$yBz$z$ACz$BCz$CCz$DCz$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$jBz$QCz$z$RCz$SCz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$z$aCz$bCz$cCz$dCz$eCz$fCz$gCz$YCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$rCz$sCz$JBz$z$fBz$tCz$aCz$bCz$cCz$uCz$vCz$wCz$xCz$yCz$z$ADz$BDz$z$ADz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$MDz$NDz$ODz$z$PDz$QDz$z$yBz$z$RDz$z$RCz$SDz$TDz$UDz$VDz$XCz$WDz$XDz$YDz$z$RCz$SDz$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$z$gDz$hDz$iDz$jDz$eDz$fDz$kDz$lDz$mDz$nDz$oDz$z$pDz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$xDz$yDz$z$AEz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$BEz$yDz$z$CEz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$DEz$yDz$z$EEz$FEz$GEz$HEz$IEz$JEz$z$KEz$LEz$MEz$xDz$yDz$z$NEz$LEz$MEz$BEz$yDz$z$OEz$LEz$MEz$DEz$yDz$z$PEz$QEz$KEz$REz$SEz$TEz$UEz$z$SBz$TBz$z$pBz$VEz$WEz$XEz$YEz$ZEz$aEz$bEz$cEz$z$dEz$DCz$eEz$qCz$sDz$fEz$gEz$hEz$iEz$z$jEz$z$fEz$gEz$hEz$kEz$lEz$mEz$nEz$oEz$pEz$qEz$rEz$sEz$tEz$JBz$z$pBz$VEz$WEz$uEz$vEz$wEz$xEz$yEz$z$gCz$YCz$AFz$rEz$sEz$BFz$CFz$DFz$EFz$FFz$z$jEz$z$GFz$HFz$IFz$JFz$KFz$LFz$MFz$NFz$OFz$PFz$QFz$RFz$SFz$TFz$z$ADz$UFz$VFz$CCz$DCz$WFz$XFz$YFz$WBz$XBz$YBz$ZBz$aBz$ZFz$aFz$bFz$cFz$dFz$z$ADz$UFz$eFz$z$ADz$UFz$fFz$gFz$hFz$hFz$hFz$hFz$hFz$hFz$hFz$iFz$jFz$kFz$z$ADz$UFz$lFz$mFz$nFz$oFz$pFz$qFz$rFz$z$ADz$UFz$fFz$gFz$hFz$hFz$hFz$hFz$hFz$hFz$hFz$iFz$jFz$kFz$z$ADz$UFz$sFz$Yz$tFz$uFz$vFz$wFz$z$ADz$UFz$xFz$yFz$mFz$mFz$AGz$BGz$z$ADz$UFz$CGz$DGz$EGz$mFz$AGz$FGz$GGz$z$ADz$UFz$HGz$IGz$JGz$mFz$KGz$LGz$z$ADz$UFz$HGz$IGz$MGz$NGz$OGz$PGz$QGz$ODz$z$ADz$UFz$RGz$SGz$TGz$mFz$UGz$VGz$z$ADz$UFz$WGz$UCz$XGz$mFz$YGz$ZGz$aGz$z$ADz$UFz$bGz$cGz$dGz$mFz$YGz$rEz$sEz$eGz$jFz$kFz$z$ADz$UFz$fFz$gFz$hFz$hFz$hFz$hFz$hFz$hFz$hFz$iFz$jFz$kFz$z$ADz$UFz$sFz$Yz$fGz$gGz$hGz$iGz$jGz$kGz$gGz$lGz$ODz$z$ADz$UFz$mGz$nGz$oGz$pGz$qGz$rGz$ODz$z$ADz$UFz$sGz$tGz$uGz$vGz$wGz$xGz$jFz$kFz$z$ADz$UFz$fFz$gFz$hFz$hFz$hFz$hFz$hFz$hFz$hFz$hFz$qFz$rFz$z$ADz$UFz$eFz"