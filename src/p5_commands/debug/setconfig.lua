--------------------------------------------------------
-- [Commands] Debug - Set Config
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
-- Set asteroid config to intense stuffs
---@param player af_services_player_player
AuroraFramework.services.commandService.create(function(player, command, args)
    if not player.properties.admin then
        return
    end

    asteroidsLibrary.configuration.asteroidDensity = 25
    asteroidsLibrary.configuration.asteroidSpawnDistance = 10
    asteroidsLibrary.configuration.asteroidSpawnTravelDistance = 5
    asteroidsLibrary.configuration.despawnDistance = 500
end, "setconfig", {"sc"})