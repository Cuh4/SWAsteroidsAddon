--------------------------------------------------------
-- [Main] Stormworks Asteroids Addon
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
-- // Variables
-------------------------------
g_savedata.userAddonConfig = {
    -- do not split "property.blabla" over multiple lines. stormworks parses the text, not the code, so it will not work and crash your game
    asteroidDensity = property.slider("Asteroid Density - How many asteroids to spawn at once", 1.0, 15.0, 1.0, 12.0),
    despawnDistance = property.slider("Asteroid Despawn Range (meters) - How far a player must go from an asteroid for it to despawn", 100.0, 500.0, 1.0, 150.0),
    spawnDistance = property.slider("Asteroid Spawn Distance (meters) - How close/far an asteroid spawns near a player", 12.0, 200.0, 1.0, 65.0),
    travelDistance = property.slider("Required Travel Distance To Spawn Asteroids (meters) - How far a player must travel for asteroids to spawn near them", 25.0, 2000.0, 10.0, 100.0),
    explodeAsteroidsOnDespawn = property.checkbox("Asteroid Explode On Despawn - Whether or not to create an explosion when asteroids naturally despawn (requires Weapons DLC)", true)
}

-------------------------------
-- // Functions
-------------------------------
-- Setup the asteroid library's configuration from g_savedata.userAddonConfig
setupAsteroidLibConfig = function()
    asteroidsLibrary.configuration.asteroidDensity = g_savedata.userAddonConfig.asteroidDensity
    asteroidsLibrary.configuration.despawnDistance = g_savedata.userAddonConfig.despawnDistance
    asteroidsLibrary.configuration.asteroidSpawnDistance = g_savedata.userAddonConfig.spawnDistance
    asteroidsLibrary.configuration.asteroidSpawnTravelDistance = g_savedata.userAddonConfig.travelDistance
    asteroidsLibrary.configuration.explodeAsteroidsOnDespawn = g_savedata.userAddonConfig.explodeAsteroidsOnDespawn
end

-- Attach debug code to a table of functions
---@param funcs table<integer, function>
---@param logger af_services_debugger_logger
attachDebugCodeMultiple = function(funcs, logger)
    for _, func in pairs(funcs) do
        if type(func) ~= "function" then
            goto continue
        end

        AuroraFramework.services.debuggerService.attach(func, logger)

        ::continue::
    end
end

-------------------------------
-- // Main
-------------------------------
---------- // Setup
-- Set up asteroid library configuration from user's desired settings
setupAsteroidLibConfig()

---------- // Create asteroid types
-- // Small
asteroidsLibrary.types.createType(
    asteroidsLibrary.enums.size.small,
    1
)

asteroidsLibrary.types.createType(
    asteroidsLibrary.enums.size.small,
    2
)

-- // Medium
asteroidsLibrary.types.createType(
    asteroidsLibrary.enums.size.medium,
    3
)

asteroidsLibrary.types.createType(
    asteroidsLibrary.enums.size.medium,
    4
)

-- // Large
asteroidsLibrary.types.createType(
    asteroidsLibrary.enums.size.large,
    5
)

---------- // Attach debug code to libraries
if addonConfiguration.dev.debugEnabled then -- debug code can slow down the addon a bit, so its important we only mount debug code onto functions if debug mode is enabled
    -- attachDebugCodeMultiple(disposablesLibrary, mainLogger)
    -- attachDebugCodeMultiple(asteroidsLibrary, mainLogger)
end

---------- // Initialize libraries
asteroidsLibrary.initialize()
disposablesLibrary.initialize()
tagsLibrary.initialize()