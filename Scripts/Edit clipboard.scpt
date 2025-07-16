#@osa-lang:AppleScript
try
	set theResponse to display dialog "Edit your clipboard" default answer (the clipboard as text) with icon note
	set the clipboard to (text returned of theResponse)
	display notification "clipboard:" & return & (the clipboard as text)
end try