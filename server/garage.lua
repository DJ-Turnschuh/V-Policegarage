ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('isPolice', function(src, cb)
    if ESX.GetPlayerFromId(src).job.name == Config.Policejob then
        cb(true)
    else
        cb(false)
    end
end)