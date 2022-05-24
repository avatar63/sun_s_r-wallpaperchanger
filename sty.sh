#!/bin/bash

echo "I AM NOOB. PLEASE CHANGE ALL IMAGE NAMES TO SUNRISE AND SUNSET DEPENDING ON WHICH YOU WANT AS WHAT."

echo "ALSO THIS SCRIPT ONLY WORKS FOR JPG images."

mkdir ~/Wallpaper_Cngr

cd ~/Wallpaper_Cngr


echo "Enter the number of pairs of wallpapers you would like to make: "
echo "Note. Number of Pairs = N+1. (enter one number less than the number of pairs you have.) "
read N

for ((i=0 ; i\<=$N ; i++ ));
do
	echo "Enter the path of the sunrise image: "
	read P1
	echo "Enter the path of the sunset image: "
	read P2
	mkdir ~/Wallpaper_Cngr/wp$i
	cp $P1 ~/Wallpaper_Cngr/wp$i
	cp $P2 ~/Wallpaper_Cngr/wp$i
done

echo "Complete!"
