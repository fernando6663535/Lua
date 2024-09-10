local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local REBIRTH_FILE_PATH = "RebirthData.json"
local TIME_FILE_PATH = "TimerData.json"
local LOG_FILE_PATH = "LogData.txt"

local gui = Instance.new("ScreenGui")
gui.Name = "RebirthTimerGui"
gui.Parent = game.CoreGui

local background = Instance.new("Frame")
background.Name = "Background"
background.Position = UDim2.new(0.0116822431, 0, 0.0248226952, 0)
background.Size = UDim2.new(0, 300, 0, 150)
background.BackgroundTransparency = 1
background.BorderSizePixel = 0
background.Parent = gui

local timerLabel = Instance.new("TextLabel")
timerLabel.Name = "TimerLabel"
timerLabel.Position = UDim2.new(0.5, 0, 0.3, 0)
timerLabel.AnchorPoint = Vector2.new(0.5, 0.5)
timerLabel.Size = UDim2.new(1, -20, 0.4, -10)
timerLabel.BackgroundTransparency = 1
timerLabel.Font = Enum.Font.SourceSans
timerLabel.TextSize = 48
timerLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
timerLabel.TextStrokeTransparency = 0
timerLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
timerLabel.Text = "0:00"
timerLabel.Parent = background

local lastLogLabel = Instance.new("TextLabel")
lastLogLabel.Name = "LastLogLabel"
lastLogLabel.Position = UDim2.new(0.5, 0, 0.7, 0)
lastLogLabel.AnchorPoint = Vector2.new(0.5, 0.5)
lastLogLabel.Size = UDim2.new(1, -20, 0.4, -10)
lastLogLabel.BackgroundTransparency = 1
lastLogLabel.Font = Enum.Font.SourceSans
lastLogLabel.TextSize = 36
lastLogLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
lastLogLabel.TextStrokeTransparency = 0
lastLogLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
lastLogLabel.Text = "Último Tiempo: 0:00"
lastLogLabel.Parent = background

local rebirthTimeValue = Instance.new("IntValue")
rebirthTimeValue.Name = "RebirthTimeValue"
rebirthTimeValue.Parent = ReplicatedStorage

local previousRebirthValue = 0
local rebirthDataSaved = false
local lastSaveTime = tick()
local lastLogResetTime = tick()
local resetInterval = 17  -- Tiempo de espera en segundos
local lastRecordedTime = "0:00"

local function updateTimer()
    local lastRebirthTime = ReplicatedStorage:WaitForChild("RebirthTimeValue").Value
    local elapsedTime = tick() - lastRebirthTime
    local minutes = math.floor(elapsedTime / 60)
    local seconds = math.floor(elapsedTime % 60)
    timerLabel.Text = string.format("%d:%02d", minutes, seconds)
    return elapsedTime
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

local function saveLogData(elapsedTime)
    local minutes = math.floor(elapsedTime / 60)
    local seconds = math.floor(elapsedTime % 60)
    local timeString = string.format("%d:%02d", minutes, seconds)

    local logData = {}
    if isfile(LOG_FILE_PATH) then
        local fileContents = readfile(LOG_FILE_PATH)
        if fileContents then
            logData = fileContents:split("\n")
        end
    end
    
    table.insert(logData, timeString)
    
    -- Write the log data to the file
    local jsonData = table.concat(logData, "\n")
    writefile(LOG_FILE_PATH, jsonData)
end

local function clearLogData()
    if isfile(LOG_FILE_PATH) then
        -- Preserve the last entry until después de 17 segundos
        local fileContents = readfile(LOG_FILE_PATH)
        local logData = fileContents:split("\n")
        local lastEntry = logData[#logData]
        
        -- Write only the last entry to the file again after clearing
        writefile(LOG_FILE_PATH, lastEntry)
    end
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

local function isInTargetPlace()
    local placeId = game.PlaceId
    return placeId == 3311165597
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
        previousRebirthValue = currentRebirthValue
        saveRebirthOnce()
    end
end

local function onPlayerCharacterAdded(character)
    local playerStats = character:FindFirstChild("Stats")
    if playerStats then
        local rebirth = playerStats:FindFirstChild("Rebirth")
        if rebirth then
            rebirth.Changed:Connect(checkRebirthChange)
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(onPlayerCharacterAdded)
end)


game:GetService("RunService").Stepped:Connect(function()
    local elapsedTime = updateTimer()

    -- Guarda los datos del temporizador y log cada segundo
    if tick() - lastSaveTime >= 1 then
        if isInTargetPlace() then
            saveTimerData()
        end

        -- Guarda los datos de log y limpia el archivo de log al reiniciar el contador
        if tick() - lastLogResetTime >= resetInterval then
            clearLogData()
            lastLogLabel.Text = "Último Tiempo: " .. lastRecordedTime
            lastLogResetTime = tick()  -- Actualiza el tiempo del último reinicio
        end

        saveLogData(elapsedTime)
        lastSaveTime = tick()
    end
end)

-- Carga los datos de renacimiento y de tiempo desde el archivo .txt
spawn(animateTextColor)
loadRebirthData()

-- Inicializa el valor del último tiempo registrado antes de reiniciar
if isfile(LOG_FILE_PATH) then
    local fileContents = readfile(LOG_FILE_PATH)
    local logData = fileContents:split("\n")
    lastRecordedTime = logData[#logData] or "0:00"
    lastLogLabel.Text = "Último Tiempo: " .. lastRecordedTime
end
