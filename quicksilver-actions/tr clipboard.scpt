using terms from application "Quicksilver"
	on process text theText
		try
			set shellCommand to "[ -f /usr/local/opt/coreutils/libexec/gnubin/tr ] && /usr/bin/pbpaste | /usr/local/opt/coreutils/libexec/gnubin/tr " & theText & " | /usr/bin/pbcopy || /usr/bin/pbpaste | /usr/bin/tr " & theText & " | /usr/bin/pbcopy"
			do shell script shellCommand
			display notification (the clipboard)
		on error errorMessage number errorNumber
			display notification errorMessage
		end try
	end process text
end using terms from

