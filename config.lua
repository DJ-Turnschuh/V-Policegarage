Config = {}

Config.Debug = true -- Boolean 


--Garage--
Config.Vehicles = {
    {label = "Police Car 1", model = 'police', coords = vec4(463.081330, -1019.459350, 27.695922, 87.874016), plate = "Police", color = {r = 255,g = 255,b = 255}, livery = nil, job = "police"},
    {label = "Police Car 2", model = 'police2', coords = vec4(452.149444, -997.252746, 25.370728, 181.417312), plate = "Police", color = nil, livery = nil, job = "police"},
    {label = "Vagos", model = 'vamos', coords = vec4(326.799444, -2040.642746, 20.240728, 323.137312), plate = "V4G05", color = {r = 255,g = 255,b = 0}, livery = nil, job = "vagos"},
    {label = "Hidden Sanchez", model = 'sanchez', coords = vec4(137.279444, -2066.382746, 17.350728, 43.137312), plate = "2F45T4U", color = nil, livery = 1, job = nil},
}

Config.ClaimKeyButton = 191

Config.NotifyClaimVeh = 'Press ~INPUT_FRONTEND_RDOWN~ to drive vehicle' -- Notify if you siting in parked vehicle
Config.NotifyUnclaimVeh = 'Press ~INPUT_FRONTEND_RDOWN~ to park vehicle' -- Notify if you siting in parked vehicle