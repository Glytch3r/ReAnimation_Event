local bloodDrip = 0
bloodyTiles = {
    ["isBloody_0"] = true,
    ["isBloody_1"] = true,
    ["isBloody_2"] = true,
    ["isBloody_3"] = true,
    ["isBloody_4"] = true,
    ["isBloody_5"] = true,
    ["isBloody_6"] = true,
    ["isBloody_7"] = true,
}

function checkBloodyTile(spr)
    return bloodyTiles[spr] or false
end

local function destroyTile(obj)
    if isClient() then
        sledgeDestroy(obj)
    else
        obj:getSquare():transmitRemoveItemFromSquare(obj)
    end
end
 ------------------------               ---------------------------


function RA_dropBlood()
	if bloodDrip == 7 then bloodDrip = 0 end
	bloodDrip=bloodDrip+1
	local square = getPlayer():getCurrentSquare() 
	local object = IsoObject.new(square, "isBloody_"..bloodDrip)
	square:AddTileObject(object);
    if isClient() then 
		object:transmitCompleteItemToServer(); 
		object:transmitCompleteItemToClients()
    end
	
	triggerEvent("OnObjectAdded", object) 
	timer:Simple(1, function() destroyTile(object); end) 	
	ISInventoryPage.renderDirty = true;
	ISInventoryPage.dirtyUI();
end
 

function BloodyZed(ticks)
	local player=getPlayer() 
	if not player then return end
	if player:getModData()['isBloody'] then
		if ticks % 30 == 0 then 
			RA_dropBlood()		
			getPlayerLoot(0):refreshBackpacks()   
		end
	end
end

Events.OnTick.Remove(BloodyZed)
Events.OnTick.Add(BloodyZed)

-- function getBloodSprite() 
    -- local player = getPlayer()
    -- local square = getPlayer():getCurrentSquare()
    -- local objs = square:getObjects()
    -- local sprite = objs:get(objs:size()-1):getTextureName()
    -- local target =  nil
    -- --if luautils.stringStarts(sprite, "isBloody") then
	-- if sprite and checkBloodyTile(sprite) then
        -- target = objs:get(objs:size()-1)
    -- end
	
    -- return target or nil
-- end


      
-- Events.OnPlayerUpdate.Add(function(player) 
    -- if not player:getModData().isBloody then return end
	-- if getBloodSprite() then
		-- if isDebugEnabled() then return; end 
		-- print(getBloodSprite():getTextureName())
		-- player:Say(tostring(getBloodSprite():getTextureName())) 
		-- destroyTile(getBloodSprite())
	-- end
-- end)
