--------------------------------------------------------
-- [Libraries] Helpers - String
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/Cuh4/SWAsteroidsAddon
        File Created: 17/01/2024 (dd/mm/yy)

    ----------------------------
]]

-------------------------------
-- // Main
-------------------------------
helpersLibrary.string = {
    ---@param tbl table<integer, string>
    formatTableToBulletList = function(tbl)
        return "- "..table.concat(tbl, "\n- ")
    end
}