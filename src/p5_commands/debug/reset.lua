--------------------------------------------------------
-- [Commands] Debug - Reset
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/Cuh4/SWAsteroidsAddon
        File Created: 14/01/2024 (dd/mm/yy)

    ----------------------------
]]

-------------------------------
-- // Main
-------------------------------
-- Reset player data
AuroraFramework.services.commandService.create(function(player, command, args)
    if not addonConfiguration.dev.debugEnabled then
        return
    end

    for _, playerToRemove in pairs(AuroraFramework.services.playerService.getAllPlayers()) do
        AuroraFramework.services.playerService.internal.removePlayerData(playerToRemove.properties.peer_id)
    end
end, "resetplayers", {"rp"})