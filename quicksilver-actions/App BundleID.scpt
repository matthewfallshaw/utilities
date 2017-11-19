using terms from application "Quicksilver"
	on get direct types
		return {"NSFilenamesPboardType"}
	end get direct types
	on open files _items_
		try
			tell application "Hammerspoon"
				set bundleID to do shell script "/usr/local/bin/hs -c \"u.applicationBundleID('" & _items_ & "')\""
			end tell
		on error a number b
			display notification ("Quicksilver App BundleID script")
			display alert (a)
			set selection to a
		end try
	end open files
end using terms from
