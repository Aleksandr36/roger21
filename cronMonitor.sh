#!/bin/bash

cat /etc/crontab > ~/crontab_save/new

DIFF=$(diff ~/crontab_save/new ~/crontab_seve/crontab)

if [ "$DIFF" != "" ]; then
	echo "Crontab has changed, sending mail!"
	sudo sendmail root < /etc/crontab
	rm ~/crontab_save/crontab
	mv ~/crontab_save/new ~/crontab_save/crontab
	else
		echo "No changes on crontab"
	fi
exit 0
