tell application "iTerm"
	activate

	tell the current terminal
		activate current session

		-- launch dailygraphics tab
		launch session "Default Session"
		tell the last session
			set name to "1-dailygraphics server"
			write text "cd ~/Projects/dailygraphics/"
			write text "workon dailygraphics"
			write text "fab app"
			tell i term application "System Events" to keystroke "d" using {command down}
			set name to "2-dailygraphics"
			write text "cd ~/Projects/dailygraphics/"
			write text "workon dailygraphics"
			write text "git pull"
			write text "fab -l"
			tell i term application "System Events" to keystroke "d" using {shift down, command down}
			set name to "3-graphics"
			write text "cd ~/Projects/graphics/"
			write text "git pull"
		end tell

		-- shift focus to dailygraphics tab
		repeat with mysession in sessions
			tell mysession
				set the_name to get name
				if the_name contains "1-dailygraphics" then
					select mysession
					return
				end if
			end tell
		end repeat

	end tell
end tell