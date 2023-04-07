--[[ local ClientCommands = {}

--- Send the blinding effect to another player
ClientCommands.SendBlind = function(_, args)
    local target = getPlayerByOnlineId(args.playerId)
    sendServerCommand(target, "Reanimation", "ReceiveBlind", {})
end

----------------------------

local OnClientCommand = function(module, command, playerObj, args)
    print("Received client command: " .. command)
    if module == 'Reanimation' and ClientCommands[command] then
        ClientCommands[command](playerObj, args)
    end
end


Events.OnClientCommand.Add(OnClientCommand)
 ]]
--[[ 
if isClient() then return; end

local Commands = {};
Commands.Reanimation = {};

Commands.Reanimation.isUndead = function(player, args)
    local playerId = player:getOnlineID();
    sendServerCommand('Reanimation', 'isUndead', {id = playerId, isUndead =  args.isUndead})    
end


Events.OnClientCommand.Add(function(module, command, player, args)
	if Commands[module] and Commands[module][command] then
	    Commands[module][command](player, args)
	end
end)
Events.OnClientCommand.Add(OnClientCommand)
 ]]
 --written by Pao


if isClient() then return; end

local Commands = {}
Commands.RA = {}





Commands.RA.NotifyAnimation = function(_, args)
    sendServerCommand("RA", "AcceptNewAnimation", {args.sender, args.anim})
end

function Anim_OnInitGlobalModData()
    ModData.getOrCreate("Anim_PLAYER_DATA")
end

Events.OnInitGlobalModData.Add(Anim_OnInitGlobalModData)





if isClient() then return; end

local Commands = {};
Commands.Reanimation = {};

Commands.Reanimation.isUndead = function(player, args)
    local playerId = player:getOnlineID();
    sendServerCommand('Reanimation', 'isUndead', {id = playerId, isUndead =  args.isUndead})    
end


Events.OnClientCommand.Add(function(module, command, player, args)
	if Commands[module] and Commands[module][command] then
	    Commands[module][command](player, args)
	end
end)