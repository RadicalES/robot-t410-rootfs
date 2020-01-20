#!/bin/sh

DISPLAY=:0.0
export DISPLAY

export TZ=Africa/Johannesburg

echo 1 >> /sys/class/leds/rbt410:serialpwr/brightness

