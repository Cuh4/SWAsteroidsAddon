--------------------------------------------------------
-- [Libraries] Disposables - Vehicles
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
g_savedata.disposablesLibrary.pendingDisposals.vehicles = {}

-------------------------------
-- // Main
-------------------------------
disposablesLibrary.vehicles = {
    -- Remove a vehicle after the addon starts
    ---@param vehicle af_services_vehicle_vehicle
    dispose = function(vehicle)
        table.insert(
            g_savedata.disposablesLibrary.pendingDisposals.vehicles,
            vehicle.properties.vehicle_id
        )
    end
}

-- Dispose of vehicles after the addon starts
disposablesLibrary.dispose:connect(function()
    for index, vehicle_id in pairs(g_savedata.disposablesLibrary.pendingDisposals.vehicles) do
        AuroraFramework.services.vehicleService.despawnVehicle(vehicle_id)
        g_savedata.disposablesLibrary.pendingDisposals.vehicles[index] = nil
    end
end)