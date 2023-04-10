


require 'RA_Debugger'
local function InitReanimation()
	local player = getPlayer()
    -- TODO Setup ModData for player

    -- TODO Check if player is already an infected or special zed

	RA_FlushData()
end

Events.OnGameStart.Add(InitReanimation)
