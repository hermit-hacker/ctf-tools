#!/usr/bin/python3
# Program  : TernaryTrix.py
# Author   : Brian Mork ("Hermit")
# Date     : 2023-08-12
# Contact  : https://blog.stackattack.net
# Requires : Python3+
import sys
import os

THECMD = sys.argv[0]
THEOPTION = sys.argv[1]
THETEXT = sys.argv[2]

def showHelpInfo():
    print('Usage: TernaryTrix.py {OPTION} {STRING}')
    print('       OPTION must be one of the following:')
    print('             encrypt     :   Used to encrypt plaintext ASCII to ternary encoding')
    print('             decrypt     :   Used to decrypt ternary encoding into ASCII')
    print('             brute       :   Used to bruteforce ternary encoding with unknown symbol/value correlations')
    print('')
    print('       When using the \'encrypt\' option the plaintext should be enclosed in single quotes, e.g.:')
    print('             TernaryTrix.py encrypt \'Hide this text in ternary encoding\'')
    print('')
    print('       When using the \'decrypt\' option the ternany values should be enclosed in single quotes')
    print('       and separated by a hypen for each trit, e.g.:')
    print('             TernaryTrix.py decrypt \'110-012-210-001-101\'')
    print('')
    print('       When using the \'brute\' option each trit uses a different format:')
    print('             1st trit: A, B, or C')
    print('             2nd trit: M, N, or O')
    print('             3rd trit: X, Y, or Z')
    print('')
    print('             A hyphen should be used to separate each triplet, e.g.:')
    print('             \"ANX-AOZ-COY-BOX\"')
    print('')

def showHeader():
    print('+-------------------------------+')
    print('|         TernaryTrix.py        |')
    print('|           version 1.0         |')
    print('|            by Hermit          |')
    print('+-------------------------------+')
    print()

def showFooter():
    print()
    print('+-----------------------+')
    print('|    ~~~ { fin }~~~     |')
    print('+-----------------------+')

def showInvalidMode():
    print('ERROR: Invalid mode selected.')
    showHelpInfo()
    sys.exit(1)

def showInputFormat():
    print('ERROR: The input format was incorrect.')
    showHelpInfo()
    sys.exit(1)

# This conversion lifted from https://stackoverflow.com/questions/26929227/base-converter-in-python
def changebase(n, base=10, to=10):
    '''
    params:
      n     - number to convert
      base  - current base of number
      to    - desired base, must be <= 36
    '''
    # check that bases are <= 36
    if to > 36 or base > 36:
        raise ValueError('max base is 36')

    # convert to base 10
    n = int(str(n),base)
    positive = n >= 0

    # return if base 10 is desired
    if to == 10:
        return str(n)

    # convert to new base
    n = abs(n)
    num = []
    handle_digit = lambda i: str(i) if i < 10 else chr(i+55)
    while n > 0:
        num.insert(0, handle_digit(n % to))
        n = n // to

    # return string value of n in new base
    return ''.join(num) if positive else '-' + ''.join(num)

def makeTernary(CLEARTEXT, RESERVEDFLAG=0):
    WORKTEXT = CLEARTEXT.lower()
    CONVERTEXT = []
    for LETTER in WORKTEXT:
        if LETTER != ' ':
            PADDEDVALUE = '{:0>3}'.format(changebase(str(ord(LETTER)-96), 10, 3))
            CONVERTEXT.append(PADDEDVALUE)
        else:
            CONVERTEXT.append('000')
    print('-'.join(CONVERTEXT))

def makeASCII(TERNTEXT, RESERVEDFLAG=0):
    if RESERVEDFLAG != 0:
        print('Converting the following to ASCII')
        print(TERNTEXT)
        print('----------------------------------')
    WORKTEXT = TERNTEXT.split('-')
    CONVERTEXT = []
    for TERNVALUE in WORKTEXT:
        NORMALVALUE = int(TERNVALUE)
        if NORMALVALUE != 0:
            RECOVERVALUE = chr(int(changebase(NORMALVALUE, 3, 10))+96)
            CONVERTEXT.append(RECOVERVALUE)
        else:
            CONVERTEXT.append(" ")
    if RESERVEDFLAG != 0:
        print('Converted text:')
    print("".join(CONVERTEXT).upper())

BASESETUP = {
    'A': 0,
    'B': 1,
    'C': 2,
    'M': 0,
    'N': 1,
    'O': 2,
    'X': 0,
    'Y': 1,
    'Z': 2
}

GRIDSOLVE = ['012', '021', '102', '120', '201', '210']

def permutateTernary(CIPHERTEXT, RESERVEDFLAG=0):
    print('Attempting to decipher: ', CIPHERTEXT)
    print('Testing shows which value is mapped to each letter, using format:')
    print('[ABC-MNO-XYZ]')
    print('For example, [210-201-120] means A=2, B=1, C=0, M=2, N=0, O=1, X=1, Y=2, Z=0')
    print('----------------------------------------------------------------------------')
    WORKTEXT = CIPHERTEXT.split('-')
    for POSA in GRIDSOLVE:
        for POSB in GRIDSOLVE:
            for POSC in GRIDSOLVE:
                print("[", POSA, "-", POSB, "-", POSC, "]  ", sep="", end="")
                STRINGHOLDER = []
                for TRIPLET in WORKTEXT:
                    TRIPLETHOLDER = []
                    LETTERINDEX = 0
                    for LETTER in TRIPLET:
                        LETTERPOS = BASESETUP.get(LETTER, None)
                        if LETTERINDEX == 0:
                            TRIPLETHOLDER.append(str(POSA[LETTERPOS]))
                        elif LETTERINDEX == 1:
                            TRIPLETHOLDER.append(str(POSB[LETTERPOS]))
                        else:
                            TRIPLETHOLDER.append(str(POSC[LETTERPOS]))
                        LETTERINDEX = LETTERINDEX + 1
                    STRINGHOLDER.append("".join(TRIPLETHOLDER))
                    STRINGHOLDER.append("-")
                STRINGHOLDER.pop()
                TERNARYTEXT = "".join(STRINGHOLDER)
                makeASCII(TERNARYTEXT)

OPMODES = {
    'encrypt': makeTernary,
    'decrypt': makeASCII,
    'brute': permutateTernary
}

CHOSENMODE = OPMODES.get(THEOPTION, None)

if CHOSENMODE is None:
    showInvalidMode()
else:
    showHeader()
    CHOSENMODE(THETEXT, 1)

showFooter()

sys.exit(0)