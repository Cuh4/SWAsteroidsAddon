--------------------------------------------------------
-- [Libraries] Disposables - Vehicles
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
disposablesLibrary.vehicles = {
    -- Remove a vehicle after the addon starts
    ---@param vehicle af_services_vehicle_vehicle
    dispose = function(vehicle)
        disposablesLibrary.internal.dispose("vehicles", vehicle.properties.group_id)
    end
}

---@param id integer
disposablesLibrary.internal.setup("vehicles", function(id)
    AuroraFramework.services.vehicleService.despawnVehicle(id)
end)