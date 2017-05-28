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

#tput sgr0: Color Reset

sup='sudo apt-get update'
sug='sudo apt-get -y upgrade'
sud='sudo apt-get -y dist-upgrade'
sar='sudo apt -y autoremove'

update()
{
	echo $(tput setaf 6)'Commencing update...'$(tput sgr0) 
	# sudo apt-get update
	if [ "$sup" ]; then
		$sup
		echo $(tput setaf 2)'update complete'$(tput sgr0)
	else
		echo $(tput setaf 1)'update failed'$(tput sgr0)
		tput bel
		echo trace_output
	fi
}

upgrade()
{
	echo $(tput setaf 6)'Commencing upgrade...'$(tput sgr0)
	# sudo apt-get upgrade
	if [ "$sug" ]; then
		$sug
		echo $(tput setaf 2)'upgrade complete'$(tput sgr0)
	else
		echo $(tput setaf 1)'upgrade failed'$(tput sgr0)
		tput bel
		echo trace_output
	fi
}

distUpgrade()
{
	echo $(tput setaf 6)'Commencing dist-upgrade...'$(tput sgr0)
	# sudo apt-get dist-upgrade
	if [ "$sud" ]; then
		$sud
		echo $(tput setaf 2)'dist-upgrade complete'$(tput sgr0)
	else
		echo $(tput setaf 1)'dist-upgrade failed'$(tput sgr0)
		tput bel
		echo trace_output
	fi
}

autoRemove()
{
	echo $(tput setaf 6)'Commencing autoremove...'$(tput sgr0)
	# sudo apt-get autoremove
	if [ "$sar" ]; then
		$sar
		echo $(tput setaf 2)'autoremove complete'$(tput sgr0)
	else
		echo $(tput setaf 1)'autoremove failed'$(tput sgr0)
		tput bel
		echo trace_output
	fi
}

main
