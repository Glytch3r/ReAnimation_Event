local ClientCommands = {}

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