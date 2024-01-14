--------------------------------------------------------
-- [Libraries] Tags - Player
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
tagsLibrary.player = {
    initialize = function()
        -- when a player leaves, remove their tags
        ---@param player af_services_player_player
        AuroraFramework.services.playerService.events.onLeave:connect(function(player)
            tagsLibrary.player.removeTags(player)
        end)
    end,

    tags = {},

    ---@param player af_services_player_player
    ---@return table<string, any>
    getTags = function(player)
        return tagsLibrary.internal.createOrGetSubTable(tagsLibrary.player.tags, player.properties.peer_id)
    end,

    ---@param player af_services_player_player
    removeTags = function(player)
        tagsLibrary.player.tags[player.properties.peer_id] = nil
    end,

    ---@param player af_services_player_player
    ---@param tag string
    ---@param value any
    setTag = function(player, tag, value)
        local tags = tagsLibrary.player.getTags(player)
        tags[tag] = value
    end,

    ---@param player af_services_player_player
    ---@param tag string
    ---@return any
    getTag = function(player, tag)
        local tags = tagsLibrary.player.getTags(player)
        return tags[tag]
    end,

    ---@param player af_services_player_player
    ---@param tag string
    removeTag = function(player, tag)
        local tags = tagsLibrary.player.getTags(player)
        tags[tag] = nil
    end
}