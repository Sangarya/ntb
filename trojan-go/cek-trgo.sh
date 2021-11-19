#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
datar=( `cat /var/log/trojan-go/trojan-go.log | grep -w 'authenticated as' | awk '{print $7}' | sort | uniq`);
echo -e "${red}============================${NC}";
echo -e "    TROJAN-GO USER LOGIN" | lolcat
echo -e "${red}============================${NC}";
for akuun in "${datar[@]}"
do
datat=( `lsof -n | grep -i ESTABLISHED | grep trojan-go | awk '{print $9}' | cut -d':' -f2 | grep -w 443 | cut -d- -f2 | grep -v '>127.0.0.1' | sort | uniq | cut -d'>' -f2`);
echo -n > /tmp/iptrojan-go.txt
for ip in "${datat[@]}"
do
jume=$(cat /var/log/trojan-go.log | grep -w $akun | awk '{print $4}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ -z "$jume" ]]; then
echo > /dev/null
else
echo "$jume" > /tmp/iptrojan-go.txt
fi
done
jumo=$(cat /tmp/iptrojan-go.txt | nl)
echo "User : $akuun";
echo "$jumo";
echo -e "${red}============================${NC}";
done
z='$4}'\''';wCz=' $ak';uz='"   ';qCz='jumo';SCz='d: -';PBz='rep ';KBz='do';oz='"${r';UBz=' gre';iBz=' | c';uBz=' -n ';Nz=' /va';qBz='| cu';Cz='1;31';VBz='p tr';xBz='ptro';dBz=' -d'\''';vBz='> /t';MCz='$aku';lCz='iptr';Fz='n='\''\';sBz=''\''>'\'' ';Jz='\e[0';Sz='troj';XCz='| un';XBz='| aw';TBz='ED |';cCz='ume"';QCz='int ';tBz='-f2`';LCz='log/';uCz=' "Us';aBz='t $9';az='icat';FCz='at[@';Vz='g | ';Pz='g/tr';Wz='grep';KCz='var/';Oz='r/lo';VCz=' | s';nBz='27.0';nz=' -e ';pz='ed}=';bBz='}'\'' |';JCz='at /';EBz='for ';GBz='n in';SBz='LISH';pCz='done';Kz='data';JBz='}"';NCz='n | ';hBz=' 443';rz='===$';Ez='gree';Lz='r=( ';CBz=' lol';mz='echo';WBz='-go ';Uz='o.lo';jz=' | u';ABz='LOGI';ADz='umo"';UCz=' $ip';lBz='p -v';fBz='f2 |';Bz=''\''\e[';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$Mz$Nz$Oz$Pz$Qz$Rz$Sz$Tz$Uz$Vz$Wz$Xz$Yz$Zz$az$bz$cz$dz$ez$fz$gz$hz$iz$jz$kz$lz$z$mz$nz$oz$pz$qz$qz$qz$qz$qz$qz$rz$sz$tz$z$mz$nz$uz$vz$wz$xz$yz$ABz$BBz$CBz$DBz$z$mz$nz$oz$pz$qz$qz$qz$qz$qz$qz$rz$sz$tz$z$EBz$FBz$GBz$HBz$Kz$IBz$JBz$z$KBz$z$Kz$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$UBz$VBz$Qz$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$fBz$UBz$gBz$hBz$iBz$jBz$kBz$fBz$UBz$lBz$mBz$nBz$oBz$hz$iz$jz$pBz$qBz$rBz$sBz$tBz$lz$z$mz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$z$EBz$CCz$DCz$ECz$FCz$GCz$z$KBz$z$HCz$ICz$JCz$KCz$LCz$Sz$Tz$Uz$Vz$Wz$Xz$MCz$NCz$OCz$PCz$QCz$RCz$iBz$jBz$SCz$TCz$UBz$gBz$UCz$VCz$WCz$XCz$YCz$z$ZCz$aCz$bCz$cCz$dCz$eCz$fCz$z$mz$gCz$hCz$iCz$z$jCz$z$mz$bCz$cCz$gCz$kCz$lCz$Qz$mCz$nCz$z$oCz$z$pCz$z$qCz$ICz$JCz$kCz$lCz$Qz$mCz$rCz$sCz$tCz$z$mz$uCz$vCz$wCz$xCz$yCz$z$mz$bCz$ADz$yCz$z$mz$nz$oz$pz$qz$qz$qz$qz$qz$qz$rz$sz$tz$z$pCz"