--------------------------------------------------------
-- [Libraries] Helpers - Misc
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
g_savedata.helpersLibrary = {
    id = 0
}

helpersLibrary.misc = {
    incrementalID = function()
        g_savedata.helpersLibrary.id = g_savedata.helpersLibrary.id + 1
        return g_savedata.helpersLibrary.id
    end
}