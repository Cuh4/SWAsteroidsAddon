--------------------------------------------------------
-- [Event Listeners] Addon Break - Notify
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
-- Notify everyone if the addon breaks
AuroraFramework.services.debuggerService.events.onAddonStop:connect(function()
    helpersLibrary.chat.send(("Sorry, the addon has broken. Please run '?reload_scripts' to temporarily fix the issue.\nPlease notify the developer (@%s) in the Discord server below.\n[%s]"):format(addonConfiguration.credit.discordUsername, addonConfiguration.credit.discordServerInvite))
end)