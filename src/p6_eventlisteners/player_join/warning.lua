--------------------------------------------------------
-- [Event Listeners] Player Join - Warning
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/Cuh4/SWAsteroidsAddon
        Created: 14/01/2024 (dd/mm/yy)

    ----------------------------
]]

-------------------------------
-- // Main
-------------------------------
-- Send a warning to new players if Space DLC is disabled
---@param player af_services_player_player
AuroraFramework.services.playerService.events.onJoin:connect(function(player)
    if AuroraFramework.attributes.SpaceEnabled then
        return
    end

    helpersLibrary.chat.send("This addon requires the Space DLC. Please create a new save with it enabled.", player)
end)