--[[ 
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



function playerZedHandler(playerZed)
	if not playerZed then return end
	--disableFallDmg(playerZed)
--	disableMoodle(playerZed)
	if isPlayerZed():getModData().isImmortal then
		ImmortalFunction(playerZed)
	end
	if isPlayerZed():getModData().isBomber then
		BomberFunction(playerZed)
	end
	if isPlayerZed():getModData().isBomber then
		ScareCrowSkill(playerZed)
	end
	
end

Events.OnPlayerUpdate.Add(playerZedHandler)

------------------------     immortal (shared)          ---------------------------

function isImmortal() 
	
end


------------------------     scarecrow          ---------------------------

function ScareCrowSkill()
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

function setIsUndead(player)
	player:getModData().isUndead = not player:getModData().isUndead 
end


------------------------               ---------------------------
function ScareCrowMode(player)
	setIsUndead(player)
	player:getModData().isScareCrow = not player:getModData().isScareCrow 
end


function SpectreMode(player)	
	setIsUndead(player)
	player:getModData().isSpectre = not player:getModData().isSpectre 
end

function SpectreMode(player)	
	setIsUndead(player)
	player:getModData().isBones = not player:getModData().isBones
end

function BonesMode()
	local player = getPlayer() 
	if not  player then return end 	
	if not player:getModData().isBones then player:getModData().isBones = true end
	local inv = player:getInventory() 
	player:clearWornItems();
	inv:clear();
	player:resetModel();
	local item = "Skin.Bones"
	local equip = inv:AddItem(item);
	equip:getVisual():setTextureChoice(ZombRand(1,25));
	player:setWornItem(equip:getBodyLocation(), equip);
end
function ScareCrowMode()
	local player = getPlayer() 
	if not  player then return end 	
	if not player:getModData().isScareCrow then player:getModData().isScareCrow = true end
	local inv = player:getInventory() 
	player:clearWornItems();
	inv:clear();
	player:resetModel();
	local item = "Skin.Scare"
	local equip = inv:AddItem(item);	
	player:setWornItem(equip:getBodyLocation(), equip);
end


--  getPlayer():setModData().isScareCrow = true 
------------------------   DEBUG            ---------------------------
function RAContextFunc(player, context, worldobjects, test)

	--if not (getCore():getDebug() or isAdmin()) then return; end 
    local Option = context:addOption("RA Menu:")
    local subMenuGlytch = ISContextMenu:getNew(context)
    context:addSubMenu(Option, subMenuGlytch)

	subMenuGlytch:addOption("BoomBoomMode", worldobjects, BoomBoomMode, player)
	subMenuGlytch:addOption("ScareCrowMode", worldobjects, ScareCrowMode, player)
	subMenuGlytch:addOption("ArmadilloMode", worldobjects, ArmadilloMode, player)
	subMenuGlytch:addOption("SpectreMode", worldobjects, SpectreMode, player)
	subMenuGlytch:addOption("BloodyMode", worldobjects, BloodyMode, player)
	subMenuGlytch:addOption("BonesMode", worldobjects, BonesMode, player)
		
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

 ]]