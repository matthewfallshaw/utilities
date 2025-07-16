#!/bin/bash

# Check if argument is provided and is either 'on' or 'off'
if [ "$#" -ne 1 ] || { [ "$1" != "on" ] && [ "$1" != "off" ]; }; then
    echo "Usage: $0 [on|off]"
    exit 1
fi

# Execute the curl command
curl -X POST \
     -H "Authorization: Bearer $(security find-generic-password -a matt -s HA_Long_lived_access_Token -w)" \
     -H "Content-Type: application/json" \
     -d "{\"entity_id\": \"switch.coffee_machine\"}" \
     "http://homeassistant.local:8123/api/services/switch/turn_$1"

