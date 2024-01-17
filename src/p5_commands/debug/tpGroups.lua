--------------------------------------------------------
-- [Commands] Debug - Teleport Groups
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
-- Teleport all groups to player
AuroraFramework.services.commandService.create(function(player, command, args)
    if not addonConfiguration.dev.debugEnabled then
        return
    end

    for _, group in pairs(AuroraFramework.services.groupService.getAllGroups()) do
        if not group.properties.addonSpawned then
            group:teleport(player:getPosition())
        end
    end
end, "groupstoself", {"gts"})