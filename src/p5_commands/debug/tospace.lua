--------------------------------------------------------
-- [Commands] Debug - To Space
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
-- Teleport self to space
AuroraFramework.services.commandService.create(function(player, command, args)
    if not addonConfiguration.dev.debugEnabled then
        return
    end

    local pos = player:getPosition()
    pos[14] = 300000

    player:teleport(pos)
end, "tospace", {"ts"})