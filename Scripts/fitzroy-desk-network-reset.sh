#!/bin/sh

if [[ "$(/usr/sbin/networksetup -getnetworkserviceenabled "Broadcom NetXtreme Gigabit Ethernet Controller")" = "Enabled" ]]
then sudo /usr/sbin/networksetup -setnetworkserviceenabled "Broadcom NetXtreme Gigabit Ethernet Controller" off &> /dev/null; sleep 3; sudo /usr/sbin/networksetup -setnetworkserviceenabled "Broadcom NetXtreme Gigabit Ethernet Controller" on &> /dev/null
fi
