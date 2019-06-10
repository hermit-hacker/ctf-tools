#!/bin/bash
#
# Program  : apk-process.sh
# Author   : Brian Mork ("Hermit")
# Date     : 2019-06-07
# Contact  : https://blog.stackattack.net
# Requires : smali/baksmali (https://github.com/JesusFreke/smali)
#            apktool        (https://github.com/iBotPeaches/Apktool)
#            Reverse-APK    (https://github.com/1N3/ReverseAPK)
#            openjdk-11-jdk

VERSION="1.0"
SUBAPKD=$1
SUBOUTD=$2
PURELS=`which ls`

# Make something pretty
showHeader() {
	echo "+--------------------------+"
	echo "|    apk-process (v${VERSION})    |"
	echo "|         by: Hermit       |"
	echo "+--------------------------+"
}

# Show errors in a consistent way, using our pretty header
showError() {
	showHeader
	echo "ERROR!"
	echo $1
	exit 1
}

# Check for an installed pre-requisite, show error and exit if not found
checkDep() {
	which $1 > /dev/null 2>&1
	# If previous returned error, it wasn't found and we should exit
	if [ $? -ne 0 ]; then
		showError "Missing $1"
	fi
}

# Did we get two arguments?
if [ $# -ne 2 ]; then
	showError "Syntax: apk-process.sh [apk-directory] [results-directory]"
# Does the specified source directory exist?
elif [ ! -d ${SUBAPKD} ]; then
	showError "The specified source APK directory does not exist!"
else
	APKDIR=$(cd $PWD/$1 && pwd -P)
fi

# Get the number of files with ".apk" in their name from the source directory
declare -i APKCHK=`find ${APKDIR} -type f -iname '*.apk' -print 2>/dev/null | wc -l`
# If no APK files were found, we have nothing to do
if [ ${APKCHK} -lt 1 ]; then
	showError "No APKs were found in ${APKDIR}"
fi

# Checking for required programs
checkDep smali
checkDep baksmali
checkDep reverse-apk
checkDep apktool

# Check if the output directory exists, and make it if not
if [ ! -d ${SUBOUTD} ]; then
	mkdir -p ${SUBOUTD}
	echo "  [+] INFO: Created ${SUBOUTD}"
fi
OUTDIR=$(cd ${PWD}/${SUBOUTD} && pwd -P)

# Check for apktool directory, and create it if it doesn't already exist
if [ ! -d ${OUTDIR}/apktool ]; then
	mkdir -p ${OUTDIR}/apktool
	echo "  [+] INFO: Created apktool directory in ${OUTDIR}"
else
	echo "  [-] WARNING: The apktool directory already existed in ${OUTDIR}!"
fi

# Check for reverse-apk directory, and create it if it doesn't already exist
if [ ! -d ${OUTDIR}/reverse-apk ]; then
	mkdir -p ${OUTDIR}/reverse-apk
	echo "  [+] INFO: Created reverse-apk directory in ${OUTDIR}"
else
	echo "  [-] WARNING: The reverse-apk directory already existed in ${OUTDIR}!"
fi

# Looks like we're ready to rock. :)
# First fire off apktool, which helpfully allows us to specify an
# output directory... hint hint reverse-apk!
# Then we'll run reverse-apk, which unfortunately only takes the APK as an input, and stays in whatever
# directory... and uses the relative path to output, so we end up with a dumb situation where we have to
# either update the script itself (not very sustainable) or do the garbage we're going to
# do below with linking to fake it out. :)
for FILE in `${PURELS} ${APKDIR}/*.apk`; do
	FILESPLIT=`echo ${FILE} | awk -F'/' '{print NF}'`
	BASEFILE=`echo ${FILE} | cut -d '/' -f ${FILESPLIT}`
	FOLDER=`echo ${BASEFILE} | cut -d . -f 1`
	echo "  [+] INFO: Processing ${FILE}"
	echo -n "     [-] INFO: Processing ${FILE} with apktool... "
	apktool d ${FILE} -o ${OUTDIR}/apktool/${FOLDER} >> ${OUTDIR}/apk.log 2>&1
	echo "DONE"
	echo -n "     [-] INFO: Processing ${FILE} with reverse-apk... "
	RAPKDIR=${OUTDIR}/reverse-apk/${FOLDER}
	mkdir ${RAPKDIR}
	cd ${RAPKDIR}
	ln -s ${FILE} ${BASEFILE}
	reverse-apk ${BASEFILE} >> ../../reverse-apk.log 2>&1
	unlink ${BASEFILE}
	echo "DONE"
	echo "  ---------------------------------------------------------"
done
