--------------------------------------------------------
-- [Libraries] Disposables - Main
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
-- // Variables
-------------------------------
g_savedata.disposablesLibrary = {
    pendingDisposals = {} ---@type table<string, table<integer, any>>
}

-------------------------------
-- // Main
-------------------------------
disposablesLibrary = {
    initialize = function()
        -- when the framework is ready, dispose of everything
        AuroraFramework.ready:connect(function()
            AuroraFramework.services.timerService.delay.create(0, function()
                disposablesLibrary.dispose:fire()
            end)
        end)
    end,

    dispose = AuroraFramework.libraries.events.create("disposablesLibrary_dispose")
}