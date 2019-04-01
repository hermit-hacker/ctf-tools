#!/usr/bin/python3
# Program  : ByteAdder.py
# Author   : Brian Mork ("Hermit")
# Date     : 2019-04-01
# Contact  : https://stackattack.net
# Requires : Python3+, Hexdump (https://pypi.org/project/hexdump/) by Anatoly Techtonik <techtonik@gmail.com>
import sys
import hexdump
import os

THEFILE = ''

def showHelpInfo():
    print('Usage: ByteAdder.py {sum|high|low|lsb|plsb|all} FILE')
    print('       sum      Sum all bytes in FILE')
    print('       high     Sum all bytes in the high nibble of FILE')
    print('       low      Sum all bytes in the low nibble of FILE')
    print('       lsb      Sum only least significant bits')
    print('       plsb     Print least significant bits')
    print('       alls     Run all SUM variants.  This can take a long time!')
    print('       allall   Run all variants.  This can take a long time!')

def showHeader():
    print('+-----------------------+')
    print('| ByteAdder version 1.0 |')
    print('|        by Hermit      |')
    print('+-----------------------+')
    print()

def showFooter():
    print()
    print('+-----------------------+')
    print('|    ~~~ { fin }~~~     |')
    print('+-----------------------+')

def showInvalidMode():
    print('ERROR: Invalid mode selected.');
    showHelpInfo();
    sys.exit(1);

def printSumResult(CKSUM):
    CKSUMH = hex(CKSUM)
    print('     Sum in dec is: ', str(CKSUM))
    print('     Sum in hex is: ', str(CKSUMH))
    print()

def sumBytes(AFILE):
    print('[Summing all bytes]')
    hd=hexdump.dump(AFILE, size=2, sep=' ')
    cksum=0
    for VAL in hd.split(' '):
        byteval = int(VAL, base=16)
        cksum=cksum+byteval
    printSumResult(cksum)

def sumHighNibble(AFILE):
    print('[Summing high nibble bytes]')
    hd=hexdump.dump(AFILE, size=1, sep=' ')
    tfcheck=0
    cksum=0
    for VAL in hd.split(' '):
        if (tfcheck == 0):
            byteval = int(VAL, base=16)
            cksum=cksum+byteval
            tfcheck = 1
        else:
            tfcheck = 0
    printSumResult(cksum)

def sumLowNibble(AFILE):
    print('[Summing low nibble bytes]')
    hd=hexdump.dump(AFILE, size=1, sep=' ')
    tfcheck=1
    cksum=0
    for VAL in hd.split(' '):
        if (tfcheck == 0):
            byteval = int(VAL, base=16)
            cksum=cksum+byteval
            tfcheck = 1
        else:
            tfcheck = 0
    printSumResult(cksum)

def sumLSBs(AFILE):
    print('[Summing least significant bytes]')
    hd=hexdump.dump(AFILE, size=1, sep=' ')
    tfcheck=1
    cksum=0
    for VAL in hd.split(' '):
        if (tfcheck == 0):
            byteval = int(VAL, base=16)
            cksum=cksum + (byteval & 1)
            tfcheck = 1
        else:
            tfcheck = 0
    printSumResult(cksum)

def printLSBs(AFILE):
    print('[Printing least significant bytes]')
    hd=hexdump.dump(AFILE, size=1, sep=' ')
    tfcheck=1
    bytestream=''
    for VAL in hd.split(' '):
        if (tfcheck == 0):
            byteval = int(VAL, base=16)
            bytestream=bytestream + str(byteval & 1)
            tfcheck = 1
        else:
            tfcheck = 0
    print(bytestream)

if ((len(sys.argv) != 3)):
    showHelpInfo()
    sys.exit(1)
else:
    THEFILE = sys.argv[2]
    fExists = os.path.isfile(THEFILE)

if (fExists):
    theFile = open(THEFILE, 'rb').read()
else:
    print('ERROR: The input file %s was not found' % THEFILE)
    sys.exit(1)

THEOPTION = sys.argv[1]

showHeader()

if (THEOPTION == "sum"):
    sumBytes(theFile)
elif (THEOPTION == "high"):
    sumHighNibble(theFile)
elif (THEOPTION == 'low'):
    sumLowNibble(theFile)
elif (THEOPTION == 'lsb'):
    sumLSBs(theFile),
elif (THEOPTION == 'plsb'):
    printLSBs(theFile)
elif (THEOPTION == 'alls'):
    sumBytes(theFile)
    sumHighNibble(theFile)
    sumLowNibble(theFile)
    sumLSBs(theFile)
elif (THEOPTION == 'allall'):
    sumBytes(theFile)
    sumHighNibble(theFile)
    sumLowNibble(theFile)
    sumLSBs(theFile)
    printLSBs(theFile)
else:
    showInvalidMode()

showFooter()

sys.exit(0)
