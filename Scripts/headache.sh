#!/bin/bash
set -euo pipefail

# Dim displays
/usr/local/bin/nightshift-toggle on

# Turn off office ceiling light
hass-cli \
  --token "$(/usr/bin/security find-generic-password -a 'matt' -s 'HA_Long_lived_access_Token' -w)" \
  service call light.turn_off --arguments entity_id=light.office_ceiling \
  1>/dev/null
