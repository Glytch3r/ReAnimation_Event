--[[  local bloodDrip = 0
 local bloodyTiles = {
    "isBloody_0",
    "isBloody_1",
    "isBloody_2",
    "isBloody_3",
    "isBloody_4",
    "isBloody_5",
    "isBloody_6",
    "isBloody_7",
}
 ------------------------               ---------------------------
 
function RA_dropBlood(bloodDrip)
	local square = getPlayer():getCurrentSquare() 
	local object = square:AddTileObject(IsoObject.new(square, "isBloody_"..bloodDrip));
    if isClient() then 
		object:transmitCompleteItemToServer(); 
		object:transmitCompleteItemToClients()
    end
	triggerEvent("OnObjectAdded", object) 
	ISInventoryPage.renderDirty = true;
	ISInventoryPage.dirtyUI();
end
 
 
local Drip = 

if bloodDrip == 7 then bloodDrip = 0 end
bloodDrip=bloodDrip+1





function BloodyZed(ticks)
	if not getPlayer() then return end
	if ticks % 3 == 0 then 
	RA_dropBlood()

    getPlayerLoot(0):refreshBackpacks()   
    end 
	if ticks % 4 == 0 then   end 
	
	
end
Events.OnTick.Remove(BloodyZed)
Events.OnTick.Add(BloodyZed)
 ]]