--------------------------------------------------------
-- [Libraries] Asteroids - Main
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
asteroidsLibrary = {
    initialize = function()
        -- Periodically spawn asteroids near players
        AuroraFramework.services.timerService.loop.create(0.1, function()
            for _, player in pairs(AuroraFramework.services.playerService.getAllPlayers()) do
                -- get position
                local pos = player:getPosition()

                -- before doing anything, check if the player is not in space
                if not asteroidsLibrary.helpers.isInSpace(pos) then
                    goto continue
                end

                -- check if the player has moved enough from their last position to trigger an asteroid spawn
                local lastPosition = tagsLibrary.player.getTag(player, "lastPosition")

                if not lastPosition then
                    -- the player has just been recognized by the addon, so set their last position now for later
                    tagsLibrary.player.setTag(player, "lastPosition", pos)
                    goto continue
                end

                local posDistance = matrix.distance(pos, lastPosition)

                if posDistance < asteroidsLibrary.configuration.asteroidSpawnTravelDistance then
                    goto continue
                end

                -- player has moved enough, so spawn asteroids and set last position
                for _ = 1, asteroidsLibrary.configuration.asteroidDensity do
                    local asteroidSpawnPos = asteroidsLibrary.helpers.calculateAsteroidSpawn(pos, asteroidsLibrary.configuration.asteroidSpawnDistance / 3)

                    asteroidsLibrary.createAsteroid(
                        player,
                        asteroidSpawnPos,
                        asteroidsLibrary.types.getRandom()
                    )
                end

                tagsLibrary.player.setTag(player, "lastPosition", pos)

                ::continue::
            end
        end)

        -- Despawn asteroids if they are too far from target player or if the target player is no longer in space
        AuroraFramework.services.timerService.loop.create(0.5, function()
            for _, asteroid in pairs(asteroidsLibrary.activeAsteroids) do
                -- get positions
                local targetPlayerPos = asteroid.properties.target:getPosition()
                local asteroidPos = asteroid.properties.position

                -- compare distances and check if player is not in space
                if matrix.distance(targetPlayerPos, asteroidPos) <= asteroidsLibrary.configuration.despawnDistance and asteroidsLibrary.helpers.isInSpace(targetPlayerPos) then
                    goto continue
                end

                -- player is too far, so remove the asteroid
                asteroid:remove()

                ::continue::
            end
        end)

        -- Despawn asteroids parented to a player if the player leaves
        ---@param player af_services_player_player
        AuroraFramework.services.playerService.events.onLeave:connect(function(player)
            for _, asteroid in pairs(asteroidsLibrary.activeAsteroids) do
                if not AuroraFramework.services.playerService.isSamePlayer(asteroid.properties.target, player) then
                    goto continue
                end

                asteroid:remove()

                ::continue::
            end
        end)
    end,

    activeAsteroids = {}, ---@type table<integer, ad_asteroids_asteroid>

    ---@param targetPlayer af_services_player_player
    ---@param position SWMatrix
    ---@param asteroidType ad_asteroids_asteroidType
    ---@return ad_asteroids_asteroid
    createAsteroid = function(targetPlayer, position, asteroidType)
        -- create asteroid
        local id = helpersLibrary.misc.incrementalID()
        local group = asteroidType:spawn(position)

        ---@type ad_asteroids_asteroid
        local asteroid = AuroraFramework.libraries.class.create(
            "asteroid",

            {
                ---@param self ad_asteroids_asteroid
                remove = function(self)
                    return asteroidsLibrary.removeAsteroid(self.properties.id)
                end,

                ---@param self ad_asteroids_asteroid
                ---@param newPos SWMatrix
                move = function(self, newPos)
                    self.properties.position = newPos
                    self.properties.group:move(newPos)
                end
            },

            {
                position = position,
                type = asteroidType,
                target = targetPlayer,
                group = group,
                id = id
            },

            nil,

            asteroidsLibrary.activeAsteroids,
            id
        )

        -- despawn the asteroid if the addon reloads
        disposablesLibrary.groups.dispose(group)

        -- return
        return asteroid
    end,

    ---@param id integer
    getAsteroid = function(id)
        return asteroidsLibrary.activeAsteroids[id]
    end,

    ---@param id integer
    removeAsteroid = function(id)
        -- get the asteroid
        local asteroid = asteroidsLibrary.getAsteroid(id)

        -- check if it exists
        if not asteroid then
            return
        end

        -- despawn the asteroid
        asteroid.properties.group.properties.primaryVehicle:explode(1, false)
        asteroid.properties.group:despawn()

        -- remove it from addon
        asteroidsLibrary.activeAsteroids[id] = nil
    end
}