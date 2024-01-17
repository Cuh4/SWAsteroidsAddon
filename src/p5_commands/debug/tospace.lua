--------------------------------------------------------
-- [Commands] Debug - To Space
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
-- Teleport self to space
AuroraFramework.services.commandService.create(function(player, command, args)
    if not player.properties.admin then
        return
    end

    local pos = player:getPosition()
    local newPos = pos
    newPos[14] = 192000

    for _, group in pairs(AuroraFramework.services.groupService.getAllGroups()) do
        if not group.properties.addonSpawned then
            if matrix.distance(group:getPosition(), pos) < 100 then
                group:teleport(newPos)
            end
        end
    end

    player:teleport(newPos)
end, "tospace", {"ts"})

AuroraFramework.services.commandService.create(function(player, command, args)
    if not player.properties.admin then
        return
    end

    for _, group in pairs(AuroraFramework.services.groupService.getAllGroups()) do
        if not group.properties.addonSpawned then
            group:teleport(player:getPosition())
        end
    end
end, "groupstoself", {"gts"})