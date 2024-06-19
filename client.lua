local inSafeZone = false
local safeZoneBlip = nil

Citizen.CreateThread(function()
    if safezoneConfig.blipEnabled then
        safeZoneBlip = AddBlipForCoord(safezoneConfig.coords)
        SetBlipSprite(safeZoneBlip, 1) -- Blip icon
        SetBlipColour(safeZoneBlip, 2) -- Green color
        SetBlipAsShortRange(safeZoneBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Safe Zone")
        EndTextCommandSetBlipName(safeZoneBlip)
    end

    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        local distance = #(playerCoords - safezoneConfig.coords)

        if distance <= safezoneConfig.radius then
            if not inSafeZone then
                inSafeZone = true
                SetEntityInvincible(playerPed, true)
            end

            -- Draw 2D text on screen
            Draw2DText("SAFEZONE", 0.5, 0.1, 0.7, 0, 255, 0, 255)

            -- Disable weapons in safe zone
            DisablePlayerFiring(playerPed, true)
            if IsPedArmed(playerPed, 7) then
                SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
                Draw2DText("You can't use weapons in the safe zone", 0.5, 0.9, 0.5, 255, 0, 0, 255)
            end
        else
            if inSafeZone then
                inSafeZone = false
                SetEntityInvincible(playerPed, false)
            end
        end
    end
end)

function Draw2DText(text, x, y, scale, r, g, b, a)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end
