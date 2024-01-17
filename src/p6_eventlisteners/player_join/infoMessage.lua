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
    AuroraFramework.services.timerService.delay.create(1, function() -- wait a little because messages don't show if they are sent right when a player joins
        -- Format DLCs
        DLCsFormatted = {}
        missingDLCsCount = 0

        for _, dlc in pairs(addonConfiguration.information.requiredDLCs) do
            if not dlc.enabled then
                missingDLCsCount = missingDLCsCount + 1
            end

            table.insert(
                DLCsFormatted,
                ("[%s | %s]"):format(dlc.name, dlc.enabled and "Enabled" or "Disabled")
            )
        end

        -- Send credit message
        helpersLibrary.chat.send(
            table.concat({
                ("This server has %s enabled."):format(addonConfiguration.information.addonName),
                addonConfiguration.information.description.long,
                "---",
                addonConfiguration.credit.discordServerInvite..(" (@%s on Discord)"):format(addonConfiguration.credit.discordUsername),
                "---",
                ("Required DLCs: %s (%s missing)"):format(table.concat(DLCsFormatted, ", "), missingDLCsCount),
                missingDLCsCount > 0 and "[!!] Please create a new save with the required DLCs enabled." or nil
            }, "\n"),

            player
        )
    end)
end)