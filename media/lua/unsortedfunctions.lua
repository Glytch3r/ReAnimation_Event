
------------------------   z types            ---------------------------
zedTypes = {


}




	------------------------               ---------------------------

	if key ~= getCore():getKey("Shout") then 
		if isPlayerZed then
			
		return key
		end	
	end
	
	
	------------------------    disable moodle           ---------------------------


------------------------   disable fall dmg            ---------------------------



function playerZedHandler(playerZed)
	if not isPlayerZed() then return end
	disableFallDmg(playerZed)
	disableMoodle(playerZed)
	
	if isPlayerZed():getModData().isImmortal then
		ImmortalFunction(playerZed)
	end
	
	if isPlayerZed():getModData().isBomber then
		BomberFunction(playerZed)
	end
	
end

Events.OnPlayerUpdate.Add(playerZedHandler)

------------------------     immortal (shared)          ---------------------------

function isImmortal() 
end


------------------------     scarecrow          ---------------------------

function ScareCrow()
	if getPlayer():isMoving() then
		getPlayer():setGodMod(false)
		sendPlayerExtraInfo(getPlayer())
	else
		getPlayer():setGodMod(false)
		sendPlayerExtraInfo(getPlayer())
	end
		print(getPlayer():isGodMod())
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


------------------------               ---------------------------









------------------------               ---------------------------
function RAContextFunc(player, context, worldobjects, test)

	
    local Option = context:addOption("RA Menu:")
    local subMenuGlytch = ISContextMenu:getNew(context)
    context:addSubMenu(Option, subMenuGlytch)

	subMenuGlytch:addOption("BomberSkin", worldobjects, bomber, player)
	subMenuGlytch:addOption("ScareCrowSkin", worldobjects, crow, player)
	subMenuGlytch:addOption("crawler", worldobjects, crawler, player)
	subMenuGlytch:addOption("SpectreSkin", worldobjects, spectre, player)
		
		
	subMenuGlytch:addOption("Lamp", worldobjects, lamp, player)
	

	subMenuGlytch:addOption("Brush Tool", worldobjects,  function() 	BrushToolChooseTileUI.openPanel(900, 20, getPlayer()) end , player)

	
	if getPlayer():isGodMod() then 
		subMenuGlytch:addOption("GodMode Off", worldobjects,  togglegod, player )
	else 
		subMenuGlytch:addOption("GodMode On", worldobjects,  togglegod, player )
	end
	
	if getPlayer():isGhostMode() then 
		subMenuGlytch:addOption("Invisible Off", worldobjects,  togglehide, player )
	else 
		subMenuGlytch:addOption("Invisible On", worldobjects,  togglehide, player )
	end
	

end
Events.OnFillWorldObjectContextMenu.Add(RAContextFunc)

