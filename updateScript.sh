#!/bin/bash

set -e

main()
{
	updater
	upgrader
	distUpgrader
}

"""
COLORS:
tput setaf 2 = Green
tput setaf 3 = Red
tput setaf 6 = Cyan

tput sgr0: Reset
"""
updater()
{
echo $(tput setaf 6)'Commencing update...'$(tput sgr0) 
sudo apt-get update
if [[ update ]]; then
	echo $(tput setaf 2)'update complete'$(tput sgr0)
else
	echo $(tput setaf 3)'update failed'$(tput sgr0)
	echo trace_output
fi
}

upgrader()
{
echo $(tput setaf 6)'Commencing upgrade...'$(tput sgr0)
sudo apt-get upgrade
if [[ upgrade ]]; then
	echo $(tput setaf 2)'upgrade complete'$(tput sgr0)
else
	echo $(tput setaf 3)'upgrade failed'$(tput sgr0)
	echo trace_output
fi
}

distUpgrader()
{
echo $(tput setaf 6)'Commencing dist-upgrade...'$(tput sgr0)
sudo apt-get dist-upgrade
if [[ dist-upgrade ]]; then
	echo $(tput setaf 2)'dist-upgrade complete'$(tput sgr0)
else
	echo $(tput setaf 3)'dist-upgrade failed'$(tput sgr0)
	echo trace_output
fi
}

main
