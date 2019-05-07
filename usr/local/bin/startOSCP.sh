#!/bin/bash
# Author: Brian Mork (Hermit)
# Purpose: Get to Dropbox-backed OSCP folder consistently, and start tmux
#          with all configured bells and whistles (see .tmux.conf)

# Jump to OSCP directory
cd /root/Dropbox/OSCP

# Check for existing session
CFS=`tmux ls | grep -c OSCP`
# If no session was found
if [[ ${CFS} -eq 0 ]]; then
	# Create one
  tmux new -s OSCP
else
	# Attach to the existing session
  tmux attach -t OSCP
fi
