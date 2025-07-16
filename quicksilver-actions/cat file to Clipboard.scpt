#@osa-lang:AppleScript
using terms from application "Quicksilver"
	on process text theFile
		try
			-- Get file size in bytes
			tell application "System Events"
				set fileSize to size of file theFile
			end tell

			-- Check if file is larger than 10MB (10485760 bytes)
			if fileSize > 10485760 then
				set errorMsg to "File too large (" & (round (fileSize / 1048576) & " MB). Use 'dangerously' action.")
				tell application "Quicksilver" to set selection to errorMsg
				return
			end if

			-- Read file contents
			set fileContent to read theFile as string

			-- Set clipboard
			set the clipboard to fileContent

			display notification fileContent

		on error errMsg
			set returnedError to "Error: " & errMsg
			tell application "Quicksilver" to set selection to returnedError
		end try
	end process text

	on get direct types
		display notification "got direct types"
		return {"public.text"}
	end get direct types

end using terms from