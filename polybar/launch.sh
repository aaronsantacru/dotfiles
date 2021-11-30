#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Wait until the precesses have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar laptop-bar &

# Execute the second bar if monitor is connected

if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
	polybar external-monitor &
fi

