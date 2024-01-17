--------------------------------------------------------
-- [Commands] Debug - Spawn Asteroid
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
-- Spawn an asteroid at the player's position
AuroraFramework.services.commandService.create(function(player, command, args)
    asteroidsLibrary.createAsteroid(
        player,
        player:getPosition(),
        asteroidsLibrary.types.getRandom()
    )
end, "spawnasteroid", {"sa"})