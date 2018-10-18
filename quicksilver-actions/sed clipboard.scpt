using terms from application "Quicksilver"
	on process text theText
		try
			set shellCommand to "/usr/bin/pbpaste | /usr/bin/sed -E '" & theText & "'"
			set shellResult to do shell script shellCommand
			set the clipboard to shellResult
			display notification (the clipboard)
		on error errorMessage number errorNumber
			display notification errorMessage
		end try
	end process text
end using terms from

