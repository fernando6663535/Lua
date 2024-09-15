local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local frame = Instance.new("Frame")
local pingLabel = Instance.new("TextLabel")
local corner = Instance.new("UICorner")
local frameMission = Instance.new("Frame")
local cornerMission = Instance.new("UICorner")
local missionLabel = Instance.new("TextLabel")
local frameFPS = Instance.new("Frame")
local cornerFPS = Instance.new("UICorner")
local fpsLabel = Instance.new("TextLabel")
local rebirthLabel = Instance.new("TextLabel")
local cornerRebirth = Instance.new("UICorner")
local strengthLabel = Instance.new("TextLabel")
local frameTransformation = Instance.new("Frame")
local cornerTransformation = Instance.new("UICorner")
local transformationLabel = Instance.new("TextLabel")
local frameR = Instance.new("Frame")
local uiCorner = Instance.new("UICorner")
local textLabel = Instance.new("TextLabel")


local function getNextRebirthPrice(currentRebirths)
    local basePrice = 3e6
    local additionalPrice = 2e6
    local nextPrice = (currentRebirths + 1) * basePrice + additionalPrice
    return nextPrice
end

local function formatNumber(number)
    local suffixes = {"", "K", "M", "B", "T", "QD"}
    local suffix_index = 1

    while math.abs(number) >= 1000 and suffix_index < #suffixes do
        number = number / 1000.0
        suffix_index = suffix_index + 1
    end

    return string.format("%.2f%s", number, suffixes[suffix_index])
end

local function getStrength()
    local player = Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
        local statsFolder = player.Character:FindFirstChild("Stats")
        if statsFolder and statsFolder:FindFirstChild("Strength") then
            return statsFolder.Strength.Value
        end
    end
    return "Error"
end


local gui = Instance.new("ScreenGui")
gui.Name = "PingDisplayGui"
gui.Parent = game.CoreGui

local guiMission = Instance.new("ScreenGui")
guiMission.Name = "MissionDisplayGui"
guiMission.Parent = game.CoreGui

local guiFPS = Instance.new("ScreenGui")
guiFPS.Name = "FPSDisplayGui"
guiFPS.Parent = game.CoreGui

local guiRebirth = Instance.new("ScreenGui")
guiRebirth.Name = "RebirthDisplayGui"
guiRebirth.Parent = game.CoreGui

local guiTransformation = Instance.new("ScreenGui")
guiTransformation.Name = "TransformationDisplayGui"
guiTransformation.Parent = game.CoreGui

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RebirthMenu"
screenGui.Parent = game.CoreGui

frame.Name = "PingFrame"
frame.Size = UDim2.new(0.100061566, 0, 0.100026964, 0)
frame.Position = UDim2.new(0.0116822431, 0, 0.0248226952, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = gui


pingLabel.Name = "PingLabel"
pingLabel.Size = UDim2.new(1, 0, 1, 0)
pingLabel.Position = UDim2.new(0, 0, 0, 0)
pingLabel.BackgroundTransparency = 1
pingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
pingLabel.TextStrokeTransparency = 0
pingLabel.Font = Enum.Font.SourceSans
pingLabel.TextSize = 18
pingLabel.Parent = frame

corner.CornerRadius = UDim.new(1, 0)
corner.Parent = frame


frameMission.Name = "MissionFrame"
frameMission.Size = UDim2.new(0.100061566, 0, 0.100026964, 0)
frameMission.Position = UDim2.new(0.0116822431 + 0.11, 0, 0.0248226952, 0) 
frameMission.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frameMission.BackgroundTransparency = 0.5
frameMission.ClipsDescendants = true  
frameMission.Parent = guiMission


missionLabel.Name = "MissionLabel"
missionLabel.Size = UDim2.new(1, -10, 1, -10) 
missionLabel.Position = UDim2.new(0, 5, 0, 5) 
missionLabel.BackgroundTransparency = 1
missionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
missionLabel.TextStrokeTransparency = 0
missionLabel.Font = Enum.Font.SourceSans
missionLabel.TextSize = 18
missionLabel.TextWrapped = true 
missionLabel.TextXAlignment = Enum.TextXAlignment.Center 
missionLabel.TextYAlignment = Enum.TextYAlignment.Center 
missionLabel.Parent = frameMission

cornerMission.CornerRadius = UDim.new(1, 0) 
cornerMission.Parent = frameMission


frameFPS.Name = "FPSFrame"
frameFPS.Size = UDim2.new(0.100061566, 0, 0.100026964, 0)
frameFPS.Position = UDim2.new(0.0116822431 + 0.22, 0, 0.0248226952, 0) -- Posición al lado del cuadro de la misión
frameFPS.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frameFPS.BackgroundTransparency = 0.5
frameFPS.ClipsDescendants = true
frameFPS.Parent = guiFPS



fpsLabel.Name = "FPSLabel"
fpsLabel.Size = UDim2.new(1, -10, 1, -10)
fpsLabel.Position = UDim2.new(0, 5, 0, 5)
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.TextStrokeTransparency = 0
fpsLabel.Font = Enum.Font.SourceSans
fpsLabel.TextSize = 18
fpsLabel.TextWrapped = true
fpsLabel.TextXAlignment = Enum.TextXAlignment.Center
fpsLabel.TextYAlignment = Enum.TextYAlignment.Center
fpsLabel.Parent = frameFPS

cornerFPS.CornerRadius = UDim.new(1, 0)
cornerFPS.Parent = frameFPS

local frameRebirth = Instance.new("Frame")
frameRebirth.Name = "RebirthFrame"
frameRebirth.Size = UDim2.new(0.100061566, 0, 0.100026964, 0)
frameRebirth.Position = UDim2.new(0.0116822431 + 0.33, 0, 0.0248226952, 0)
frameRebirth.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frameRebirth.BackgroundTransparency = 0.5
frameRebirth.ClipsDescendants = true
frameRebirth.Parent = guiRebirth


rebirthLabel.Name = "RebirthLabel"
rebirthLabel.Size = UDim2.new(1, -10, 0.8, -10)
rebirthLabel.Position = UDim2.new(0, 5, 0, 5)
rebirthLabel.BackgroundTransparency = 1
rebirthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
rebirthLabel.TextStrokeTransparency = 0
rebirthLabel.Font = Enum.Font.SourceSans
rebirthLabel.TextSize = 14
rebirthLabel.TextScaled = true
rebirthLabel.TextWrapped = true
rebirthLabel.TextXAlignment = Enum.TextXAlignment.Center
rebirthLabel.TextYAlignment = Enum.TextYAlignment.Center
rebirthLabel.ClipsDescendants = true
rebirthLabel.Parent = frameRebirth

cornerRebirth.CornerRadius = UDim.new(1, 0)
cornerRebirth.Parent = frameRebirth


strengthLabel.Name = "StrengthLabel"
strengthLabel.Size = UDim2.new(1, -10, 0.8, -10)
strengthLabel.Position = UDim2.new(0, 5, 0.5, 5)
strengthLabel.BackgroundTransparency = 1
strengthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
strengthLabel.TextStrokeTransparency = 0
strengthLabel.Font = Enum.Font.SourceSans
strengthLabel.TextSize = 14
strengthLabel.TextScaled = true
strengthLabel.TextWrapped = true
strengthLabel.TextXAlignment = Enum.TextXAlignment.Center
strengthLabel.TextYAlignment = Enum.TextYAlignment.Center
strengthLabel.ClipsDescendants = true
strengthLabel.Parent = frameRebirth



frameTransformation.Name = "TransformationFrame"
frameTransformation.Size = UDim2.new(0.100061566, 0, 0.100026964, 0)
frameTransformation.Position = UDim2.new(0.0116822431 + 0.44, 0, 0.0248226952, 0) 
frameTransformation.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frameTransformation.BackgroundTransparency = 0.5
frameTransformation.ClipsDescendants = true  
frameTransformation.Parent = guiTransformation

cornerTransformation.CornerRadius = UDim.new(1, 0) 
cornerTransformation.Parent = frameTransformation

transformationLabel.Name = "TransformationLabel"
transformationLabel.Size = UDim2.new(1, -10, 1, -10) 
transformationLabel.Position = UDim2.new(0, 5, 0, 5) 
transformationLabel.BackgroundTransparency = 1
transformationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
transformationLabel.TextStrokeTransparency = 0
transformationLabel.Font = Enum.Font.SourceSans
transformationLabel.TextSize = 18
transformationLabel.TextWrapped = true 
transformationLabel.TextXAlignment = Enum.TextXAlignment.Center 
transformationLabel.TextYAlignment = Enum.TextYAlignment.Center 
transformationLabel.Parent = frameTransformation

local success, playerData = pcall(function()
    return ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
end)
if not success then
    warn("No se pudo obtener datos del jugador")
    return
end
success, rebirthValue = pcall(function()
    return playerData:WaitForChild("Rebirth")
end)
if not success then
    warn("No se pudo obtener el valor de rebirth")
    return
end

frameR.Size = UDim2.new(0.100061566, 0, 0.100026964, 0)
frameR.Position = UDim2.new(0.0116822431 + 0.55, 0, 0.0248226952, 0)
frameR.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frameR.BackgroundTransparency = 0.5
frameR.Parent = screenGui

uiCorner.CornerRadius = UDim.new(1, 0)
uiCorner.Parent = frameR

textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.Text = "Rebirths: " .. rebirthValue.Value
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.BackgroundTransparency = 1
textLabel.TextScaled = true
textLabel.TextStrokeTransparency = 0.8
textLabel.Parent = frameR

local HttpService = game:GetService("HttpService")

local FILE_PATH = "RebirthData.json"

local gui = Instance.new("ScreenGui")
gui.Name = "RebirthTimerGui"
gui.Parent = game.CoreGui

local background = Instance.new("Frame")
background.Name = "Background"
background.Position = UDim2.new(0.0116822431 + 0.66, 0, 0.0248226952, 0)
background.Size = UDim2.new(0.100061566, 0, 0.100026964, 0)
background.BackgroundTransparency = 0.5
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BorderSizePixel = 0
background.Parent = gui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(1, 0) -- Ajusta este valor para hacer los bordes más o menos redondeados
uiCorner.Parent = background

local timerLabel = Instance.new("TextLabel")
timerLabel.Name = "TimerLabel"
timerLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
timerLabel.AnchorPoint = Vector2.new(0.5, 0.5)
timerLabel.Size = UDim2.new(1, -20, 1, -10)
timerLabel.BackgroundTransparency = 1
timerLabel.Font = Enum.Font.SourceSans
timerLabel.TextSize = 48
timerLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
timerLabel.TextStrokeTransparency = 0
timerLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
timerLabel.Text = "0:00"
timerLabel.Parent = background

local rebirthTimeValue = Instance.new("IntValue")
rebirthTimeValue.Name = "RebirthTimeValue"
rebirthTimeValue.Parent = ReplicatedStorage

local previousRebirthValue = 0
local hasReinitialized = false

local function updateTimer()
    local lastRebirthTime = ReplicatedStorage:WaitForChild("RebirthTimeValue").Value
    local elapsedTime = tick() - lastRebirthTime
    local minutes = math.floor(elapsedTime / 60)
    local seconds = math.floor(elapsedTime % 60)
    timerLabel.Text = string.format("%d:%02d", minutes, seconds)
end

local function animateTextColor()
    local colors = {
        Color3.fromRGB(255, 0, 0),
        Color3.fromRGB(0, 255, 0),
        Color3.fromRGB(0, 0, 255),
        Color3.fromRGB(255, 255, 0),
        Color3.fromRGB(255, 165, 0)
    }
    local index = 1
    while true do
        timerLabel.TextColor3 = colors[index]
        index = (index % #colors) + 1
        wait(1)
    end
end

local function saveRebirthData()
    local success, errorMsg = pcall(function()
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
    end)
    
    if not success then
        warn("Error al guardar datos: " .. errorMsg)
    end
end

local function loadRebirthData()
    local success, errorMsg = pcall(function()
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
            ReplicatedStorage:WaitForChild("RebirthTimeValue").Value = tick()
            local player = Players.LocalPlayer
            local playerStats = player.Character and player.Character:FindFirstChild("Stats")
            if playerStats and playerStats:FindFirstChild("Rebirth") then
                playerStats.Rebirth.Value = 0
                previousRebirthValue = 0
            end
        end
    end)
    
    if not success then
        warn("Error al cargar datos: " .. errorMsg)
    end
end

local function isInTargetPlace()
    local placeId = game.PlaceId
    return placeId == 3311165597
end

local timerConnection
timerConnection = game:GetService("RunService").Stepped:Connect(function()
    updateTimer()

    local player = Players.LocalPlayer
    local playerStats = player.Character and player.Character:FindFirstChild("Stats")
    local currentRebirthValue = playerStats and playerStats:FindFirstChild("Rebirth") and playerStats.Rebirth.Value or 0

    if currentRebirthValue > previousRebirthValue then
        ReplicatedStorage:WaitForChild("RebirthTimeValue").Value = tick()
        previousRebirthValue = currentRebirthValue
    end

    if isInTargetPlace() then
        if not hasReinitialized then
            ReplicatedStorage:WaitForChild("RebirthTimeValue").Value = tick()
            previousRebirthValue = currentRebirthValue
            hasReinitialized = true
        end
    else
        hasReinitialized = false
    end

    saveRebirthData()
end)


local function updateRebirthDisplay()
    local success, errorMessage = pcall(function()
        textLabel.Text = "Rebirths: " .. rebirthValue.Value
    end)
    
    if not success then
        warn("Error al actualizar el valor de rebirth: " .. errorMessage)
    end
end


local function getTransformation(player)
    local success, transformation = pcall(function()
        return player.Status.Transformation.Value  -- Suponiendo que la transformación esté almacenada en este lugar
    end)
    if success then
        return transformation
    else
        warn("Error al obtener la transformación: ", transformation)  -- Registra el error
        return "Error"
    end
end

local function updateTransformation(player)
    while true do
        local success, transformation = pcall(function()
            return getTransformation(player)
        end)
        if success then
            transformationLabel.Text = "For: " .. transformation
        else
            warn("Error al actualizar la transformación: ", transformation)
            transformationLabel.Text = "Error"
        end
        wait(0.05)
    end
end

local function updateRebirth()
    while true do
        local success, ldata = pcall(function()
            return ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
        end)
        if success then
            local currentRebirths = ldata.Rebirth.Value
            local nextRebirthPrice = getNextRebirthPrice(currentRebirths)
            local strength = ldata.Strength.Value
            rebirthLabel.Text = string.format("\n%s / %s", formatNumber(nextRebirthPrice), formatNumber(strength))
        else
            warn("Error al actualizar el rebirth: ", ldata)
            rebirthLabel.Text = "Error"
        end
        wait(0.5)
    end
end

local function updateStrength()
    while true do
        local success, strength = pcall(function()
            return getStrength()
        end)
        if success then
            strengthLabel.Size = UDim2.new(0.8930841106, 0, 0.409148958, 0 )
            strengthLabel.Position = UDim2.new(0.0630841106, 0, 0.599148958, 0 )
            strengthLabel.Text = "stat: " .. formatNumber(tonumber(strength) or 0)
        else
            warn("Error al actualizar la fuerza: ", strength)
            strengthLabel.Text = "Error"
        end
        wait(0.2)
    end
end

local lastUpdate = tick()
local frameCount = 0

local function updateFPS()
    while true do
        frameCount = frameCount + 1
        local currentTime = tick()
        if currentTime - lastUpdate >= 1 then
            local fps = frameCount / (currentTime - lastUpdate)
            fpsLabel.Text = "FPS: " .. math.floor(fps)
            frameCount = 0
            lastUpdate = currentTime
        end
        wait(0.03)  -- Esperar un corto intervalo para permitir la actualización de la UI
    end
end

RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
end)

local function getMission(player)
    local success, mission = pcall(function()
        return ReplicatedStorage.Datas[player.UserId].Quest.Value
    end)
    if success then
        return mission
    else
        warn("Error al obtener la misión: ", mission)
        return "Error"
    end
end

local function updateMission(player)
    while true do
        local success, mission = pcall(function()
            return getMission(player)
        end)
        if success then
            missionLabel.Text = "Misión:\n" .. mission
        else
            warn("Error al actualizar la misión: ", mission)
            missionLabel.Text = "Error"
        end
        wait(0.05)
    end
end

local function getPing()
    local success, pingValue = pcall(function()
        return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    if success then
        return pingValue
    else
        warn("Error al obtener el ping: ", pingValue)
        return "Error"
    end
end

local function formatPing(ping)
    if type(ping) == "number" then
        if ping >= 1000 then
            return string.format("%.1fk ms", ping / 1000)
        else
            return string.format("%d ms", ping)
        end
    else
        return ping
    end
end

local function updatePing()
    while true do
        local success, ping = pcall(function()
            return getPing()
        end)
        if success then
            pingLabel.Text = "Ping: " .. formatPing(ping)
        else
            warn("Error al actualizar el ping: ", ping)
            pingLabel.Text = "Error"
        end
        wait(.05)
    end
end

spawn(animateTextColor)
loadRebirthData()
rebirthValue.Changed:Connect(updateRebirthDisplay)
updateRebirthDisplay()
spawn(function() updateTransformation(player) end)
spawn(updateRebirth)
spawn(updateStrength)
spawn(function() updateMission(player) end)
spawn(updatePing)
spawn(updateFPS)
