--------------------------------------------------------
-- [Libraries] Helpers - Chat
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
helpersLibrary.chat = {
    ---@param message string
    ---@param targetPlayer af_services_player_player|nil
    send = function(message, targetPlayer)
        return AuroraFramework.services.chatService.sendMessage(
            ("[%s]"):format(addonConfiguration.information.addonName),
            message,
            targetPlayer
        )
    end
}