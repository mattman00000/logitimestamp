-- @name        Date/Time Stamp Inserter Lua Script
-- @author      mattman00000
-- @namespace   https://github.com/mattman00000/logitimestamp/
-- @description allows the use of G-keys to insert date and time
-- @version     0.6.9

function OnEvent(event, arg, fam)
	-- if (fam == "kb" and ) then --for now just if-blockin' the whole thing
	dbg = false
	OutputLogMessage("date = %s, event = %s, arg = %s\n", GetDate("%Y-%m-%d-%H%M%S"), event, arg)
	lool = ""
	-- if (fam == "kb" and event == "G_PRESSED") then
	-- if (fam == "kb" and GetMKeyState()==1) then
	if (event == "G_PRESSED") then
		if (fam == "kb" and GetMKeyState()==1 and arg == 14) then
			lool = GetDate("!%Y-%m-%d_%H%M.%S")
		end
		if (GetMKeyState()==1 and ((fam == "kb" and arg == 17) or (fam=="lhc" and arg == 1))) then
			lool = GetDate("%Y-%m-%d_%H%M.%S")
		end
		-- end
		-- if (fam == "kb" and GetMKeyState()==2) then
		if (fam == "kb" and GetMKeyState()==2 and arg == 13) then
			lool = GetDate("!%m/%d/%Y %H:%M:%S<")
		end
		if (fam == "kb" and GetMKeyState()==2 and arg == 14) then
			lool = GetDate("!%m/%d/%Y %H:%M:%S>")
		end
		if (fam == "kb" and GetMKeyState()==2 and arg == 16) then
			lool = GetDate("%m/%d/%Y %H:%M:%S<")
		end
		if (fam == "kb" and GetMKeyState()==2 and arg == 17) then
			lool = GetDate("%m/%d/%Y %H:%M:%S>")
		end
	end
	-- end
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
		if c == "_" then
			if dbg then OutputLogMessage("%s found\n",c) end
			c = "minus"
			shft = 1
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
	-- end --end of if (fam == "kb")
end