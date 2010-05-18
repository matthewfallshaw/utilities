#!/bin/bash

exit 0

[ -d /Volumes/Time\ Machine/ ] || [ -d /Volumes/Spare/ ] && osascript /Users/matt/dev/utils/Scripts/SetTimeMachinedrive.scpt
