--[[ local ServerCommands = {}


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
 ]]


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
    
    if player:getModData()['isScareCrow'] then
        if player:getVariableBoolean('isScareCrow') == false then
            player:setVariable('isScareCrow', 'true');
            if isClient() then
                sendClientCommand('Reanimation', 'isScareCrow', {isScareCrow = true})
            end
        end
    else
        if player:getVariableBoolean('isScareCrow') == true then
            player:setVariable('isScareCrow', 'false');
            if isClient() then
                sendClientCommand('Reanimation', 'isScareCrow', {isScareCrow = false})
            end
        end
    end
    
    if player:getModData()['isSpectre'] then
        if player:getVariableBoolean('isSpectre') == false then
            player:setVariable('isSpectre', 'true');
            if isClient() then
                sendClientCommand('Reanimation', 'isSpectre', {isSpectre = true})
            end
        end
    else
        if player:getVariableBoolean('isSpectre') == true then
            player:setVariable('isSpectre', 'false');
            if isClient() then
                sendClientCommand('Reanimation', 'isSpectre', {isSpectre = false})
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

Commands.Reanimation.isScareCrow = function(args)
    local source = getPlayer();
    local player = getPlayerByOnlineID(args.id)
    if source ~= player then
        if args.isScareCrow then
            player:setVariable('isScareCrow', 'true');
        else
            player:setVariable('isScareCrow', 'false');
        end
    end
end
Commands.Reanimation.isSpectre = function(args)
    local source = getPlayer();
    local player = getPlayerByOnlineID(args.id)
    if source ~= player then
        if args.isSpectre then
            player:setVariable('isSpectre', 'true');
        else
            player:setVariable('isSpectre', 'false');
        end
    end
end
Events.OnServerCommand.Add(function(module, command, args)
	if Commands[module] and Commands[module][command] then
		Commands[module][command](args)
	end
end)


