#!/bin/bash

osascript<<END
tell application "Finder"
	set sel to the selection as text
	set the clipboard to POSIX path of sel
end tell
END
