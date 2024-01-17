--------------------------------------------------------
-- [Libraries] Disposables - Internal
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
disposablesLibrary.internal = {
    -- Add an ID to pendingDisposals
    ---@param disposalTableName string
    ---@param id any
    dispose = function(disposalTableName, id)
        local tbl = g_savedata.disposablesLibrary.pendingDisposals[disposalTableName]

        table.insert(
            tbl,
            id
        )
    end,

    -- Create a disposal handler
    ---@param disposalTableName string
    ---@param despawnHandler fun(id: any)
    setup = function(disposalTableName, despawnHandler)
        local tbl = g_savedata.disposablesLibrary.pendingDisposals[disposalTableName]

        if not tbl then
            g_savedata.disposablesLibrary.pendingDisposals[disposalTableName] = {}
            return disposablesLibrary.internal.setup(disposalTableName, despawnHandler)
        end

        disposablesLibrary.dispose:connect(function()
            for index, id in pairs(tbl) do
                despawnHandler(id)
                tbl[index] = nil
            end
        end)
    end
}