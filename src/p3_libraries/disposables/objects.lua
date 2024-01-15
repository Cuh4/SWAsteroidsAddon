--------------------------------------------------------
-- [Libraries] Disposables - Objects
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
g_savedata.disposablesLibrary.pendingDisposals.objects = {}

-------------------------------
-- // Main
-------------------------------
disposablesLibrary.objects = {
    -- Remove an object after the addon starts
    ---@param object_id integer
    dispose = function(object_id)
        table.insert(
            g_savedata.disposablesLibrary.pendingDisposals.objects,
            object_id
        )
    end
}

-- Dispose of objects after the addon starts
disposablesLibrary.dispose:connect(function()
    for index, object_id in pairs(g_savedata.disposablesLibrary.pendingDisposals.objects) do
        server.despawnObject(object_id, true)
        g_savedata.disposablesLibrary.pendingDisposals.objects[index] = nil
    end
end)