-- @ Pao please dont remove this debugger or alter it. 
-- you can take what you need but ultimately this will serve as a tool
-- as so this might be a long code but everything should be here  since they are local anyways
-- we should have a global versions of these things and organized the way you initially planned to 

if not isDebugEnabled() then return; end 

local function isUndead() 
	local player = getPlayer()
	local modData = player:getModData()
	if modData['isUndead'] then 
		return true
	else
		return false
	end
end

-- print(getPlayer():getModData().isUndead)
local function setIsUndead()
	local player = getPlayer()
	player:getModData().isUndead = true 
	print(player:getModData().isUndead)
end


------------------------               ---------------------------
local function doRoll(percent) if percent >= ZombRand(1, 101) then return true end end 

------------------------               ---------------------------
---@param isUndead  is for the lua side. to trigger functions there. (removed the use of this boolean in xmls that are animation related.)
--TODO server commands needs refactoring
local ZedTypes = {
	['isBones']='isBones',
	['isBloody']='isBloody',
	['isSpectre']='isSpectre',
	['isScareCrow']='isScareCrow',
	['isClown']='isClown',
	['isFat']='isFat',
	['isBoomBoom']='isBoomBoom',
}

---@param ZedTypeString string
function setZedType(player, ZedTypeString)
	if not ZedTypeString then player:getModData().isUndead = false return end
	if not player:getModData().ZedType and player:getModData().isUndead then
		player:getModData().ZedType = ZedTypeString
	end
end
--TODO whenver a special zombie type is set it should always turn on the isUndead
------------------------               ---------------------------







------------------------               ---------------------------
function RA_PrintData()
	local player = getPlayer() 
	local modData = player:getModData(); 
	print('-------------------')


	if modData.isBones then print('isBones'); modData.isUndead = true 
	elseif modData.isBloody then print('isBloody'); modData.isUndead = true	 
	elseif modData.isSpectre then print('isSpectre'); modData.isUndead = true 
	elseif modData.isScareCrow then print('isScareCrow'); modData.isUndead = true 
	elseif modData.isClown then print('isClown'); modData.isUndead = true  
	elseif modData.isFat then print('isFat'); modData.isUndead = true
	elseif modData.isFat then print('isBoomBoom'); modData.isUndead = true
	end	
	print('isUndead:');print(modData.isUndead)
end

function RA_FlushData()
	local player = getPlayer() 
	local modData = player:getModData(); 
	RA_PrintData()
	modData.isUndead = false
	modData.isBones = false
	modData.isBloody = false
	modData.isSpectre = false
	modData.isScareCrow = false
	modData.isClown = false
	modData.isFat = false
	modData.isBoomBoom = false
	modData.getZedType = ""
end
------------------------               ---------------------------
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
	
	local player = getPlayer() 
	player:getModData()['isUndead'] = true
	local inv = player:getInventory() 
	--if not inv:contains("Bones") then 
--[[ 		pl:clearWornItems();
		inv:clear();
		pl:resetModel();
		local item = "Skin.Bones"
		local equip = inv:AddItem(item);
		equip:getVisual():setTextureChoice(ZombRand(1,24));
		pl:setWornItem(equip:getBodyLocation(), equip); ]]


	player:setGodMod(true)
	ISFastTeleportMove.cheat = true
	player:setUnlimitedEndurance(true)
	player:setUnlimitedCarry(true)
	player:setBuildCheat(true)
	player:setFarmingCheat(true)
	player:setHealthCheat(true)
	player:setMechanicsCheat(true)
	player:setMovablesCheat(true)
	getDebugOptions():setBoolean("Cheat.Recipe.KnowAll", true)
	player:setZombiesDontAttack(true)
	player:setCanSeeAll(true)
	player:setNetworkTeleportEnabled(true)
	--getPlayer():setShowMPInfos(false)
	
	
end


local function RA_Lamp()
	local pl = getPlayer(); pl:getCell():addLamppost(IsoLightSource.new(pl:getX(), pl:getY(), pl:getZ(), 255, 255, 255, 255)) 
end

local function RA_Zedless()
	SendCommandToServer(string.format("/removezombies -remove true"))
end

local function RA_Explode()
	local player = getPlayer() 
	local args = { x = player:getX(), y = player:getY(), z = player:getSquare():getZ() }
	sendClientCommand(player, 'object', 'addExplosionOnSquare', args)
end

local function RA_Suicide()
	getPlayer():Kill(nil)
end
------------------------               ---------------------------
local function RA_God()
	local player = getPlayer() 
	player:setGodMod(not player:isGodMod())
	sendPlayerExtraInfo(player)
	print(player:isGodMod())
end

local function RA_Hide()
	local player = getPlayer() 
	player:setGhostMode(not player:isGhostMode());
	print(player:isGhostMode())
	sendPlayerExtraInfo(player)
end

------------------------               --------------------------------
---@param texture integer
local function wearThis(item, texture)
	local player = getPlayer()
	if item then
		local inv = player:getInventory() 
		local equip = inv:AddItem(item);
		if texture ~= nil then
			equip:getVisual():setTextureChoice(texture);
		end
		player:setWornItem(equip:getBodyLocation(), equip);
	end
end
local function resetInventory(player)
	local inv = player:getInventory() 
	player:clearWornItems();
	inv:clear();
	player:resetModel();
end
------------------------               ---------------------------
local function BonesMode()
	local player = getPlayer() 
	if not  player then return end 	
	if not player:getModData().isBones then 
		RA_FlushData()
		player:getModData().isBones = true 
		setZedType(player, 'isBones')
	end
	resetInventory(player)	
	local item = "Skin.Science"
	wearThis(item)
end

local function ScareCrowMode()
	local player = getPlayer() 
	if not  player then return end 	
	if not player:getModData().isScareCrow then 
		RA_FlushData()
		player:getModData().isScareCrow = true 
		setZedType(player, 'isScareCrow')
	end
	resetInventory(player)
	local item = "Skin.Scare"
	wearThis(item)
end

local function SpectreMode()
	local player = getPlayer() 
	if not  player then return end 	
	if not player:getModData().isSpectre then 
		RA_FlushData()
		player:getModData().isSpectre = true 
		setZedType(player, 'isSpectre')
	end
	resetInventory(player)
	local item = "Skin.Bones"
	wearThis(item, 24)
end

local function FatMode()
	local player = getPlayer() 
	if not  player then return end 	
	if not player:getModData().isFatty then 
		RA_FlushData()
		player:getModData().isFatty = true 
		setZedType(player, 'isFatty')
	end
	resetInventory(player)
	local item = "AuthenticZLite.FatBody01"
	wearThis(item, 2)
end


local function BloodyMode()
	local player = getPlayer() 
	if not  player then return end 	
	if not player:getModData().isBloody then 
		RA_FlushData()
		player:getModData().isBloody = true 
		setZedType(player, 'isBloody')
	end
	resetInventory(player)
	local item = "Skin.Bones"
	wearThis(item, 25)
end


local function ClownMode()
	local player = getPlayer() 
	if not  player then return end 	
	if not player:getModData().isClown then 
		RA_FlushData()
		player:getModData().isClown = true 
		setZedType(player, 'isClown')
	end
	resetInventory(player)
	local item = "AuthenticZLite.FatBody03_ObeseBod_Clown"
	wearThis(item, 2)
	local item = "AuthenticZLite.Hat_WrinklesMask"
	wearThis(item)
end
local function BoomBoomMode()
	local player = getPlayer() 
	if not  player then return end 	
	if not player:getModData().isBoomBoom then 
		RA_FlushData()
		player:getModData().isBoomBoom = true 
		setZedType(player, 'isBoomBoom')
	end
	resetInventory(player)
	--local item = "AuthenticZLite.FatBody03_ObeseBod_Clown"
	--wearThis(item, 2)
	local item = "AuthenticZLite.CEDAHazmatSuitBlueNoMask"
	wearThis(item)
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


	--TODO put the options below on a submenu
	local ZedSubOption = RA_ZedMenu:addOption("RA_ZedTypeMenu:")
	local RA_ZedTypeMenu = ISContextMenu:getNew(RA_ZedMenu)
    RA_ZedMenu:addSubMenu(ZedSubOption, RA_ZedTypeMenu)
    
	RA_ZedTypeMenu:addOption("BonesMode", worldobjects, BonesMode, player)
	RA_ZedTypeMenu:addOption("BloodyMode", worldobjects, BloodyMode, player)
	RA_ZedTypeMenu:addOption("ScareCrowMode", worldobjects, ScareCrowMode, player)
	RA_ZedTypeMenu:addOption("SpectreMode", worldobjects, SpectreMode, player)
	RA_ZedTypeMenu:addOption("ClownMode", worldobjects, ClownMode, player)
	RA_ZedTypeMenu:addOption("FatMode", worldobjects, FatMode, player)
	RA_ZedTypeMenu:addOption("BoomBoomMode", worldobjects, FatMode, player)
	if isUndead(player) then 
		RA_ZedMenu:addOption("setUndead Off", worldobjects,  setIsUndead, player )
	else 
		RA_ZedMenu:addOption("setUndead On", worldobjects,  setIsUndead, player )
	end
	
		
	RA_ZedMenu:addOption("RA_PrintData", worldobjects, RA_PrintData, player)
	RA_ZedMenu:addOption("RA_FlushData", worldobjects, RA_FlushData, player)
	
	    
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

