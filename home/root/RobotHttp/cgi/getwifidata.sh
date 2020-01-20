#!/bin/sh
# 
# getnwkcfg.sh
# Script to retrieve the current network setup and return as JSON result
#
# (C) 2016, Radical Electronic Systems - www.radicalsystems.co.za
# Written by Jan Zwiegers, jan@radicalsystems.co.za



# retrieve MAC address
# ifconfig eth0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'
# cat /sys/class/net/eth0/address
# ip link show eth0 | awk '/ether/ {print $2}'
# ifconfig eth0 | awk '/HWaddr/ {print $5}'
# x=$(ifconfig eth0) && x=${x#*HWaddr } && echo ${x%% *}
# ifconfig | grep HW | awk '{print $5}'

WIFIIFDEV=wlan0
WIFIMAC=$(cat /sys/class/net/wlan0/address)
RES=$?

# WIFICON=$(iwconfig wlan0 | grep ESSID)
# WIFILIST=$(iwlist wlan0 scan | grep ESSID)

# IEEE 802.11  ESSID:"radairport"
# Mode:Managed  Frequency:2.412 GHz  Access Point: F0:9F:C2:7A:18:DF
# Bit Rate=1 Mb/s   Tx-Power=20 dBm
# Retry short  long limit:2   RTS thr:off   Fragment thr:off
# Encryption key:off
# Power Management:off
# Link Quality=41/70  Signal level=-69 dBm
# Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
# Tx excessive retries:1  Invalid misc:6   Missed beacon:0

# IEEE 802.11  ESSID:off/any
# Mode:Managed  Frequency:2.412 GHz  Access Point: Not-Associated
# Tx-Power=20 dBm
# Retry short  long limit:2   RTS thr:off   Fragment thr:off
# Encryption key:off
# Power Management:off

FREQ="0"
LQ="0"
SL="0"
AP="Not-Associated"

WIFIDAT=$(iwconfig wlan0)
ESSID=$(grep ESSID <<< $WIFIDAT)
ESSID=${ESSID#*ESSID:}
# remove white space at the end
ESSID=${ESSID//[[:space:]]}

if [ "$ESSID" != "off/any" ]; then
    ESSID=$(grep ESSID <<< $WIFIDAT)
    ESSID=${ESSID#*ESSID:\"}
    ESSID=${ESSID%\"*}
    FREQ=$(grep Frequency <<< $WIFIDAT)
    FREQ=${FREQ#*Frequency:}
    FREQ=${FREQ% GHz*}
    LQ=$(grep Link <<< $WIFIDAT)
    LQ=${LQ#*Link Quality=}
    LQ=${LQ%  Signal*}
    SL=$(grep Signal <<< $WIFIDAT)
    SL=${SL#*Signal level=}
    SL=${SL% dBm*}
    AP=$(grep Access <<< $WIFIDAT)
    AP=${AP#*Access Point: }
    # AP=${AP%%+([[:space:]])}
    # Remove all whitespace
    AP=${AP//[[:space:]]}
else
    ESSID="Not connected"
fi

echo "{\"status\":\"OK\",\"ESSID\":\"$ESSID\",\"APMAC\":\"$AP\",\"frequency\":\"$FREQ GHz\",\"linkquality\":\"$LQ\",\"signallevel\":\"$SL dBm\"}"
