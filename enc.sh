#!/bin/bash

blue="\e[1;34m"
off="\x1b[m"

echo -e "${blue}AUTO ENCRYPT STARTING${off}"
sleep 1
cd /root/add
mkdir -p enc
shc -r -f usernew && rm usernew && rm usernew.x.c && mv usernew.x usernew && chmod +x usernew && cp usernew enc/usernew.sh
shc -r -f host && rm host && rm host.x.c && mv host.x host && chmod +x host && cp host enc/host.sh
shc -r -f add-ws && rm add-ws && rm add-ws.x.c && mv add-ws.x add-ws && chmod +x add-ws && cp add-ws enc/add-ws.sh
shc -r -f add-vless && rm add-vless && rm add-vless.x.c && mv add-vless.x add-vless && chmod +x add-vless && cp add-vless enc/add-vless.sh
shc -r -f add-wg && rm add-wg && rm add-wg.x.c && mv add-wg.x add-wg && chmod +x add-wg && cp add-wg enc/add-wg.sh
shc -r -f add-ss && rm add-ss && rm add-ss.x.c && mv add-ss.x add-ss && chmod +x add-ss && cp add-ss enc/add-ss.sh
shc -r -f add-ssr && rm add-ssr && rm add-ssr.x.c && mv add-ssr.x add-ssr && chmod +x add-ssr && cp add-ssr enc/add-ssr.sh
shc -r -f add-tr && rm add-tr && rm add-tr.x.c && mv add-tr.x add-tr && chmod +x add-tr && cp add-tr enc/add-tr.sh
shc -r -f add-sstp && rm add-sstp && rm add-sstp.x.c && mv add-sstp.x add-sstp && chmod +x add-sstp && cp add-sstp enc/add-sstp.sh
shc -r -f add-pptp && rm add-pptp && rm add-pptp.x.c && mv add-pptp.x add-pptp && chmod +x add-pptp && cp add-pptp enc/add-pptp.sh
shc -r -f add-l2tp && rm add-l2tp && rm add-l2tp.x.c && mv add-l2tp.x add-l2tp && chmod +x add-l2tp && cp add-l2tp enc/add-l2tp.sh
shc -r -f trial && rm trial && rm trial.x.c && mv trial.x trial && chmod +x trial && cp trial enc/trial.sh
shc -r -f running && rm running && rm running.x.c && mv running.x running && chmod +x running && cp running enc/running.sh
shc -r -f clear-log && rm clear-log && rm clear-log.x.c && mv clear-log.x clear-log && chmod +x clear-log && cp clear-log enc/clear-log.sh
shc -r -f bw && rm bw && rm bw.x.c && mv bw.x bw && chmod +x bw && cp bw enc/bw.sh
shc -r -f menu && rm menu && rm menu.x.c && mv menu.x menu && chmod +x menu && cp menu enc/menu.sh
shc -r -f hapus && rm hapus && rm hapus.x.c && mv hapus.x hapus && chmod +x hapus && cp hapus enc/hapus.sh
shc -r -f certv2ray &&rm certv2ray && rm certv2ray.x.c && mv certv2ray.x certv2ray && chmod +x certv2ray && cp certv2ray enc/cert.sh
shc -r -f trialws && rm trialws && rm trialws.x.c && mv trialws.x trialws && chmod +x trialws && cp trialws enc/trialws.sh
shc -r -f update && rm update && rm update.x.c && mv update.x update && chmod +x update && cp update enc/update.sh
shc -r -f autokill && rm autokill && rm autokill.x.c && mv autokill.x autokill && chmod +x autokill && cp autokill enc/autokill.sh
shc -r -f backup && rm backup && rm backup.x.c && mv backup.x backup && chmod +x backup && cp backup enc/backup.sh
shc -r -f autobackup && rm autobackup && rm autobackup.x.c && mv autobackup.x autobackup && chmod +x autobackup && cp autobackup enc/autobackup.sh
shc -r -f bckp && rm bckp && rm bckp.x.c && mv bckp.x bckp && chmod +x bckp && cp bckp enc/bckp.sh
shc -r -f ws-stunnel && rm ws-stunnel && rm ws-stunnel.x.c && mv ws-stunnel.x ws-stunnel && chmod +x ws-stunnel && cp ws-stunnel enc/ws-stunnel
shc -r -f proxy-template.py && rm proxy-template.py && rm proxy-template.py.x.c && mv proxy-template.py.x proxy-template.py && chmod +x proxy-template.py && cp proxy-template.py enc/proxy-template.py
shc -r -f edu-op.py && rm edu-op.py && rm edu-op.py.x.c && mv edu-op.py.x edu-op.py && chmod +x edu-op.py && cp edu-op.py enc/edu-op.py
shc -r -f bw && rm bw && rm bw.x.c && mv bw.x bw && chmod +x bw && cp bw enc/bw.sh
#shc -r -f update && rm update && rm update.x.c && mv update.x bckp && update +x update && cp update enc/update.sh
shc -r -f setup && rm setup && rm setup.x.c && mv setup.x setup && setup +x setup && cp setup enc/setup.sh
shc -r -f ssh-vpn && rm ssh-vpn && rm ssh-vpn.x.c && mv ssh-vpn.x ssh-vpn && ssh-vpn +x ssh-vpn && cp ssh-vpn enc/ssh-vpn.sh
shc -r -f cf && rm cf && rm cf.x.c && mv cf.x cf && chmod +x cf && cp cf enc/cf.sh
shc -r -f cfd && rm cfd && rm cfd.x.c && mv cfd.x cfd && chmod +x cfd && cp cfd enc/cfd.sh
shc -r -f pointing && rm pointing && rm pointing.x.c && mv pointing.x pointing && chmod +x pointing && cp pointing enc/pointing.sh
shc -r -f cfh && rm cfh && rm cfh.x.c && mv cfh.x cfh && chmod +x cfh && cp cfh enc/cfh.sh
shc -r -f add-cf && rm add-cf && rm add-cf.x.c && mv add-cf.x add-cf && chmod +x add-cf && cp add-cf enc/add-cf.sh
shc -r -f add-host && rm add-host && rm add-host.x.c && mv add-host.x add-host && chmod +x add-host && cp add-host enc/add-host.sh

sleep 0.5
zip -r encrypt.zip enc > /dev/null 2>&1
cp -r encrypt.zip /home/root/enc.zip
rm -rf encrypt.zip
rm -rf enc
cd
rm -f enc.sh
