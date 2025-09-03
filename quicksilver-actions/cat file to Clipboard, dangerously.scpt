#@osa-lang:AppleScript
using terms from application "Quicksilver"
	on process text theFile
		try
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
		return {"public.text"}
	end get direct types

end using terms from