CreateThread(function()
    while true do
        Wait(0)
        for k, v in pairs(Config.Locations) do 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local clothingCoords = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v["Coords"].x, v["Coords"].y, v["Coords"].z)

            if clothingCoords <= 20.0 and IsControlJustReleased(0, Config.KeyToPress) then
                TriggerEvent(Config.Event)
            end
        end
    end
end)