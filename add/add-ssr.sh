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

read -e -p "Username :" ssr_user
CLIENT_EXISTS=$(grep -w $ssr_user /usr/local/shadowsocksr/akun.conf | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo ""
echo "Nama User Sudah Ada, Harap Masukkan Nama Lain!"
exit 1
fi
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
lastport=$(cat /usr/local/shadowsocksr/mudb.json | grep '"port": ' | tail -n1 | awk '{print $2}' | cut -d "," -f 1 | cut -d ":" -f 1 )
if [[ $lastport == '' ]]; then
ssr_port=1443
else
ssr_port=$((lastport+1))
fi
ssr_password="$ssr_user"
ssr_method="aes-256-cfb"
ssr_protocol="origin"
ssr_obfs="tls1.2_ticket_auth_compatible"
ssr_protocol_param="2"
ssr_speed_limit_per_con=0
ssr_speed_limit_per_user=0
ssr_transfer="838868"
ssr_forbid="bittorrent"
cd /usr/local/shadowsocksr
match_add=$(python mujson_mgr.py -a -u "${ssr_user}" -p "${ssr_port}" -k "${ssr_password}" -m "${ssr_method}" -O "${ssr_protocol}" -G "${ssr_protocol_param}" -o "${ssr_obfs}" -s "${ssr_speed_limit_per_con}" -S "${ssr_speed_limit_per_user}" -t "${ssr_transfer}" -f "${ssr_forbid}"|grep -w "add user info")
cd
echo -e "${Info} Penambahan user berhasil [username: ${ssr_user}]"
echo -e "### $ssr_user $exp" >> /usr/local/shadowsocksr/akun.conf
tmp1=$(echo -n "${ssr_password}" | base64 -w0 | sed 's/=//g;s/\//_/g;s/+/-/g')
SSRobfs=$(echo ${ssr_obfs} | sed 's/_compatible//g')
tmp2=$(echo -n "$MYIP:${ssr_port}:${ssr_protocol}:${ssr_method}:${SSRobfs}:${tmp1}/obfsparam=" | base64 -w0)
ssr_link1="ssr://${tmp1}"
ssr_link2="ssr://${tmp2}"
/etc/init.d/ssrmu restart
service cron restart
clear
echo -e ""
echo -e "${red}=================================${off}"
echo -e "${blue}   SHADOWSOCKSR SSR${off}"
echo -e "${red}=================================${off}"
echo -e " ${white}ISP   : $ISP"
echo -e " CITY          : $CITY"
echo -e " COUNTRY       : $COUNTRY"
echo -e " Server IP     : ${MYIP}"
echo -e " Host          : ${domain}"
echo -e " Port          : ${ssr_port}"
echo -e " Password      : ${ssr_password}"
echo -e " Encryption    : ${ssr_method}"
echo -e " Protocol      : ${ssr_protocol}"
echo -e " Obfs          : ${ssr_obfs}"
echo -e " Device limit  : ${ssr_protocol_param}${off}"
echo -e "${red}=================================${off}"
echo -e "${white} LINK  SSR${off}"
echo -e "${ssr_link1}" | lolcat
echo -e ""
echo -e "${ssr_link2}" | lolcat
echo -e ""
echo -e "${red}=================================${off}"
echo -e " ${white}Aktif Selama : $masaaktif Hari"
echo -e " Dibuat Pada   : $tnggl"
echo -e " Berakhir Pada : $expe${off}"
echo -e "${red}=================================${off}"
echo -e ""
hn2';FIz='serv';jHz='1}/o';mEz='meth';vDz='usr/';pHz='-w0)';oGz=' >> ';qHz='link';fBz='if [';aJz='Sela';XBz='lib/';JEz=' tai';XDz='bln=';BEz='sr/m';MBz='get ';nGz='exp"';kCz='h Ad';WCz='| wc';YBz='prem';VDz='+"%d';VJz=' lol';CJz='tion';QDz='d "$';aBz='scri';YGz='nfo}';vz=' )';rHz='1="s';fDz=' $th';xFz='G "$';EGz='s "$';FCz='CLIE';kz='$(cu';dHz='}:${';nHz=' bas';eDz='bln,';iz='7;41';sDz='last';ZEz='[ $l';iCz='ser ';YJz='e}Ak';dJz='saak';fGz='sern';UHz='_obf';hCz='ma U';sBz='in)';lEz='ser"';HCz='XIST';YDz='+"%b';YFz='sr';PCz='ocal';kGz='"###';bIz='P   ';Vz='[95m';RBz='p);';WEz=' -d ';gz='flag';hIz=': $C';bEz='ort ';Mz='yell';EHz=' | b';TCz='r/ak';AEz='sock';Hz='m'\''';cBz='pvps';oHz='e64 ';cHz='P:${';QIz='"${b';DCz='ssr_';LBz='=$(w';FDz='`dat';MIz='ed}=';NDz='tgl=';vBz='fi';uz='2-10';eFz='ujso';VBz='ce /';NBz='-qO-';BBz='pinf';ZJz='tif ';aFz='h_ad';IHz='sed ';Oz='\x1b';UFz='bitt';cDz='="$t';PDz='te -';UIz='WSOC';gIz='    ';Nz='ow='\''';aDz='+"%Y';NGz='r_tr';kJz='nggl';SHz='$(ec';SCz='ocks';EBz='y )';VGz='fo")';lCz='a, H';rDz='2"';HHz='0 | ';xIz='" Pa';yDz='adow';cFz='pyth';uBz='IP';gDz='n"';lJz='" Be';lz='rl -';HIz='cron';tFz='{ssr';mIz='OUNT';SEz='d ",';WGz='cd';ez='off=';bGz='han ';oDz=' $bl';WDz='")';Bz='='\''\x';VFz='orre';hJz=' Pad';THz='ho $';eJz='Hari';AGz='toco';eIz='" CI';JIz='tart';jBz=' ]];';uIz='in}"';IBz='try ';kHz='bfsp';Wz='cyan';VEz=' cut';UCz='un.c';wBz='read';mz='s ip';Ez='red=';gJz='buat';IEz=' '\'' |';qBz='c/v2';dCz='en';RFz='8868';OBz=' ipi';rIz=': ${';GIz='ice ';hBz='IP" ';CCz=' :" ';GCz='NT_E';fFz='n_mg';TEz='" -f';bz='bold';fIz='TY  ';tDz='port';WJz='cat';NCz='r /u';vCz=' -p ';GBz='TRY=';NFz='=0';yFz='_pro';hHz='s}:$';dEz='=144';ZCz='S} =';hDz='tgl2';jJz=': $t';ZGz=' Pen';VIz='KSR ';cz='='\''\0';DJz='od}"';Zz='e='\''\';EJz='" Pr';lGz=' $ss';ICz='S=$(';yBz='-p "';jDz='ate ';PFz='sfer';FEz='rep ';Yz='whit';CFz='_com';OIz='${of';xz='=$(c';lFz='er}"';uHz='mp1}';gBz='[ "$';jEz='="$s';eBz='f';mDz='tngg';YCz='[ ${';CDz='asaa';QFz='="83';BFz='auth';jFz='${ss';GGz='ed_l';sz=' " "';NHz=';s/+';sHz='sr:/';YIz='}"';DIz='star';ECz='user';IFz='d_li';SFz='forb';dIz='SP"';MDz='d"`';Gz='b[91';nIz='RY"';mCz='arap';QCz='/sha';DDz='ktif';PHz=''\'')';gGz='ame:';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Kz$Lz$z$Mz$Nz$Oz$Pz$Qz$z$Rz$Bz$Cz$Sz$z$Tz$Uz$Oz$Vz$Qz$z$Wz$Bz$Cz$Xz$z$Yz$Zz$Kz$az$z$bz$cz$dz$Hz$z$ez$Fz$fz$z$gz$Bz$hz$iz$Hz$z$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$z$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$z$FBz$GBz$kz$lz$mz$nz$oz$HBz$IBz$JBz$z$KBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$z$SBz$TBz$z$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$z$fBz$gBz$hBz$iBz$jBz$kBz$lBz$z$mBz$nBz$oBz$pBz$qBz$rBz$mBz$sBz$z$tBz$z$mBz$nBz$uBz$z$vBz$z$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$z$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$z$fBz$YCz$FCz$GCz$HCz$ZCz$aCz$bCz$cCz$dCz$z$eCz$fCz$z$eCz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$rCz$sCz$z$tCz$uCz$z$vBz$z$wBz$vCz$wCz$xCz$yCz$ADz$BDz$CDz$DDz$z$EDz$FDz$GDz$HDz$CDz$DDz$IDz$JDz$KDz$LDz$MDz$z$NDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$WDz$z$XDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$YDz$WDz$z$ZDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$aDz$WDz$z$bDz$cDz$dDz$eDz$fDz$gDz$z$hDz$iDz$jDz$VDz$WDz$z$kDz$iDz$jDz$YDz$WDz$z$lDz$iDz$jDz$aDz$WDz$z$mDz$nDz$hDz$oDz$pDz$qDz$rDz$z$sDz$tDz$xz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$DEz$EEz$FEz$GEz$HEz$IEz$JEz$KEz$LEz$MEz$NEz$OEz$PEz$QEz$REz$SEz$TEz$UEz$VEz$WEz$XEz$YEz$vz$z$fBz$ZEz$aEz$bEz$cEz$bCz$cCz$dCz$z$DCz$tDz$dEz$eEz$z$tBz$z$DCz$tDz$fEz$sDz$tDz$gEz$z$vBz$z$DCz$hEz$iEz$jEz$kEz$lEz$z$DCz$mEz$nEz$oEz$pEz$qEz$z$DCz$rEz$sEz$tEz$uEz$sCz$z$DCz$vEz$wEz$xEz$yEz$AFz$BFz$CFz$DFz$EFz$z$DCz$rEz$sEz$FFz$GFz$rDz$z$DCz$HFz$IFz$JFz$KFz$LFz$MFz$z$DCz$HFz$IFz$JFz$KFz$ECz$NFz$z$DCz$OFz$PFz$QFz$RFz$sCz$z$DCz$SFz$TFz$UFz$VFz$WFz$z$XFz$vDz$wDz$xDz$yDz$AEz$YFz$z$ZFz$aFz$bFz$cFz$dFz$eFz$fFz$gFz$hFz$iFz$jFz$kFz$lFz$vCz$mFz$nFz$oFz$pFz$qFz$DCz$hEz$iEz$rFz$sFz$tFz$uFz$vFz$wFz$qFz$DCz$rEz$sEz$rFz$xFz$tFz$yFz$AGz$BGz$CGz$DGz$qFz$DCz$vEz$rFz$EGz$tFz$FGz$GGz$HGz$IGz$JGz$rFz$KGz$tFz$FGz$GGz$HGz$IGz$MCz$LGz$MGz$jFz$NGz$OGz$lFz$tz$mFz$PGz$QGz$RGz$JCz$KCz$SGz$TGz$UGz$VGz$z$WGz$z$eCz$xBz$XGz$YGz$ZGz$aGz$bGz$ECz$cGz$dGz$eGz$fGz$gGz$hGz$kEz$iGz$jGz$z$eCz$xBz$kGz$lGz$kFz$mGz$nGz$oGz$pGz$qGz$rGz$sGz$tGz$uGz$vGz$dBz$eBz$z$wGz$xGz$yGz$AHz$jFz$BHz$CHz$DHz$EHz$FHz$GHz$HHz$IHz$JHz$KHz$LHz$MHz$NHz$OHz$PHz$z$QHz$RHz$SHz$THz$tFz$UHz$VHz$WHz$XHz$CFz$DFz$YHz$ZHz$z$aHz$xGz$yGz$AHz$bHz$cHz$DCz$tDz$dHz$DCz$rEz$sEz$dHz$DCz$mEz$eHz$fHz$gHz$hHz$iHz$jHz$kHz$lHz$mHz$nHz$oHz$pHz$z$DCz$qHz$rHz$sHz$tHz$uHz$sCz$z$DCz$qHz$vHz$sHz$tHz$wHz$sCz$z$xHz$yHz$AIz$BIz$CIz$DIz$EIz$z$FIz$GIz$HIz$IIz$JIz$z$SBz$TBz$z$eCz$xBz$KIz$z$eCz$xBz$LIz$MIz$NIz$NIz$NIz$NIz$NIz$NIz$NIz$NIz$OIz$PIz$z$eCz$xBz$QIz$RIz$SIz$TIz$UIz$VIz$WIz$XIz$YIz$z$eCz$xBz$LIz$MIz$NIz$NIz$NIz$NIz$NIz$NIz$NIz$NIz$OIz$PIz$z$eCz$xBz$ZIz$Yz$aIz$bIz$cIz$dIz$z$eCz$xBz$eIz$fIz$gIz$gIz$hIz$iIz$z$eCz$xBz$jIz$kIz$lIz$gIz$hIz$mIz$nIz$z$eCz$xBz$oIz$pIz$qIz$gIz$rIz$KBz$YIz$z$eCz$xBz$sIz$tIz$gIz$gIz$rIz$mBz$uIz$z$eCz$xBz$vIz$wIz$gIz$gIz$rIz$DCz$tDz$YIz$z$eCz$xBz$xIz$CHz$yIz$gIz$rIz$DCz$hEz$iEz$YIz$z$eCz$xBz$AJz$BJz$CJz$gIz$rIz$DCz$mEz$DJz$z$eCz$xBz$EJz$FJz$GJz$gIz$rIz$DCz$rEz$sEz$YIz$z$eCz$xBz$HJz$IJz$gIz$gIz$rIz$DCz$vEz$YIz$z$eCz$xBz$JJz$KJz$LJz$MJz$rIz$DCz$rEz$sEz$FFz$NJz$XIz$YIz$z$eCz$xBz$LIz$MIz$NIz$NIz$NIz$NIz$NIz$NIz$NIz$NIz$OIz$PIz$z$eCz$xBz$OJz$PJz$QJz$RJz$WIz$XIz$YIz$z$eCz$xBz$mFz$SJz$TJz$UJz$VJz$WJz$z$eCz$xBz$KIz$z$eCz$xBz$mFz$SJz$XJz$UJz$VJz$WJz$z$eCz$xBz$KIz$z$eCz$xBz$LIz$MIz$NIz$NIz$NIz$NIz$NIz$NIz$NIz$NIz$OIz$PIz$z$eCz$xBz$ZIz$Yz$YJz$ZJz$aJz$bJz$cJz$dJz$ZJz$eJz$sCz$z$eCz$xBz$fJz$gJz$hJz$iJz$jJz$kJz$sCz$z$eCz$xBz$lJz$mJz$nJz$oJz$pJz$qJz$XIz$YIz$z$eCz$xBz$LIz$MIz$NIz$NIz$NIz$NIz$NIz$NIz$NIz$NIz$OIz$PIz$z$eCz$xBz$KIz"