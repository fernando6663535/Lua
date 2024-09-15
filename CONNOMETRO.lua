local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
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

spawn(animateTextColor)

loadRebirthData()
