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
MYIP=$(wget -qO- ipv4.icanhazip.com);
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
read -rp "Bug: " -e bug
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/v2ray/config.json | wc -l)

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
exp=`date -d "$masaaktif days" +"%d-%m-%Y"`
created=`date -d "0 days" +"%d-%m-%Y"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"2"',"email": "'""$user""'"' /etc/v2ray/config.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"2"',"email": "'""$user""'"' /etc/v2ray/none.json
cat>/etc/v2ray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "2",
      "net": "ws",
      "path": "geo",
      "type": "none",
      "host": "${bug}",
      "tls": "tls"
}
EOF
cat>/etc/v2ray/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${bug}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "2",
      "net": "ws",
      "path": "geo",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmesslink1="vmess://$(base64 -w 0 /etc/v2ray/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /etc/v2ray/$user-none.json)"
systemctl restart v2ray
systemctl restart v2ray@none
service cron restart
clear
echo -e "${cyan}=====================${off}"
echo -e " Remarks        : ${user}"
echo -e " Bug            : ${bug}"
echo -e " Domain         : ${domain}"
echo -e " Port TLS       : ${tls}"
echo -e " Port NON-TLS   : ${none}"
echo -e " ID             : ${uuid}"
echo -e " AlterID        : 2"
echo -e " Security       : auto"
echo -e " Network        : ws"
echo -e " Path           : geo${off}"
echo -e "${cyan}=====================${off}"
echo -e "${purple}~> VMESS TLS${off}"
echo -e ""
echo -e "${vmesslink1}"
echo -e ""
echo -e "${cyan}====================${off}"
echo -e "${purple}~> VMESS NON-TLS${off}"
echo -e ""
echo -e "${vmesslink2}"
echo -e ""
echo -e "${cyan}====================${off}"
echo -e " ${green}Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe${off}"
echo -e "${cyan}====================${off}"
echo -e ""
echo -e "Script By Geo.NTB" | lolcat
echo -e ""
   ';IBz='onte';VGz='"ema';bHz='e",';bEz='reat';xBz='or P';HBz='serc';JIz='s://';FDz=''\'')"';jGz='# '\''"';wDz='NT_E';PJz=' : a';cGz='ay/c';ICz='ce /';aFz='=$(d';SCz='[ "$';VIz='l re';Kz='x1b[';BGz='"`';KBz='om/S';cFz='bln2';lIz='mark';bFz='ate ';XBz=' $IZ';HCz='sour';cHz='"hos';gGz='/#no';oCz='/log';fz='b[m'\''';gFz=' $bl';gBz='ion ';ZJz='eo${';YCz='doma';dCz='ray/';MGz='id":';qDz=' do';tIz='}"';jz='MYIP';uIz='" Do';aDz='/g'\'')';vCz='Vmes';VFz='gl $';PHz='d}",';QHz='"aid';KIz='$(ba';Fz=''\''\x1';RIz='er-n';XGz='"$us';kHz='e.js';mGz='\';lHz='on<<';GIz='2)';DJz='ON-T';AHz='"ps"';THz='ws",';HDz='="$(';gJz='LS${';PCz='pvps';DHz='r}",';UBz='if [';CIz=' $vm';hCz=' -rp';YJz=' : g';MBz='rya/';UJz=' : w';pFz='s" +';NGz=' "'\''"';Rz='blue';DGz='-i '\''';NCz='scri';ZHz='e": ';GKz='ada ';ZGz=''\''"'\'' ';uCz='-w "';pHz='one}';TFz='expe';dGz='onfi';qBz='ssio';RGz='alte';HHz='main';jBz='...$';BCz='sers';FJz='e}"';OCz='pt/i';IDz='cat ';YHz='"typ';DFz='asaa';vJz='f Ha';ECz='fi';dIz=' res';QIz='k2="';TGz=': '\''"';gDz='a-zA';JJz='terI';XDz='f2|s';nGz='ay/n';xDz='XIST';hz='1b[4';MJz='" Se';UIz='emct';cJz='urpl';uFz='ted=';TCz='IP" ';MHz='ls}"';XHz='",';vIz='{dom';sz=';';xEz='"Exp';OIz='ls.j';oBz='ed}P';nCz='at ~';SIz=')"';kEz=' 1';lDz='LIEN';IFz='d "$';xFz='" +"';vFz=' "0 ';uGz='OF';KKz='eo.N';CDz='|sed';iHz='EOF';FGz='s$/a';OFz='")';tDz='" -e';fHz='"tls';FCz='clea';Yz='whit';yBz='remi';WCz=' the';mDz='T_EX';Cz='1b[9';hBz='Acce';fJz='SS T';vBz=' "On';rFz='%m-%';lz='get ';hGz='ne$/';SJz='twor';sBz='nied';PGz='id""';WDz='d: -';lBz='"';GHz='${do';VDz='ut -';rz='com)';cCz='c/v2';Vz='[95m';CCz='exit';vGz='{';BHz=': "$';PEz=' "A ';IEz='c -l';WGz='il":';XJz='th  ';oz='4.ic';DEz='2ray';dEz='plea';RFz='thn=';AJz='LS  ';mEz='uuid';IKz='ipt ';wIz='ain}';Nz='ow='\''';dz='33[1';nBz='"${r';cDz='l [[';OHz='{uui';LBz='anga';LCz='prem';Zz='e='\''\';qJz='" ${';kGz='r $e';wEz=' -p ';oHz='"${n';rCz='.txt';YBz='IN ]';DCz=' 0';yDz='S=$(';eGz='g.js';GBz='hubu';TEz='the ';tJz='Sela';yJz='buat';bCz=' /et';fDz='~ ^[';CGz='sed ';ABz='=$( ';pEz='proc';XIz='t v2';iDz='9_]+';EDz=' //g';xGz=' "2"';EBz='/raw';PBz='n/ip';yFz='%d-%';CJz='rt N';cz='='\''\0';AGz='m-%Y';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Kz$Lz$z$Mz$Nz$Oz$Pz$Qz$z$Rz$Bz$Cz$Sz$z$Tz$Uz$Oz$Vz$Qz$z$Wz$Bz$Cz$Xz$z$Yz$Zz$Kz$az$z$bz$cz$dz$Hz$z$ez$Fz$fz$z$gz$Bz$hz$iz$Hz$z$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$z$tz$uz$vz$wz$xz$z$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$jz$TBz$z$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$z$tz$bBz$cBz$dBz$eBz$fBz$gBz$hBz$iBz$jBz$kBz$lBz$z$mBz$z$tz$bBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$z$tz$vBz$wBz$xBz$yBz$ACz$BCz$lBz$z$CCz$DCz$z$ECz$z$FCz$GCz$z$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$z$UBz$SCz$TCz$UCz$VCz$WCz$XCz$z$YCz$ZCz$aCz$bCz$cCz$dCz$YCz$eCz$z$mBz$z$YCz$ZCz$fCz$z$ECz$z$gCz$hCz$iCz$jCz$bBz$kCz$z$lCz$mCz$nCz$oCz$pCz$qCz$rCz$sCz$tCz$uCz$vCz$wCz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$FDz$z$GDz$HDz$IDz$JDz$KDz$LDz$MDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$lBz$z$bDz$cDz$dDz$eDz$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$VCz$qDz$z$gCz$hCz$rDz$sDz$tDz$uDz$GCz$z$vDz$wDz$xDz$yDz$ODz$PDz$AEz$BEz$CEz$DEz$EEz$FEz$GEz$HEz$IEz$JEz$z$UBz$KEz$vDz$wDz$xDz$LEz$MEz$NEz$ZBz$aBz$z$tz$OEz$z$tz$PEz$QEz$REz$SEz$TEz$UEz$VEz$WEz$XEz$YEz$ZEz$aEz$bEz$cEz$dEz$eEz$fEz$gEz$hEz$iEz$jEz$z$CCz$kEz$z$ECz$z$lEz$z$mEz$nEz$oEz$pEz$qEz$rEz$sEz$tEz$uEz$vEz$z$gCz$wEz$xEz$yEz$AFz$BFz$CFz$DFz$EFz$z$FFz$GFz$HFz$IFz$JFz$KFz$LFz$MFz$NFz$OFz$z$PFz$GFz$HFz$IFz$JFz$KFz$LFz$MFz$QFz$OFz$z$RFz$GFz$HFz$IFz$JFz$KFz$LFz$MFz$SFz$OFz$z$TFz$UFz$VFz$WFz$XFz$YFz$z$ZFz$aFz$bFz$NFz$OFz$z$cFz$aFz$bFz$QFz$OFz$z$dFz$aFz$bFz$SFz$OFz$z$eFz$fFz$ZFz$gFz$hFz$iFz$jFz$z$kFz$lFz$mFz$nFz$DFz$EFz$oFz$pFz$qFz$rFz$sFz$z$tFz$uFz$lFz$mFz$vFz$wFz$xFz$yFz$AGz$BGz$z$CGz$DGz$EGz$FGz$GGz$HGz$IGz$JGz$KGz$z$LGz$MGz$NGz$OGz$PGz$QGz$RGz$SGz$TGz$UGz$VGz$WGz$NGz$XGz$YGz$ZGz$aGz$bGz$cGz$dGz$eGz$fGz$z$CGz$DGz$gGz$hGz$iGz$jGz$AEz$kGz$lGz$mGz$z$LGz$MGz$NGz$OGz$PGz$QGz$RGz$SGz$TGz$UGz$VGz$WGz$NGz$XGz$YGz$ZGz$aGz$bGz$nGz$oGz$GEz$z$pGz$aGz$bGz$qGz$IGz$rGz$sGz$tGz$uGz$z$vGz$z$wGz$xGz$yGz$z$AHz$BHz$CHz$DHz$z$EHz$FHz$GHz$HHz$IHz$z$JHz$KHz$LHz$MHz$yGz$z$NHz$BHz$OHz$PHz$z$QHz$FHz$RHz$z$SHz$FHz$THz$z$UHz$VHz$WHz$XHz$z$YHz$ZHz$aHz$bHz$z$cHz$KHz$dHz$eHz$yGz$z$fHz$FHz$gHz$z$hHz$z$iHz$z$pGz$aGz$bGz$qGz$IGz$jHz$kHz$lHz$iHz$z$vGz$z$wGz$xGz$yGz$z$AHz$BHz$CHz$DHz$z$EHz$FHz$mHz$nHz$z$JHz$KHz$oHz$pHz$XHz$z$NHz$BHz$OHz$PHz$z$QHz$FHz$RHz$z$SHz$FHz$THz$z$UHz$VHz$WHz$XHz$z$YHz$ZHz$aHz$bHz$z$cHz$KHz$qHz$rHz$sHz$z$fHz$FHz$GDz$lBz$z$hHz$z$iHz$z$tHz$uHz$vHz$wHz$xHz$yHz$AIz$BIz$CIz$DIz$GEz$EIz$z$tHz$uHz$vHz$FIz$xHz$yHz$AIz$BIz$CIz$DIz$GEz$GIz$z$tHz$HIz$IIz$tHz$JIz$KIz$vHz$PDz$LIz$CEz$DEz$MIz$NIz$OIz$PIz$lBz$z$tHz$HIz$QIz$tHz$JIz$KIz$vHz$PDz$LIz$CEz$DEz$MIz$RIz$oGz$GEz$SIz$z$TIz$UIz$VIz$WIz$XIz$YIz$z$TIz$UIz$VIz$WIz$XIz$ZIz$GDz$z$aIz$bIz$cIz$dIz$eIz$z$FCz$GCz$z$tz$bBz$fIz$gIz$hIz$hIz$hIz$hIz$hIz$iIz$jIz$z$tz$bBz$kIz$lIz$mIz$nIz$oIz$CHz$pIz$z$tz$bBz$qIz$rIz$nIz$nIz$oIz$sIz$tIz$z$tz$bBz$uIz$HHz$nIz$nIz$oIz$vIz$wIz$lBz$z$tz$bBz$xIz$yIz$AJz$nIz$oIz$BJz$tIz$z$tz$bBz$xIz$CJz$DJz$AJz$oIz$EJz$FJz$z$tz$bBz$GJz$nIz$nIz$nIz$oIz$OHz$HJz$z$tz$bBz$IJz$JJz$KJz$nIz$LJz$lBz$z$tz$bBz$MJz$NJz$OJz$nIz$PJz$QJz$z$tz$bBz$RJz$SJz$TJz$nIz$UJz$VJz$z$tz$bBz$WJz$XJz$nIz$nIz$YJz$ZJz$aJz$lBz$z$tz$bBz$fIz$gIz$hIz$hIz$hIz$hIz$hIz$iIz$jIz$z$tz$bBz$bJz$cJz$dJz$eJz$fJz$gJz$aJz$lBz$z$tz$bBz$hJz$z$tz$bBz$iJz$jJz$kJz$lJz$z$tz$bBz$hJz$z$tz$bBz$fIz$gIz$hIz$hIz$hIz$hIz$hIz$mJz$nJz$z$tz$bBz$bJz$cJz$dJz$eJz$oJz$DJz$gJz$aJz$lBz$z$tz$bBz$hJz$z$tz$bBz$iJz$jJz$kJz$pJz$z$tz$bBz$hJz$z$tz$bBz$fIz$gIz$hIz$hIz$hIz$hIz$hIz$mJz$nJz$z$tz$bBz$qJz$Iz$rJz$sJz$tJz$uJz$oIz$JFz$KFz$vJz$wJz$z$tz$bBz$xJz$yJz$AKz$BKz$oIz$eFz$CKz$z$tz$bBz$DKz$EKz$FKz$GKz$oIz$TFz$mJz$nJz$z$tz$bBz$fIz$gIz$hIz$hIz$hIz$hIz$hIz$mJz$nJz$z$tz$bBz$hJz$z$tz$bBz$HKz$IKz$JKz$KKz$LKz$MKz$NKz$z$tz$bBz$hJz"