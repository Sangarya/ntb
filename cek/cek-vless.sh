#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo -n > /tmp/other.txt
data=( `cat /etc/v2ray/vless.json | grep '^###' | cut -d ' ' -f 2`);
echo -e "${red}============================${NC}";
echo "        VLESS USER LOGIN" | lolcat
echo -e "${red}============================${NC}";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="Gaada"
fi
echo -n > /tmp/ipvless.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep v2ray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/v2ray/access2.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvless.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvless.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvless.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvless.txt | nl)
echo "User : $akun";
echo "$jum2";
echo -e "${red}============================${NC}";
fi
rm -rf /tmp/ipvmess.txt
done
oth=$(cat /tmp/other.txt | sort | uniq | nl)
echo "Other";
echo "$oth";
echo -e "${red}============================${NC}";
rm -rf /tmp/other.txt

n';Ez='gree';cz='| cu';eCz='ess.';ECz='/acc';jBz='$5}'\''';dz='t -d';Tz='/etc';Hz='32m'\''';Sz='cat ';vCz=' 2>&';lCz='at /';fBz='y | ';ez=' '\'' '\''';Lz=' -n ';YBz=' EST';xz='for ';HCz='-w $';KBz=' the';SCz='rt |';nz='";';Cz='1;31';rCz='" /t';EBz='do';tz=' LOG';iz='"${r';Kz='echo';BBz='"${d';hz=' -e ';hCz=' "$i';Uz='/v2r';yBz='$(ca';mBz='d: -';oCz='-i "';iCz='p" >';aDz='r.tx';XDz=' "$o';MBz='="Ga';gz='2`);';LBz='n';oz=' "  ';qCz='m2/d';Az='red=';sCz=' > /';wCz='1';IDz=' $ak';Nz='mp/o';pz='    ';hBz=''\''{pr';SDz='| un';aCz='um" ';rz='ESS ';gCz='else';qBz='uniq';YDz='th";';Vz='ay/v';fz=' -f ';vz='| lo';CDz='then';FCz='ess2';Qz='data';KCz='{pri';TCz=' uni';fCz='txt';ZBz='ABLI';JBz=' ]];';PDz='oth=';tCz='dev/';DCz='2ray';GDz=' "Us';NCz=': -f';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$Oz$Pz$z$Qz$Rz$Sz$Tz$Uz$Vz$Wz$Xz$Yz$Zz$az$bz$cz$dz$ez$fz$gz$z$Kz$hz$iz$jz$kz$kz$kz$kz$kz$kz$lz$mz$nz$z$Kz$oz$pz$qz$rz$sz$tz$uz$vz$wz$z$Kz$hz$iz$jz$kz$kz$kz$kz$kz$kz$lz$mz$nz$z$xz$yz$ABz$BBz$CBz$DBz$z$EBz$z$FBz$GBz$HBz$IBz$JBz$KBz$LBz$z$yz$MBz$NBz$z$OBz$z$Kz$Lz$Mz$PBz$QBz$RBz$SBz$z$Qz$TBz$UBz$VBz$WBz$XBz$Zz$YBz$ZBz$aBz$bBz$cBz$dBz$bBz$cBz$eBz$fBz$gBz$hBz$iBz$jBz$kBz$lBz$mBz$nBz$oBz$pBz$qBz$rBz$z$xz$sBz$tBz$uBz$vBz$wBz$z$EBz$z$xBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$GCz$bBz$cBz$HCz$yz$ICz$JCz$KCz$LCz$MCz$cz$dz$NCz$OCz$Zz$PCz$QCz$RCz$SCz$TCz$UCz$z$FBz$VCz$WCz$XCz$YCz$JBz$KBz$LBz$z$Kz$ZCz$aCz$bCz$cCz$dCz$eCz$fCz$z$gCz$z$Kz$hCz$iCz$Mz$Nz$Oz$Pz$z$OBz$z$jCz$kCz$lCz$cCz$dCz$eCz$mCz$z$nCz$oCz$pCz$qCz$rCz$Nz$Oz$Pz$sCz$tCz$uCz$vCz$wCz$z$xCz$z$xBz$yBz$yCz$PBz$QBz$RBz$ADz$z$FBz$GBz$ZCz$aCz$BDz$CDz$z$Kz$sCz$tCz$uCz$z$gCz$z$jCz$kCz$lCz$cCz$dCz$eCz$DDz$EDz$FDz$z$Kz$GDz$HDz$IDz$JDz$z$Kz$ZCz$KDz$LDz$z$Kz$hz$iz$jz$kz$kz$kz$kz$kz$kz$lz$mz$nz$z$OBz$z$MDz$NDz$cCz$ODz$eCz$fCz$z$xCz$z$PDz$yBz$yCz$Nz$Oz$Pz$QDz$RDz$SDz$TDz$UDz$z$Kz$VDz$WDz$LDz$z$Kz$XDz$YDz$z$Kz$hz$iz$jz$kz$kz$kz$kz$kz$kz$lz$mz$nz$z$MDz$NDz$cCz$ZDz$aDz$bDz"