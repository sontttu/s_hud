local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('hud:requestData', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local data = {
            cash = Player.PlayerData.money["cash"] or 0,
            bank = Player.PlayerData.money["bank"] or 0,
            job = (Player.PlayerData.job.label or "") .. " - " .. (Player.PlayerData.job.grade.name or "")
        }
        TriggerClientEvent('hud:update', src, data)
    end
end)
