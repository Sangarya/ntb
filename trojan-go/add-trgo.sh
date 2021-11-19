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
NC='\x1b[m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
COUNTRY=$(curl -s ipinfo.io/country )

MYIP=$(wget -qO- ipinfo.io/ip);
clear
uuid1=$(cat /etc/trojan-go/uuid.txt)
uuid2=$(cat /etc/trojan/uuid.txt)
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
trojango="$(cat ~/log-install.txt | grep -i TrojanGO | cut -d: -f2|sed 's/ //g')"
tr="$(cat ~/log-install.txt | grep -i TrojanGFW | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXIST} && ${user_EXISTS} == '0' ]]; do
		read -rp "Remarks : " -e user
		user_EXIST=$(grep -w $user /etc/trojan-go/akun.conf | wc -l)
        user_EXISTS=$(grep -w $user /etc/trojan/akun.conf | wc -l)
		if [[ ${user_EXIST} == "1" ]] || [[ ${user_EXISTS}  == '1' ]]; then
			echo ""
			echo "Nama User Sudah Ada, Harap Masukkan Nama Lain!"
			exit 1
		fi
	done
users="Trojan-GO_$user"
user2="Trojan-GFW_$user"
read -p "Expired (hari) : " masaaktif
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
sed -i '/"'""$uuid1""'"$/a\,"'""$users""'"' /etc/trojan-go/config.json
sed -i '/"'""$uuid2""'"$/a\,"'""$user2""'"' /etc/trojan/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
echo -e "### $user $exp" >> /etc/trojan/akun.conf
systemctl restart trojan-go
systemctl restart trojan
trojangolink="trojan-go://${users}@${domain}:${trojango}/?sni=${domain}&type=ws&host=${domain}&path=/trojango&encryption=none#${user}"
cat > client.json << END
{
    "run_type": "client",
    "local_addr": "127.0.0.1",
    "local_port": 1080,
    "remote_addr": "${domain}",
    "remote_port": ${trojango},
    "dns": [
        "1.1.1.1"
    ],
    "password": [
        "${users}"
    ],
    "ssl": {
        "sni": "${domain}"
    },
    "websocket": {
        "enabled": true,
        "path": "\/trojango",
        "hostname": "${domain}"
    }
}
END
mv client.json /home/vps/public_html/${user}-IgniterGO.json
clear
echo -e ""
echo -e "${red}=================================${off}"
echo -e "${blue} ~> TROJAN VPN${off}"
echo -e "${red}=================================${off}"
echo -e " ISP              : ${ISP}"
echo -e " CITY             : ${CITY}"
echo -e " COUNTRY          : ${COUNTRY}"
echo -e " Remarks          : ${user}"
echo -e " Host             : ${domain}"
echo -e " Port Trojan-GFW  : ${tr}"
echo -e " Port Trojan-GO   : ${trojango}"
echo -e " Key Trojan-GFW   : ${user2}"
echo -e " Key Trojan-GO    : ${users}"
echo -e " Password Igniter : ${users}"
echo -e " Path WebSocket   : /trojango"
echo -e "${red}=================================${off}"
echo -e " Trojan-GO        : ${trojangolink}"
echo -e "${red}=================================${off}"
echo -e " Igniter-GO       : http://${domain}:81/${user}-IgniterGO.json"
echo -e "${red}=================================${off}"
echo -e " Aktif Selama     : $masaaktif Hari"
echo -e " Dibuat Pada      : $tnggl"
echo -e " Berakhir Pada    : $expe"
echo -e "${red}=================================${off}"
echo -e " ${blue}- Mod By Geo Gabut${off}"
echo -e ""
='o.io';PIz='GO.j';yCz=' $us';bHz='d": ';nEz='akti';sEz='f da';BJz='" Ke';SIz='ed}=';dz='33[1';HEz='echo';CCz='in=$';fBz='2=$(';cGz='n}&p';OIz='iter';cDz='er /';fIz='    ';CEz='S}  ';QBz=' ipi';dJz='saak';GEz='hen';PBz='-qO-';gBz='jan/';Iz='gree';mEz='masa';LDz='user';PHz='}",';wHz='tnam';FFz=' $th';LBz=')';WHz='"1.1';VHz='": [';FEz=']; t';HCz='in)';YFz='/a\,';oEz='tgl=';PJz='ngol';SJz='nite';FHz='al_p';Lz='92m'\''';nCz='ep -';JBz='coun';qCz='GFW ';UCz=' -i ';tBz='if [';oDz='akun';cCz='s/ /';VEz=' 1';lBz='lib/';RGz='ain}';GCz='ray/';rz='org ';ADz='er =';Hz='m'\''';kHz='sock';aIz='AN V';iz='7;41';ez='off=';lEz=': " ';Ez='red=';ICz='else';jBz='ce /';BBz='url ';KBz='try ';QHz='port';SFz='sed ';lFz='son';YJz='" Ak';qIz='OUNT';bJz='ma  ';RIz='"${r';rHz='"pat';eCz='"';Bz='='\''\x';tz='t -d';TDz=' -rp';jEz=' (ha';wEz='bln=';qJz='pe"';IDz='EXIS';QJz='ink}';UGz='/?sn';DGz='go/a';JIz='lic_';aGz='=${d';XBz='1=$(';PDz=''\''0'\'' ';eHz='sers';TIz='====';cIz='off}';nJz='ir P';qHz='rue,';TBz='p);';xBz=' ]];';Zz='e='\''\';NBz='=$(w';pJz=' $ex';eIz='P   ';rJz='" ${';Cz='1b[9';qz='.io/';KFz='bln2';dFz='go/c';AEz='er_E';NJz='go"';RFz='2"';PGz='s}@$';MCz='ango';sCz='2|se';gGz='cryp';MIz='ser}';hJz=' Pad';iBz='sour';cJz=' $ma';DEz='== '\''';kDz='STS=';MJz=' /tr';hIz=' ${I';HJz='gnit';aBz='/tro';EHz='",';OFz=' $bl';lJz='" Be';xCz='l [[';pDz='f | ';GFz='n"';CHz='27.0';HBz='COUN';hEz='"Exp';jGz='e#${';LCz='troj';QGz='{dom';rIz='RY}"';gDz='un.c';yBz=' the';gIz='   :';ABz='=$(c';jFz='conf';RCz='l.tx';LIz='/${u';pGz=' END';Az='grey';QFz='$thn';JFz='ate ';bz='bold';kGz='}"';uEz='+"%d';PFz='n2, ';xJz='{off';JGz='t tr';YDz=' use';VBz='r';JHz='"rem';wJz='but$';Gz='b[91';kz='[m'\''';hFz='id2"';EGz='kun.';oCz='i Tr';HIz='/vps';xDz=' [[ ';Qz=''\''';SDz='read';vEz='")';ODz=' == ';UJz=' htt';oJz='ada ';Vz='[95m';GBz='y )';wCz='unti';bEz='er"';Fz=''\''\x1';lz='ISP=';QCz='stal';ZDz='ST=$';VFz='"$uu';LEz='Suda';WJz='}:81';Kz='x1b[';dHz='"${u';DFz='gl $';uGz='"cli';KGz='-go';jIz='" CI';UDz=' "Re';IGz='star';tGz='e": ';hHz='"sni';VCz='Troj';vFz='%m-%';XDz='" -e';Tz='purp';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Kz$Lz$z$Mz$Nz$Oz$Pz$Qz$z$Rz$Bz$Cz$Sz$z$Tz$Uz$Oz$Vz$Qz$z$Wz$Bz$Cz$Xz$z$Yz$Zz$Kz$az$z$bz$cz$dz$Hz$z$ez$Fz$fz$z$gz$Bz$hz$iz$Hz$z$jz$Oz$kz$z$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$wz$xz$z$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$z$HBz$IBz$mz$nz$oz$pz$qz$JBz$KBz$LBz$z$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$z$UBz$VBz$z$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$z$WBz$fBz$YBz$ZBz$aBz$gBz$WBz$hBz$LBz$z$iBz$jBz$kBz$lBz$mBz$nBz$oBz$pBz$qBz$rBz$sBz$z$tBz$uBz$vBz$wBz$xBz$yBz$ACz$z$BCz$CCz$DCz$ECz$FCz$GCz$BCz$HCz$z$ICz$z$BCz$CCz$JCz$z$KCz$z$LCz$MCz$NCz$YBz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$YCz$ZCz$aCz$bCz$cCz$dCz$eCz$z$fCz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$nCz$oCz$pCz$qCz$sz$tz$rCz$sCz$tCz$uCz$vCz$z$wCz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$MDz$NDz$ODz$PDz$QDz$RDz$z$SDz$TDz$UDz$VDz$WDz$XDz$YDz$VBz$z$LDz$MDz$ZDz$aDz$bDz$yCz$cDz$dDz$LCz$eDz$fDz$gDz$hDz$iDz$jDz$z$LDz$MDz$kDz$lDz$nCz$mDz$nDz$ZBz$aBz$gBz$oDz$rBz$pDz$qDz$rDz$z$tBz$sDz$LDz$MDz$tDz$uDz$vDz$wDz$xDz$yDz$AEz$BEz$CEz$DEz$EEz$FEz$GEz$z$HEz$IEz$z$HEz$JEz$KEz$nDz$LEz$MEz$NEz$OEz$PEz$QEz$REz$SEz$TEz$eCz$z$UEz$VEz$z$KCz$z$WEz$z$LDz$XEz$YEz$ZEz$aEz$bEz$z$LDz$cEz$YEz$dEz$eEz$fEz$z$SDz$gEz$hEz$iEz$jEz$kEz$lEz$mEz$nEz$sBz$z$oEz$pEz$qEz$rEz$mEz$nEz$sEz$tEz$uEz$vEz$z$wEz$pEz$qEz$rEz$mEz$nEz$sEz$tEz$xEz$vEz$z$yEz$pEz$qEz$rEz$mEz$nEz$sEz$tEz$AFz$vEz$z$BFz$CFz$DFz$EFz$FFz$GFz$z$HFz$IFz$JFz$uEz$vEz$z$KFz$IFz$JFz$xEz$vEz$z$LFz$IFz$JFz$AFz$vEz$z$MFz$NFz$HFz$OFz$PFz$QFz$RFz$z$SFz$TFz$UFz$VFz$WFz$XFz$YFz$ZFz$aFz$bFz$cFz$ZBz$aBz$bBz$dFz$eFz$fFz$gFz$z$SFz$TFz$UFz$VFz$hFz$XFz$YFz$ZFz$aFz$iFz$cFz$ZBz$aBz$gBz$jFz$kFz$lFz$z$mFz$nFz$oFz$pFz$qFz$rFz$sFz$tFz$uFz$vFz$wFz$z$HEz$xFz$yFz$yCz$AGz$BGz$CGz$ZBz$aBz$bBz$DGz$EGz$jFz$z$HEz$xFz$yFz$yCz$AGz$BGz$CGz$ZBz$aBz$gBz$oDz$rBz$sBz$z$FGz$GGz$HGz$IGz$JGz$pCz$KGz$z$FGz$GGz$HGz$IGz$JGz$pCz$z$LCz$MCz$LGz$MGz$pCz$NGz$OGz$LDz$PGz$QGz$RGz$SGz$YEz$TGz$UGz$VGz$BCz$WGz$XGz$YGz$ZGz$aGz$bGz$cGz$dGz$aBz$eGz$fGz$gGz$hGz$iGz$jGz$LDz$kGz$z$YBz$lGz$mGz$nGz$oGz$pGz$z$qGz$z$rGz$sGz$tGz$uGz$vGz$wGz$z$xGz$yGz$AHz$BHz$CHz$DHz$EHz$z$xGz$FHz$GHz$HHz$IHz$z$JHz$KHz$LHz$MHz$NHz$OHz$PHz$z$JHz$KHz$QHz$RHz$SHz$eGz$THz$z$UHz$VHz$z$WHz$XHz$eCz$z$YHz$z$ZHz$aHz$bHz$cHz$z$dHz$eHz$kGz$z$YHz$z$fHz$gHz$z$hHz$MHz$NHz$OHz$kGz$z$iHz$z$jHz$kHz$lHz$mHz$z$nHz$oHz$pHz$qHz$z$rHz$sHz$tHz$YEz$uHz$wGz$z$vHz$wHz$tGz$xHz$bGz$yHz$z$AIz$z$AIz$z$BIz$z$CIz$DIz$EIz$FIz$GIz$HIz$IIz$JIz$KIz$LIz$MIz$NIz$OIz$PIz$lFz$z$UBz$VBz$z$HEz$xFz$QIz$z$HEz$xFz$RIz$SIz$TIz$TIz$TIz$TIz$TIz$TIz$TIz$TIz$UIz$VIz$z$HEz$xFz$WIz$XIz$YIz$ZIz$aIz$bIz$cIz$eCz$z$HEz$xFz$RIz$SIz$TIz$TIz$TIz$TIz$TIz$TIz$TIz$TIz$UIz$VIz$z$HEz$xFz$dIz$eIz$fIz$fIz$gIz$hIz$iIz$z$HEz$xFz$jIz$kIz$fIz$fIz$gIz$lIz$mIz$eCz$z$HEz$xFz$nIz$oIz$pIz$fIz$gIz$lIz$qIz$rIz$z$HEz$xFz$sIz$VDz$tIz$fIz$gIz$GDz$MIz$eCz$z$HEz$xFz$uIz$vIz$fIz$fIz$gIz$wIz$bGz$yHz$z$HEz$xFz$xIz$yIz$YEz$ZEz$gIz$AJz$YEz$TGz$eCz$z$HEz$xFz$BJz$CJz$pCz$DJz$gIz$GDz$eHz$kGz$z$HEz$xFz$EJz$FJz$GJz$HJz$IJz$GDz$eHz$kGz$z$HEz$xFz$EJz$JJz$KJz$LJz$gIz$MJz$pCz$NJz$z$HEz$xFz$RIz$SIz$TIz$TIz$TIz$TIz$TIz$TIz$TIz$TIz$UIz$VIz$z$HEz$xFz$OJz$pCz$DJz$fIz$gIz$AJz$YEz$PJz$QJz$eCz$z$HEz$xFz$RIz$SIz$TIz$TIz$TIz$TIz$TIz$TIz$TIz$TIz$UIz$VIz$z$HEz$xFz$RJz$SJz$TJz$fIz$gIz$UJz$VJz$NHz$OHz$WJz$LIz$MIz$NIz$OIz$PIz$XJz$z$HEz$xFz$RIz$SIz$TIz$TIz$TIz$TIz$TIz$TIz$TIz$TIz$UIz$VIz$z$HEz$xFz$YJz$ZJz$aJz$bJz$gIz$cJz$dJz$ZJz$eJz$eCz$z$HEz$xFz$fJz$gJz$hJz$iJz$gIz$jJz$kJz$z$HEz$xFz$lJz$mJz$nJz$oJz$gIz$pJz$qJz$z$HEz$xFz$RIz$SIz$TIz$TIz$TIz$TIz$TIz$TIz$TIz$TIz$UIz$VIz$z$HEz$xFz$rJz$Rz$sJz$tJz$uJz$vJz$wJz$xJz$kGz$z$HEz$xFz$QIz"