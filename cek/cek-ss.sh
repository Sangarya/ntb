#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo -e "${red}============================${NC}";
echo "     SS OBFS USER LOGIN" | lolcat
echo -e "${red}============================${NC}";
echo ""
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
x=1
echo -e "${red}============================${NC}";
echo "         USER | TLS"
echo -e "${red}============================${NC}";
for akun in "${data[@]}"
do
port=$(cat /etc/shadowsocks-libev/akun.conf | grep '^port_tls' | cut -d ' ' -f 2 | tr '\n' ' ' | awk '{print $'"$x"'}')
jum=$(netstat -anp | grep ESTABLISHED | grep obfs-server | cut -d ':' -f 2 | grep -w $port | awk '{print $2}' | sort | uniq | nl)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
echo " $akun - $port"
echo "$jum";
echo -e "${red}============================${NC}";
fi
x=$(( "$x" + 1 ))
done
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
x=1
echo ""
echo -e "${red}============================${NC}";
echo "         USER |  HTTP"
echo -e "${red}============================${NC}";
for akun in "${data[@]}"
do
port=$(cat /etc/shadowsocks-libev/akun.conf | grep '^port_http' | cut -d ' ' -f 2 | tr '\n' ' ' | awk '{print $'"$x"'}')
jum=$(netstat -anp | grep ESTABLISHED | grep obfs-server | cut -d ':' -f 2 | grep -w $port | awk '{print $2}' | sort | uniq | nl)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
echo " $akun - $port"
echo "$jum";
echo -e "${red}============================${NC}";
fi
x=$(( "$x" + 1 ))
done
";';dCz='fi';DCz=''\'' -f';xz='`);';rBz='p ES';hz='/etc';SBz='libe';bBz=' | t';qCz=' -f ';yBz='rver';aCz=' - $';HCz='rt |';LCz=' | u';Dz='m'\''';FBz='akun';iz='/sha';ez='data';KBz='do';BCz='ut -';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$z$Mz$Nz$Oz$Pz$Qz$Qz$Qz$Qz$Qz$Qz$Rz$Sz$Tz$z$Mz$Uz$Vz$Wz$Xz$Yz$Zz$az$bz$cz$z$Mz$Nz$Oz$Pz$Qz$Qz$Qz$Qz$Qz$Qz$Rz$Sz$Tz$z$Mz$dz$z$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$wz$xz$z$yz$z$Mz$Nz$Oz$Pz$Qz$Qz$Qz$Qz$Qz$Qz$Rz$Sz$Tz$z$Mz$Uz$ABz$BBz$Yz$CBz$DBz$z$Mz$Nz$Oz$Pz$Qz$Qz$Qz$Qz$Qz$Qz$Rz$Sz$Tz$z$EBz$FBz$GBz$HBz$IBz$JBz$z$KBz$z$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$tz$uz$vz$wz$bBz$cBz$dBz$eBz$fBz$gBz$hBz$iBz$jBz$kBz$z$lBz$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$qBz$FCz$GCz$HCz$fBz$gBz$hBz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$z$PCz$QCz$RCz$SCz$TCz$UCz$z$Mz$VCz$WCz$XCz$z$YCz$z$Mz$ZCz$FBz$aCz$LBz$bCz$z$Mz$RCz$cCz$z$Mz$Nz$Oz$Pz$Qz$Qz$Qz$Qz$Qz$Qz$Rz$Sz$Tz$z$dCz$z$eCz$fCz$gCz$hCz$OCz$z$iCz$z$ez$fz$gz$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$wz$xz$z$yz$z$Mz$dz$z$Mz$Nz$Oz$Pz$Qz$Qz$Qz$Qz$Qz$Qz$Rz$Sz$Tz$z$Mz$Uz$ABz$BBz$Yz$jCz$kCz$z$Mz$Nz$Oz$Pz$Qz$Qz$Qz$Qz$Qz$Qz$Rz$Sz$Tz$z$EBz$FBz$GBz$HBz$IBz$JBz$z$KBz$z$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$UBz$VBz$WBz$XBz$YBz$lCz$mCz$nCz$oCz$pCz$qCz$rCz$sCz$tCz$vz$uCz$vCz$wCz$xCz$yCz$ADz$z$lBz$mBz$nBz$oBz$pBz$qBz$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$CCz$DCz$ECz$qBz$FCz$GCz$HCz$fBz$gBz$hBz$ICz$JCz$KCz$LCz$MCz$NCz$OCz$z$PCz$QCz$RCz$SCz$TCz$UCz$z$Mz$VCz$WCz$XCz$z$YCz$z$Mz$ZCz$FBz$aCz$LBz$bCz$z$Mz$RCz$cCz$z$Mz$Nz$Oz$Pz$Qz$Qz$Qz$Qz$Qz$Qz$Rz$Sz$Tz$z$dCz$z$eCz$fCz$gCz$hCz$OCz$z$iCz"