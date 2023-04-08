RA_PlayerDamage = {}


RA_PlayerDamage.Unblind = function()
    local player = getPlayer()      -- inefficient.

    UIManager.FadeIn(player:getPlayerNum(), 1)
    player:setIgnoreInputsForDirection(false)
    player:setIgnoreMovement(false) 

end



RA_PlayerDamage.Blind = function()
    local player = getPlayer()

    UIManager.setFadeBeforeUI(player:getPlayerNum(), true)
    UIManager.FadeOut(player:getPlayerNum(), 1)
    player:setIgnoreInputsForDirection(true)
    player:setIgnoreMovement(true) 


    timer.Simple(1, RA_PlayerDamage.Unblind)
end

function RA_PlayerDamage.onhit(wielder, target, handWeapon, damage)   
    if wielder:getModData().isUndead and not target:getModData().isUndead then 
        target:getBodyDamage():setOverallBodyHealth(0)
    end
end
Events.OnWeaponHitCharacter.Remove(RA_PlayerDamage.onhit)
Events.OnWeaponHitCharacter.Add(RA_PlayerDamage.onhit)
