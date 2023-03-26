QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('outfits', ("(Admin Only)"), {{name="id", help="Player ID "}}, false, function(source, args)
    local src = source
    if args[1] then
        local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
        if Player then
            TriggerClientEvent('qb-clothing:client:openAll', Player.PlayerData.source)
        else
            TriggerClientEvent('QBCore:Notify', ('Player Not Online'), "error")
        end
    else
        TriggerClientEvent('qb-clothing:client:openAll', src)
    end
end, 'admin')