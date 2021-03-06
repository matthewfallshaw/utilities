using terms from application "Quicksilver"
	on process text _text

		set regex_pattern to "^([^#@]+?) *(?:(?:#([^@]+))|(?:@([^#]+)))*$"

		if _text is equal to "" or _text is equal to "help" or _text is equal to "-h" then
			display notification "To make a Reminder I'm expecting something like 'buy milk #Family @6pm'"
			error "To make a Reminder I'm expecting something like 'buy milk #Family @6pm'"
		end if

		set reminderLists to {}
		tell application "Reminders"
			repeat with listIndex from 1 to (count of list)
				set oneList to list listIndex
				copy (name of oneList) to end of reminderLists
			end repeat
		end tell

		set theReminder to reExtract(_text, regex_pattern, 1)

		set theListRaw to reExtract(_text, regex_pattern, 2)
		if theListRaw is not "" then
			set theList to theListRaw
		else
			set theList to (first item of reminderLists)
		end if
		if reminderLists does not contain theList then
			display notification theList & " isn't one of your Reminder lists, using " & (first item of reminderLists)
			set theReminder to theReminder & " #" & theList
			set theList to (first item of reminderLists)
		end if

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

		try
			tell application "Reminders"
				tell list theList
					if theTime is equal to "" then
						make new reminder with properties {name:theReminder, body:""}
					else
						make new reminder with properties {name:theReminder, body:"", due date:theTime, remind me date:theTime}
					end if
				end tell
				activate
			end tell
		on error errStr number errorNumber
			display notification errStr & errorNumber
			error errStr number errorNumber
		end try

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
