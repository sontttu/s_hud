local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('hud:update')
AddEventHandler('hud:update', function(data)
    SendNUIMessage({
        action = 'updateHud',
        cash = data.cash,
        bank = data.bank,
        job = data.job
    })
end)

CreateThread(function()
    while true do
        TriggerServerEvent('hud:requestData')
        Wait(1000)
    end
end)

CreateThread(function()
    local previousSpeed = 0
    while true do
        Wait(50) 
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local speed = GetEntitySpeed(vehicle) * 3.6 
            local fuel = GetVehicleFuelLevel(vehicle)

            local smoothedSpeed = previousSpeed + (speed - previousSpeed) * 0.2
            previousSpeed = smoothedSpeed

            SendNUIMessage({
                action = 'updateSpeedometer',
                speed = math.floor(smoothedSpeed),
                fuel = math.floor(fuel),
                visible = true
            })
        else
            SendNUIMessage({
                action = 'updateSpeedometer',
                speed = 0,
                fuel = 0,
                visible = false
            })
        end
    end
end)
