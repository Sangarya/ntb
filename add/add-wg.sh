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
# Load params
source /etc/wireguard/params
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
SERVER_PUB_IP=$(cat /etc/v2ray/domain);
else
SERVER_PUB_IP=$IP
fi

until [[ ${CLIENT_NAME} =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
read -rp "Username: " -e CLIENT_NAME
CLIENT_EXISTS=$(grep -w $CLIENT_NAME /etc/wireguard/wg0.conf | wc -l)

if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo ""
echo "Nama Sudah Ada, Harap Masukkan Nama Lain!"
exit 1
fi
done
ENDPOINT="$SERVER_PUB_IP:$SERVER_PORT"
WG_CONFIG="/etc/wireguard/wg0.conf"
LASTIP=$( grep "/32" $WG_CONFIG | tail -n1 | awk '{print $3}' | cut -d "/" -f 1 | cut -d "." -f 4 )
if [[ "$LASTIP" = "" ]]; then
CLIENT_ADDRESS="10.66.66.2"
else
CLIENT_ADDRESS="10.66.66.$((LASTIP+1))"
fi

# Adguard DNS by default
CLIENT_DNS_1="176.103.130.130"

CLIENT_DNS_2="176.103.130.131"

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
# Generate key pair for the client
CLIENT_PRIV_KEY=$(wg genkey)
CLIENT_PUB_KEY=$(echo "$CLIENT_PRIV_KEY" | wg pubkey)
CLIENT_PRE_SHARED_KEY=$(wg genpsk)

# Create client file and add the server as a peer
echo "[Interface]
PrivateKey = $CLIENT_PRIV_KEY
Address = $CLIENT_ADDRESS/24
DNS = $CLIENT_DNS_1,$CLIENT_DNS_2

[Peer]
PublicKey = $SERVER_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
Endpoint = $ENDPOINT
AllowedIPs = 0.0.0.0/0,::/0" >>"$HOME/$SERVER_WG_NIC-client-$CLIENT_NAME.conf"

# Add the client as a peer to the server
echo -e "### Client $CLIENT_NAME $exp
[Peer]
PublicKey = $CLIENT_PUB_KEY
PresharedKey = $CLIENT_PRE_SHARED_KEY
AllowedIPs = $CLIENT_ADDRESS/32" >>"/etc/wireguard/$SERVER_WG_NIC.conf"
systemctl restart "wg-quick@$SERVER_WG_NIC"
cp $HOME/$SERVER_WG_NIC-client-$CLIENT_NAME.conf /home/vps/public_html/$CLIENT_NAME.conf
clear
sleep 1
echo -e ""
echo -e "${red}=================================${off}"
echo -e "${white}     WIREGUARD${off}"
echo -e "${red}=================================${off}"
echo -e " ${white}ISP    : ${ISP}"
echo -e " CITY           : ${CITY}"
echo -e " COUNTRY        : ${COUNTRY}"
echo -e " Server IP      : ${MYIP}"
echo -e " Server Host    : ${SERVER_PUB_IP}${off}"
echo -e "${red}=================================${off}"
echo -e " ${white}WireGuard URL  : "
echo -e " http://$SERVER_PUB_IP:81/$CLIENT_NAME.conf${off}"
echo -e "${red}=================================${off}"
echo -e " ${white}Aktif Selama   : $masaaktif Hari"
echo -e " Dibuat Pada    : $tnggl"
echo -e " Berakhir Pada  : $expe${off}"
echo -e "${red}=================================${off}"
rm -f /root/wg0-client-$CLIENT_NAME.conf
z='c -l';kFz='k)';rDz=' '\''{p';lz='rl -';xHz='    ';xBz='/v2r';kGz='-cli';GCz='unti';UBz='sour';az='37m'\''';fz='b[m'\''';Bz='='\''\x';Lz='92m'\''';QGz='PUB_';UCz='XIST';ZDz='WG_C';KBz='MYIP';NCz='[a-z';TFz='KEY=';nCz='c/wi';CBz='o.io';xz='=$(c';WIz='_PUB';EFz=' $th';KGz='r]';OBz=' ipi';NIz='{SER';bIz='Sela';nFz='face';IFz='ate ';NGz='y = ';XCz=''\'' ]]';VDz=':$SE';WHz='ps/p';JBz=')';kEz='d"`';ZEz=' " m';UIz='" ht';GGz='S_1,';Qz=''\''';eBz='ium-';kHz='}   ';OFz='n2, ';sCz=' | w';jBz='f';yGz='ER_W';aHz='slee';aIz='tif ';CGz='DRES';oGz='"###';YCz='; do';tGz='_ADD';PDz='ENDP';aEz='asaa';sDz='rint';MIz='t   ';Fz=''\''\x1';YEz='ri):';FEz='10.6';tDz=' $3}';vHz='" CI';Mz='yell';GEz='6.66';YFz='EY=$';KDz='a La';uHz='{ISP';tFz='IENT';RIz='ard ';mIz='ir P';PGz='VER_';uFz='_PRI';SGz='Pres';WEz='ired';fIz='" Di';UEz=' -p ';Rz='blue';SDz='ERVE';nGz=' -e ';RCz='& ${';uEz='")';aCz=' -rp';XEz=' (ha';HDz='Masu';AGz='= $C';BGz='T_AD';OHz='_WG_';hDz='( gr';SHz='NT_N';hHz='f}"';cFz='g pu';fDz='LAST';gFz='D_KE';EIz='{COU';eHz='ed}=';hGz='E/$S';bz='bold';ez='off=';LIz=' Hos';MCz='=~ ^';BCz='n);';UDz='B_IP';dz='33[1';tBz='UB_I';FFz='n"';HCz='l [[';bCz=' "Us';UGz='dKey';lBz='[ "$';QDz='OINT';kz='$(cu';DFz='bln,';LEz='NT_D';AEz=' "."';SFz='RIV_';iDz='ep "';WFz='key)';dIz='f Ha';nIz='ada ';Hz='m'\''';gCz='ENT_';jDz='/32"';lDz='_CON';sBz='ER_P';oEz='d "$';kBz='if [';Az='grey';Kz='x1b[';EDz=' Ada';UHz=' /ho';iEz='"%Y-';Iz='gree';qFz='ateK';iz='7;41';YBz='guar';LBz='=$(w';NHz='/$SE';jGz='_NIC';HHz='g-qu';DCz='P=$I';lGz='ent-';LGz='Publ';dBz='prem';iFz='wg g';MGz='icKe';pIz='f /r';lHz='  WI';nEz='te -';qDz=' awk';dFz='bkey';Uz='le='\''';HBz='coun';RGz='KEY';MHz='HOME';yBz='ay/d';vGz='/wir';sHz='P   ';hIz=' Pad';uDz=''\'' | ';fFz='HARE';xFz='Addr';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Kz$Lz$z$Mz$Nz$Oz$Pz$Qz$z$Rz$Bz$Cz$Sz$z$Tz$Uz$Oz$Vz$Qz$z$Wz$Bz$Cz$Xz$z$Yz$Zz$Kz$az$z$bz$cz$dz$Hz$z$ez$Fz$fz$z$gz$Bz$hz$iz$Hz$z$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$z$wz$xz$yz$ABz$BBz$CBz$DBz$EBz$z$FBz$GBz$kz$lz$mz$nz$oz$HBz$IBz$JBz$z$KBz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$z$SBz$TBz$z$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$z$UBz$VBz$bBz$cBz$dBz$eBz$fBz$gBz$hBz$iBz$jBz$z$kBz$lBz$mBz$nBz$oBz$pBz$qBz$z$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$z$CCz$z$rBz$sBz$tBz$DCz$ECz$z$FCz$z$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$YCz$z$ZCz$aCz$bCz$cCz$dCz$eCz$fCz$gCz$hCz$z$SCz$TCz$UCz$iCz$jCz$kCz$lCz$gCz$hCz$mCz$nCz$oCz$pCz$qCz$rCz$sCz$tCz$JBz$z$kBz$uCz$SCz$TCz$UCz$VCz$vCz$XCz$wCz$xCz$z$yCz$ADz$z$yCz$BDz$CDz$DDz$EDz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$z$MDz$NDz$z$FCz$z$ODz$z$PDz$QDz$RDz$SDz$TDz$UDz$VDz$WDz$XDz$YDz$z$ZDz$aDz$bDz$WBz$XBz$YBz$cDz$dDz$eDz$z$fDz$gDz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$tDz$uDz$vDz$wDz$xDz$yDz$qz$rz$AEz$tz$BEz$z$kBz$lBz$fDz$mBz$nBz$oBz$pBz$qBz$z$SCz$CEz$DEz$EEz$FEz$GEz$HEz$z$CCz$z$SCz$CEz$DEz$EEz$FEz$GEz$IEz$fDz$JEz$KEz$z$FCz$z$SCz$LEz$MEz$NEz$OEz$PEz$QEz$REz$z$SCz$LEz$SEz$NEz$OEz$PEz$QEz$TEz$z$ZCz$UEz$VEz$WEz$XEz$YEz$ZEz$aEz$bEz$z$cEz$dEz$eEz$fEz$aEz$bEz$gEz$hEz$iEz$jEz$kEz$z$lEz$mEz$nEz$oEz$pEz$qEz$rEz$sEz$tEz$uEz$z$vEz$mEz$nEz$oEz$pEz$qEz$rEz$sEz$wEz$uEz$z$xEz$mEz$nEz$oEz$pEz$qEz$rEz$sEz$yEz$uEz$z$AFz$BFz$CFz$DFz$EFz$FFz$z$GFz$HFz$IFz$tEz$uEz$z$JFz$HFz$IFz$wEz$uEz$z$KFz$HFz$IFz$yEz$uEz$z$LFz$MFz$GFz$NFz$OFz$PFz$QFz$z$SCz$RFz$SFz$TFz$UFz$VFz$WFz$z$SCz$RFz$XFz$YFz$ZFz$aFz$SCz$RFz$SFz$bFz$sCz$cFz$dFz$JBz$z$SCz$RFz$eFz$fFz$gFz$hFz$iFz$jFz$kFz$z$yCz$lFz$mFz$nFz$oFz$z$pFz$qFz$rFz$sFz$tFz$uFz$vFz$wFz$z$xFz$yFz$AGz$JCz$BGz$CGz$DGz$z$EGz$AGz$JCz$FGz$GGz$lCz$gCz$HGz$IGz$z$JGz$KGz$z$LGz$MGz$NGz$OGz$PGz$QGz$RGz$z$SGz$TGz$UGz$VGz$SCz$RFz$eFz$fFz$gFz$wFz$z$WGz$XGz$VGz$PDz$QDz$z$YGz$ZGz$aGz$bGz$cGz$dGz$eGz$fGz$gGz$hGz$SDz$iGz$jGz$kGz$lGz$lCz$gCz$hCz$iBz$mGz$z$yCz$nGz$oGz$pGz$qGz$lCz$gCz$hCz$rGz$sGz$z$JGz$KGz$z$LGz$MGz$NGz$lCz$gCz$QGz$RGz$z$SGz$TGz$UGz$VGz$SCz$RFz$eFz$fFz$gFz$wFz$z$YGz$ZGz$aGz$sFz$tFz$tGz$uGz$jDz$fGz$wBz$vGz$wGz$xGz$rBz$yGz$AHz$BHz$eDz$z$CHz$DHz$EHz$FHz$GHz$HHz$IHz$OGz$PGz$JHz$KHz$z$LHz$MHz$NHz$WDz$OHz$PHz$QHz$RHz$SCz$SHz$THz$rCz$UHz$VHz$WHz$XHz$YHz$ZHz$SCz$SHz$THz$rCz$z$SBz$TBz$z$aHz$bHz$z$yCz$nGz$cHz$z$yCz$nGz$dHz$eHz$fHz$fHz$fHz$fHz$fHz$fHz$fHz$fHz$gHz$hHz$z$yCz$nGz$iHz$jHz$kHz$lHz$mHz$nHz$oHz$pHz$z$yCz$nGz$dHz$eHz$fHz$fHz$fHz$fHz$fHz$fHz$fHz$fHz$gHz$hHz$z$yCz$nGz$qHz$Yz$rHz$sHz$tHz$uHz$pHz$z$yCz$nGz$vHz$wHz$xHz$xHz$tHz$yHz$AIz$z$yCz$nGz$BIz$CIz$DIz$xHz$tHz$EIz$FIz$pHz$z$yCz$nGz$GIz$HIz$IIz$xHz$tHz$JIz$KIz$z$yCz$nGz$GIz$HIz$LIz$MIz$tHz$NIz$PGz$QGz$OIz$oHz$pHz$z$yCz$nGz$dHz$eHz$fHz$fHz$fHz$fHz$fHz$fHz$fHz$fHz$gHz$hHz$z$yCz$nGz$qHz$Yz$PIz$QIz$RIz$SIz$TIz$z$yCz$nGz$UIz$VIz$NHz$WDz$WIz$XIz$YIz$SCz$SHz$THz$rCz$gHz$hHz$z$yCz$nGz$dHz$eHz$fHz$fHz$fHz$fHz$fHz$fHz$fHz$fHz$gHz$hHz$z$yCz$nGz$qHz$Yz$ZIz$aIz$bIz$cIz$tHz$pEz$qEz$dIz$eIz$z$yCz$nGz$fIz$gIz$hIz$iIz$tHz$LFz$jIz$z$yCz$nGz$kIz$lIz$mIz$nIz$tHz$AFz$gHz$hHz$z$yCz$nGz$dHz$eHz$fHz$fHz$fHz$fHz$fHz$fHz$fHz$fHz$gHz$hHz$z$oIz$pIz$qIz$rIz$QHz$RHz$SCz$SHz$THz$rCz"