local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

-- Ruta del archivo JSON en el entorno de desarrollo
local FILE_PATH = "RebirthData.json"

-- Crear el ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "RebirthTimerGui"
gui.Parent = game.CoreGui  -- Cambiado de PlayerGui a CoreGui

-- Crear el Frame de fondo
local background = Instance.new("Frame")
background.Name = "Background"
background.Position = UDim2.new(0.0116822431, 0, 0.0248226952, 0)  -- Posición especificada
background.Size = UDim2.new(0, 300, 0, 100)  -- Tamaño ajustable
background.BackgroundTransparency = 1  -- Fondo completamente transparente
background.BorderSizePixel = 0
background.Parent = gui

-- Crear el TextLabel para el temporizador
local timerLabel = Instance.new("TextLabel")
timerLabel.Name = "TimerLabel"
timerLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
timerLabel.AnchorPoint = Vector2.new(0.5, 0.5)
timerLabel.Size = UDim2.new(1, -20, 1, -10)  -- Tamaño ajustable para que se ajuste al marco
timerLabel.BackgroundTransparency = 1
timerLabel.Font = Enum.Font.SourceSans
timerLabel.TextSize = 48
timerLabel.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Inicialmente en rojo
timerLabel.TextStrokeTransparency = 0
timerLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
timerLabel.Text = "0:00"
timerLabel.Parent = background

-- Crear un valor en ReplicatedStorage para guardar el tiempo del rebirth
local rebirthTimeValue = Instance.new("IntValue")
rebirthTimeValue.Name = "RebirthTimeValue"
rebirthTimeValue.Parent = ReplicatedStorage

-- Variables para seguimiento
local previousRebirthValue = 0
local hasReinitialized = false  -- Bandera para verificar si ya se reinició

-- Función para actualizar el temporizador
local function updateTimer()
    local lastRebirthTime = ReplicatedStorage:WaitForChild("RebirthTimeValue").Value
    local elapsedTime = tick() - lastRebirthTime
    local minutes = math.floor(elapsedTime / 60)
    local seconds = math.floor(elapsedTime % 60)
    timerLabel.Text = string.format("%d:%02d", minutes, seconds)
end

-- Función para animar el color del texto
local function animateTextColor()
    local colors = {
        Color3.fromRGB(255, 0, 0),    -- Rojo
        Color3.fromRGB(0, 255, 0),    -- Verde
        Color3.fromRGB(0, 0, 255),    -- Azul
        Color3.fromRGB(255, 255, 0),  -- Amarillo
        Color3.fromRGB(255, 165, 0)   -- Naranja
    }
    local index = 1
    while true do
        timerLabel.TextColor3 = colors[index]
        index = (index % #colors) + 1
        wait(1)  -- Cambiar el color cada segundo
    end
end

-- Función para guardar el tiempo y el rebirth en un archivo JSON
local function saveRebirthData()
    local rebirthTime = ReplicatedStorage:WaitForChild("RebirthTimeValue").Value
    local player = Players.LocalPlayer
    local playerStats = player.Character and player.Character:FindFirstChild("Stats")
    local rebirthValue = playerStats and playerStats:FindFirstChild("Rebirth") and playerStats.Rebirth.Value or 0

    local rebirthInfo = {
        LastRebirthTime = rebirthTime,
        PlayerRebirth = rebirthValue
    }
    local jsonData = HttpService:JSONEncode(rebirthInfo)
    writefile(FILE_PATH, jsonData)
end

-- Función para cargar el tiempo y el rebirth desde un archivo JSON
local function loadRebirthData()
    if isfile(FILE_PATH) then
        local fileContents = readfile(FILE_PATH)
        if fileContents then
            local rebirthData = HttpService:JSONDecode(fileContents)
            if rebirthData then
                if rebirthData.LastRebirthTime then
                    ReplicatedStorage:WaitForChild("RebirthTimeValue").Value = rebirthData.LastRebirthTime
                end
                if rebirthData.PlayerRebirth then
                    local player = Players.LocalPlayer
                    local playerStats = player.Character and player.Character:FindFirstChild("Stats")
                    if playerStats and playerStats:FindFirstChild("Rebirth") then
                        playerStats.Rebirth.Value = rebirthData.PlayerRebirth
                        previousRebirthValue = playerStats.Rebirth.Value
                    end
                end
            end
        end
    else
        -- Si no se encuentra el archivo, establecer los valores predeterminados
        ReplicatedStorage:WaitForChild("RebirthTimeValue").Value = tick()
        local player = Players.LocalPlayer
        local playerStats = player.Character and player.Character:FindFirstChild("Stats")
        if playerStats and playerStats:FindFirstChild("Rebirth") then
            playerStats.Rebirth.Value = 0
            previousRebirthValue = 0
        end
    end
end

-- Función para verificar si el jugador está en el lugar específico
local function isInTargetPlace()
    local placeId = game.PlaceId
    return placeId == 3311165597
end

-- Actualizar el temporizador cada segundo
local timerConnection
timerConnection = game:GetService("RunService").Stepped:Connect(function()
    updateTimer()

    -- Obtener el valor actual de rebirth
    local player = Players.LocalPlayer
    local playerStats = player.Character and player.Character:FindFirstChild("Stats")
    local currentRebirthValue = playerStats and playerStats:FindFirstChild("Rebirth") and playerStats.Rebirth.Value or 0

    -- Verificar si el valor de rebirth ha cambiado
    if currentRebirthValue > previousRebirthValue then
        ReplicatedStorage:WaitForChild("RebirthTimeValue").Value = tick()  -- Reiniciar el temporizador
        previousRebirthValue = currentRebirthValue  -- Actualizar el valor de rebirth anterior
    end

    -- Verificar si el jugador está en el lugar específico
    if isInTargetPlace() then
        if not hasReinitialized then
            ReplicatedStorage:WaitForChild("RebirthTimeValue").Value = tick()  -- Reiniciar el temporizador
            previousRebirthValue = currentRebirthValue  -- Actualizar el valor de rebirth anterior
            hasReinitialized = true  -- Marcar que se ha reiniciado
        end
    else
        -- Si el jugador no está en el lugar, restablecer la bandera
        hasReinitialized = false
    end

    saveRebirthData()  -- Guardar el tiempo y el rebirth cada segundo
end)

-- Iniciar la animación de color del texto
spawn(animateTextColor)

-- Cargar el tiempo y el rebirth al unirse al juego
loadRebirthData()
