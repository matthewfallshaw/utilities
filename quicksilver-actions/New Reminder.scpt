#@osa-lang:AppleScript
using terms from application "Quicksilver"
	on process text _text

		set defaultList to "Reminders"

		-- <reminder text> #<list> @<time>
		set regex_pattern to "^([^#@]+?) *(?:(?:#([^@]+))|(?:@([^#]+)))*$"

		if _text is equal to "" or _text is equal to "help" or _text is equal to "-h" then
			display notification "To make a Reminder I'm expecting something like 'buy milk #Family @6pm'"
			error "To make a Reminder I'm expecting something like 'buy milk #Family @6pm'"
		end if

		-- Parse input
		set theReminder to reExtract(_text, regex_pattern, 1)

		-- Set target list
		set theListRaw to reExtract(_text, regex_pattern, 2)
		tell application "Reminders"
			try
				set theList to (first item of (lists whose name is defaultList))
			on error
				set theList to (first item of lists)
			end try
			if theListRaw is not "" then
				try
					set theList to (first item of (lists whose name is theListRaw))
				on error
					display notification theListRaw & "isn't one of your Reminder lists. I'll use " & name of theList & ". (\"" & _text & "\")"
				end try
			end if
		end tell
		set theReminder to theReminder & " #" & theList

		-- Set target time
		set theTimeRaw to reExtract(_text, regex_pattern, 3)
		if theTimeRaw is not "" then
			set theTime to (do shell script "/bin/echo -n $($(/usr/local/bin/brew --prefix coreutils)/libexec/gnubin/date -d \"" & theTimeRaw & "\" \"+%A, %d %B %Y at %T\")")
			if theTime is "" then
				set theTime to (do shell script "ruby -rrubygems -rchronic -e \"the_date = Chronic.parse(" & quoted form of theTimeRaw & "); puts the_date ? the_date.strftime('%d %B %Y %H:%M:%S') : ''\"")
				if theTime is "" then
					display notification "I couldn't make '" & theTimeRaw & "' into a time."
					set theReminder to theReminder & " @" & theTimeRaw
				end if
			end if
			if theTime is not "" then set theTime to date (theTime)
		else
			set theTime to ""
		end if

		-- Make reminder
		tell application "Reminders"
			tell theList
				if theTime is equal to "" then
					make new reminder with properties {name:theReminder, body:""}
				else
					make new reminder with properties {name:theReminder, body:"", due date:theTime, remind me date:theTime}
				end if
			end tell
			activate
		end tell

	end process text

	on get direct types
		return {"NSStringPboardType"}
	end get direct types

end using terms from

on reExtract(theText, regex, capture)
	do shell script "ruby <<ahz3Yaazah2see
raw_text = <<'voh2veemeecaoZ'
" & theText & "
voh2veemeecaoZ
regex = <<'ouJe4ohgei7kie0zeg4c'
" & regex & "
ouJe4ohgei7kie0zeg4c
capture = " & capture & "
puts raw_text.chomp[Regexp.new(regex.chomp), capture]
ahz3Yaazah2see"
end reExtract