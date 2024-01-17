--------------------------------------------------------
-- [Libraries] Disposables - Objects
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
disposablesLibrary.objects = {
    -- Remove an object after the addon starts
    ---@param object_id integer
    dispose = function(object_id)
        disposablesLibrary.internal.dispose("objects", object_id)
    end
}

AuroraFramework.ready:connect(function()
    ---@param id integer
    disposablesLibrary.internal.setup("objects", function(id)
        server.despawnObject(id, true)
    end)
end)