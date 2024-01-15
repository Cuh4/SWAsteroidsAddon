--------------------------------------------------------
-- [Libraries] Disposables - Main
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/Cuh4/SWAsteroidsAddon
        Created: 15/01/2024 (dd/mm/yy)

    ----------------------------
]]

-------------------------------
-- // Variables
-------------------------------
g_savedata.disposablesLibrary = {
    ---@type table<string, table<integer, integer>>
    pendingDisposals = {}
}

-------------------------------
-- // Main
-------------------------------
disposablesLibrary = {
    initialize = function()
        -- when the framework is ready, dispose of everything
        AuroraFramework.ready:connect(function()
            disposablesLibrary.dispose:fire()
        end)
    end,

    dispose = AuroraFramework.libraries.events.create("disposablesLibrary_dispose")
}