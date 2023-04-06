RA_Scarecrow = {}


RA_Scarecrow.ExecuteBlind = function(target)

    -- TODO Should send a client command to execute the blind function on the other client
    sendClientCommand(getPlayer(), "Reanimation", "SendBlind", {playerId = target:getOnlineId()})
end


