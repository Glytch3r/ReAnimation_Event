RA_Scarecrow = {}



RA_Scarecrow.HandleImmortality = function()
    local player = getPlayer()

    player:setGodMod(not player:isMoving())
    sendPlayerExtraInfo(player)
end


RA_Scarecrow.ChangeSkin = function()
	local pl = getPlayer() 
	local inv = pl:getInventory() 

    pl:clearWornItems()
    inv:clear()
    pl:resetModel()

    local item = "Skin.Scare"       -- TODO we need a better name
    local equippedItem = inv:AddItem(item)

    pl:setWornItem(equippedItem:getBodyLocation(), equippedItem)
end


RA_Scarecrow.ExecuteBlind = function(target)
    sendClientCommand(getPlayer(), "Reanimation", "SendBlind", {playerId = target:getOnlineId()})
end


RA_Scarecrow.HandleActions = function(key)

    -- TODO Should listen to keybinds
    -- TODO Make them customizable.


    -- Overrides shout


end

