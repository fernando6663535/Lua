local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local FILE_PATH = "RebirthData.json"


local gui = Instance.new("ScreenGui")
gui.Name = "DisplayGui"
gui.Parent = game.CoreGui

local function getNextRebirthPrice(currentRebirths)
    local basePrice = 3e6
    local additionalPrice = 2e6
    return (currentRebirths + 1) * basePrice + additionalPrice
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

local function safeGetValue(func)
    local success, result = pcall(func)
    if success then
        return result
    else
        warn("Error: " .. tostring(result))
        return "Error"
    end
end

local function getPing()
    return safeGetValue(function()
        return game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
end

local function getMission()
    return safeGetValue(function()
        return ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId).Quest.Value
    end)
end

local function getAdditionalStrength()
    local statsFolder = player.Character and player.Character:FindFirstChild("Stats")
    if statsFolder and statsFolder:FindFirstChild("Strength") then
        return statsFolder.Strength.Value
    end
    return 0
end

local function getTransformation()
    return safeGetValue(function()
        return player.Status and player.Status.Transformation and player.Status.Transformation.Value
    end)
end

local function getRebirths()
    return safeGetValue(function()
        local folderData = ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
        return folderData.Rebirth.Value
    end)
end

local function createFrame(positionOffset, text, textSize)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.100061566, 0, 0.100026964, 0)
    frame.Position = UDim2.new(0.0116822431 + positionOffset, 0, 0.0248226952, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.5
    frame.ClipsDescendants = true
    frame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 1, -10)
    label.Position = UDim2.new(0, 5, 0, 5)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0
    label.Font = Enum.Font.SourceSans
    label.TextSize = textSize or 18
    label.TextWrapped = true
    label.TextScaled = true
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.ClipsDescendants = true
    label.Text = text
    label.Parent = frame

    return label
end

local pingLabel = createFrame(0, "Ping: Loading...", 18)
local missionLabel = createFrame(0.11, "Loading...", 14)
local fpsLabel = createFrame(0.22, "FPS: Loading...", 18)
local rebirthLabel = createFrame(0.33, "Loading...", 18)
local transformationLabel = createFrame(0.44, "For: Loading...", 18)
local rebirthFrameLabel = createFrame(0.55, "Rebirths: Loading...", 18)





local gui = Instance.new("ScreenGui")
gui.Name = "RebirthTimerGui"
gui.Parent = game.CoreGui



-- Función para crear un frame y un TextLabel
local function createLabel(name, text, position, size, textSize, textColor)
    local frame = Instance.new("Frame")
    frame.Name = name .. "Frame"
    frame.Position = position
    frame.Size = size
    frame.BackgroundTransparency = 0.5
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BorderSizePixel = 0
    frame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Name = name .. "Label"
    label.Size = UDim2.new(1, -20, 1, -10)
    label.Position = UDim2.new(0.5, 0, 0.5, 0)
    label.AnchorPoint = Vector2.new(0.5, 0.5)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.SourceSans
    label.TextSize = textSize
    label.TextColor3 = textColor
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.Text = text
    label.Parent = frame

    return label
end

-- Crear los labels con la función simplificada
local timerLabel = createLabel("Timer", "0:00", UDim2.new(0.0116822431 + 0.66, 0, 0.0248226952, 0), UDim2.new(0.100, 0, 0.100, 0), 48, Color3.fromRGB(255, 0, 0))

local rebirthTimeValue = Instance.new("IntValue")
rebirthTimeValue.Name = "RebirthTimeValue"
rebirthTimeValue.Parent = ReplicatedStorage

local previousRebirthValue = 0
local hasReinitialized = false

local function updateTimer()
    local success, lastRebirthTime = pcall(function()
        return ReplicatedStorage:WaitForChild("RebirthTimeValue").Value
    end)
    
    if success then
        local elapsedTime = tick() - lastRebirthTime
        local minutes = math.floor(elapsedTime / 60)
        local seconds = math.floor(elapsedTime % 60)
        timerLabel.Text = string.format("%d:%02d", minutes, seconds)
    else
        warn("Error al obtener el tiempo de renacimiento.")
        timerLabel.Text = "Error"
    end
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
    return game.PlaceId == 3311165597
end

RunService.Stepped:Connect(function()
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

spawn(animateTextColor)
loadRebirthData() 

local lastUpdate = tick()
local frameCount = 0



local function updateDisplay()
    while true do
        local success, err = pcall(function()
            local folderData = ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
            local currentRebirths = folderData.Rebirth.Value
            local nextRebirthPrice = getNextRebirthPrice(currentRebirths)
            local strength = folderData.Strength.Value
            local additionalStrength = getAdditionalStrength()
            local formattedStrength = formatNumber(strength)
            local formattedAdditionalStrength = formatNumber(additionalStrength)
            local ping = getPing()
            local mission = getMission()
            local transformation = getTransformation()
            local rebirths = getRebirths()

            pingLabel.Text = "Ping: " .. formatNumber(ping)
            missionLabel.Text = mission
            rebirthLabel.Text = formatNumber(nextRebirthPrice) .. " / " .. formattedStrength .. "\n" .. formattedAdditionalStrength
            transformationLabel.Text = "For: " .. transformation
            rebirthFrameLabel.Text = "" .. formatNumber(rebirths)

            local currentTime = tick()
            if currentTime - lastUpdate >= 1 then
                local fps = frameCount / (currentTime - lastUpdate)
                fpsLabel.Text = "FPS: " .. math.floor(fps)
                frameCount = 0
                lastUpdate = currentTime
            end

            frameCount = frameCount + 1
        end)
        
        if not success then
            warn("Error en updateDisplay: " .. tostring(err))
        end
        
        wait(0.1)
    end
end

RunService.RenderStepped:Connect(function()
    local success, err = pcall(function()
        frameCount = frameCount + 1
    end)

    if not success then
        warn("Error en RenderStepped: " .. tostring(err))
    end
end)

spawn(function()
    local success, err = pcall(updateDisplay)
    if not success then
        warn("Error al iniciar updateDisplay: " .. tostring(err))
    end
end)
