#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
clear
tr="$(cat ~/log-install.txt | grep -i Trojan-go | cut -d: -f2|sed 's/ //g')"
echo -e "Name : Change Port Trojan GO"
echo -e "============================" | lolcat
echo -e "Change Port $tr"
read -p "New Port Trojan-go: " tr2
if [ -z $tr2 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $tr2)
if [[ -z $cek ]]; then
sed -i "s/$tr/$tr2/g" /etc/trojan-go/config.json
sed -i "s/   - Trojan                  : $tr/   - Trojan-go                  : $tr2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tr -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tr -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $tr2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $tr2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart trojan-go > /dev/null
echo -e "\e[032;1mPort $tr2 modified successfully\e[0m"
else
echo "Port $tr2 is used"
fi
z=' ]; ';ez='inst';CCz='" /e';Mz='get ';MCz='    ';cz='t ~/';ACz='r/$t';rBz='[ -z';EDz='es';NBz='read';YDz='oad ';RDz='rsis';mBz='utlp';rDz='y\e[';IBz='"Cha';XDz=' rel';yz='ort ';uCz=' ACC';FBz='=" |';vDz='is u';xz='ge P';JBz='nge ';bCz='INPU';PCz='- Tr';TCz='root';sCz=' -I ';lCz=' --d';Bz=''\''\e[';Gz='e[0;';dz='log-';Qz='g.me';BDz='able';Yz='clea';qBz='tr2)';yBz='s/$t';oBz='rep ';dDz='emct';KDz='ptab';CDz='s.up';RCz='tr2/';ABz='Troj';wCz='-sav';TBz=' " t';Pz='onfi';SBz='-go:';PDz='ilte';xCz='e > ';Lz='=$(w';ZBz='then';VCz='-ins';lDz='tr2 ';HBz='cat';hBz='fi';eCz='te -';BCz='r2/g';fz='all.';Vz='ecki';ECz='roja';cDz='syst';HCz='fig.';GBz=' lol';iz='ep -';hCz='EW -';vCz='EPT';aDz='ev/n';ZDz='> /d';JDz='tc/i';oCz='ACCE';iDz='032;';lBz='t -n';sBz=' $ce';Ez='gree';qz='d '\''s';oDz=' suc';pz='2|se';MBz='"';nBz=' | g';vBz='en';GCz='/con';Nz='-qO-';tDz='else';rz='/ //';FCz='n-go';nDz='fied';kz='ojan';jCz='p -p';DCz='tc/t';Cz='1;31';WDz='l';DDz='.rul';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$Oz$Pz$Qz$Rz$Sz$z$Tz$Uz$Vz$Wz$Xz$z$Yz$Zz$z$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$z$Tz$tz$uz$vz$wz$xz$yz$ABz$BBz$CBz$z$Tz$tz$DBz$EBz$EBz$EBz$EBz$EBz$EBz$FBz$GBz$HBz$z$Tz$tz$IBz$JBz$KBz$LBz$MBz$z$NBz$OBz$PBz$QBz$RBz$kz$SBz$TBz$UBz$z$VBz$WBz$XBz$YBz$ZBz$z$Tz$aBz$bBz$cBz$dBz$eBz$z$fBz$gBz$z$hBz$z$iBz$jBz$kBz$lBz$mBz$nBz$oBz$pBz$qBz$z$VBz$rBz$sBz$tBz$uBz$vBz$z$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$GCz$HCz$ICz$z$wBz$xBz$JCz$KCz$ECz$LCz$MCz$MCz$MCz$NCz$LBz$OCz$PCz$kz$lz$MCz$MCz$MCz$MCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$z$YCz$ZCz$aCz$bCz$cCz$dCz$eCz$fCz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$LBz$nCz$oCz$pCz$z$YCz$ZCz$aCz$bCz$cCz$dCz$eCz$fCz$gCz$hCz$qCz$jCz$rCz$lCz$mCz$LBz$nCz$oCz$pCz$z$YCz$ZCz$sCz$bCz$cCz$dCz$eCz$fCz$gCz$hCz$iCz$jCz$kCz$lCz$mCz$LBz$tCz$uCz$vCz$z$YCz$ZCz$sCz$bCz$cCz$dCz$eCz$fCz$gCz$hCz$qCz$jCz$rCz$lCz$mCz$LBz$tCz$uCz$vCz$z$YCz$ZCz$wCz$xCz$yCz$ADz$BDz$CDz$DDz$EDz$z$YCz$ZCz$FDz$GDz$HDz$IDz$JDz$KDz$LDz$MDz$NDz$z$ODz$PDz$QDz$RDz$SDz$TDz$xCz$UDz$VDz$WDz$z$ODz$PDz$QDz$RDz$SDz$XDz$YDz$ZDz$aDz$bDz$z$cDz$dDz$eDz$fDz$gDz$kz$lz$ZDz$aDz$bDz$z$Tz$tz$hDz$iDz$jDz$kDz$lDz$mDz$nDz$oDz$pDz$qDz$rDz$sDz$z$tDz$z$Tz$uDz$kDz$lDz$vDz$wDz$z$hBz"