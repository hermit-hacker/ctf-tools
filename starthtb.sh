#!/bin/bash
# Program:	starthtb.sh
# Function: 	Starts up Tmux and gets everything ready
# Aguments:	Just the name of the box

if [ $# -ne 3 ]; then
	echo "[ERROR] Syntax is: starthtb [Name] [IP Address] [System Type]"
	exit 2
fi

BASEDIR="/mnt/hgfs/SharedVM/HTB"
BOXNAME="${1}"
IPADDY="${2}"
OSTYPE="${3}"
BOXDIR="${BASEDIR}/${BOXNAME}"
LOGFILE="${BOXDIR}/htb-${BOXNAME}.txt"
DSTAMP=`date -Idate`

# Create the base directory
mkdir -p ${BOXDIR}

# Build the logfile template
cat <<EOF > ${LOGFILE}
# Okay, let's see what we've got...

# System Name: ${BOXNAME}
# System Type: ${OSTYPE}
# IP Address:  ${IPADDY}

# Starting work on ${DSTAMP}.

# Let's Nmap and go!
nmap -sS -sV -vvv -p1-65535 -oA nmap-all-tcp-${BOXNAME} ${IPADDY}
EOF

# Launch the log file
echo "[I]   Log file created at ${LOGFILE}"

# And a reminder...
echo "---------------------------------------------------------"
echo "[I]   Now would be a great time to try this command:"
echo "      tmux new -s ${BOXNAME}"

# Show the suggested nmap launch
echo "---------------------------------------------------------"
echo "[I]   Suggeston for next steps:"
tail -n 2 ${LOGFILE}
