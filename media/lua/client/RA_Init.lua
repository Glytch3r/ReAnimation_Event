



local function InitReanimation()
    -- TODO Setup ModData for player

    -- TODO Check if player is already an infected or special zed

	if not getPlayer():getModData().isUndead then
		getPlayer():getModData().isUndead = false
	end
end

Events.OnGameStart.Add(InitReanimation)
