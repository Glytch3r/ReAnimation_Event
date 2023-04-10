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

------------------------               ---------------------------

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
    if player:getModData()['isBloody'] then
        if player:getVariableBoolean('isBloody') == false then
            player:setVariable('isBloody', 'true');
            if isClient() then
                sendClientCommand('Reanimation', 'isBloody', {isBloody = true})
            end
        end
    else
        if player:getVariableBoolean('isBloody') == true then
            player:setVariable('isBloody', 'false');
            if isClient() then
                sendClientCommand('Reanimation', 'isBloody', {isBloody = false})
            end
        end
    end
    if player:getModData()['isBones'] then
        if player:getVariableBoolean('isBones') == false then
            player:setVariable('isBones', 'true');
            if isClient() then
                sendClientCommand('Reanimation', 'isBones', {isBones = true})
            end
        end
    else
    if player:getVariableBoolean('isBones') == true then
            player:setVariable('isBones', 'false');
            if isClient() then
                sendClientCommand('Reanimation', 'isBones', {isBones = false})
            end
        end
    end
    if player:getModData()['isFat'] then
        if player:getVariableBoolean('isFat') == false then
            player:setVariable('isFat', 'true');
            if isClient() then
                sendClientCommand('Reanimation', 'isFat', {isFat = true})
            end
        end
    else
        if player:getVariableBoolean('isFat') == true then
            player:setVariable('isFat', 'false');
            if isClient() then
                sendClientCommand('Reanimation', 'isFat', {isFat = false})
            end
        end
    end
    if player:getModData()['isClown'] then
        if player:getVariableBoolean('isClown') == false then
            player:setVariable('isClown', 'true');
            if isClient() then
                sendClientCommand('Reanimation', 'isClown', {isClown = true})
            end
        end
    else
        if player:getVariableBoolean('isClown') == true then
            player:setVariable('isClown', 'false');
            if isClient() then
                sendClientCommand('Reanimation', 'isClown', {isClown = false})
            end
        end
    end
    if player:getModData()['isBoomBoom'] then
        if player:getVariableBoolean('isBoomBoom') == false then
            player:setVariable('isBoomBoom', 'true');
            if isClient() then
                sendClientCommand('Reanimation', 'isBoomBoom', {isBoomBoom = true})
            end
        end
    else
        if player:getVariableBoolean('isBoomBoom') == true then
            player:setVariable('isBoomBoom', 'false');
            if isClient() then
                sendClientCommand('Reanimation', 'isBoomBoom', {isBoomBoom = false})
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
Commands.Reanimation.isBloody = function(args)
    local source = getPlayer();
    local player = getPlayerByOnlineID(args.id)
    if source ~= player then
        if args.isBloody then
            player:setVariable('isBloody', 'true');
        else
            player:setVariable('isBloody', 'false');
        end
    end
end
Commands.Reanimation.isBones = function(args)
    local source = getPlayer();
    local player = getPlayerByOnlineID(args.id)
    if source ~= player then
        if args.isBones then
            player:setVariable('isBones', 'true');
        else
            player:setVariable('isBones', 'false');
        end
    end
end
Commands.Reanimation.isFat = function(args)
    local source = getPlayer();
    local player = getPlayerByOnlineID(args.id)
    if source ~= player then
        if args.isFat then
            player:setVariable('isFat', 'true');
        else
            player:setVariable('isFat', 'false');
        end
    end
end
Commands.Reanimation.isClown = function(args)
    local source = getPlayer();
    local player = getPlayerByOnlineID(args.id)
    if source ~= player then
        if args.isClown then
            player:setVariable('isClown', 'true');
        else
            player:setVariable('isClown', 'false');
        end
    end
end
Commands.Reanimation.isBoomBoom = function(args)
    local source = getPlayer();
    local player = getPlayerByOnlineID(args.id)
    if source ~= player then
        if args.isBoomBoom then
            player:setVariable('isBoomBoom', 'true');
        else
            player:setVariable('isBoomBoom', 'false');
        end
    end
end
Events.OnServerCommand.Add(function(module, command, args)
	if Commands[module] and Commands[module][command] then
		Commands[module][command](args)
	end
end)


