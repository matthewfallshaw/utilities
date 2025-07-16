#@osa-lang:AppleScript
using terms from application "Growl.app"
	on «event GrRuNtEv» given «class NtPa»:notification
		if notification's «class ApNm» is "growlnotify" then
			if notification's «class Desc» contains "password" then
				return {«class GrHL»:no}
			end if
		end if
	end «event GrRuNtEv»
end using terms from