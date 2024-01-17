--------------------------------------------------------
-- [Libraries] Tags - Internal
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
tagsLibrary.internal = {
    ---@param tbl table
    ---@param index any
    createOrGetSubTable = function(tbl, index)
        if not tbl[index] then
            tbl[index] = {}
        end

        return tbl[index]
    end
}