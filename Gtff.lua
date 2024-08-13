local HttpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
local marketplaceService = game:GetService("MarketplaceService")
local stats = character:FindFirstChild("Stats")
local userInputService = game:GetService("UserInputService")
local players = game:GetService("Players")
local networkStats = game:GetService("Stats").Network

local function getDeviceType()
    if userInputService.TouchEnabled then
        return "Móvil"
    elseif userInputService.KeyboardEnabled and userInputService.MouseEnabled then
        return "PC"
    else
        return "Desconocido"
    end
end

local function getPlayerCount()
    return #players:GetPlayers()
end

local function getPing()
    return networkStats.ServerStatsItem["Data Ping"]:GetValue()
end

local function getServerData()
    local serverListUrl = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
    local success, response = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(serverListUrl))
    end)

    if success and response and response.data then
        local totalServers = #response.data
        local totalPlayers = 0
        for _, server in ipairs(response.data) do
            totalPlayers = totalPlayers + server.playing
        end
        return totalServers, totalPlayers
    else
        return 0, 0
    end
end

local function getPlayerData()
    local strength = stats and stats:FindFirstChild("Strength") and stats.Strength.Value or 0
    local rebirth = stats and stats:FindFirstChild("Rebirth") and stats.Rebirth.Value or 0
    local questValue = game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value
    local quest = questValue ~= "" and questValue or "No está en ninguna misión"
    local currentDateTime = os.date("%Y-%m-%d %H:%M:%S")
    local placeId = game.PlaceId
    local serverLocation = ""

    if placeId == 3311165597 then
        serverLocation = "Está en la tierra"
    elseif placeId == 5151400895 then
        serverLocation = "Está en Bilss"
    else
        serverLocation = "Ubicación desconocida"
    end

    local playerStatus = "Está en Farm o caminando xd"
    if humanoidRootPart and humanoidRootPart.Position.Y > 26 then
        playerStatus = "Está en vuelo"
    end

    local gameName = marketplaceService:GetProductInfo(placeId).Name
    local serverId = game.JobId
    local playerId = player.UserId
    local deviceType = getDeviceType()

    -- Obtener el apodo del jugador
    local displayName = player.DisplayName or "Sin apodo"

    -- Obtener la fecha de estado de Roblox
    local accountAge = player.AccountAge
    local accountAgeDate = os.date("%Y-%m-%d", os.time() - (accountAge * 86400))

    -- Obtener la transformación actual (sin la maestría)
    local transformation = player.Status.Transformation.Value

    -- Obtener el ping del jugador
    local ping = getPing()

    -- Obtener datos de los servidores
    local totalServers, totalPlayers = getServerData()

    return {
        id = playerId,
        name = player.Name,
        displayName = displayName,
        strength = strength,
        rebirth = rebirth,
        quest = quest,
        timestamp = currentDateTime,
        serverLocation = serverLocation,
        serverId = serverId,
        status = playerStatus,
        gameName = gameName,
        device = deviceType,
        accountAgeDate = accountAgeDate,
        transformation = transformation,
        playerCount = getPlayerCount(),
        ping = ping,
        totalServers = totalServers,  -- Número total de servidores activos
        totalPlayers = totalPlayers  -- Número total de jugadores en todos los servidores
    }
end

local function sendPlayerData()
    local dataToSend = getPlayerData()
    
    local response = request({
        Url = "https://869f4db0-f4a9-4e3e-80bc-584b83f72c2e-00-1lfbcpjuok5s7.riker.replit.dev/receive-data",
        Method = "POST",
        Body = HttpService:JSONEncode(dataToSend),
        Headers = {
            ["Content-Type"] = "application/json"
        }
    })

    if response.Success and response.StatusCode == 200 then
        print("Código de estado: " .. response.StatusCode)
        print("Mensaje de estado: " .. response.StatusMessage)
        print("Cuerpo de la respuesta: " .. response.Body)
    else
        print("Error en la solicitud: " .. response.StatusMessage)
    end
end

sendPlayerData()
