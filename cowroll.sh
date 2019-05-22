#!/bin/bash
apt-get install -y lolcat cowsay > /dev/null 2>&1
wget -O- https://raw.githubusercontent.com/doyler/SecurityTools/master/DNSRickroll/lyrics.txt 2>/dev/null >/tmp/a.txt
echo "Enjoy! Love, Hermit" >> /tmp/a.txt
while read -r LY; do clear; echo ${LY} | /usr/games/cowsay -w | /usr/games/lolcat; sleep 1; done < /tmp/a.txt
