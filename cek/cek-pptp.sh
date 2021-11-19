#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
last | grep ppp | grep still | awk '{print " ",$1," - " $3 }' > /tmp/login-db-pptp.txt;
echo " "
echo -e "${red}============================${NC}";
echo "     PPTP VPN USER LOGIN" | lolcat
echo -e "${red}============================${NC}";
echo "Username   ---   IP" | lolcat
echo -e "${green}------------------------------------- ${NC}";
cat /tmp/login-db-pptp.txt
echo " "
echo -e "${red}============================${NC}";
echo " ";
z='b-pp';vz='USER';ez='in-d';Vz='{pri';Tz=' | a';Zz='- " ';hz='xt;';Iz='NC='\''';Hz='32m'\''';HBz=' lol';OBz='cat ';xz='IN" ';Mz='last';Pz='ppp ';lz='"${r';rz=' "  ';gz='tp.t';QBz=';';PBz='xt';Oz='rep ';Xz=' ",$';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$z$Mz$Nz$Oz$Pz$Qz$Rz$Sz$Tz$Uz$Vz$Wz$Xz$Yz$Zz$az$bz$cz$dz$ez$fz$gz$hz$z$iz$jz$z$iz$kz$lz$mz$nz$nz$nz$nz$nz$nz$oz$pz$qz$z$iz$rz$sz$tz$uz$vz$wz$xz$yz$ABz$z$iz$kz$lz$mz$nz$nz$nz$nz$nz$nz$oz$pz$qz$z$iz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$z$iz$kz$JBz$KBz$LBz$MBz$MBz$MBz$MBz$MBz$MBz$MBz$MBz$NBz$pz$qz$z$OBz$cz$dz$ez$fz$gz$PBz$z$iz$jz$z$iz$kz$lz$mz$nz$nz$nz$nz$nz$nz$oz$pz$qz$z$iz$jz$QBz"