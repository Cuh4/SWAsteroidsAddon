--------------------------------------------------------
-- [Event Listeners] Player Join - Info Message
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
-- Show information when a player joins
---@param player af_services_player_player
AuroraFramework.services.playerService.events.onJoin:connect(function(player)
    AuroraFramework.services.timerService.delay.create(0.1, function() -- wait a little because messages don't show if they are sent right when a player joins
        -- Send credit message
        helpersLibrary.chat.send(
            table.concat({
                ("This server has %s enabled."):format(addonConfiguration.information.addonName),
                addonConfiguration.information.description.long,
                "---",
                addonConfiguration.credit.discordServerInvite..(" (@%s on Discord)"):format(addonConfiguration.credit.discordUsername)
            }, "\n"),

            player
        )
    end)
end)