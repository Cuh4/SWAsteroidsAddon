--------------------------------------------------------
-- [Libraries] Disposables - Groups
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
g_savedata.disposablesLibrary.pendingDisposals.groups = {}

-------------------------------
-- // Main
-------------------------------
disposablesLibrary.groups = {
    -- Remove a group after the addon starts
    ---@param group af_services_group_group
    dispose = function(group)
        table.insert(
            g_savedata.disposablesLibrary.pendingDisposals.groups,
            group.properties.group_id
        )
    end
}

-- Dispose of groups after the addon starts
disposablesLibrary.dispose:connect(function()
    for index, group_id in pairs(g_savedata.disposablesLibrary.pendingDisposals.groups) do
        AuroraFramework.services.groupService.despawnGroup(group_id)
        g_savedata.disposablesLibrary.pendingDisposals.groups[index] = nil
    end
end)