#!/usr/bin/python3
# Program  : ByteAdder.py
# Author   : Brian Mork ("Hermit")
# Thanks to: haystack-ia (https://github.com/haystack-ia) for removing Hexdump dependency
# Date     : 2019-04-01
# Contact  : https://blog.stackattack.net
# Requires : Python3+
import sys
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


def __masklist(AFILE, mask, shift=0):
    '''
    returns list of masked bytes in bytes object
    '''

    return [(x & mask) >> shift for x in AFILE]

def __masksum(AFILE, mask, shift=0):
    '''
    sums (byte & mask) for byte in AFILE
    '''

    return sum(__masklist(AFILE, mask, shift=shift))

def sumBytes(AFILE):
    '''
    prints sum of bytes in file
    '''

    print('[Summing all bytes]')
    cksum = __masksum(AFILE, 0xFF)
    printSumResult(cksum)

def sumHighNibble(AFILE):
    '''
    prints sum of high nibbles of a bytes object
    '''

    print('[Summing high nibble bytes]')
    cksum = __masksum(AFILE, 0xF0, shift=4)
    printSumResult(cksum)

def sumLowNibble(AFILE):
    '''
    prints sum of low nibbles of a bytes object
    '''

    print('[Summing low nibble bytes]')
    cksum = __masksum(AFILE, 0x0F)
    printSumResult(cksum)

def sumLSBs(AFILE):
    '''
    prints sum of least significant bits of a bytes object
    '''

    print('[Summing least significant bits]')
    bit_sum = __masksum(AFILE, 0x1)
    printSumResult(bit_sum)
    
    
def printLSBs(AFILE):
    '''
    prints least significant bits of a bytes object
    '''

    print('[Printing least significant bits]')
    bitstream = ''.join([str(x) for x in __masklist(AFILE, 0x1)])
    print(bitstream)



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

# Thanks to haystack-ia for conversion of if/elif/else to dictionary
funs = {
    'sum': sumBytes,
    'high': sumHighNibble,
    'low': sumLowNibble,
    'lsb': sumLSBs,
    'plsb': printLSBs,
    'alls': [#ALL!
        sumBytes, sumHighNibble, sumLowNibble,
        sumLSBs
    ],
    'allall': [#NO, ALL!
        sumBytes, sumHighNibble, sumLowNibble,
        sumLSBs, printLSBs
        ]
}

fun_to_run = funs.get(THEOPTION, None)

if fun_to_run is None:
    showInvalidMode()
elif type(fun_to_run) is list:
    [fun(theFile) for fun in fun_to_run]
else:
    fun_to_run(theFile)

showFooter()

sys.exit(0)
