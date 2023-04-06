RA_PlayerDamage = {}


RA_PlayerDamage.Blind = function()
    local player = getPlayer()

    UIManager.setFadeBeforeUI(player:getPlayerNum(), true)
    UIManager.FadeOut(player:getPlayerNum(), 1)
    player:setIgnoreInputsForDirection(true)
    player:setIgnoreMovement(true) 
end