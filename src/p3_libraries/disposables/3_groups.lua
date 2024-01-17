--------------------------------------------------------
-- [Libraries] Disposables - Groups
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
disposablesLibrary.groups = {
    -- Remove a group after the addon starts
    ---@param group af_services_group_group
    dispose = function(group)
        disposablesLibrary.internal.dispose("groups", group.properties.group_id)
    end
}

AuroraFramework.ready:connect(function()
    ---@param id integer
    disposablesLibrary.internal.setup("groups", function(id)
        AuroraFramework.services.groupService.despawnGroup(id)
    end)
end)