--------------------------------------------------------
-- [Libraries] Asteroids - Types
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
asteroidsLibrary.types = {
    asteroidTypes = {}, ---@type table<integer, ad_asteroids_asteroidType>

    ---@param sizeName string
    ---@param playlist_id integer
    ---@return ad_asteroids_asteroidType
    createType = function(sizeName, playlist_id)
        ---@type ad_asteroids_asteroidType
        return AuroraFramework.libraries.class.create(
            "ad_asteroids_asteroidType",

            {
                ---@param self ad_asteroids_asteroidType
                ---@param position SWMatrix
                spawn = function(self, position)
                    local group = AuroraFramework.services.groupService.spawnGroup(
                        position,
                        self.properties.playlist_id
                    )

                    for _, vehicle in pairs(group.properties.vehicles) do
                        vehicle:setTooltip("-----\nAsteroid\n-----\nSize: "..self.properties.sizeName)
                    end

                    return group
                end
            },

            {
                sizeName = sizeName,
                playlist_id = playlist_id
            },

            nil,

            asteroidsLibrary.types.asteroidTypes
        )
    end,

    ---@param playlist_id integer
    removeType = function(playlist_id)
        for index, asteroidType in pairs(asteroidsLibrary.types.asteroidTypes) do
            if asteroidType.properties.playlist_id ~= playlist_id then
                goto continue
            end

            asteroidsLibrary.types.asteroidTypes[index] = nil

            ::continue::
        end
    end,

    ---@return ad_asteroids_asteroidType
    getRandom = function()
        return AuroraFramework.libraries.miscellaneous.getRandomTableValue(asteroidsLibrary.types.asteroidTypes)
    end,

    ---@param playlist_id integer
    getTypeByPlaylistID = function(playlist_id)
        for _, asteroidType in pairs(asteroidsLibrary.types.asteroidTypes) do
            if asteroidType.properties.playlist_id == playlist_id then
                return asteroidType
            end
        end
    end
}