local ServerCommands = {}


ServerCommands.ReceiveBlind = function(args)

    RA_PlayerDamage.Blind()
end

-------------------------

local function OnServerCommand(module, command, args)

    if ServerCommands[module] and ServerCommands[module][command] then
        ServerCommands[module][command](args)
    end

end

Events.OnServerCommand.Add(OnServerCommand)



local Commands = {};
Commands.Reanimation = {};

Events.OnPlayerUpdate.Add(function(player)
    if player:getModData()['isUndead'] then
        if player:getVariableBoolean('isUndead') == false then
            player:setVariable('isUndead', 'true');
            if isClient() then
                sendClientCommand('Reanimation', 'isUndead', {isUndead = true})
            end
        end
    else
        if player:getVariableBoolean('isUndead') == true then
            player:setVariable('isUndead', 'false');
            if isClient() then
                sendClientCommand('Reanimation', 'isUndead', {isUndead = false})
            end
        end
    end
end)


Commands.Reanimation.isUndead = function(args)
    local source = getPlayer();
    local player = getPlayerByOnlineID(args.id)

    if source ~= player then
        if args.isUndead then
            player:setVariable('isUndead', 'true');
        else
            player:setVariable('isUndead', 'false');
        end
    end
end

Events.OnServerCommand.Add(function(module, command, args)
	if Commands[module] and Commands[module][command] then
		Commands[module][command](args)
	end
end)


