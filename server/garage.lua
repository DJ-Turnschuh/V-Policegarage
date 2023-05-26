ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('isJob', function(src, cb)
    local job = ESX.GetPlayerFromId(src).job.name
    if job ~= nil then
        cb(job)
    end
end)