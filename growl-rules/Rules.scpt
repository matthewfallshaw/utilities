using terms from application "Growl"
	on evaluate notification with notification
		if notification's app name is "growlnotify" then
			if notification's note description contains "password" then
				return {history log:no}
			end if
		end if
	end evaluate notification
end using terms from
