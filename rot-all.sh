#!/bin/bash
UNMOD=$1
UPPER=$(echo $UNMOD | tr '[a-z]' '[A-Z]')
echo "====== Modified: Uppercase Only ROT-26 ======"
echo
echo $UPPER | tr '[A-Z]' '[B-ZA]'
echo $UPPER | tr '[A-Z]' '[C-ZA-B]'
echo $UPPER | tr '[A-Z]' '[D-ZA-C]'
echo $UPPER | tr '[A-Z]' '[E-ZA-D]'
echo $UPPER | tr '[A-Z]' '[F-ZA-E]'
echo $UPPER | tr '[A-Z]' '[G-ZA-F]'
echo $UPPER | tr '[A-Z]' '[H-ZA-G]'
echo $UPPER | tr '[A-Z]' '[I-ZA-H]'
echo $UPPER | tr '[A-Z]' '[J-ZA-I]'
echo $UPPER | tr '[A-Z]' '[K-ZA-J]'
echo $UPPER | tr '[A-Z]' '[L-ZA-K]'
echo $UPPER | tr '[A-Z]' '[M-ZA-L]'
echo $UPPER | tr '[A-Z]' '[N-ZA-M]'
echo $UPPER | tr '[A-Z]' '[O-ZA-N]'
echo $UPPER | tr '[A-Z]' '[P-ZA-O]'
echo $UPPER | tr '[A-Z]' '[Q-ZA-P]'
echo $UPPER | tr '[A-Z]' '[R-ZA-Q]'
echo $UPPER | tr '[A-Z]' '[S-ZA-R]'
echo $UPPER | tr '[A-Z]' '[T-ZA-S]'
echo $UPPER | tr '[A-Z]' '[U-ZA-T]'
echo $UPPER | tr '[A-Z]' '[V-ZA-U]'
echo $UPPER | tr '[A-Z]' '[W-ZA-V]'
echo $UPPER | tr '[A-Z]' '[X-ZA-W]'
echo $UPPER | tr '[A-Z]' '[Y-ZA-X]'
echo $UPPER | tr '[A-Z]' '[ZA-Y]'
echo
echo "====== Modified: Uppercase Only ROT-36 ======"
echo
echo $UPPER | tr '[A-Z0-9]' '[B-Z0-9A]'
echo $UPPER | tr '[A-Z0-9]' '[C-Z0-9A-B]'
echo $UPPER | tr '[A-Z0-9]' '[D-Z0-9A-C]'
echo $UPPER | tr '[A-Z0-9]' '[E-Z0-9A-D]'
echo $UPPER | tr '[A-Z0-9]' '[F-Z0-9A-E]'
echo $UPPER | tr '[A-Z0-9]' '[G-Z0-9A-F]'
echo $UPPER | tr '[A-Z0-9]' '[H-Z0-9A-G]'
echo $UPPER | tr '[A-Z0-9]' '[I-Z0-9A-H]'
echo $UPPER | tr '[A-Z0-9]' '[J-Z0-9A-I]'
echo $UPPER | tr '[A-Z0-9]' '[K-Z0-9A-J]'
echo $UPPER | tr '[A-Z0-9]' '[L-Z0-9A-K]'
echo $UPPER | tr '[A-Z0-9]' '[M-Z0-9A-L]'
echo $UPPER | tr '[A-Z0-9]' '[N-Z0-9A-M]'
echo $UPPER | tr '[A-Z0-9]' '[O-Z0-9A-N]'
echo $UPPER | tr '[A-Z0-9]' '[P-Z0-9A-O]'
echo $UPPER | tr '[A-Z0-9]' '[Q-Z0-9A-P]'
echo $UPPER | tr '[A-Z0-9]' '[R-Z0-9A-Q]'
echo $UPPER | tr '[A-Z0-9]' '[S-Z0-9A-R]'
echo $UPPER | tr '[A-Z0-9]' '[T-Z0-9A-S]'
echo $UPPER | tr '[A-Z0-9]' '[U-Z0-9A-T]'
echo $UPPER | tr '[A-Z0-9]' '[V-Z0-9A-U]'
echo $UPPER | tr '[A-Z0-9]' '[W-Z0-9A-V]'
echo $UPPER | tr '[A-Z0-9]' '[X-Z0-9A-W]'
echo $UPPER | tr '[A-Z0-9]' '[Y-Z0-9A-X]'
echo $UPPER | tr '[A-Z0-9]' '[Z0-9A-Y]'
echo $UPPER | tr '[A-Z0-9]' '[0-9A-Z]'
echo $UPPER | tr '[A-Z0-9]' '[1-9A-Z0]'
echo $UPPER | tr '[A-Z0-9]' '[2-9A-Z0-1]'
echo $UPPER | tr '[A-Z0-9]' '[3-9A-Z0-2]'
echo $UPPER | tr '[A-Z0-9]' '[4-9A-Z0-3]'
echo $UPPER | tr '[A-Z0-9]' '[5-9A-Z0-4]'
echo $UPPER | tr '[A-Z0-9]' '[6-9A-Z0-5]'
echo $UPPER | tr '[A-Z0-9]' '[7-9A-Z0-6]'
echo $UPPER | tr '[A-Z0-9]' '[8-9A-Z0-7]'
echo $UPPER | tr '[A-Z0-9]' '[9A-Z0-8]'
echo
echo "====== Unmodified (Upper/Lower) ROT-26 (aka ROT-52) ======"
echo
echo $UNMOD | tr '[A-Za-z]' '[B-Za-zA]'
echo $UNMOD | tr '[A-Za-z]' '[C-Za-zA-B]'
echo $UNMOD | tr '[A-Za-z]' '[D-Za-zA-C]'
echo $UNMOD | tr '[A-Za-z]' '[E-Za-zA-D]'
echo $UNMOD | tr '[A-Za-z]' '[F-Za-zA-E]'
echo $UNMOD | tr '[A-Za-z]' '[G-Za-zA-F]'
echo $UNMOD | tr '[A-Za-z]' '[H-Za-zA-G]'
echo $UNMOD | tr '[A-Za-z]' '[I-Za-zA-H]'
echo $UNMOD | tr '[A-Za-z]' '[J-Za-zA-I]'
echo $UNMOD | tr '[A-Za-z]' '[K-Za-zA-J]'
echo $UNMOD | tr '[A-Za-z]' '[L-Za-zA-K]'
echo $UNMOD | tr '[A-Za-z]' '[M-Za-zA-L]'
echo $UNMOD | tr '[A-Za-z]' '[N-Za-zA-M]'
echo $UNMOD | tr '[A-Za-z]' '[O-Za-zA-N]'
echo $UNMOD | tr '[A-Za-z]' '[P-Za-zA-O]'
echo $UNMOD | tr '[A-Za-z]' '[Q-Za-zA-P]'
echo $UNMOD | tr '[A-Za-z]' '[R-Za-zA-Q]'
echo $UNMOD | tr '[A-Za-z]' '[S-Za-zA-R]'
echo $UNMOD | tr '[A-Za-z]' '[T-Za-zA-S]'
echo $UNMOD | tr '[A-Za-z]' '[U-Za-zA-T]'
echo $UNMOD | tr '[A-Za-z]' '[V-Za-zA-U]'
echo $UNMOD | tr '[A-Za-z]' '[W-Za-zA-V]'
echo $UNMOD | tr '[A-Za-z]' '[X-Za-zA-W]'
echo $UNMOD | tr '[A-Za-z]' '[Y-Za-zA-X]'
echo $UNMOD | tr '[A-Za-z]' '[Za-zA-Y]'
echo $UNMOD | tr '[A-Za-z]' '[a-zA-Z]'
echo $UNMOD | tr '[A-Za-z]' '[b-zA-Za]'
echo $UNMOD | tr '[A-Za-z]' '[c-zA-Za-b]'
echo $UNMOD | tr '[A-Za-z]' '[d-zA-Za-c]'
echo $UNMOD | tr '[A-Za-z]' '[e-zA-Za-d]'
echo $UNMOD | tr '[A-Za-z]' '[f-zA-Za-e]'
echo $UNMOD | tr '[A-Za-z]' '[g-zA-Za-f]'
echo $UNMOD | tr '[A-Za-z]' '[h-zA-Za-g]'
echo $UNMOD | tr '[A-Za-z]' '[i-zA-Za-h]'
echo $UNMOD | tr '[A-Za-z]' '[j-zA-Za-i]'
echo $UNMOD | tr '[A-Za-z]' '[k-zA-Za-j]'
echo $UNMOD | tr '[A-Za-z]' '[l-zA-Za-k]'
echo $UNMOD | tr '[A-Za-z]' '[m-zA-Za-l]'
echo $UNMOD | tr '[A-Za-z]' '[n-zA-Za-m]'
echo $UNMOD | tr '[A-Za-z]' '[o-zA-Za-n]'
echo $UNMOD | tr '[A-Za-z]' '[p-zA-Za-o]'
echo $UNMOD | tr '[A-Za-z]' '[q-zA-Za-p]'
echo $UNMOD | tr '[A-Za-z]' '[r-zA-Za-q]'
echo $UNMOD | tr '[A-Za-z]' '[s-zA-Za-r]'
echo $UNMOD | tr '[A-Za-z]' '[t-zA-Za-s]'
echo $UNMOD | tr '[A-Za-z]' '[u-zA-Za-t]'
echo $UNMOD | tr '[A-Za-z]' '[v-zA-Za-u]'
echo $UNMOD | tr '[A-Za-z]' '[w-zA-Za-v]'
echo $UNMOD | tr '[A-Za-z]' '[x-zA-Za-w]'
echo $UNMOD | tr '[A-Za-z]' '[y-zA-Za-x]'
echo $UNMOD | tr '[A-Za-z]' '[zA-Za-y]'
echo
echo "====== Unmodified (Upper/Lower) ROT-36 (aka ROT-62) ======"
echo
echo $UNMOD | tr '[A-Za-z0-9]' '[B-Za-z0-9A]'
echo $UNMOD | tr '[A-Za-z0-9]' '[C-Za-z0-9A-B]'
echo $UNMOD | tr '[A-Za-z0-9]' '[D-Za-z0-9A-C]'
echo $UNMOD | tr '[A-Za-z0-9]' '[E-Za-z0-9A-D]'
echo $UNMOD | tr '[A-Za-z0-9]' '[F-Za-z0-9A-E]'
echo $UNMOD | tr '[A-Za-z0-9]' '[G-Za-z0-9A-F]'
echo $UNMOD | tr '[A-Za-z0-9]' '[H-Za-z0-9A-G]'
echo $UNMOD | tr '[A-Za-z0-9]' '[I-Za-z0-9A-H]'
echo $UNMOD | tr '[A-Za-z0-9]' '[J-Za-z0-9A-I]'
echo $UNMOD | tr '[A-Za-z0-9]' '[K-Za-z0-9A-J]'
echo $UNMOD | tr '[A-Za-z0-9]' '[L-Za-z0-9A-K]'
echo $UNMOD | tr '[A-Za-z0-9]' '[M-Za-z0-9A-L]'
echo $UNMOD | tr '[A-Za-z0-9]' '[N-Za-z0-9A-M]'
echo $UNMOD | tr '[A-Za-z0-9]' '[O-Za-z0-9A-N]'
echo $UNMOD | tr '[A-Za-z0-9]' '[P-Za-z0-9A-O]'
echo $UNMOD | tr '[A-Za-z0-9]' '[Q-Za-z0-9A-P]'
echo $UNMOD | tr '[A-Za-z0-9]' '[R-Za-z0-9A-Q]'
echo $UNMOD | tr '[A-Za-z0-9]' '[S-Za-z0-9A-R]'
echo $UNMOD | tr '[A-Za-z0-9]' '[T-Za-z0-9A-S]'
echo $UNMOD | tr '[A-Za-z0-9]' '[U-Za-z0-9A-T]'
echo $UNMOD | tr '[A-Za-z0-9]' '[V-Za-z0-9A-U]'
echo $UNMOD | tr '[A-Za-z0-9]' '[W-Za-z0-9A-V]'
echo $UNMOD | tr '[A-Za-z0-9]' '[X-Za-z0-9A-W]'
echo $UNMOD | tr '[A-Za-z0-9]' '[Y-Za-z0-9A-X]'
echo $UNMOD | tr '[A-Za-z0-9]' '[Za-z0-9A-Y]'
echo $UNMOD | tr '[A-Za-z0-9]' '[a-z0-9A-Z]'
echo $UNMOD | tr '[A-Za-z0-9]' '[b-z0-9A-Za]'
echo $UNMOD | tr '[A-Za-z0-9]' '[c-z0-9A-Za-b]'
echo $UNMOD | tr '[A-Za-z0-9]' '[d-z0-9A-Za-c]'
echo $UNMOD | tr '[A-Za-z0-9]' '[e-z0-9A-Za-d]'
echo $UNMOD | tr '[A-Za-z0-9]' '[f-z0-9A-Za-e]'
echo $UNMOD | tr '[A-Za-z0-9]' '[g-z0-9A-Za-f]'
echo $UNMOD | tr '[A-Za-z0-9]' '[h-z0-9A-Za-g]'
echo $UNMOD | tr '[A-Za-z0-9]' '[i-z0-9A-Za-h]'
echo $UNMOD | tr '[A-Za-z0-9]' '[j-z0-9A-Za-i]'
echo $UNMOD | tr '[A-Za-z0-9]' '[k-z0-9A-Za-j]'
echo $UNMOD | tr '[A-Za-z0-9]' '[l-z0-9A-Za-k]'
echo $UNMOD | tr '[A-Za-z0-9]' '[m-z0-9A-Za-l]'
echo $UNMOD | tr '[A-Za-z0-9]' '[n-z0-9A-Za-m]'
echo $UNMOD | tr '[A-Za-z0-9]' '[o-z0-9A-Za-n]'
echo $UNMOD | tr '[A-Za-z0-9]' '[p-z0-9A-Za-o]'
echo $UNMOD | tr '[A-Za-z0-9]' '[q-z0-9A-Za-p]'
echo $UNMOD | tr '[A-Za-z0-9]' '[r-z0-9A-Za-q]'
echo $UNMOD | tr '[A-Za-z0-9]' '[s-z0-9A-Za-r]'
echo $UNMOD | tr '[A-Za-z0-9]' '[t-z0-9A-Za-s]'
echo $UNMOD | tr '[A-Za-z0-9]' '[u-z0-9A-Za-t]'
echo $UNMOD | tr '[A-Za-z0-9]' '[v-z0-9A-Za-u]'
echo $UNMOD | tr '[A-Za-z0-9]' '[w-z0-9A-Za-v]'
echo $UNMOD | tr '[A-Za-z0-9]' '[x-z0-9A-Za-w]'
echo $UNMOD | tr '[A-Za-z0-9]' '[y-z0-9A-Za-x]'
echo $UNMOD | tr '[A-Za-z0-9]' '[z0-9A-Za-y]'
echo $UNMOD | tr '[A-Za-z0-9]' '[0-9A-Za-z]'
echo $UNMOD | tr '[A-Za-z0-9]' '[1-9A-Za-z0]'
echo $UNMOD | tr '[A-Za-z0-9]' '[2-9A-Za-z0-1]'
echo $UNMOD | tr '[A-Za-z0-9]' '[3-9A-Za-z0-2]'
echo $UNMOD | tr '[A-Za-z0-9]' '[4-9A-Za-z0-3]'
echo $UNMOD | tr '[A-Za-z0-9]' '[5-9A-Za-z0-4]'
echo $UNMOD | tr '[A-Za-z0-9]' '[6-9A-Za-z0-5]'
echo $UNMOD | tr '[A-Za-z0-9]' '[7-9A-Za-z0-6]'
echo $UNMOD | tr '[A-Za-z0-9]' '[8-9A-Za-z0-7]'
echo $UNMOD | tr '[A-Za-z0-9]' '[9A-Za-z0-8]'
echo "====== Unmodified: ATBASH ======"
echo
echo $UNMOD | tr '[A-Za-z]' '[ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba]'
