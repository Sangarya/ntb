#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
data=( `cat /var/log/trojan.log | grep -w 'authenticated as' | awk '{print $7}' | sort | uniq`);
echo "-------------------------------";
echo "-----=[ Trojan User Login ]=-----";
echo "-------------------------------";
for akun in "${data[@]}"
do
data2=( `lsof -n | grep -i ESTABLISHED | grep trojan | awk '{print $9}' | cut -d':' -f2 | grep -w 445 | cut -d- -f2 | grep -v '>127.0.0.1' | sort | uniq | cut -d'>' -f2`);
echo -n > /tmp/iptrojan.txt
for ip in "${data2[@]}"
do
jum=$(cat /var/log/trojan.log | grep -w $akun | awk '{print $4}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
echo "$jum" > /tmp/iptrojan.txt
fi
done
jum2=$(cat /tmp/iptrojan.txt | nl)
echo "user : $akun";
echo "$jum2";
echo "-------------------------------"
done
t | ';Nz='-qO-';CBz='[ Tr';qz='{pri';CCz='txt';Yz='r';vBz=' -f2';Iz='NC='\''';WBz='-i E';gCz='if [';YCz='d: -';Qz='ip.c';eCz='| un';MCz='og/t';rBz='uniq';BDz=' "us';Uz='ecki';oCz='null';fCz='iq)';Rz='om);';gz='log ';hz='| gr';VCz=''\''{pr';jCz='um" ';JCz='$(ca';kz='uthe';GBz='gin ';uBz='d'\''>'\''';WCz='int ';hCz='[ -z';uCz='at /';jz='w '\''a';pCz='else';bCz=' $ip';fz='jan.';FCz='{dat';lBz='v '\''>';UBz=' | g';yBz='> /t';UCz='awk ';QBz='do';sBz=' | c';ABz='-";';tCz='=$(c';BBz='---=';SCz='$aku';KBz='for ';ZCz='f1 |';Lz='=$(w';VBz='rep ';Ez='gree';EDz='un";';SBz='`lso';Xz='clea';nBz='0.0.';Pz='nhaz';dBz='| cu';FBz='r Lo';Bz=''\''\e[';Sz='echo';aBz=' gre';GCz='a2[@';XBz='STAB';Hz='32m'\''';IBz='---"';wBz='`);';TBz='f -n';yCz=' | n';jBz='cut ';XCz='$4}'\''';YBz='LISH';aCz='p -w';ICz='jum=';QCz='grep';DCz='ip i';Oz=' ica';mCz=' > /';lz='ntic';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Vz$Wz$z$Xz$Yz$z$Zz$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$wz$z$Sz$xz$yz$yz$yz$yz$yz$yz$yz$ABz$z$Sz$xz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$z$Sz$xz$yz$yz$yz$yz$yz$yz$yz$ABz$z$KBz$LBz$MBz$NBz$OBz$PBz$z$QBz$z$Zz$RBz$SBz$TBz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$DBz$oz$pz$qz$rz$cBz$dBz$eBz$fBz$gBz$hz$iz$hBz$iBz$jBz$kBz$gBz$hz$iz$lBz$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$vBz$wBz$z$Sz$xBz$yBz$ACz$BCz$fz$CCz$z$KBz$DCz$ECz$FCz$GCz$HCz$z$QBz$z$ICz$JCz$KCz$LCz$MCz$NCz$OCz$PCz$QCz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$sBz$tBz$YCz$ZCz$aBz$aCz$bCz$cCz$dCz$eCz$fCz$z$gCz$hCz$iCz$jCz$kCz$lCz$z$Sz$mCz$nCz$oCz$z$pCz$z$Sz$iCz$jCz$yBz$ACz$BCz$fz$CCz$z$qCz$z$rCz$z$sCz$tCz$uCz$vCz$wCz$DBz$xCz$yCz$ADz$z$Sz$BDz$CDz$DDz$EDz$z$Sz$iCz$FDz$JBz$z$Sz$xz$yz$yz$yz$yz$yz$yz$yz$GDz$z$rCz"