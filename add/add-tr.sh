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
uuid=$(cat /etc/trojan/uuid.txt)
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
tr="$(cat ~/log-install.txt | grep -i Trojan | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password: " -e user
		user_EXISTS=$(grep -w $user /etc/trojan/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo "Nama User Sudah Ada, Harap Masukkan Nama Lain!"
			exit 1
		fi
	done
read -p "Expired (hari): " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
echo -e "### $user $exp" >> /etc/trojan/akun.conf
systemctl restart trojan
trojanlink="trojan://${user}@${domain}:${tr}"
clear
echo -e ""
echo -e "${red}=================================${off}"
echo -e "${white}       TROJAN ${off}"
echo -e "${red}=================================${off}"
echo -e " ${white}ISP    : ${ISP}"
echo -e " CITY           : ${CITY}"
echo -e " COUNTRY        : ${COUNTRY}"
echo -e " Server IP      : ${MYIP}"
echo -e " Remarks        : ${user}"
echo -e " Host           : ${domain}"
echo -e " Port           : ${tr}"
echo -e " Key            : geo"
echo -e " Link           : ${trojanlink}${off}"
echo -e "${red}=================================${off}"
echo -e " ${white}Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe${off}"
echo -e "${red}=================================${off}"
 ';nFz='" Se';uCz=' use';XFz='{off';HBz='coun';kBz='.con';FDz='akun';HFz='@${d';iDz=' (ha';kz='$(cu';ABz='-s i';rFz='P}"';hEz='=$(d';LBz='=$(w';hBz='scri';LEz='d"`';sFz='" Re';iEz='ate ';VFz='TROJ';BFz='t tr';jCz='TS} ';ADz='w $u';DCz='fi';mEz='l="$';Vz='[95m';rEz=' -e ';JFz='n}:$';FCz='$(ca';dBz='var/';pz='org ';Xz='6m'\''';XEz='+"%b';wCz='_EXI';yDz='roja';xEz='emct';YCz='l [[';iz='7;41';jBz='pvps';IDz='l)';mBz='if [';Tz='purp';QBz='io/i';XDz=' Mas';KDz='STS}';jEz='bln2';xz='=$(c';fFz='TY  ';Cz='1b[9';pFz=' IP ';yFz='st  ';lEz='tngg';XCz='unti';PCz=' | c';aEz='expe';YDz='ukka';EGz='" Ke';Jz='n='\''\';eFz='" CI';tDz='a\,"';vDz='""'\''"';oCz='read';LFz='""';iBz='pt/i';GGz=' : g';YBz='an/u';rCz='sswo';sCz='rd: ';Bz='='\''\x';YEz='thn=';rBz=' the';WBz='etc/';wFz='r}"';mFz='NTRY';EEz='`dat';cCz='a-zA';bFz='P   ';eBz='lib/';TCz='ed '\''';Ez='red=';gFz='{CIT';hFz='Y}"';XBz='troj';bBz='sour';MGz='ink}';sEz='"###';gCz=' ${u';UBz='uuid';nEz=' $bl';lCz='0'\'' ]';yz='url ';UCz='s/ /';HEz=' day';mz='s ip';WGz='a   ';lz='rl -';Az='grey';OCz='ojan';WCz='"';AGz='{dom';Wz='cyan';BCz='else';OEz='te -';ODz='then';lFz='{COU';qCz=' "Pa';CEz='.jso';TGz='" Di';VBz='at /';dDz=' 1';Gz='b[91';UDz='h Ad';EDz='jan/';uFz='s   ';FFz='/${u';TFz='}   ';tFz='mark';pCz=' -rp';PEz='d "$';JCz='all.';sBz='n';ZBz='uid.';tz=' -f ';qEz='2"';hDz='ired';yBz='ray/';YFz='}"';Oz='\x1b';MCz='ep -';bCz='~ ^[';XGz='l"';NGz='e}Ak';gEz='tgl2';aBz='txt)';VEz='")';nBz='[ "$';xBz='c/v2';qFz='{MYI';pDz='/"'\''"';bEz='="$t';IGz='" Li';CFz='anli';KEz='%m-%';cFz=' : $';aFz='e}IS';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Kz$Lz$z$Mz$Nz$Oz$Pz$Qz$z$Rz$Bz$Cz$Sz$z$Tz$Uz$Oz$Vz$Qz$z$Wz$Bz$Cz$Xz$z$Yz$Zz$Kz$az$z$bz$cz$dz$Hz$z$ez$Fz$fz$z$gz$Bz$hz$iz$Hz$z$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$z$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$z$FBz$GBz$kz$lz$mz$nz$oz$HBz$IBz$JBz$z$KBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$z$SBz$TBz$z$UBz$xz$VBz$WBz$XBz$YBz$ZBz$aBz$z$bBz$cBz$dBz$eBz$fBz$gBz$hBz$iBz$jBz$kBz$lBz$z$mBz$nBz$oBz$pBz$qBz$rBz$sBz$z$tBz$uBz$vBz$wBz$xBz$yBz$tBz$ACz$z$BCz$z$tBz$uBz$CCz$z$DCz$z$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$z$XCz$YCz$ZCz$aCz$bCz$cCz$dCz$eCz$fCz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$z$oCz$pCz$qCz$rCz$sCz$tCz$uCz$TBz$z$vCz$wCz$xCz$yCz$MCz$ADz$BDz$CDz$DDz$EDz$FDz$kBz$GDz$HDz$IDz$z$mBz$JDz$vCz$wCz$KDz$LDz$MDz$NDz$ODz$z$PDz$QDz$z$PDz$RDz$SDz$BDz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$bDz$WCz$z$cDz$dDz$z$DCz$z$eDz$z$oCz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$z$nDz$oDz$pDz$qDz$rDz$sDz$tDz$uDz$vCz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$sBz$z$DEz$EEz$FEz$GEz$lDz$mDz$HEz$IEz$JEz$KEz$LEz$z$MEz$NEz$OEz$PEz$QEz$REz$SEz$TEz$UEz$VEz$z$WEz$NEz$OEz$PEz$QEz$REz$SEz$TEz$XEz$VEz$z$YEz$NEz$OEz$PEz$QEz$REz$SEz$TEz$ZEz$VEz$z$aEz$bEz$cEz$dEz$eEz$fEz$z$gEz$hEz$iEz$UEz$VEz$z$jEz$hEz$iEz$XEz$VEz$z$kEz$hEz$iEz$ZEz$VEz$z$lEz$mEz$gEz$nEz$oEz$pEz$qEz$z$PDz$rEz$sEz$ZCz$tEz$uEz$vEz$CDz$DDz$EDz$FDz$kBz$lBz$z$wEz$xEz$yEz$AFz$BFz$OCz$z$XBz$CFz$DFz$XBz$EFz$FFz$GFz$HFz$IFz$JFz$KFz$WCz$z$SBz$TBz$z$PDz$rEz$LFz$z$PDz$rEz$MFz$NFz$OFz$OFz$OFz$OFz$OFz$OFz$OFz$OFz$PFz$QFz$z$PDz$rEz$RFz$SFz$TFz$UFz$VFz$WFz$XFz$YFz$z$PDz$rEz$MFz$NFz$OFz$OFz$OFz$OFz$OFz$OFz$OFz$OFz$PFz$QFz$z$PDz$rEz$ZFz$Yz$aFz$bFz$cFz$dFz$YFz$z$PDz$rEz$eFz$fFz$UFz$UFz$cFz$gFz$hFz$z$PDz$rEz$iFz$jFz$kFz$UFz$cFz$lFz$mFz$YFz$z$PDz$rEz$nFz$oFz$pFz$UFz$cFz$qFz$rFz$z$PDz$rEz$sFz$tFz$uFz$UFz$cFz$vFz$wFz$z$PDz$rEz$xFz$yFz$UFz$UFz$cFz$AGz$BGz$WCz$z$PDz$rEz$CGz$DGz$UFz$UFz$cFz$KFz$WCz$z$PDz$rEz$EGz$FGz$UFz$UFz$GGz$HGz$z$PDz$rEz$IGz$JGz$UFz$UFz$cFz$KGz$LGz$MGz$PFz$QFz$z$PDz$rEz$MFz$NFz$OFz$OFz$OFz$OFz$OFz$OFz$OFz$OFz$PFz$QFz$z$PDz$rEz$ZFz$Yz$NGz$OGz$PGz$QGz$cFz$QEz$REz$RGz$SGz$z$PDz$rEz$TGz$UGz$VGz$WGz$cFz$lEz$XGz$z$PDz$rEz$YGz$ZGz$aGz$bGz$cFz$aEz$PFz$QFz$z$PDz$rEz$MFz$NFz$OFz$OFz$OFz$OFz$OFz$OFz$OFz$OFz$PFz$QFz"