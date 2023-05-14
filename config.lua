Config = {}

Config.Debug = true -- Boolean 
Config.Policejob = 'police' -- Policejob name

--Garage--
Config.Vehicles = {
    {model = 'police', coords = vec4(463.081330, -1019.459350, 27.695922, 87.874016)},
    {model = 'police2', coords = vec4(452.149444, -997.252746, 25.370728, 181.417312)}
}

Config.Plate = 'POL' -- 3 or 4 Characters (4 only if Config.PlateMax3 = false) for first characters in vehicle plate.
Config.PlateMax3 = false -- boolean Set true if you want to have 4 characters and 3 numbers in plate if false then its 3 characters and 4 numbers.

Config.ClaimKeyButton = 191

Config.NotifyClaimVeh = 'Press ~INPUT_FRONTEND_RDOWN~ to drive vehicle' -- Notify if you siting in parked vehicle
Config.NotifyUnclaimVeh = 'Press ~INPUT_FRONTEND_RDOWN~ to park vehicle' -- Notify if you siting in parked vehicle