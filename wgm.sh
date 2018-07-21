#!/bin/bash
# Just a quick script to quickly mirror websites
SITE=$1
PARENTTEST=$2
LOC='/pentest/tool-outputs/wgm'
mkdir -p ${LOC}
WLOG=`mktemp -u | cut -d '.' -f 2`

if [[ ${SITE} == '' ]]; then
	echo "Usage:"
	echo "wgm.sh SITENAME PARENTSTOP"
	echo "Any value for \"PARENTSTOP\" results in mirroring only part of the site"
	exit 1
fi

# Random choice of user agent, swap it and timing as you see fit
if [[ ${PARENTTEST} ]]; then
	echo "Logging to ${LOC}/${WLOG}"
	wget --mirror --execute robots=off --page-requisites --wait 5 --adjust-extension --user-agent='Opera/9.80 (X11; Linux x86_64; U; en) Presto/2.2.15 Version/10.00' --convert-links --directory-prefix=${LOC} -o ${LOC}/${WLOG} ${SITE} 
else
	echo "Logging to ${LOC}/${WLOG}"
	wget --mirror --execute robots=off --page-requisites --wait 5 --adjust-extension --user-agent='Opera/9.80 (X11; Linux x86_64; U; en) Presto/2.2.15 Version/10.00' --no-parent --convert-links --directory-prefix=${LOC} -o ${LOC}/${WLOG} ${SITE} &
fi
