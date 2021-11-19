#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
               hariini=`date +%Y-%m-%d`
               echo "Terima Kasih Sudah Menghapus Akun Expired"
               echo "--------------------------------------"
               cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
               totalaccounts=`cat /tmp/expirelist.txt | wc -l`
               for((i=1; i<=$totalaccounts; i++ ))
               do
               tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
               username=`echo $tuserval | cut -f1 -d:`
               userexp=`echo $tuserval | cut -f2 -d:`
               userexpireinseconds=$(( $userexp * 86400 ))
               tglexp=`date -d @$userexpireinseconds`             
               tgl=`echo $tglexp |awk -F" " '{print $3}'`
               while [ ${#tgl} -lt 2 ]
               do
               tgl="0"$tgl
               done
               while [ ${#username} -lt 15 ]
               do
               username=$username" " 
               done
               bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
               echo "echo "Expired- User : $username Expire at : $tgl $bulantahun"" >> /usr/local/bin/alluser
               todaystime=`date +%s`
               if [ $userexpireinseconds -ge $todaystime ] ;
               then
		    	:
               else
               echo "echo "Expired- Username : $username are expired at: $tgl $bulantahun and removed : $hariini "" >> /usr/local/bin/deleteduser
	           echo "Username $username Expired Pada $tgl $bulantahun Dihapus Dari VPS Pada $hariini"
               userdel $username
               fi
               done
               echo " "
               echo "--------------------------------------"
               echo "Script Berhasil Dijalankan!"
e';QCz='tgl=';FDz='ho "';Oz='`dat';KBz='-l`';TCz='wk -';Zz='ghap';dBz='list';hBz='-n 1';MDz=': $t';Jz='\e[0';NDz='gl $';oBz='ut -';xCz='k -F';qCz='me" ';iDz='then';XBz='=`he';JEz='ari ';WDz='toda';KCz=' -d ';mCz=' 15 ';GEz='un D';tBz='o $t';YBz='ad -';qDz='nd r';HDz=' Use';bDz=' $us';yCz='" " ';RDz='/loc';RCz='glex';fDz='stim';kBz='name';BEz='me $';oDz='d at';SEz='ript';MEz='i"';xBz=':`';Ez='gree';YDz='me=`';FEz='a $t';mz='t -d';pBz='f1 -';iCz='${#u';Cz='1;31';OBz='=$to';Uz='rima';BBz='ount';bz='kun ';MCz='erex';Gz='e[0;';vDz='i ""';az='us A';Mz='hari';NEz='del ';Az='red=';lCz=' -lt';ECz='rexp';hz='cat ';fBz=' | t';lz='| cu';nz=': -f';VDz='er';
eval "$Az$Bz$Cz$Dz$z$Ez$Fz$Gz$Hz$z$Iz$Jz$Dz$z$Kz$Lz$z$Mz$Nz$Oz$Pz$Qz$Rz$z$Sz$Tz$Uz$Vz$Wz$Xz$Yz$Zz$az$bz$cz$dz$z$Sz$ez$fz$fz$fz$fz$fz$fz$fz$fz$fz$gz$z$hz$iz$jz$kz$lz$mz$nz$oz$pz$qz$rz$sz$tz$uz$vz$wz$xz$z$yz$ABz$BBz$CBz$DBz$EBz$FBz$GBz$HBz$IBz$JBz$KBz$z$LBz$MBz$NBz$OBz$PBz$QBz$RBz$SBz$TBz$z$UBz$z$VBz$WBz$XBz$YBz$ZBz$aBz$bBz$cBz$dBz$eBz$fBz$gBz$hBz$iBz$z$jBz$kBz$lBz$mBz$VBz$WBz$nBz$oBz$pBz$qBz$z$jBz$rBz$sBz$tBz$jBz$uBz$lz$vBz$wBz$xBz$z$jBz$FBz$yBz$ACz$BCz$CCz$DCz$ECz$FCz$GCz$TBz$z$HCz$ICz$JCz$KCz$LCz$MCz$cBz$NCz$OCz$PCz$z$QCz$sBz$tBz$RCz$SCz$TCz$UCz$VCz$WCz$XCz$YCz$z$ZCz$aCz$bCz$cCz$dCz$eCz$z$UBz$z$QCz$fCz$gCz$z$hCz$z$ZCz$aCz$iCz$jCz$kCz$lCz$mCz$nCz$z$UBz$z$jBz$kBz$oCz$pCz$qCz$gz$z$hCz$z$rCz$sCz$tCz$Sz$uCz$vCz$wCz$xCz$yCz$ADz$BDz$CDz$DDz$z$Sz$EDz$FDz$cz$GDz$HDz$IDz$DCz$JDz$KDz$cBz$LDz$MDz$NDz$rCz$sCz$ODz$PDz$QDz$RDz$SDz$TDz$UDz$VDz$z$WDz$XDz$YDz$JCz$ZDz$iBz$z$aDz$bDz$MCz$cBz$NCz$OCz$cDz$dDz$eDz$fDz$gDz$hDz$z$iDz$z$jDz$z$kDz$z$Sz$EDz$FDz$cz$GDz$HDz$JDz$lDz$DCz$JDz$mDz$nDz$cBz$oDz$MDz$NDz$rCz$sCz$pDz$qDz$rDz$sDz$tDz$uDz$vDz$PDz$QDz$RDz$SDz$wDz$xDz$yDz$VDz$z$Sz$AEz$pCz$BEz$jBz$kBz$CEz$DEz$EEz$FEz$NDz$rCz$sCz$GEz$HEz$IEz$JEz$KEz$LEz$tDz$uDz$MEz$z$jBz$NEz$DCz$JDz$OEz$z$PEz$z$hCz$z$Sz$QEz$z$Sz$ez$fz$fz$fz$fz$fz$fz$fz$fz$fz$gz$z$Sz$REz$SEz$TEz$UEz$VEz$WEz$XEz$YEz"