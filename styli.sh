#!/bin/bash

# This script is gonna be used to change wallpaper at a specific time of the day based on what time the sunrise/sunset is. This is supposed to be a cronjob but since cron doesn't work on this desktop just yet
# I'll make this a bpf.sh edit later on.
# Step 1: Use grep to identify exactly what time it is including AMPM.
# Step 2: Use wget to find out what time the sunset/sunrise is on a given day.
# Step 3: Compare the output of the first two steps, on true change wallpaper based on what's true, else: continue
# Step 4: Make pairs and figure out a method to select random files. to select from.



# To note. This is a script that is gonna be written with the help of google. I do not want to give up on this idea and i will try to make this work. The purpose of this script is to learn and get more
# comfortable with bash scripting overall.
# on that note, let's do this.
DN=$(date | egrep -o "AM|PM")
echo $DN
TIME=$(date | egrep -o "[[:digit:]]{2}:[[:digit:]]{2}[[:digit:]]{2}")
echo $TIME

echo $TIME $DN



wget https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400

wait

egrep -o "[[:digit:]]{1,2}:[[:digit:]]{1,2}:[[:digit:]]{1,2}" json?lat=36.7201600 | head -2 > file.txt
echo $TIMINGS


SUNRISE=$(head -1 file.txt)
SUNSET=$(tail -1 file.txt)
echo $SUNRISE
echo $SUNSET






FILE=$(($RANDOM%3))
echo $FILE
SUNS=~/scripts/wp$FILE/sunset.jpg
SUNR=~/scripts/wp$FILE/sunrise.jpg
echo $SUNS
echo $SUNR

rm json?lat=36.7201600


if [ $DN == 'AM' ]
then
	echo "AM"
	if [ $SUNRISE == $TIME ]
	then
		gsettings set org.gnome.desktop.background picture-uri #SUNRISE PICS
	fi
elif [ $DN == "PM" ]
then
	echo "PM"
	if [ $SUNRISE  == $TIME ]
	then
		echo "It's Sunset time."
		gsettings set org.gnome.desktop.background picture-uri file://$SUNS

	fi
fi
