



local function InitReanimation()
	local player = getPlayer()
    -- TODO Setup ModData for player

    -- TODO Check if player is already an infected or special zed

	if not player:getModData().isUndead then
		player:getModData().isUndead = false
	end
	if not player:getModData().isScareCrow then
		player:getModData().isScareCrow = false
	end
	if not player:getModData().isSpectre then
		player:getModData().isSpectre = false
	end
end

Events.OnGameStart.Add(InitReanimation)
