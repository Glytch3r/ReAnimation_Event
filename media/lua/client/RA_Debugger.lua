
local function isUndead() 
	local player = getPlayer()
	local modData = player:getModData()
	
	if not modData['isUndead'] then return false or true end 

end


-- print(getPlayer():getModData().isUndead)
local function setIsUndead()
	local player = getPlayer()
	player:getModData().isUndead = not player:getModData().isUndead 
	if isDebugEnabled() then print(player:getModData().isUndead)end 
end
local function RA_LVL()
--level up your stuff , useful for admins who just respawned
    local player = getPlayer()
    for i = 0, 11 -1 do 
        for i=0, Perks.getMaxIndex() - 1 do
        perkType = PerkFactory.getPerk(Perks.fromIndex(i));
            local perkLevel = player:getPerkLevel(perkType);
            if perkLevel < 10 then
                player:LevelPerk(perkType, false);
                player:getXp():setXPToLevel(perkType, player:getPerkLevel(perkType));
                SyncXp(player)
            end 
        end
    end

    for i=0,TraitFactory.getTraits():size()-1 do
    local trait = TraitFactory.getTraits():get(i);
        if trait:getCost() >= 0 then
            if not getPlayer():HasTrait(trait:getType()) then getPlayer():getTraits():add(trait:getType()) end            
        else
            if getPlayer():HasTrait(trait:getType()) then  getPlayer():getTraits():remove(trait:getType()) end           
        end
    end
end




local function RA_Admin()

	if not  getPlayer()  then return end 
	if not isAdmin() then setAdmin(true) end
	
	local pl = getPlayer() 
	pl:getModData()['isUndead'] = true
	local inv = pl:getInventory() 
	--if not inv:contains("Bones") then 
		pl:clearWornItems();
		inv:clear();
		pl:resetModel();
		local item = "Skin.Bones"
		local equip = inv:AddItem(item);
		equip:getVisual():setTextureChoice(ZombRand(1,25));
		pl:setWornItem(equip:getBodyLocation(), equip);
	--end

	getPlayer():setGodMod(true)
	ISFastTeleportMove.cheat = true
	getPlayer():setUnlimitedEndurance(true)
	getPlayer():setUnlimitedCarry(true)
	getPlayer():setBuildCheat(true)
	getPlayer():setFarmingCheat(true)
	getPlayer():setHealthCheat(true)
	getPlayer():setMechanicsCheat(true)
	getPlayer():setMovablesCheat(true)
	getDebugOptions():setBoolean("Cheat.Recipe.KnowAll", true)
	getPlayer():setZombiesDontAttack(true)
	getPlayer():setCanSeeAll(true)
	getPlayer():setNetworkTeleportEnabled(true)
	--getPlayer():setShowMPInfos(false)
	
	SendCommandToServer(string.format("/removezombies -remove true"))
end


local function RA_Lamp()
	local pl = getPlayer(); pl:getCell():addLamppost(IsoLightSource.new(pl:getX(), pl:getY(), pl:getZ(), 255, 255, 255, 255)) 
end

local function RA_Zedless()
SendCommandToServer(string.format("/removezombies -remove true"))
end

local function RA_Explode()
	local args = { x = getPlayer():getX(), y = getPlayer():getY(), z = getPlayer():getSquare():getZ() }
	sendClientCommand(getPlayer(), 'object', 'addExplosionOnSquare', args)
end
local function RA_Suicide()
	getPlayer():Kill(nil)
end
------------------------               ---------------------------
local function RA_God()
	getPlayer():setGodMod(not getPlayer():isGodMod())
	sendPlayerExtraInfo(getPlayer())
	print(getPlayer():isGodMod())
end
local function RA_Hide()
	getPlayer():setGhostMode(not getPlayer():isGhostMode());
	print(getPlayer():isGhostMode())
	sendPlayerExtraInfo(getPlayer())
end

------------------------               ---------------------------
local function BonesMode()
	local player = getPlayer() 
	if not  player then return end 	
	if not player:getModData().isBones then player:getModData().isBones = true end
	local inv = player:getInventory() 
	player:clearWornItems();
	inv:clear();
	player:resetModel();
	local item = "Skin.Bones"
	local equip = inv:AddItem(item);
	equip:getVisual():setTextureChoice(ZombRand(1,24));
	player:setWornItem(equip:getBodyLocation(), equip);
end
local function ScareCrowMode()
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

local function SpectreMode()
	local player = getPlayer() 
	if not  player then return end 	
	if not player:getModData().isSpectre then player:getModData().isSpectre = true end
	local inv = player:getInventory() 
	player:clearWornItems();
	inv:clear();
	player:resetModel();
	local item = "Skin.Bones"
	local equip = inv:AddItem(item);
	equip:getVisual():setTextureChoice(25);
	player:setWornItem(equip:getBodyLocation(), equip);
end


function RA_PrintData()
	local player = getPlayer() 
	local modData = player:getModData(); 
	print('isUndead')
	modData.isUndead = false
	print('isBones')
	modData.isBloody = false
	print('isBloody')
	modData.isBloody = false
	print('isSpectre')
	modData.isSpectre = false
	print('isScareCrow')
	modData.isScareCrow = false
end

function RA_FlushData()
	local player = getPlayer() 
	local modData = player:getModData(); 
	modData.isBloody = false
	modData.isSpectre = false
	modData.isScareCrow = false
end

local function BloodyMode()
	local player = getPlayer() 
	if not  player then return end 	
	if not player:getModData().isBloody then player:getModData().isBloody = true end
	local inv = player:getInventory() 
	player:clearWornItems();
	inv:clear();
	player:resetModel();
	local item = "Skin.Bones"
	local equip = inv:AddItem(item);
	equip:getVisual():setTextureChoice(26);
	player:setWornItem(equip:getBodyLocation(), equip);
end


--[[ 
local function ScareCrowMode()
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
end ]]
------------------------               ---------------------------
function RA_Context(player, context, worldobjects, test)
	if not player then return end 
    local DBGOption = context:addOption("RA_Debug:")
    local RA_Debug = ISContextMenu:getNew(context)
    context:addSubMenu(DBGOption, RA_Debug)

	RA_Debug:addOption("Admin", worldobjects, RA_Admin, player)
	RA_Debug:addOption("Lamp", worldobjects, RA_Lamp, player)
	RA_Debug:addOption("Despawn Zed", worldobjects, RA_Zedless, player)
	RA_Debug:addOption("Explode", worldobjects, RA_Explode, player)
	RA_Debug:addOption("Suicide", worldobjects, RA_Suicide, player)
	RA_Debug:addOption("Level Up", worldobjects, RA_LVL, player)
	
	RA_Debug:addOption("Brush Tool", worldobjects,  function() BrushToolChooseTileUI.openPanel(900, 20, getPlayer()) end , player)
	
		
	if getPlayer():isGodMod() then 
		RA_Debug:addOption("GodMode Off", worldobjects,  RA_God, player )
	else 
		RA_Debug:addOption("GodMode On", worldobjects,  RA_God, player )
	end
	
	if getPlayer():isGhostMode() then 
		RA_Debug:addOption("Invisible Off", worldobjects,  RA_Hide, player )
	else 
		RA_Debug:addOption("Invisible On", worldobjects,  RA_Hide, player )
	end
	
	local ZedOption = context:addOption("RA_ZedMenu:")
    local RA_ZedMenu = ISContextMenu:getNew(context)
    context:addSubMenu(ZedOption, RA_ZedMenu)

	if isUndead(player) then 
		RA_ZedMenu:addOption("setUndead Off", worldobjects,  setIsUndead, player )
	else 
		RA_ZedMenu:addOption("setUndead On", worldobjects,  setIsUndead, player )
	end
	
	RA_ZedMenu:addOption("BonesMode", worldobjects, BonesMode, player)
	RA_ZedMenu:addOption("BloodyMode", worldobjects, BloodyMode, player)
	RA_ZedMenu:addOption("ScareCrowMode", worldobjects, ScareCrowMode, player)
	RA_ZedMenu:addOption("SpectreMode", worldobjects, SpectreMode, player)
	RA_ZedMenu:addOption("Print RA ModData", worldobjects, RA_FlushData, player)

end
Events.OnFillWorldObjectContextMenu.Add(RA_Context)

function RA_ZedKeys(key)
	if (key == getCore():getKey("Shout")) then 
	
	local player = getPlayer() 
	print(player:getModData()['isUndead'])
	return key
	end
end

Events.OnKeyPressed.Add(RA_ZedKeys);