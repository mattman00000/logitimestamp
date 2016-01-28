function OnEvent(event, arg)
	dbg = false
	OutputLogMessage("date = %s, event = %s, arg = %s\n", GetDate("%Y-%m-%d-%H%M%S"), event, arg)
	lool = ""
	if (event == "G_PRESSED") then
		if (GetMKeyState()==1) then
			if (arg == 14) then
				lool = GetDate("!%Y-%m-%d %H%M.%S")
			end
			if (arg == 17) then
				lool = GetDate("%Y-%m-%d %H%M.%S")
			end
		end
		if (GetMKeyState()==2) then
			if (arg == 13) then
				lool = GetDate("!%m/%d/%Y %H:%M:%S<")
			end
			if (arg == 14) then
				lool = GetDate("!%m/%d/%Y %H:%M:%S>")
			end
			if (arg == 16) then
				lool = GetDate("%m/%d/%Y %H:%M:%S<")
			end
			if (arg == 17) then
				lool = GetDate("%m/%d/%Y %H:%M:%S>")
			end
		end
	end
	if (lool ~= "") then
		if dbg then OutputLogMessage("\n") end
		if dbg then OutputLogMessage("starting gsub\n") end
		if dbg then OutputLogMessage("\n") end
		lool:gsub(".", function(c)
			if dbg then OutputLogMessage("\n") end
			if dbg then OutputLogMessage("iterating gsub: %s\n", c) end
			if dbg then OutputLogMessage("\n") end
			shft = 0
			if c == "-" then
				if dbg then OutputLogMessage("%s found\n",c) end
				c = "minus"
			end
			if c == "." then
				if dbg then OutputLogMessage("%s found\n",c) end
				c = "period"
			end
			if c == " " then
				if dbg then OutputLogMessage("%s found\n",c) end
				c = "spacebar"
			end
			if c == ":" then
				if dbg then OutputLogMessage("%s found\n",c) end
				c = "semicolon"
				shft = 1
			end
			if c == ">" then
				if dbg then OutputLogMessage("%s found\n",c) end
				c = "tab"
			end
			if c == "<" then
				if dbg then OutputLogMessage("%s found\n",c) end
				c = "enter"
			end
			if c == "/" then
				if dbg then OutputLogMessage("%s found\n",c) end
				c = "slash"
			end
			if (shft == 1) then
				if dbg then OutputLogMessage("pressing shift\n") end
				PressKey("rshift")
				PressAndReleaseKey( c )
				ReleaseKey("rshift")
				else
				if dbg then OutputLogMessage("no shift\n") end
				PressAndReleaseKey( c )
			end
		end
		)
	end
end