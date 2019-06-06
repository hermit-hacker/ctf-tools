#!/bin/bash
if [ $# -ne 3 ]; then
	echo "Usage: ./SearchStat.sh {resultsfile} {targetdomain} {updateinterval}"
	exit 1
fi

RESFILE = ${1}
TGTDOM  = ${2}
UPDINT  = ${3}

if [ ! -f ${RESFILE} ]; then
	echo "ERROR: File ${RESFILE} does not exist."
	echo "Exiting..."
	exit 1
fi

while (true); do 
	clear
	echo "Quick Status Checks"
	echo "========================================="
	echo "Updated at " $(date)
	echo "========================================="
	echo -n "Unique Users: "
	cat ${RESFILE} | awk -F":" '{ print $2 }' | sort -u | wc -l
	echo -n "Unique @"${TGTDOM}" Users: "
	grep '@'${TGTDOM} ${RESFILE} | awk -F":" '{ print $2 }' | sort -u | wc -l
	echo -n "Unique User/Pass Combos: "
	cat ${RESFILE} | awk -F":" '{ print $2, $3 }' | sort -u | wc -l
	echo -n "Unique @"${TGTDOM}" Pass Combos: "
	grep '@'${TGTDOM} ${RESFILE} | awk -F":" '{ print $2, $3 }' | sort -u | wc -l
	echo "========================================="
	echo "Updated at " $(date)
	sleep ${UPDINT}
done
