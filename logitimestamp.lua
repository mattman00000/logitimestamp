function OnEvent(event, arg)
	OutputLogMessage("date = %s, event = %s, arg = %s\n", GetDate("%Y-%m-%d-%H%M%S"), event, arg)
	lool = ""
--	police = 0
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
			-- if (arg == 10) then
				-- police = 1
				-- while (police == 1) do
					-- dutyInterval = 1000
					-- if ((GetRunningTime()%dutyInterval)<(dutyInterval/2)) then
						-- SetBacklightColor(255, 0, 0, kb)
						-- SetBacklightColor(0, 0, 255, lhc)
						-- else
						-- SetBacklightColor(0, 0, 255, kb)
						-- SetBacklightColor(255, 0, 0, lhc)
					-- end
				-- end
			-- end
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
	-- if event == "G_RELEASED" and GetMKeyState() == 2 and arg == 10 then
		-- police = 0
	-- end
	if (lool != "") then
		lool:gsub(".", function(c)
				shft = 0
				if c == "-" then
					c = "minus"
				end
				if c == "." then
					c = "period"
				end
				if c == " " then
					c = "spacebar"
				end
				if c == ":" then
					c = "semicolon"
					shft = 1
				end
				if c == ">" then
					c = "tab"
				end
				if c == "<" then
					c = "enter"
				end
				if (shft == 1) then
					PressKey("shift")
					PressAndReleaseKey( c )
					ReleaseKey("shift")
					else
					PressAndReleaseKey( c )
				end
			end
		)
	end
end
