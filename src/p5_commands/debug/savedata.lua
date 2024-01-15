--------------------------------------------------------
-- [Commands] Debug - Save Data
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
-- Print g_savedata
---@param player af_services_player_player
AuroraFramework.services.commandService.create(function(player, command, args)
    if not player.properties.admin then
        return
    end

    mainLogger:send(g_savedata)
end, "savedata", {"sd"})