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
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
read -rp "Bug: " -e bug
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
user=Trial-`</dev/urandom tr -dc X-Z0-9 | head -c2`
uuid=$(cat /proc/sys/kernel/random/uuid)
tnggl=$(date +"%R")
read -p "Expired (Jam): " ktf
exp=`date -d "$ktf hour" +"%R"`
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
echo -e ""
echo -e "${cyan}=======================${off}"
echo -e "${purple} ~> TRIAL V2RAY VMESS${off}"
echo -e "${cyan}=======================${off}"
echo -e " ${green}ISP            : ${ISP}"
echo -e " CITY           : ${CITY}"
echo -e " COUNTRY        : ${COUNTRY}"
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
echo -e "${cyan}======================${off}"
echo -e "${purple}=> VMESS TLS${off}"
echo -e ""
echo -e "${vmesslink1}"
echo -e ""
echo -e "${cyan}======================${off}"
echo -e "${purple}=> VMESS NON-TLS${off}"
echo -e ""
echo -e "${vmesslink2}"
echo -e ""
echo -e "${cyan}======================${off}"
echo -e " ${green}Aktif Selama   : $ktf Jam"
echo -e "${cyan}======================${off}"
echo -e ""
='EOF';rCz='/g'\'')';lz='rl -';dEz='{';QCz=' cut';WCz=''\'')"';rBz='ray/';Sz='4m'\''';dDz='e -d';IEz='ay/c';YGz='urpl';bHz=' : w';fHz=' : g';TBz='r';EGz='emct';XEz='cat>';OGz='tart';oHz='mess';bz='bold';NCz='Vmes';mDz='\###';PEz='# '\''"';cBz='pvps';bDz='exp=';Mz='yell';jEz='{use';XHz='uto"';kFz='ess_';hDz='R"`';EHz='ain}';nCz='d: -';ZBz='ium-';wGz='s   ';TEz='\';gBz='[ "$';PHz='" Al';AHz='g   ';qFz='s://';yDz=': '\''"';pEz='}",';wz='CITY';Oz='\x1b';hz='1b[4';eCz='t | ';KDz='/sys';FFz='",';cFz='s_ba';WGz='}"';ADz='m tr';oFz='slin';BHz='{bug';gDz='our"';TDz=' +"%';RCz=' -d:';eGz='ESS$';RDz='l=$(';gHz='eo${';dBz='.con';lDz='s$/a';mBz='doma';fBz='if [';NGz=' res';rz='t -d';aBz='scri';QGz='""';XCz='none';GEz='/etc';xBz=' -rp';Nz='ow='\''';fGz='" ${';Qz=''\''';CBz='o.io';tDz='"$uu';uGz='" Re';uDz='id""';SDz='date';dz='33[1';lCz=' | c';XDz='ired';az='37m'\''';DGz='syst';yEz='2",';aHz='k   ';ZGz='e} ~';jHz='e}=>';yCz='ando';xCz='v/ur';VDz=' -p ';tBz='else';SGz='yan}';nz='info';KBz='MYIP';SEz='xp"'\''';FBz='COUN';NFz='"tls';qBz='c/v2';Cz='1b[9';xEz='"aid';VGz='{off';REz='r $e';vEz='{uui';IFz='"non';wEz='d}",';PCz='S" |';OBz=' ipi';HCz='-ins';YHz='" Ne';oDz=' $ex';Zz='e='\''\';TGz='====';vFz='/$us';VBz='ce /';PFz='}';pDz='p"'\''\';jFz=' $vm';RGz='"${c';Bz='='\''\x';RFz='-non';cCz='stal';GHz='rt T';VFz='g}",';iEz=': "$';BGz='er-n';SFz='e.js';NDz='rand';sGz='{COU';SCz=' -f2';sCz='"';KFz='"hos';KGz='serv';OHz='d}"';RBz='p);';ZFz='omai';BCz=' -e ';XGz='"${p';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Kz$Lz$z$Mz$Nz$Oz$Pz$Qz$z$Rz$Bz$Cz$Sz$z$Tz$Uz$Oz$Vz$Qz$z$Wz$Bz$Cz$Xz$z$Yz$Zz$Kz$az$z$bz$cz$dz$Hz$z$ez$Fz$fz$z$gz$Bz$hz$iz$Hz$z$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$z$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$z$FBz$GBz$kz$lz$mz$nz$oz$HBz$IBz$JBz$z$KBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$z$SBz$TBz$z$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$z$fBz$gBz$hBz$iBz$jBz$kBz$lBz$z$mBz$nBz$oBz$pBz$qBz$rBz$mBz$sBz$z$tBz$z$mBz$nBz$uBz$z$vBz$z$wBz$xBz$yBz$ACz$BCz$CCz$z$DCz$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$z$XCz$YCz$ZCz$aCz$bCz$cCz$dCz$eCz$fCz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$rCz$sCz$z$tCz$uCz$vCz$wCz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$FDz$GDz$z$HDz$xz$IDz$JDz$KDz$LDz$MDz$NDz$ODz$PDz$z$QDz$RDz$SDz$TDz$UDz$z$wBz$VDz$WDz$XDz$YDz$ZDz$aDz$eBz$z$bDz$cDz$dDz$eDz$fDz$gDz$TDz$hDz$z$iDz$jDz$kDz$lDz$mDz$nDz$tCz$oDz$pDz$z$qDz$rDz$sDz$tDz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$sDz$DEz$EEz$FEz$GEz$HEz$IEz$JEz$KEz$LEz$z$iDz$jDz$MEz$NEz$OEz$PEz$QEz$REz$SEz$TEz$z$qDz$rDz$sDz$tDz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$sDz$DEz$EEz$FEz$GEz$HEz$UEz$VEz$WEz$z$XEz$GEz$HEz$YEz$tCz$ZEz$aEz$bEz$cEz$z$dEz$z$eEz$fEz$gEz$z$hEz$iEz$jEz$kEz$z$lEz$mEz$nEz$oEz$pEz$z$qEz$rEz$sEz$tEz$gEz$z$uEz$iEz$vEz$wEz$z$xEz$mEz$yEz$z$AFz$mEz$BFz$z$CFz$DFz$EFz$FFz$z$GFz$HFz$IFz$JFz$z$KFz$rEz$LFz$MFz$gEz$z$NFz$mEz$OFz$z$PFz$z$QFz$z$XEz$GEz$HEz$YEz$tCz$RFz$SFz$TFz$QFz$z$dEz$z$eEz$fEz$gEz$z$hEz$iEz$jEz$kEz$z$lEz$mEz$UFz$VFz$z$qEz$rEz$WFz$XFz$FFz$z$uEz$iEz$vEz$wEz$z$xEz$mEz$yEz$z$AFz$mEz$BFz$z$CFz$DFz$EFz$FFz$z$GFz$HFz$IFz$JFz$z$KFz$rEz$YFz$ZFz$aFz$z$NFz$mEz$XCz$sCz$z$PFz$z$QFz$z$bFz$cFz$dFz$eFz$fFz$gFz$hFz$iFz$jFz$kFz$WEz$lFz$z$bFz$cFz$dFz$mFz$fFz$gFz$hFz$iFz$jFz$kFz$WEz$nFz$z$bFz$oFz$pFz$bFz$qFz$rFz$dFz$gCz$sFz$tFz$uFz$vFz$wFz$xFz$yFz$sCz$z$bFz$oFz$AGz$bFz$qFz$rFz$dFz$gCz$sFz$tFz$uFz$vFz$BGz$VEz$WEz$CGz$z$DGz$EGz$FGz$GGz$HGz$IGz$z$DGz$EGz$FGz$GGz$HGz$JGz$XCz$z$KGz$LGz$MGz$NGz$OGz$z$SBz$TBz$z$PGz$BCz$QGz$z$PGz$BCz$RGz$SGz$TGz$TGz$TGz$TGz$TGz$UGz$VGz$WGz$z$PGz$BCz$XGz$YGz$ZGz$aGz$bGz$cGz$dGz$eGz$VGz$WGz$z$PGz$BCz$RGz$SGz$TGz$TGz$TGz$TGz$TGz$UGz$VGz$WGz$z$PGz$BCz$fGz$Iz$gGz$hGz$iGz$iGz$jGz$kGz$WGz$z$PGz$BCz$lGz$mGz$iGz$iGz$jGz$nGz$oGz$z$PGz$BCz$pGz$qGz$rGz$iGz$jGz$sGz$tGz$WGz$z$PGz$BCz$uGz$vGz$wGz$iGz$jGz$jEz$xGz$z$PGz$BCz$yGz$AHz$iGz$iGz$jGz$BHz$WGz$z$PGz$BCz$CHz$oEz$iGz$iGz$jGz$DHz$EHz$sCz$z$PGz$BCz$FHz$GHz$HHz$iGz$jGz$IHz$WGz$z$PGz$BCz$FHz$JHz$KHz$HHz$jGz$LHz$MHz$z$PGz$BCz$NHz$iGz$iGz$iGz$jGz$vEz$OHz$z$PGz$BCz$PHz$QHz$RHz$iGz$SHz$sCz$z$PGz$BCz$THz$UHz$VHz$iGz$WHz$XHz$z$PGz$BCz$YHz$ZHz$aHz$iGz$bHz$cHz$z$PGz$BCz$dHz$eHz$iGz$iGz$fHz$gHz$hHz$sCz$z$PGz$BCz$RGz$SGz$TGz$TGz$TGz$TGz$TGz$iHz$hHz$sCz$z$PGz$BCz$XGz$YGz$jHz$kHz$lHz$mHz$hHz$sCz$z$PGz$BCz$QGz$z$PGz$BCz$nHz$oHz$pHz$qHz$z$PGz$BCz$QGz$z$PGz$BCz$RGz$SGz$TGz$TGz$TGz$TGz$TGz$iHz$hHz$sCz$z$PGz$BCz$XGz$YGz$jHz$kHz$rHz$KHz$mHz$hHz$sCz$z$PGz$BCz$QGz$z$PGz$BCz$nHz$oHz$pHz$sHz$z$PGz$BCz$QGz$z$PGz$BCz$RGz$SGz$TGz$TGz$TGz$TGz$TGz$iHz$hHz$sCz$z$PGz$BCz$fGz$Iz$tHz$uHz$vHz$wHz$jGz$xHz$yHz$z$PGz$BCz$RGz$SGz$TGz$TGz$TGz$TGz$TGz$iHz$hHz$sCz$z$PGz$BCz$QGz"