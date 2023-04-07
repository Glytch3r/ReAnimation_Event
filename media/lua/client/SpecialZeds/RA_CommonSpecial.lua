-- [[ Functions used by several special infected zeds--]]


RA_CommonSpecial = {}



RA_CommonSpecial.SetImmortal = function()
    -- TODO do it
end

RA_CommonSpecial.RegenHealth = function(ticks)
    if ticks % 10 == 0 then   
        local player = getPlayer() 
        if player:isGodMod() then player:setGodMod(false) end       -- TODO This doesn't seem right
        local body = player:getBodyDamage()
        local hp = body:getOverallBodyHealth()
        local stats = player:getStats()
        local heal = 10
        body:AddGeneralHealth(hp + heal)        

        local bodyDamage = player:getBodyDamage()
        local bodyParts = bodyDamage:getBodyParts()
        stats:setHunger(0)
        stats:setEndurance(1)
        stats:setFatigue(1)
        stats:setBoredom(0)    
        stats:setSickness(0)
        stats:setThirst(0)
        stats:setFear(0)    
        stats:setStress(0);
        stats:setDrunkenness(0)
        bodyDamage:setColdStrength(0)
        bodyDamage:setWetness(0)
        bodyDamage:setFoodSicknessLevel(0)
        bodyDamage:setPoisonLevel(0) 
        bodyDamage:setUnhappynessLevel(0)
        bodyDamage:setInfected(false)
        bodyDamage:setHasACold(false)
        bodyDamage:setInfectionMortalityDuration(-1)
        bodyDamage:setInfectionTime(-1)
        bodyDamage:setInfectionLevel(0)
        bodyDamage:setInfectionGrowthRate(0);   
        bodyDamage:setFakeInfectionLevel(0)
        if player:isOnFire() then
            if isClient() then
                player:sendStopBurning()
            else
                player:StopBurning()
            end
        end

        for i=bodyParts:size()-1, 0, -1  do
            local bodyPart = bodyParts:get(i)
            bodyPart:SetInfected(false)
            bodyPart:setInfectedWound(false)
            bodyPart:SetFakeInfected(false)
            bodyPart:setWoundInfectionLevel(0)
            bodyPart:setDeepWoundTime(0)
            bodyPart:setScratchTime(0)
            bodyPart:setDeepWounded(false)
            bodyPart:setBleedingTime(0)
            bodyPart:setBurnTime(0)
            bodyPart:SetBitten(false);
            bodyPart:setFractureTime(0)
            player:getFitness():removeStiffnessValue(BodyPartType.ToString(bodyPart:getType()))
            bodyPart:setScratchTime(0)
            bodyPart:setCutTime(0)
        end
    end
end 

RA_CommonSpecial.DisableMoodles = function()
	local player = getPlayer()
	local stats = player:getStats()
	stats:setAnger(0.0)
	stats:setBoredom(0.0)
	stats:setEndurance(1.0)
	stats:setEndurancelast(1.0)
	stats:setEndurancedanger(0.25)
	stats:setEndurancewarn(0.5)
	stats:setFatigue(0.0)
	stats:setFitness(0.0)
	stats:setHunger(0.0)
	stats:setIdleboredom(0.0)
	stats:setMorale(1.0)
	stats:setStress(0.0)
	stats:setStressFromCigarettes(0.0)
	stats:setFear(0.0)
	stats:setPanic(0.0)
	stats:setSanity(1.0)
	stats:setSickness(0.0)
	stats:setPain(0.0)
	stats:setDrunkenness(0.0)
	stats:setNumVisibleZombies(0)
	stats:setTripping(false)
	stats:setTrippingRotAngle(0.0)
	stats:setThirst(0.0)
end


RA_CommonSpecial.DisableFallDamage = function()
    -- local player = getPlayer()
    -- local health = player:getHealth()
    -- print("Health is " .. health)
    
    health:setFallTime(0)       -- TODO What does this do?
    
    
end