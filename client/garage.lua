ESX = exports["es_extended"]:getSharedObject()

local claimed = false
local plateNumber = 0000
local spawnedVehicles = {}
local ReadyToClaim = false
local isPolice = false

function isPlayerJobPolice()
    ESX.TriggerServerCallback("isPolice", function(cb)
        isPolice = cb
    end) 
    return isPolice
end

function vehiclespawn()
    for k, v in ipairs(Config.Vehicles) do
        if IsModelInCdimage(v.model) and v.coords ~= nil then
            local isVehicleClear = ESX.Game.IsSpawnPointClear(vec3(v.coords.x, v.coords.y, v.coords.z - 0.3), 3)
            if Config.Debug then
                print(isVehicleClear)
            end
            if isVehicleClear then
                RequestModel(v.model)
                while not HasModelLoaded(v.model) do
                    RequestModel(v.model)
                    Citizen.Wait(100)
                end
                local vehicle = CreateVehicle(GetHashKey(v.model),v.coords.x, v.coords.y, v.coords.z, v.coords.w,true,false)
                if Config.PlateMax3 then 
                    plateNumber = math.random(100,999)
                else
                    plateNumber = math.random(1000,9999)
                end
                ESX.Game.SetVehicleProperties(vehicle, {
                    plate = tostring(Config.Plate .. " " .. plateNumber)
                })
                FreezeEntityPosition(vehicle, true)
                table.insert(spawnedVehicles, {id = k, veh = vehicle, coords = vec3(v.coords.x, v.coords.y, v.coords.z)})
                SetModelAsNoLongerNeeded(v.model)
            else
                if Config.Debug then 
                    print('Vehicle spawn point is blocked!')
                end
            end
        end
    end
end

function vehicleclaim()
    local player = GetPlayerPed(-1)
    for k, vehicle in ipairs(spawnedVehicles) do
        while IsPedInVehicle(player, vehicle.veh, true) do
            Citizen.Wait(0)
            if claimed then
                local distance = GetDistanceBetweenCoords(GetEntityCoords(player), vehicle.coords, false)
                if distance < 3 then 
                    ESX.ShowHelpNotification(Config.NotifyUnclaimVeh, true, true, 1)
                    if IsControlJustPressed(0, Config.ClaimKeyButton) then
                        Citizen.Wait(100)
                        TaskLeaveVehicle(player, vehicle.veh, 64)
                        FreezeEntityPosition(vehicle.veh, true)
                        claimed = false
                    end
                end
            elseif not claimed then
                ESX.ShowHelpNotification(Config.NotifyClaimVeh, true, true, 1)
                if IsControlJustPressed(0, Config.ClaimKeyButton) then
                    FreezeEntityPosition(vehicle.veh, false)
                    claimed = true
                end
            end
        end
    end
end

AddEventHandler('onResourceStart', function()
    vehiclespawn()
    while true do 
        Citizen.Wait(0)
        if ReadyToClaim then
            vehicleclaim()
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1000)
        if IsPedGettingIntoAVehicle(GetPlayerPed(-1)) then
            if isPlayerJobPolice() then 
                ReadyToClaim = true
            else
                ReadyToClaim = false
            end
        else
            ReadyToClaim = false
        end 
    end 
end)