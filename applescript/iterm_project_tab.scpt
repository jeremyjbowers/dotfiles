on run argv
	tell application "iTerm"
		activate

		tell the current terminal
			activate current session

			-- launch dailygraphics tab
			launch session "Default Session"
			tell the last session
				set name to "1-" & argv & " gunicorn"
				write text "cd ~/Projects/" & argv
				write text "workon " & argv
				write text "git pull"
				write text "fab app"
				tell i term application "System Events" to keystroke "d" using {command down}
				set name to "2-" & argv
				write text "cd ~/Projects/" & argv
				write text "workon " & argv
				write text "fab -l"
			end tell
		end tell
	end tell
end run