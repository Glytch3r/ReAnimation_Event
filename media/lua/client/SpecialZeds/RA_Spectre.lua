--[[
    Cannot kill anything. It can shout and attract hordes of zombies. 
    It cannot be killed or targeted.

    Transparent textures, invisibile while sneaking
]]

RA_Spectre = {}

RA_Spectre.ToggleHide = function()
    local player = getPlayer()
    player:setGhostMode(not player:isGhostMode())
    sendPlayerExtraInfo(player)
end

---------------------

RA_Spectre.HandleActions = function(key)
    RA_BaseZed.HandleActions(key)
    -- TODO Should listen to keybinds
    -- TODO Make them customizable.

end
