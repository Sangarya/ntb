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
lastport1=$(grep "port_tls" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport2=$(grep "port_http" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
if [[ $lastport1 == '' ]]; then
tls=2443
else
tls="$((lastport1+1))"
fi
if [[ $lastport2 == '' ]]; then
http=3443
else
http="$((lastport2+1))"
fi
echo ""
#echo "Masukkan password"

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Password: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/shadowsocks-libev/akun.conf | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Nama User Sudah Ada, Harap Masukkan Nama Lain!"
			exit 1
		fi
	done
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
cat > /etc/shadowsocks-libev/$user-tls.json<<END
{   
    "server":"0.0.0.0",
    "server_port":$tls,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "no_delay":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"obfs-server",
    "plugin_opts":"obfs=tls"
}
END
cat > /etc/shadowsocks-libev/$user-http.json <<-END
{
    "server":"0.0.0.0",
    "server_port":$http,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "no_delay":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"obfs-server",
    "plugin_opts":"obfs=http"
}
END
chmod +x /etc/shadowsocks-libev/$user-tls.json
chmod +x /etc/shadowsocks-libev/$user-http.json

systemctl start shadowsocks-libev-server@$user-tls.service
systemctl enable shadowsocks-libev-server@$user-tls.service
systemctl start shadowsocks-libev-server@$user-http.service
systemctl enable shadowsocks-libev-server@$user-http.service
tmp1=$(echo -n "aes-256-cfb:${user}@${domain}:$tls" | base64 -w0)
tmp2=$(echo -n "aes-256-cfb:${user}@${domain}:$http" | base64 -w0)
linkss1="ss://${tmp1}?plugin=obfs-local;obfs=tls;obfs-host=bug-anda.com"
linkss2="ss://${tmp2}?plugin=obfs-local;obfs=http;obfs-host=bug-anda.com"
echo -e "### $user $exp
port_tls $tls
port_http $http">>"/etc/shadowsocks-libev/akun.conf"
service cron restart
clear
echo -e ""
echo -e "${red}===================================${off}"
echo -e "${white}  SHADOWSOCKS OBFS${off}"
echo -e "${red}===================================${off}"
echo -e " ${white}ISP    : $ISP"
echo -e " CITY           : $CITY"
echo -e " COUNTRY        : $COUNTRY"
echo -e " Server IP      : $MYIP"
echo -e " Server Host    : $domain"
echo -e " OBFS TLS       : $tls"
echo -e " OBFS HTTP      : $http"
echo -e " Password       : $user"
echo -e " Method         : aes-256-cfb${off}"
echo -e "${red}===================================${off}"
echo -e "${white}OBFS  TLS${off}"
echo -e "$linkss1" | lolcat
echo -e "${red}===================================${off}"
echo -e "${white}OBFS HTTP${off}"
echo -e "$linkss2" | lolcat
echo -e "${red}===================================${off}"
echo -e " ${white}Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe${off}"
echo -e "${red}=================================${off}"
echo -e ""
;tEz='+"%d';QCz='k '\''{';GHz='ev-s';XDz=' '\''0'\''';jGz='s.js';yEz='+"%Y';JJz='FS T';qBz='c/v2';Mz='yell';mFz='eout';dIz='ed}=';fDz=' use';SGz='erve';MDz='er =';EEz=' "Na';dJz='cat';Yz='whit';CFz='gl $';yBz='1=$(';QHz='cho ';xJz='f}"';EDz='tpor';jEz='%m-%';vz=' )';SJz=' : a';rDz='ibev';gEz=' day';bCz='bev/';Pz='[93m';iHz='0)';Ez='red=';rIz='e}IS';wFz='t_op';rGz='art ';VEz='"Exp';gCz=' | a';XJz='S  T';FDz='t2+1';xz='=$(c';uEz='")';GEz='ser ';iEz='"%Y-';GJz='t   ';mGz='tp.j';OBz=' ipi';jIz='}  S';LIz='er $';TIz='etc/';Jz='n='\''\';pEz='masa';mIz='KS O';kDz=' -w ';tFz='6-cf';mz='s ip';lJz='f Ha';vGz='libe';SHz='aes-';az='37m'\''';LEz=' Mas';pIz='}"';cFz='0.0.';KJz='LS  ';eBz='f';hHz='4 -w';RFz='cat ';YCz='adow';rJz='l"';IGz='8",';gIz='off}';hDz='NT_E';PEz='ain!';HHz='r@$u';SEz=' 1';JEz='a, H';WFz='son<';pBz=' /et';NDz='~ ^[';tz=' -f ';aFz='ver"';fJz='TP${';CDz='="$(';lDz='$use';aEz='asaa';lGz='r-ht';AIz='com"';qGz='l st';lIz='WSOC';bHz='se64';kFz='r",';gz='flag';AEz='= '\''1';bFz=':"0.';ZFz='"ser';qIz='" ${';kEz='d"`';rHz='cal;';tJz='rakh';hEz='s" +';EIz='fs-h';hJz='e}Ak';rBz='ray/';qHz='s-lo';kz='$(cu';BHz='ervi';tHz='=tls';FBz='COUN';mEz='$(da';EBz='y )';xCz='ort2';gHz='ase6';lHz='"ss:';TEz='done';aBz='scri';kBz=' the';PBz='nfo.';XCz='c/sh';HEz='Suda';LCz='conf';FEz='ma U';VJz='fb${';CIz='=htt';YJz='LS${';VHz='${us';XFz='<END';Tz='purp';UCz='2=$(';CBz='o.io';IHz='ser-';iDz='XIST';iBz='= ""';fCz=' -n1';cIz='"${r';rz='t -d';tGz='owso';cDz='sswo';hFz='"pas';rEz='f da';YEz='ri):';cJz=' lol';iGz='r-tl';AHz='ls.s';vEz='bln=';dDz='rd: ';Xz='6m'\''';sGz='shad';pGz='emct';XHz='${do';uHz=';obf';qJz='a   ';jz='ISP=';KEz='arap';YFz='{';HIz='anda';VIz='un.c';QFz='2"';gJz='2" |';Dz='0m'\''';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Kz$Lz$z$Mz$Nz$Oz$Pz$Qz$z$Rz$Bz$Cz$Sz$z$Tz$Uz$Oz$Vz$Qz$z$Wz$Bz$Cz$Xz$z$Yz$Zz$Kz$az$z$bz$cz$dz$Hz$z$ez$Fz$fz$z$gz$Bz$hz$iz$Hz$z$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$z$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$z$FBz$GBz$kz$lz$mz$nz$oz$HBz$IBz$JBz$z$KBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$z$SBz$TBz$z$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$z$fBz$gBz$hBz$iBz$jBz$kBz$lBz$z$mBz$nBz$oBz$pBz$qBz$rBz$mBz$sBz$z$tBz$z$mBz$nBz$uBz$z$vBz$z$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$z$wBz$xBz$UCz$ACz$BCz$VCz$WCz$pBz$XCz$YCz$ZCz$aCz$bCz$cCz$dBz$dCz$eCz$fCz$gCz$hCz$iCz$jCz$kCz$z$fBz$lCz$mCz$nCz$oCz$pCz$qCz$rCz$z$sCz$tCz$z$tBz$z$sCz$uCz$wBz$xBz$vCz$wCz$z$vBz$z$fBz$lCz$mCz$xCz$oCz$pCz$qCz$rCz$z$yCz$ADz$BDz$z$tBz$z$yCz$CDz$DDz$EDz$FDz$GDz$z$vBz$z$HDz$IDz$z$JDz$KDz$LDz$MDz$NDz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$WDz$XDz$jBz$YDz$z$ZDz$aDz$bDz$cDz$dDz$eDz$fDz$TBz$z$gDz$hDz$iDz$jDz$ACz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$z$fBz$xDz$gDz$hDz$iDz$yDz$AEz$BEz$CEz$DEz$z$HDz$IDz$z$HDz$EEz$FEz$GEz$HEz$IEz$JEz$KEz$LEz$MEz$NEz$OEz$PEz$QEz$z$REz$SEz$z$vBz$z$TEz$z$ZDz$UEz$VEz$WEz$XEz$YEz$ZEz$aEz$bEz$z$cEz$dEz$eEz$fEz$aEz$bEz$gEz$hEz$iEz$jEz$kEz$z$lEz$mEz$nEz$oEz$pEz$qEz$rEz$sEz$tEz$uEz$z$vEz$mEz$nEz$oEz$pEz$qEz$rEz$sEz$wEz$uEz$z$xEz$mEz$nEz$oEz$pEz$qEz$rEz$sEz$yEz$uEz$z$AFz$BFz$CFz$DFz$EFz$FFz$z$GFz$HFz$IFz$tEz$uEz$z$JFz$HFz$IFz$wEz$uEz$z$KFz$HFz$IFz$yEz$uEz$z$LFz$MFz$GFz$NFz$OFz$PFz$QFz$z$RFz$SFz$nDz$oDz$pDz$qDz$rDz$TFz$UFz$VFz$WFz$XFz$z$YFz$z$ZFz$aFz$bFz$cFz$dFz$z$ZFz$eFz$xBz$fFz$gFz$z$hFz$iFz$jFz$lDz$kFz$z$lFz$mFz$nFz$oFz$z$pFz$qFz$rFz$sFz$tFz$uFz$z$vFz$wFz$xFz$yFz$oFz$z$AGz$BGz$CGz$DGz$z$EGz$FGz$aFz$GGz$HGz$IGz$z$JGz$KGz$LGz$MGz$NGz$oFz$z$OGz$PGz$QGz$RGz$SGz$kFz$z$OGz$TGz$UGz$VGz$WGz$XGz$z$YGz$z$ZGz$z$RFz$SFz$nDz$oDz$pDz$qDz$rDz$TFz$aGz$bGz$cGz$dGz$ZGz$z$YFz$z$ZFz$aFz$bFz$cFz$dFz$z$ZFz$eFz$xBz$eGz$fGz$z$hFz$iFz$jFz$lDz$kFz$z$lFz$mFz$nFz$oFz$z$pFz$qFz$rFz$sFz$tFz$uFz$z$vFz$wFz$xFz$yFz$oFz$z$AGz$BGz$CGz$DGz$z$EGz$FGz$aFz$GGz$HGz$IGz$z$JGz$KGz$LGz$MGz$NGz$oFz$z$OGz$PGz$QGz$RGz$SGz$kFz$z$OGz$TGz$UGz$VGz$WGz$yCz$QEz$z$YGz$z$ZGz$z$gGz$hGz$pBz$XCz$YCz$ZCz$aCz$bCz$lDz$iGz$jGz$kGz$z$gGz$hGz$pBz$XCz$YCz$ZCz$aCz$bCz$lDz$lGz$mGz$nGz$z$oGz$pGz$qGz$rGz$sGz$tGz$uGz$vGz$wGz$xGz$yGz$UFz$AHz$BHz$CHz$z$oGz$pGz$DHz$EHz$FHz$GCz$HCz$ICz$GHz$SGz$HHz$IHz$JHz$KHz$LHz$z$oGz$pGz$qGz$rGz$sGz$tGz$uGz$vGz$wGz$xGz$yGz$aGz$bGz$KHz$LHz$z$oGz$pGz$DHz$EHz$FHz$GCz$HCz$ICz$GHz$SGz$HHz$IHz$yCz$MHz$NHz$z$OHz$PHz$QHz$RHz$SHz$THz$UHz$VHz$WHz$XHz$YHz$ZHz$DCz$aHz$bHz$cHz$JBz$z$dHz$PHz$QHz$RHz$SHz$THz$UHz$VHz$WHz$XHz$YHz$eHz$WCz$fHz$gHz$hHz$iHz$z$jHz$kHz$lHz$mHz$OHz$nHz$oHz$pHz$qHz$rHz$sHz$tHz$uHz$vHz$wHz$xHz$yHz$AIz$z$jHz$BIz$lHz$mHz$dHz$nHz$oHz$pHz$qHz$rHz$sHz$CIz$DIz$EIz$FIz$GIz$HIz$IIz$QEz$z$HDz$JIz$KIz$LDz$LIz$MIz$z$xBz$NIz$OIz$PIz$z$xBz$QIz$RIz$WCz$SIz$TIz$sGz$tGz$uGz$vGz$UIz$VIz$WIz$z$KHz$XIz$YIz$ZIz$aIz$z$SBz$TBz$z$HDz$JIz$bIz$z$HDz$JIz$cIz$dIz$eIz$eIz$eIz$eIz$eIz$eIz$eIz$eIz$fIz$gIz$QEz$z$HDz$JIz$hIz$iIz$jIz$kIz$lIz$mIz$nIz$oIz$pIz$z$HDz$JIz$cIz$dIz$eIz$eIz$eIz$eIz$eIz$eIz$eIz$eIz$fIz$gIz$QEz$z$HDz$JIz$qIz$Yz$rIz$sIz$tIz$uIz$z$HDz$JIz$vIz$wIz$xIz$xIz$tIz$wz$QEz$z$HDz$JIz$yIz$AJz$BJz$xIz$tIz$FBz$CJz$z$HDz$JIz$DJz$xGz$EJz$xIz$tIz$KBz$QEz$z$HDz$JIz$DJz$xGz$FJz$GJz$tIz$mBz$HJz$z$HDz$JIz$IJz$JJz$KJz$xIz$tIz$XGz$z$HDz$JIz$IJz$LJz$MJz$xIz$tIz$yCz$QEz$z$HDz$JIz$NJz$cDz$OJz$xIz$tIz$PJz$QEz$z$HDz$JIz$QJz$RJz$xIz$xIz$SJz$TJz$UJz$VJz$gIz$QEz$z$HDz$JIz$cIz$dIz$eIz$eIz$eIz$eIz$eIz$eIz$eIz$eIz$fIz$gIz$QEz$z$HDz$JIz$hIz$iIz$WJz$XJz$YJz$gIz$QEz$z$HDz$JIz$ZJz$aJz$bJz$cJz$dJz$z$HDz$JIz$cIz$dIz$eIz$eIz$eIz$eIz$eIz$eIz$eIz$eIz$fIz$gIz$QEz$z$HDz$JIz$hIz$iIz$WJz$eJz$fJz$gIz$QEz$z$HDz$JIz$ZJz$aJz$gJz$cJz$dJz$z$HDz$JIz$cIz$dIz$eIz$eIz$eIz$eIz$eIz$eIz$eIz$eIz$fIz$gIz$QEz$z$HDz$JIz$qIz$Yz$hJz$iJz$jJz$kJz$tIz$pEz$qEz$lJz$mJz$z$HDz$JIz$nJz$oJz$pJz$qJz$tIz$LFz$rJz$z$HDz$JIz$sJz$tJz$uJz$vJz$tIz$AFz$wJz$xJz$z$HDz$JIz$cIz$dIz$eIz$eIz$eIz$eIz$eIz$eIz$eIz$eIz$wJz$xJz$z$HDz$JIz$bIz"