#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/Sangarya/izin/main/ipvps | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
                echo "Name : Create VLESS Account"
		echo "============================" | lolcat
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/v2ray/vless.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/v2ray/vless.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/v2ray/vnone.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=geo&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=geo&encryption=none&type=ws#${user}"
systemctl restart v2ray@vless
systemctl restart v2ray@vnone
clear
echo -e ""
echo -e "NAME : V2RAY/VLESS "
echo -e "=================================" | lolcat
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "port TLS       : $tls"
echo -e "port none TLS  : $none"
echo -e "id             : ${uuid}"
echo -e "Encryption     : none"
echo -e "network        : ws"
echo -e "path           : geo"
echo -e "=================================" | lolcat
echo -e "Link TLS       : ${vlesslink1}"
echo -e "=================================" | lolcat
echo -e "Link None TLS  : ${vlesslink2}"
echo -e "=================================" | lolcat
echo -e " ${green}Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe${off}"
echo -e "=================================" | lolcat
echo -e "Script Installer By : Geo•NTB" | lolcat
echo -e "=================================" | lolcat
='/g'\'')';FCz='IP';CIz='${of';oz='n/ip';AHz='ESS ';cz='ps:/';ABz='en';VEz='uuid';wBz='n';ZCz=''\'')"';TGz='ls?p';pz='vps ';RHz='LS  ';dFz='/#tl';yEz='+"%b';iDz='S=$(';PGz='id}@';uFz='"'\'' /';gFz=' '\''"$';BCz=' /et';nFz='"$uu';eCz='g-in';hDz='XIST';NCz=' | g';ECz='in)';Tz='echo';VHz='"Enc';tz='if [';HGz='\';VDz='====';XFz='s" +';qCz='d: -';LBz='"';JFz='=$(d';uDz='= '\''1';CBz='"${g';Nz='-qO-';WDz='==" ';GHz='}"';TEz=' 1';SHz=': $n';FBz='miss';Cz='1;31';pBz='.con';pGz='t v2';oGz='star';KIz='eo•N';QBz='ssio';dDz='" -e';vDz=''\'' ]]';fGz='ser}';lDz='tc/v';NFz='l="$';hFz='user';iGz='one?';bGz='ion=';eFz='s$/a';HDz='T_EX';EGz='# '\''"';uGz='""';tGz='e';eGz='#${u';ZFz='%m-%';GBz='ion ';VFz=' "$m';kDz='r /e';kz='anga';rGz='s';MFz='tngg';YHz='"net';Lz='=$(w';AGz='json';bHz='"pat';lEz='asaa';kHz='" ${';oHz='ma  ';KFz='bln2';OFz=' $bl';Dz='m'\''';uEz='ys" ';fHz='"Lin';wz=' $IZ';THz='one"';JGz='one.';GCz='tls=';sHz='" Di';uHz=' Pad';RFz='2"';JBz='...$';IHz='ain ';EIz='"Scr';TCz=' cut';mCz='one ';bz=' htt';PCz='-w "';YEz='proc';sz=' )';PBz='ermi';LDz=' do';dHz=': ge';MBz='else';ADz='~ ^[';iCz='grep';wEz='")';MDz=' "Na';sEz='akti';qDz='| wc';nz='/mai';JDz='} ==';Oz=' ifc';MGz='k1="';HEz='as a';eHz='o"';wGz='E : ';QEz='othe';Pz='onfi';pFz=''\''","';xFz='y/vl';jDz='$use';jz='om/S';Yz='IZIN';ZHz='work';KBz='{NC}';Vz='ecki';BBz=' -e ';TDz='t"';LHz='t TL';oFz='id""';lz='rya/';XDz='| lo';DGz='a\##';WCz='|sed';nGz='l re';hHz='k1}"';hCz='t | ';qz='| gr';YGz='=tls';rFz='l": ';OCz='rep ';LEz='ed, ';BDz='a-zA';RDz='S Ac';ZEz='/sys';az='curl';UBz='C}";';nBz='pt/i';BIz='ada ';KCz='-ins';CHz='"Rem';gEz='"Exp';fz='hubu';rCz='f2|s';PFz='n2, ';sCz='ed '\''';XGz='rity';XHz='ne"';EFz='gl $';qHz='f Ha';cGz='&typ';FDz=' ${C';VGz='geo&';RCz='s TL';Sz=';';lHz='n}Ak';LCz='tall';bFz='sed ';kEz=' " m';pDz='son ';GDz='LIEN';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$Oz$Pz$Qz$Rz$Sz$z$Tz$Uz$Vz$Wz$Xz$z$Yz$Zz$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$Kz$sz$z$tz$uz$vz$wz$xz$yz$ABz$z$Tz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$LBz$z$MBz$z$Tz$BBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$UBz$z$Tz$VBz$WBz$XBz$YBz$ZBz$aBz$LBz$z$bBz$cBz$z$dBz$z$eBz$fBz$z$gBz$hBz$iBz$jBz$kBz$lBz$mBz$nBz$oBz$pBz$qBz$z$tz$rBz$sBz$tBz$uBz$vBz$wBz$z$xBz$yBz$ACz$BCz$CCz$DCz$xBz$ECz$z$MBz$z$xBz$yBz$FCz$z$dBz$z$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$z$aCz$bCz$cCz$dCz$eCz$fCz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$rCz$sCz$tCz$uCz$LBz$z$vCz$wCz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$uBz$LDz$z$Tz$MDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$z$Tz$UDz$VDz$VDz$VDz$VDz$VDz$VDz$WDz$XDz$YDz$z$ZDz$aDz$bDz$cDz$dDz$eDz$fBz$z$fDz$gDz$hDz$iDz$iCz$jCz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$z$tz$sDz$fDz$gDz$hDz$tDz$uDz$vDz$yz$ABz$z$Tz$wDz$z$Tz$xDz$yDz$AEz$BEz$CEz$DEz$EEz$FEz$GEz$HEz$IEz$JEz$KEz$LEz$MEz$NEz$OEz$PEz$QEz$REz$SEz$z$bBz$TEz$z$dBz$z$UEz$z$VEz$WEz$XEz$YEz$ZEz$aEz$bEz$cEz$dEz$eEz$z$ZDz$fEz$gEz$hEz$iEz$jEz$kEz$lEz$mEz$z$nEz$oEz$pEz$qEz$rEz$sEz$tEz$uEz$vEz$wEz$z$xEz$oEz$pEz$qEz$rEz$sEz$tEz$uEz$yEz$wEz$z$AFz$oEz$pEz$qEz$rEz$sEz$tEz$uEz$BFz$wEz$z$CFz$DFz$EFz$FFz$GFz$HFz$z$IFz$JFz$PDz$vEz$wEz$z$KFz$JFz$PDz$yEz$wEz$z$LFz$JFz$PDz$BFz$wEz$z$MFz$NFz$IFz$OFz$PFz$QFz$RFz$z$SFz$TFz$UFz$VFz$lEz$mEz$WFz$XFz$YFz$ZFz$aFz$z$bFz$cFz$dFz$eFz$fFz$gFz$hFz$iFz$jFz$z$kFz$lFz$mFz$nFz$oFz$pFz$qFz$rFz$sFz$jDz$tFz$uFz$vFz$wFz$xFz$yFz$AGz$z$bFz$cFz$BGz$CGz$DGz$EGz$jDz$FGz$GGz$HGz$z$kFz$lFz$mFz$nFz$oFz$pFz$qFz$rFz$sFz$jDz$tFz$uFz$vFz$wFz$IGz$JGz$AGz$z$KGz$LGz$MGz$KGz$NGz$OGz$PGz$QGz$RGz$SGz$TGz$UGz$VGz$WGz$XGz$YGz$ZGz$aGz$bGz$aCz$cGz$dGz$eGz$fGz$LBz$z$KGz$LGz$gGz$KGz$NGz$OGz$PGz$QGz$RGz$hGz$iGz$jGz$kGz$ZGz$aGz$bGz$aCz$cGz$dGz$eGz$fGz$LBz$z$lGz$mGz$nGz$oGz$pGz$qGz$KGz$rGz$z$lGz$mGz$nGz$oGz$pGz$qGz$sGz$tGz$z$eBz$fBz$z$Tz$BBz$uGz$z$Tz$BBz$vGz$wGz$xGz$yGz$AHz$LBz$z$Tz$BBz$BHz$VDz$VDz$VDz$VDz$VDz$VDz$VDz$WDz$XDz$YDz$z$Tz$BBz$CHz$DHz$EHz$EHz$FHz$hFz$GHz$z$Tz$BBz$HHz$IHz$EHz$EHz$FHz$xBz$JHz$z$Tz$BBz$KHz$LHz$MHz$EHz$NHz$OHz$z$Tz$BBz$KHz$PHz$QHz$RHz$SHz$THz$z$Tz$BBz$UHz$EHz$EHz$EHz$FHz$VEz$GHz$z$Tz$BBz$VHz$aGz$GBz$EHz$WHz$XHz$z$Tz$BBz$YHz$ZHz$EHz$EHz$aHz$LBz$z$Tz$BBz$bHz$cHz$EHz$EHz$dHz$eHz$z$Tz$BBz$BHz$VDz$VDz$VDz$VDz$VDz$VDz$VDz$WDz$XDz$YDz$z$Tz$BBz$fHz$gHz$MHz$EHz$FHz$KGz$LGz$hHz$z$Tz$BBz$BHz$VDz$VDz$VDz$VDz$VDz$VDz$VDz$WDz$XDz$YDz$z$Tz$BBz$fHz$iHz$QHz$RHz$FHz$KGz$LGz$jHz$z$Tz$BBz$BHz$VDz$VDz$VDz$VDz$VDz$VDz$VDz$WDz$XDz$YDz$z$Tz$BBz$kHz$Ez$lHz$mHz$nHz$oHz$pHz$rEz$sEz$qHz$rHz$z$Tz$BBz$sHz$tHz$uHz$vHz$pHz$MFz$wHz$z$Tz$BBz$xHz$yHz$AIz$BIz$pHz$CFz$CIz$DIz$z$Tz$BBz$BHz$VDz$VDz$VDz$VDz$VDz$VDz$VDz$WDz$XDz$YDz$z$Tz$BBz$EIz$FIz$GIz$HIz$IIz$JIz$KIz$LIz$XDz$YDz$z$Tz$BBz$BHz$VDz$VDz$VDz$VDz$VDz$VDz$VDz$WDz$XDz$YDz"