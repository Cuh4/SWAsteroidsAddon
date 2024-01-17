--------------------------------------------------------
-- [Commands] Debug - Explode
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/Cuh4/SWAsteroidsAddon
        File Created: 17/01/2024 (dd/mm/yy)

    ----------------------------
]]

-------------------------------
-- // Main
-------------------------------
-- Spawn an explosion at the player's location
AuroraFramework.services.commandService.create(function(player, command, args)
    if not addonConfiguration.dev.debugEnabled then
        return
    end

    server.spawnExplosion(player:getPosition(), tonumber(args[1]) or 0.1)
end, "explode", {"ex"})