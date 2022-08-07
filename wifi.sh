#!/bin/bash
if [ $# -eq 3 ];then 
  nmcli con add con-name $1 ifname wlan0 type wifi ssid $2
  nmcli con modify $1 wifi-sec.key-mgmt wpa-psk
  nmcli con modify $1 wifi-sec.psk $3
  nmcli con up $1
elif [ "$1" = "show" ];then
  nmcli con show
elif [ "$1" = "help" ];then
  echo "con_name, wifi_ssid, password"
elif [ "$1" = "ssid" ];then
  nmcli dev wifi list
elif [ $# -eq 1 ];then
  nmcli con up $1
else 
  echo "wrong parameter!"
  nmcli con show
  nmcli dev wifi list
fi
