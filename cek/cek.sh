#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo " "
echo " "

if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi
                
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo -e "${red}============================${NC}";
echo -e "         DROPBEAR" | lolcat
echo -e "${red}============================${NC}";
echo -e "   ID  |  Username  |  IP ";
echo -e "${red}============================${NC}";
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
                fi
done
echo -e " "
echo -e "${red}============================${NC}";
echo -e "          OPENSSH " | lolcat
echo -e "${red}============================${NC}";
echo -e "    ID  |  Username  |  IP ";
echo -e "${red}============================${NC}";
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi
done
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
        echo -e " "
        echo -e "${red}============================${NC}";
        echo -e "        OPENVPN TCP " | lolcat
        echo -e "${red}============================${NC}";
        echo -e "Username  |  IP  | Since";
        echo -e "${red}============================${NC}";
        cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-tcp.txt
        cat /tmp/vpn-login-tcp.txt
fi
echo -e "${red}============================${NC}";

if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
        echo -e " "
        echo -e "${red}============================${NC}";
        echo -e "          OPENVPN UDP " | lolcat
        echo -e "${red}============================${NC}";
        echo -e "Username  |  IP  | Since";
        echo -e "${red}============================${NC}";
        cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-udp.txt
        cat /tmp/vpn-login-udp.txt
fi
echo -e "${red}============================${NC}";
echo -e "";
echo -e "- Mod By GEO GABUT" | lolcat
LBz$MBz$NBz$z$Mz$Pz$uz$vz$wz$wz$wz$wz$wz$wz$xz$yz$fz$z$OBz$PBz$QBz$RBz$SBz$TBz$UBz$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$fBz$gBz$hBz$iBz$z$jBz$kBz$lBz$mBz$nBz$oBz$z$pBz$z$OBz$qBz$rBz$sBz$tBz$uBz$vBz$wBz$xBz$yBz$ACz$BCz$eBz$fBz$gBz$CCz$DCz$iBz$z$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$z$OCz$PCz$QCz$fBz$gBz$CCz$DCz$RCz$SCz$TCz$UCz$VCz$WCz$NBz$z$XCz$OBz$qBz$rBz$sBz$YCz$ZCz$uBz$pz$qz$rz$aCz$bCz$z$Oz$cCz$dCz$eCz$Vz$Wz$z$Mz$fCz$gCz$hCz$iCz$jCz$fz$z$Zz$z$kCz$z$Mz$Pz$lCz$z$Mz$Pz$uz$vz$wz$wz$wz$wz$wz$wz$xz$yz$fz$z$Mz$Pz$ABz$BBz$mCz$nCz$oCz$pCz$qCz$rCz$z$Mz$Pz$uz$vz$wz$wz$wz$wz$wz$wz$xz$yz$fz$z$Mz$Pz$ABz$sCz$LBz$tCz$uCz$vCz$wCz$fz$z$Mz$Pz$uz$vz$wz$wz$wz$wz$wz$wz$xz$yz$fz$z$OBz$PBz$QBz$RBz$xCz$yCz$VBz$WBz$ADz$BDz$CDz$DDz$EDz$FDz$GDz$qBz$rBz$sBz$tBz$rCz$z$gz$hz$iz$jz$kz$HDz$IDz$JDz$KDz$LDz$MDz$NDz$pz$qz$rz$sz$tz$z$jBz$kBz$lBz$mBz$nBz$oBz$z$pBz$z$OBz$qBz$rBz$sBz$tBz$uBz$vBz$ODz$PDz$ACz$BCz$eBz$fBz$gBz$CCz$DCz$iBz$z$ECz$FCz$GCz$HCz$ICz$JCz$KCz$LCz$MCz$NCz$z$OCz$PCz$QCz$fBz$gBz$CCz$DCz$RCz$SCz$TCz$UCz$QDz$RDz$z$XCz$OBz$qBz$rBz$sBz$YCz$ZCz$uBz$pz$qz$rz$SDz$bCz$z$Oz$cCz$dCz$eCz$Vz$Wz$z$Mz$fCz$gCz$hCz$iCz$jCz$fz$z$Zz$z$kCz$z$Oz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$bDz$cDz$cz$dz$ez$z$Mz$Pz$lCz$z$Mz$Pz$uz$vz$wz$wz$wz$wz$wz$wz$xz$yz$fz$z$Mz$Pz$ABz$BBz$dDz$eDz$fDz$gDz$hDz$iDz$z$Mz$Pz$uz$vz$wz$wz$wz$wz$wz$wz$xz$yz$fz$z$Mz$Pz$jDz$kDz$lDz$mDz$vCz$nDz$oDz$z$Mz$Pz$uz$vz$wz$wz$wz$wz$wz$wz$xz$yz$fz$z$OBz$pDz$ZDz$aDz$qDz$rDz$sDz$tDz$uDz$vDz$VBz$WBz$wDz$xDz$yDz$AEz$BEz$CEz$DEz$EEz$FEz$GEz$HEz$Pz$IEz$JEz$KEz$LEz$GCz$MEz$NEz$ICz$uDz$OEz$z$OBz$qBz$PEz$QEz$REz$SEz$TEz$z$Zz$z$Mz$Pz$uz$vz$wz$wz$wz$wz$wz$wz$xz$yz$fz$z$Oz$TDz$UDz$VDz$WDz$XDz$YDz$ZDz$aDz$UEz$cDz$cz$dz$ez$z$Mz$Pz$lCz$z$Mz$Pz$uz$vz$wz$wz$wz$wz$wz$wz$xz$yz$fz$z$Mz$Pz$ABz$BBz$mCz$VEz$WEz$XEz$pCz$qCz$rCz$z$Mz$Pz$uz$vz$wz$wz$wz$wz$wz$wz$xz$yz$fz$z$Mz$Pz$jDz$kDz$lDz$mDz$vCz$nDz$oDz$z$Mz$Pz$uz$vz$wz$wz$wz$wz$wz$wz$xz$yz$fz$z$OBz$pDz$ZDz$aDz$qDz$rDz$sDz$tDz$YEz$vDz$VBz$WBz$wDz$xDz$yDz$AEz$BEz$CEz$DEz$EEz$FEz$GEz$HEz$Pz$IEz$JEz$KEz$LEz$GCz$MEz$NEz$ICz$YEz$OEz$z$OBz$qBz$PEz$QEz$ZEz$aEz$TEz$z$Zz$z$Mz$Pz$uz$vz$wz$wz$wz$wz$wz$wz$xz$yz$fz$z$Mz$Pz$bEz$z$Mz$Pz$cEz$dEz$eEz$fEz$gEz$pCz$qCz$rCz"