local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local REBIRTH_FILE_PATH = "RebirthData.json"
local TIME_FILE_PATH = "TimerData.json"

local gui = Instance.new("ScreenGui")
gui.Name = "RebirthTimerGui"
gui.Parent = game.CoreGui

local background = Instance.new("Frame")
background.Name = "Background"
background.Position = UDim2.new(0.0116822431, 0, 0.0248226952, 0)
background.Size = UDim2.new(0, 500, 0, 100) -- Ajustado para dos cuadros
background.BackgroundTransparency = 1
background.BorderSizePixel = 0
background.Parent = gui

local timerLabel = Instance.new("TextLabel")
timerLabel.Name = "TimerLabel"
timerLabel.Position = UDim2.new(0.2, 0, 0.5, 0)
timerLabel.AnchorPoint = Vector2.new(0.5, 0.5)
timerLabel.Size = UDim2.new(0.4, -20, 1, -10)
timerLabel.BackgroundTransparency = 1
timerLabel.Font = Enum.Font.SourceSans
timerLabel.TextSize = 48
timerLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
timerLabel.TextStrokeTransparency = 0
timerLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
timerLabel.Text = "0:00"
timerLabel.Parent = background

local lastTimeLabel = Instance.new("TextLabel")
lastTimeLabel.Name = "LastTimeLabel"
lastTimeLabel.Position = UDim2.new(0.8, 0, 0.5, 0)
lastTimeLabel.AnchorPoint = Vector2.new(0.5, 0.5)
lastTimeLabel.Size = UDim2.new(0.4, -20, 1, -10)
lastTimeLabel.BackgroundTransparency = 1
lastTimeLabel.Font = Enum.Font.SourceSans
lastTimeLabel.TextSize = 48
lastTimeLabel.TextColor3 = Color3.fromRGB(0, 255, 0)  -- Color verde
lastTimeLabel.TextStrokeTransparency = 0
lastTimeLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
lastTimeLabel.Text = "Último: 0:00"
lastTimeLabel.Parent = background

local rebirthTimeValue = Instance.new("IntValue")
rebirthTimeValue.Name = "RebirthTimeValue"
rebirthTimeValue.Parent = ReplicatedStorage

local previousRebirthValue = 0
local lastSavedTime = 0
local rebirthDataSaved = false

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
    local rebirthTime = ReplicatedStorage:WaitForChild("RebirthTimeValue").Value
    local player = Players.LocalPlayer
    local playerStats = player.Character and player.Character:FindFirstChild("Stats")
    local rebirthValue = playerStats and playerStats:FindFirstChild("Rebirth") and playerStats.Rebirth.Value or 0

    local rebirthInfo = {
        LastRebirthTime = rebirthTime,
        PlayerRebirth = rebirthValue
    }
    local jsonData = HttpService:JSONEncode(rebirthInfo)
    writefile(REBIRTH_FILE_PATH, jsonData)
end

local function saveTimerData()
    local elapsedTime = tick() - ReplicatedStorage:WaitForChild("RebirthTimeValue").Value
    local timerInfo = {
        ElapsedTime = elapsedTime
    }
    local jsonData = HttpService:JSONEncode(timerInfo)
    writefile(TIME_FILE_PATH, jsonData)
end

local function loadRebirthData()
    if isfile(REBIRTH_FILE_PATH) then
        local fileContents = readfile(REBIRTH_FILE_PATH)
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
end

local function isInTargetPlace(targetPlaceId)
    return game.PlaceId == targetPlaceId
end

local function saveRebirthOnce()
    if not rebirthDataSaved then
        saveRebirthData()
        rebirthDataSaved = true
    end
end

local function checkRebirthChange()
    local player = Players.LocalPlayer
    local playerStats = player.Character and player.Character:FindFirstChild("Stats")
    local currentRebirthValue = playerStats and playerStats:FindFirstChild("Rebirth") and playerStats.Rebirth.Value or 0

    if currentRebirthValue > previousRebirthValue then
        ReplicatedStorage:WaitForChild("RebirthTimeValue").Value = tick()
        lastSavedTime = tick() - ReplicatedStorage:WaitForChild("RebirthTimeValue").Value
        local minutes = math.floor(lastSavedTime / 60)
        local seconds = math.floor(lastSavedTime % 60)
        lastTimeLabel.Text = string.format("Último: %d:%02d", minutes, seconds)
        previousRebirthValue = currentRebirthValue
        saveRebirthOnce()
    end
end

game:GetService("RunService").Stepped:Connect(function()
    updateTimer()
    checkRebirthChange()

    if isInTargetPlace(3311165597) then
        saveTimerData()
    end
end)

spawn(animateTextColor)
loadRebirthData()
