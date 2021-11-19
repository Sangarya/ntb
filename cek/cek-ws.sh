#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo -n > /tmp/other.txt
data=( `cat /etc/v2ray/config.json | grep '^###' | cut -d ' ' -f 2`);
echo -e "${red}============================${NC}";
echo "      VMESS USER LOGIN" | lolcat
echo -e "${red}============================${NC}";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="Gaada"
fi
echo -n > /tmp/ipvmess.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep v2ray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/v2ray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvmess.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvmess.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvmess.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvmess.txt | nl)
echo "user : $akun";
echo "$jum2";
echo -e "${red}============================${NC}"
fi
rm -rf /tmp/ipvmess.txt
done
oth=$(cat /tmp/other.txt | sort | uniq | nl)
echo "other";
echo "$oth";
echo -e "${red}============================${NC}"
rm -rf /tmp/other.txt
;dBz='ABLI';pBz='f1 |';UBz='ss.t';wBz='{dat';bDz='t';GCz='/acc';KCz='ep -';bCz='$ip"';iz=' 2`)';eBz='SHED';SDz='| un';wz='OGIN';fBz=' | g';fz='ut -';lz='"${r';PDz='oth=';pz='{NC}';ECz='og/v';IBz='if [';Lz='r';HCz='ess.';Jz='\e[0';Dz='m'\''';rCz='/$ju';QDz=' | s';lBz=''\''{pr';TDz='iq |';sBz='uniq';ADz='done';PCz='prin';TCz=' -d:';kCz='p" >';JCz='| gr';TBz='pvme';Cz='1;31';ODz='rf /';vCz='dev/';Fz='n='\''\';Az='red=';yCz='1';Gz='e[0;';WDz='her"';qz='";';ez=' | c';DBz=' in ';XCz=')';az='on |';Bz=''\''\e[';Nz=' -n ';Vz='/etc';MCz='kun ';Pz='mp/o';Kz='clea';VDz=' "ot';RCz='}'\'' |';ABz='at';VBz='xt';BDz='t /t';yBz=']}"';hz=''\'' -f';QCz='t $3';CBz='akun';oCz='txt)';KDz='un";';hCz='txt';CCz='t /v';Uz='cat ';Zz='g.js';kBz='awk ';XDz=' "$o';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$z$Mz$Nz$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Vz$Wz$Xz$Yz$Zz$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$z$Mz$kz$lz$mz$nz$nz$nz$nz$nz$nz$oz$pz$qz$z$Mz$rz$sz$tz$uz$vz$wz$xz$yz$ABz$z$Mz$kz$lz$mz$nz$nz$nz$nz$nz$nz$oz$pz$qz$z$BBz$CBz$DBz$EBz$FBz$GBz$z$HBz$z$IBz$JBz$KBz$LBz$MBz$NBz$OBz$z$CBz$PBz$QBz$z$RBz$z$Mz$Nz$Oz$SBz$TBz$UBz$VBz$z$Sz$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$fBz$gBz$hBz$fBz$gBz$iBz$jBz$kBz$lBz$mBz$nBz$ez$fz$oBz$pBz$qBz$rBz$sBz$tBz$z$BBz$uBz$vBz$wBz$xBz$yBz$z$HBz$z$ACz$BCz$CCz$DCz$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$fBz$gBz$VCz$WCz$qBz$rBz$sBz$XCz$z$IBz$YCz$ZCz$aCz$bCz$MBz$NBz$OBz$z$Mz$cCz$dCz$eCz$fCz$gCz$HCz$hCz$z$iCz$z$Mz$jCz$kCz$Oz$Pz$Qz$Rz$z$RBz$z$lCz$mCz$nCz$fCz$gCz$HCz$oCz$z$pCz$qCz$rCz$sCz$tCz$Pz$Qz$Rz$uCz$vCz$wCz$xCz$yCz$z$ADz$z$ACz$BCz$BDz$SBz$TBz$UBz$CDz$z$IBz$JBz$cCz$dCz$DDz$EDz$z$Mz$uCz$vCz$wCz$z$iCz$z$lCz$mCz$nCz$fCz$gCz$HCz$FDz$GDz$XCz$z$Mz$HDz$IDz$JDz$KDz$z$Mz$cCz$LDz$jz$z$Mz$kz$lz$mz$nz$nz$nz$nz$nz$nz$oz$pz$MDz$z$RBz$z$NDz$ODz$fCz$gCz$HCz$hCz$z$ADz$z$PDz$BCz$BDz$Pz$Qz$Rz$QDz$RDz$SDz$TDz$UDz$z$Mz$VDz$WDz$jz$z$Mz$XDz$YDz$z$Mz$kz$lz$mz$nz$nz$nz$nz$nz$nz$oz$pz$MDz$z$NDz$ODz$fCz$ZDz$aDz$bDz"