--------------------------------------------------------
-- [Event Listeners] Player Join - Credit
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
-- Show credit when a player joins
---@param player af_services_player_player
AuroraFramework.services.playerService.events.onJoin:connect(function(player)
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