--------------------------------------------------------
-- [Event Listeners] Ready - Addon Reload
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/Cuh4/SWAsteroidsAddon
        File Created: 15/01/2024 (dd/mm/yy)

    ----------------------------
]]

-------------------------------
-- // Main
-------------------------------
-- Send message when the addon reloads
---@param state af_ready_state
AuroraFramework.ready:connect(function(state)
    if state ~= "addon_reload" then
        return
    end

    helpersLibrary.chat.send(("%s has reloaded. This may fix any issues that you may have encountered before the reload."):format(addonConfiguration.information.addonName))
end)