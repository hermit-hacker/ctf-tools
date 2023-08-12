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
    print('+-------------------------------+')
    print('|       End of processing       |')
    print('+-------------------------------+')

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

# Convert from cleartext into ternary (RESERVEDFLAG not used at this time)
def makeTernary(CLEARTEXT, RESERVEDFLAG=0):
    # Lowercase makes for clear ASCII shift (drop 96 from lowercase yields A=1, Z=26)
    WORKTEXT = CLEARTEXT.lower()
    # Holder array for converted text/results
    CONVERTEXT = []
    # Iterate through the lowercase of the cleartext
    for LETTER in WORKTEXT:
        # Spaces are assumed to be null (000) and are handled separately
        if LETTER != ' ':
            # The below adds padding to make a consistent three character representation
            # First the unicode value of the letter is obtained, then 96 is subtracted
            # to obtain the decimal value of that character.  That value is then shifted
            # from decimal to ternary, but the result may not be a consistent three characters
            # (e.g. "a" becomes "1"), so the format is used to pad a "0" character to the left
            # (value preserving) until a consistent three character limit is reached
            PADDEDVALUE = '{:0>3}'.format(changebase(str(ord(LETTER)-96), 10, 3))
            # Add the standard three character value to the results array
            CONVERTEXT.append(PADDEDVALUE)
        else:
            # If it is a space, don't do the above, just add "000"
            CONVERTEXT.append('000')
    # Show full output by joining each array element with a hyphen between them
    print('-'.join(CONVERTEXT))


# Used to convert from standard ternary back to ASCII
# the RESERVEDFLAG is used to specify when the help text should be shown, because
# this is used both as a standalone function and called by the bruteforce option
def makeASCII(TERNTEXT, RESERVEDFLAG=0):
    # Use offest of 95 for A=0 indexing, 96 for standard A=1 indexing
    # Note that changing this offset of 95 may cause doubling issues with spaces
    # Basically, don't mess with this unless there's some weird encoding response
    # you're seeing
    OFFSETVALUE = 96
    # If any value greater than '1' is passed, we want to show the status prompt
    if RESERVEDFLAG > 1:
        print('Converting the following to ASCII')
        print(TERNTEXT)
        print('----------------------------------')
    # Split the text being converted from ternary triplet notation to give array
    # of individual letters
    WORKTEXT = TERNTEXT.split('-')
    # Holder array for converted text/results
    CONVERTEXT = []
    for TERNVALUE in WORKTEXT:
        # Force a type conversion from string (e.g. "010") into integer (e.g. "10")
        # which also drops the zero padding
        NORMALVALUE = int(TERNVALUE)
        # The triple zero is assumed to be a space, so everything else gets converted
        if NORMALVALUE != 0:
            # First convert the integer from ternary into decimal, then add the offset
            # value from above (96 should be standard) to get back to unicode value,
            # then cast that directly to a character value
            # (e.g. "10" becomes "3" and gets 96 added to become 99, which is "C")
            RECOVERVALUE = chr(int(changebase(NORMALVALUE, 3, 10))+OFFSETVALUE)
            # Add the recovered character to the array
            CONVERTEXT.append(RECOVERVALUE)
        # Handle the space directly by hard-coding the value
        else:
            CONVERTEXT.append(" ")
    # If any value other than '0' is passed, we want to show the output prefix
    if RESERVEDFLAG != 0:
        print('Converted text:')
    # Show full output by joining each array element with no spacing between elements
    print("".join(CONVERTEXT).upper())

# This variable is used to determine what position would be "normal" encoding
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

# All possible permutations of letter positions (e.g. first is A=0, B=1, C=2, then A=0, B=2, C=1)
GRIDSOLVE = ['012', '021', '102', '120', '201', '210']

# Run all permutations to look for things that make sense (RESERVEDFLAG is not used at this time)
def permutateTernary(CIPHERTEXT, RESERVEDFLAG=0):
    print('Attempting to decipher: ', CIPHERTEXT)
    print('Testing shows which value is mapped to each letter, using format:')
    print('[ABC-MNO-XYZ]')
    print('For example, [210-201-120] means A=2, B=1, C=0, M=2, N=0, O=1, X=1, Y=2, Z=0')
    print('----------------------------------------------------------------------------')
    # Split up the brute force encoded message
    # Only thing that actually matters here is consistency in translation from source
    # to the result
    # Quick example using three trits represented in unknown value from a CTF:
    # [demon face]  [sad face]      [evil eye]
    # [demon face]  [happy face]    [evil eye]
    # [angel face]  [sad face]      [stink eye]
    #
    # Both of the following are equally valid for the above:
    # ANZ-AOZ-CNX
    # BMY-BOY-AMX
    WORKTEXT = CIPHERTEXT.split('-')
    # This loops through the first position in the trit (A-C)
    for POSA in GRIDSOLVE:
        # This loops through the second position in the trit (M-O)
        for POSB in GRIDSOLVE:
            # This loops through the third position in the trit (X-Z)
            for POSC in GRIDSOLVE:
                # Show the current decrypt combination attempt in square brackets
                # and don't go to a new line
                print("[", POSA, "-", POSB, "-", POSC, "]  ", sep="", end="")
                # Array to hold converted text from all triplets
                STRINGHOLDER = []
                # Iterate through each trit
                for TRIPLET in WORKTEXT:
                    # Array to hold converted text from this particular trit
                    TRIPLETHOLDER = []
                    # Determines which letter to operate on (first/second/third letter)
                    LETTERINDEX = 0
                    # Loop through each letter in each trit
                    for LETTER in TRIPLET:
                        # Find the assumed index value (A=0, B=1, C=2, M=0, N=1, O=2, etc "standard" encoding)
                        LETTERPOS = BASESETUP.get(LETTER, None)
                        # Check each letter to determine which lookup (position in the trit) to use to decode
                        # In effect this is using the GRIDSOLVE values as a decryption key
                        if LETTERINDEX == 0:
                            TRIPLETHOLDER.append(str(POSA[LETTERPOS]))
                        elif LETTERINDEX == 1:
                            TRIPLETHOLDER.append(str(POSB[LETTERPOS]))
                        else:
                            TRIPLETHOLDER.append(str(POSC[LETTERPOS]))
                        # Increment the operating letter (this is automatically reset when the end of the trit
                        # is reached so it stays within three values)
                        LETTERINDEX = LETTERINDEX + 1
                    # Once all three values are known add the new triplet to the temporary results array
                    STRINGHOLDER.append("".join(TRIPLETHOLDER))
                    # Add a "hypen" for the separator
                    STRINGHOLDER.append("-")
                # Drop the final hyphen to avoid breaking the split
                STRINGHOLDER.pop()
                # Create the standard ternary representation string
                TERNARYTEXT = "".join(STRINGHOLDER)
                # Decrypt the string and show the results
                makeASCII(TERNARYTEXT)

# Handler for the system arguments to the implementing functions
OPMODES = {
    'encrypt': makeTernary,
    'decrypt': makeASCII,
    'brute': permutateTernary
}

# Either find out it's valid or return "None"
CHOSENMODE = OPMODES.get(THEOPTION, None)

# If it's not valid, show the error (and exit)
if CHOSENMODE is None:
    showInvalidMode()
# If it is valid, show the header and run the mode
else:
    showHeader()
    CHOSENMODE(THETEXT, 0)

# Show the footer upon completion
showFooter()

# Exit cleanly
sys.exit(0)


############### TEST VALUES
#
# Encryption using simple string:
# encrypt 'Testing the sample' --> 202-012-201-202-100-112-021-000-202-022-012-000-201-001-111-121-110-012
#
# Decryption using result of encryption
# decrypt '202-012-201-202-100-112-021-000-202-022-012-000-201-001-111-121-110-012' --> 'TESTING THE SAMPLE'
# 
# Random assignment of consistent position values to encrypted simple string:
# brute 'AOX-BNX-AOZ-AOX-COY-CNX-BMZ-BOY-AOX-BMX-BNX-BOY-AOZ-BOZ-CNZ-CMZ-CNY-BNX' --> (excerpt of output below)
#       [201-210-120]  SDRSKMFBSGDBR LOND
#       [201-210-201]  TESTING THE SAMPLE       <-- MATCH
#       [201-210-210]  TERTJNFATHEAR LOME
#