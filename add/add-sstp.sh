#!/bin/bash
red='\e[1;31m'
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
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
sstp="$(cat ~/log-install.txt | grep -i SSTP | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /var/lib/premium-script/data-user-sstp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Nama User Sudah Ada, Harap Masukkan Nama Lain!"
                        exit 1
		fi
	done
read -p "Password: " pass
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
cat >> /home/sstp/sstp_account <<EOF
$user * $pass *
EOF
echo -e "### $user $exp">>"/var/lib/premium-script/data-user-sstp"
clear
echo -e ""
echo -e "${red}================================${off}"
echo -e "${white}     SSTP VPN${off}"
echo -e "${red}================================${off}"
echo -e " ${white}ISP    : $ISP"
echo -e " CITY           : $CITY"
echo -e " COUNTRY        : $COUNTRY"
echo -e " Server IP      : $MYIP"
echo -e " Server Host    : $domain"
echo -e " Port           : $sstp"
echo -e " Username       : $user"
echo -e " Password       : $pass"
echo -e " Cert           : http://$domain:81/server.crt${off}"
echo -e "${red}================================${off}"
echo -e " ${white}Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe${off}"
echo -e "${red}=================================${off}"
echo -e ""
''';wDz='s" +';ZEz='thn2';PFz='PN${';WDz=' Mas';jDz='s';oBz='doma';UCz=' $us';FCz='l.tx';uCz='$use';iDz=' pas';xDz='"%Y-';cCz='LIEN';nCz='" -e';KBz='try ';JBz='coun';HCz='grep';SEz='bln,';nBz='n';Gz='1b[9';uDz=' "$m';BFz='-sst';hFz='t   ';jFz='" Po';wBz='IP';vBz='else';DBz='pinf';aDz='ain!';LGz='l"';Tz='blue';mCz='me: ';Qz='\x1b';FBz='/cit';REz='gl $';az='whit';Mz='x1b[';cBz='scri';bBz='ium-';VEz='tgl2';KEz='")';eFz='rver';ACz='="$(';XDz='ukka';nFz='" Pa';PGz='ada ';aCz='$ &&';OCz='ed '\''';MGz='" Be';HEz='f da';qFz='pass';qCz='NT_E';iFz='in"';mFz='me  ';oz='s ip';KGz='a   ';cz='37m'\''';TDz='h Ad';JFz='}"';Az='red=';HGz='" Di';XEz='ate ';aEz='tngg';BEz='tgl=';Fz='='\''\x';sDz='`dat';Yz='cyan';OFz='TP V';CEz='$(da';PDz=' "Na';jz='1b[4';bDz='exit';ECz='stal';Dz='m'\''';FFz='ed}=';AEz='d"`';SCz='unti';Oz='yell';sCz='S=$(';JCz='SSTP';JGz=' Pad';rCz='XIST';sBz='c/v2';sFz=' : h';OEz='+"%Y';gCz=' '\''0'\''';gFz=' Hos';vDz=' day';RGz='f}"';CCz='~/lo';LFz='hite';NFz='  SS';mDz=' (ha';ZDz='ma L';oEz='r * ';ADz='um-s';hDz='d: "';UEz='n"';TBz='p);';Cz='1;31';eCz='ISTS';oFz='sswo';bFz='Y   ';xCz='ib/p';GBz='y )';EFz='"${r';TFz='P   ';Hz='0m'\''';RCz='"';fEz='2"';IDz='S} =';ZCz='9_]+';jEz='p/ss';RDz='ser ';kFz='rt  ';QFz='off}';Vz='purp';dBz='pt/i';cEz=' $bl';KFz='"${w';JDz='= '\''1';xEz='pt/d';lEz='ccou';ZBz='lib/';lCz='erna';sz='| cu';FGz='f Ha';MEz='+"%b';pCz='CLIE';kEz='tp_a';WCz='~ ^[';eDz=' -p ';NEz='thn=';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Az$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$z$Oz$Pz$Qz$Rz$Sz$z$Tz$Fz$Gz$Uz$z$Vz$Wz$Qz$Xz$Sz$z$Yz$Fz$Gz$Zz$z$az$bz$Mz$cz$z$dz$ez$fz$Dz$z$gz$Iz$hz$z$iz$Fz$jz$kz$Dz$z$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$wz$xz$z$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$z$HBz$IBz$mz$nz$oz$pz$qz$JBz$KBz$LBz$z$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$z$UBz$VBz$z$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$fBz$gBz$z$hBz$iBz$jBz$kBz$lBz$mBz$nBz$z$oBz$pBz$qBz$rBz$sBz$tBz$oBz$uBz$z$vBz$z$oBz$pBz$wBz$z$xBz$z$yBz$ACz$BCz$CCz$DCz$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$z$SCz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$aCz$bCz$cCz$dCz$eCz$fCz$gCz$lBz$hCz$z$iCz$jCz$kCz$lCz$mCz$nCz$oCz$VBz$z$pCz$qCz$rCz$sCz$HCz$tCz$uCz$vCz$wCz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$yBz$FDz$GDz$LBz$z$hBz$HDz$pCz$qCz$rCz$IDz$JDz$KDz$LDz$MDz$z$NDz$ODz$z$NDz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$RCz$z$bDz$cDz$z$xBz$z$dDz$z$iCz$eDz$fDz$gDz$hDz$iDz$jDz$z$iCz$eDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$z$rDz$sDz$tDz$uDz$pDz$qDz$vDz$wDz$xDz$yDz$AEz$z$BEz$CEz$DEz$EEz$FEz$GEz$HEz$IEz$JEz$KEz$z$LEz$CEz$DEz$EEz$FEz$GEz$HEz$IEz$MEz$KEz$z$NEz$CEz$DEz$EEz$FEz$GEz$HEz$IEz$OEz$KEz$z$PEz$QEz$REz$SEz$TEz$UEz$z$VEz$WEz$XEz$JEz$KEz$z$YEz$WEz$XEz$MEz$KEz$z$ZEz$WEz$XEz$OEz$KEz$z$aEz$bEz$VEz$cEz$dEz$eEz$fEz$z$BCz$gEz$hEz$iEz$jEz$kEz$lEz$mEz$nEz$z$uCz$oEz$pEz$qEz$z$rEz$z$NDz$sEz$tEz$UCz$uEz$vEz$wEz$YBz$ZBz$aBz$bBz$cBz$xEz$yEz$AFz$BFz$CFz$z$UBz$VBz$z$NDz$sEz$DFz$z$NDz$sEz$EFz$FFz$GFz$GFz$GFz$GFz$GFz$GFz$GFz$HFz$IFz$JFz$z$NDz$sEz$KFz$LFz$MFz$NFz$OFz$PFz$QFz$RCz$z$NDz$sEz$EFz$FFz$GFz$GFz$GFz$GFz$GFz$GFz$GFz$HFz$IFz$JFz$z$NDz$sEz$RFz$az$SFz$TFz$UFz$VFz$z$NDz$sEz$WFz$XFz$YFz$YFz$UFz$yz$RCz$z$NDz$sEz$ZFz$aFz$bFz$YFz$UFz$HBz$cFz$z$NDz$sEz$dFz$eFz$fFz$YFz$UFz$MBz$RCz$z$NDz$sEz$dFz$eFz$gFz$hFz$UFz$oBz$iFz$z$NDz$sEz$jFz$kFz$YFz$YFz$UFz$yBz$RCz$z$NDz$sEz$lFz$lCz$mFz$YFz$UFz$AFz$RCz$z$NDz$sEz$nFz$oFz$pFz$YFz$UFz$qFz$RCz$z$NDz$sEz$rFz$kFz$YFz$YFz$sFz$tFz$uFz$vFz$wFz$xFz$yFz$AGz$IFz$JFz$z$NDz$sEz$EFz$FFz$GFz$GFz$GFz$GFz$GFz$GFz$GFz$HFz$IFz$JFz$z$NDz$sEz$RFz$az$BGz$CGz$DGz$EGz$UFz$FEz$GEz$FGz$GGz$z$NDz$sEz$HGz$IGz$JGz$KGz$UFz$aEz$LGz$z$NDz$sEz$MGz$NGz$OGz$PGz$UFz$PEz$QGz$RGz$z$NDz$sEz$EFz$FFz$GFz$GFz$GFz$GFz$GFz$GFz$GFz$GFz$QGz$RGz$z$NDz$sEz$DFz"