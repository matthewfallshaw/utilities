#@osa-lang:AppleScript
using terms from application "Quicksilver"
	on process text theText
		try
			set theText to theText as number
			set shellCommand to "/bin/echo -n $($(/usr/local/bin/brew --prefix coreutils)/libexec/gnubin/date -d \"+" & theText & " days\" +%Y-%m-%d) | /usr/bin/pbcopy"
			do shell script shellCommand
			display notification (the clipboard)
		on error errorMessage number errorNumber
			display notification errorMessage
		end try
	end process text
end using terms from
