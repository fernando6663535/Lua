local HttpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
local marketplaceService = game:GetService("MarketplaceService")
local stats = character:FindFirstChild("Stats")
local userInputService = game:GetService("UserInputService")
local players = game:GetService("Players")

local function getDeviceType()
    if userInputService.TouchEnabled then
        return "Móvil"
    elseif userInputService.KeyboardEnabled and userInputService.MouseEnabled then
        return "PC"
    else
        return "Desconocido"
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

    return {
        id = playerId,
        name = player.Name,
        displayName = displayName,  -- Añadir el apodo del jugador
        strength = strength,
        rebirth = rebirth,
        quest = quest,
        timestamp = currentDateTime,
        serverLocation = serverLocation,
        serverId = serverId,
        status = playerStatus,
        gameName = gameName,
        device = deviceType,  -- Añadir el tipo de dispositivo al cuerpo de datos
        accountAgeDate = accountAgeDate,  -- Añadir la fecha de estado de Roblox
        transformation = transformation  -- Añadir el nombre de la transformación (sin la maestría)
    }
end

local function sendPlayerData()
    local dataToSend = getPlayerData()
    
    local response = HttpService:RequestAsync({
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

-- Temporizador para enviar datos cada 5 segundos
local lastSentTime = 0
local interval = 5 -- en segundos

while true do
    local currentTime = tick()
    if currentTime - lastSentTime >= interval then
        sendPlayerData()
        lastSentTime = currentTime
    end
    wait(1) -- Espera 1 segundo antes de verificar de nuevo
end
