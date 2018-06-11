#!/bin/bash
# Helper functions for quick pentesting scripts

# Function: echochars
# Description: Prints one or more characters a specified number of times,
#              and optionally print a trailing new line characters
# Arguments: ARG1 = Required: The character(s) to print out
#            ARG2 = Required: The number of times to repeat each character(s)
#            ARG3 = Optional: Any value here will cause the trailing newline to not print
# Depends On: Nothing
echochars() {
	# Loop the specified number of times
	for RANGE in `seq 1 $2`; do
		# Print the passed characters each time, without a trailing newline
		echo -n "$1";
	done
	# If a third argument was passed (any value)
	if [[ $3 == '' ]]; then
		# Print a trailing newline character
		echo
	fi
}


# Function: centerheader
# Description: Prints the specified text centered on the terminal (auto adjusts for terminal size)
			   with "## " before it and " ##" after it, and spacing to pad the remainder
# Arguments: ARG1 = Required: The text to center
# Depends On: echochars
centerheader() {
	# Create an integer to store the length of the text to print
	declare -i LENGTH
	# Set the length to the actual length plus six characters (buffer space for the "##" characters)
	let LENGTH=${#1}+6
	# Create an integer and get the width of the terminal
	declare -i WIDTH=`tput cols`
	# Create an integer for the amount of padding to use
	declare -i PADDINGNUM
	# Calculate the width for the padding... and Bash math rounds down so no need to worry about decimals
	let PADDINGNUM=(${WIDTH}-${LENGTH})/2
	# Print the leading characters, then the space padding, then the text to center, then padding and trailing
	echo -n '##'
	echochars ' ' ${PADDINGNUM} 'no'
	echo -n " $1 "
	echochars ' ' ${PADDINGNUM} 'no'
	echo '##'
}