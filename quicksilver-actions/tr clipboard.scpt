using terms from application "Quicksilver"
	on process text theText
		try
			set shellCommand to "[ -f /usr/local/opt/coreutils/libexec/gnubin/tr ] && /usr/bin/pbpaste | /usr/local/opt/coreutils/libexec/gnubin/tr " & theText & " || /usr/bin/pbpaste | /usr/bin/tr " & theText
			set shellResult to do shell script shellCommand
			set the clipboard to shellResult
			display notification (the clipboard)
		on error errorMessage number errorNumber
			display notification errorMessage
		end try
	end process text
end using terms from

