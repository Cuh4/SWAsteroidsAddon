--------------------------------------------------------
-- [Commands] Debug - Clear
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
-- Clear groups
AuroraFramework.services.commandService.create(function(player, command, args)
    for i = 0, 10000 do
        AuroraFramework.services.groupService.despawnGroup(i)
    end
end, "clear", {"cl"})