#! /bin/bash

#Custom script to change xbacklight value

#Set here your xbacklight file
BRIGHTNESS_FILE='/sys/class/backlight/intel_backlight/brightness'
KEY="$1"
BRIGHTNESS=$(cat "$BRIGHTNESS_FILE")

case $KEY in
	"-u") echo $((BRIGHTNESS + 20)) > $BRIGHTNESS_FILE;; 
	"-d") echo $((BRIGHTNESS - 20)) > $BRIGHTNESS_FILE;; 
esac	
