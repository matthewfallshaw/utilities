#@osa-lang:AppleScript
-- Invoke Quicksilver, `.` to enter text entry, supply a `perl` command, like `s/A-Za-z/-/g`
--   Prepend with ~ to force processing of large text.
--   <tab> to the actions pane, choose the modified script, <return> to execute
--   The clipboard will be populated with the result of running the `perl` command over
--   the current contents of the clipboard.

using terms from application "Quicksilver"
	property forceProcessingChar : "~" -- Define the special character

	on process text theText
		try
			-- Check if the clipboard is not empty and contains text
			set clipboardContent to do shell script "/usr/bin/pbpaste"
			if clipboardContent is equal to "" then
				error "Clipboard is empty."
			end if

			-- Check the size of the clipboard content
			if (length of clipboardContent > 10000) and not (theText starts with forceProcessingChar) then
				display notification "Clipboard content is large. Prepend " & forceProcessingChar & " to force processing."
				return
			end if

			-- Sanitize and process the input
			set sanitizedText to my sanitizeInput(theText)
			set shellCommand to "/usr/bin/pbpaste | /usr/bin/perl -pe '" & sanitizedText & "'"
			set shellResult to do shell script shellCommand

			set the clipboard to shellResult
			display notification "Clipboard processed successfully"
		on error errorMessage number errorNumber
			display notification "Error " & errorNumber & ": " & errorMessage
		end try
	end process text
end using terms from

-- Function to sanitize input
on sanitizeInput(inputText)
	-- Remove the special character if present
	if inputText starts with forceProcessingChar then
		set inputText to text 2 through -1 of inputText
	end if
	-- Add further sanitization logic here if needed
	return inputText
end sanitizeInput
