--------------------------------------------------------
-- [Libraries] Asteroids - Helpers
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
asteroidsLibrary.helpers = {
    ---@param pos SWMatrix
    isInSpace = function(pos)
        return pos[14] >= asteroidsLibrary.configuration.spaceThreshold
    end,

    ---@param pos SWMatrix
    ---@param tooClose number
    calculateAsteroidSpawn = function(pos, tooClose)
        local calculatedPos = AuroraFramework.libraries.matrix.randomOffset(
            pos,
            asteroidsLibrary.configuration.asteroidSpawnDistance,
            true
        )

        if matrix.distance(calculatedPos, pos) <= tooClose then
            return asteroidsLibrary.helpers.calculateAsteroidSpawn(pos, tooClose)
        end

        return calculatedPos
    end
}