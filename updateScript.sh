#!/bin/bash

set -e

main()
{
	update
	upgrade
	distUpgrade
	autoRemove
}

#COLORS:
#tput setaf 2 = Green
#tput setaf 3 = Red
#tput setaf 6 = Cyan

#tput sgr0: Reset

update()
{
echo $(tput setaf 6)'Commencing update...'$(tput sgr0) 
sudo apt-get update
if [[ update ]]; then
	echo $(tput setaf 1)'update complete'$(tput sgr0)
else
	echo $(tput setaf 2)'update failed'$(tput sgr0)
	echo trace_output
fi
}

upgrade()
{
echo $(tput setaf 6)'Commencing upgrade...'$(tput sgr0)
sudo apt-get upgrade
if [[ input == "Do you want to continue? [Y/n]" ]]; then
	return "y"
else
	echo '---------------NOTHIN APPEND'
fi
if [[ upgrade ]]; then
	echo $(tput setaf 1)'upgrade complete'$(tput sgr0)
else
	echo $(tput setaf 2)'upgrade failed'$(tput sgr0)
	echo trace_output
fi
}

distUpgrade()
{
echo $(tput setaf 6)'Commencing dist-upgrade...'$(tput sgr0)
sudo apt-get dist-upgrade
if [[ dist-upgrade ]]; then
	echo $(tput setaf 1)'dist-upgrade complete'$(tput sgr0)
else
	echo $(tput setaf 2)'dist-upgrade failed'$(tput sgr0)
	echo trace_output
fi
}

autoRemove()
{
echo $(tput setaf 6)'Commencing autoremove...'$(tput sgr0)
sudo apt-get autoremove
if [[ auto-remove ]]; then
	echo $(tput setaf 1)'autoremove complete'$(tput sgr0)
else
	echo $(tput setaf 2)'autoremove failed'$(tput sgr0)
	echo trace_output
fi
}

main
