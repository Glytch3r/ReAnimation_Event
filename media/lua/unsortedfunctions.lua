
------------------------   z types            ---------------------------
zedTypes = {


}

------------------------   blind            ---------------------------
UIManager.setFadeBeforeUI(getPlayer():getPlayerNum(), true)
UIManager.FadeOut(getPlayer():getPlayerNum(), 1)
getPlayer():setIgnoreInputsForDirection(true);
getPlayer():setIgnoreMovement(true) 
------------------------     unblind          ---------------------------

UIManager.FadeIn(getPlayer():getPlayerNum(), 1)
getPlayer():setIgnoreInputsForDirection(false);
getPlayer():setIgnoreMovement(false) 

------------------------     stagger          ---------------------------
	getPlayer():setBumpType("stagger");getPlayer():setVariable("BumpDone", false); getPlayer():setVariable("BumpFall", true);
	
	------------------------               ---------------------------

	if key ~= getCore():getKey("Shout") then 
		if isPlayerZed then
			
		return key
		end	
	end
	
	
	------------------------    disable moodle           ---------------------------
	
function disableMoodle(playerZed)
	local player = playerZed
	local Stats = player:getStats()
	Stats:setAnger(0.0)
	Stats:setBoredom(0.0)
	Stats:setEndurance(1.0)
	Stats:setEndurancelast(1.0)
	Stats:setEndurancedanger(0.25)
	Stats:setEndurancewarn(0.5)
	Stats:setFatigue(0.0)
	Stats:setFitness(0.0)
	Stats:setHunger(0.0)
	Stats:setIdleboredom(0.0)
	Stats:setMorale(1.0)
	Stats:setStress(0.0)
	Stats:setStressFromCigarettes(0.0)
	Stats:setFear(0.0)
	Stats:setPanic(0.0)
	Stats:setSanity(1.0)
	Stats:setSickness(0.0)
	Stats:setPain(0.0)
	Stats:setDrunkenness(0.0)
	Stats:setNumVisibleZombies(0)
	Stats:setTripping(false)
	Stats:setTrippingRotAngle(0.0)
	Stats:setThirst(0.0)
end
------------------------     immortal (shared)          ---------------------------

function isImmortal() 
end
function setImmortal() 
 Events.OnPlayerUpdate.Add(disableMoodle)
end


------------------------     scarecrow          ---------------------------

function scarecrow()
	if getPlayer():isMoving() then
		getPlayer():setGodMod(not getPlayer():isGodMod())
		sendPlayerExtraInfo(getPlayer())
		print(getPlayer():isGodMod())
	end
end

------------------------               ---------------------------
function isPlayerZed()
	local isZed = getPlayer():getModData().isUndead
	return isZed or false
end

function getPlayerZed()
	if getPlayer():getModData().isUndead then
		return getPlayer()
	end
end
------------------------     bomb        ---------------------------
local x,y,z = getPlayerZed():getX(), getPlayerZed():getY(), getPlayerZed():getZ() 
local args = { x = x, y = y, z = z }
sendClientCommand(getPlayerZed(), 'object', 'addExplosionOnSquare', args)
getPlayerZed():Kill(nil)
------------------------               ---------------------------

function initReanimation()
	if not getPlayer():getModData().isUndead then
		getPlayer():getModData().isUndead = false
	end
end
Events.OnGameStart.Add(initReanimation)
------------------------   disable fall dmg            ---------------------------

function disableFallDmg(playerZed)
	if not isPlayerZed() then return end
	print(playerZed:getCurrentState())
	local CurrentHealth = playerZed:getHealth()
	print("Health is " .. CurrentHealth)
	
	print(playerZed:getFallTime())
	playerZed:setFallTime(0)
	
end


function playerZedHandler(playerZed)
	if not isPlayerZed() then return end
	disableFallDmg(playerZed)
	disableMoodle(playerZed)
end

Events.OnPlayerUpdate.Add(playerZedHandler)

