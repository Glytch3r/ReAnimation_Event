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