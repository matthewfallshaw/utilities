#@osa-lang:AppleScript
set shellCommand to "/usr/bin/lorem 1"
set scriptResult to do shell script shellCommand
tell application "System Events" to keystroke scriptResult