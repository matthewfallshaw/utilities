using terms from application "Quicksilver"
	on get direct types
		return {"NSFilenamesPboardType"}
	end get direct types
	on open files _items_
		try
			set appName to text 1 through -2 of ((item 1 of _items_) as text)
			tell application appName
				set bundleID to id
				set the clipboard to bundleID
				display notification bundleID
			end tell
		on error a number b
			display notification ("Quicksilver App BundleID script")
			display alert (a)
			set selection to a
		end try
	end open files
end using terms from
