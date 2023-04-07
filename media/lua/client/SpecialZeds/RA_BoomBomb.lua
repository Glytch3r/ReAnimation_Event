--[[
    Should explode upon contact, dying immediately
]]


RA_BoomBomb = {}

RA_BoomBomb.Explode = function()
    local player = getPlayer()

    local x,y,z = player:getX(), player:getY(), player:getZ() 
    local args = { x = x, y = y, z = z }
    sendClientCommand(getPlayerZed(), 'object', 'addExplosionOnSquare', args)
    player:Kill(nil)

end

RA_BoomBomb.HandleActions = function(key)
    RA_BaseZed.HandleActions(key)
    -- TODO Should listen to keybinds
    -- TODO Make them customizable.

end
