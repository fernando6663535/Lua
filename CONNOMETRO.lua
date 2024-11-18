game:GetService("Players")
game:GetService("ReplicatedStorage")
game:GetService("RunService")
player = game.Players.LocalPlayer
FILE_PATH = "RebirthData.json"

gui = Instance.new("ScreenGui")
gui.Name = "DisplayGui"
gui.Parent = game.CoreGui

function safeGetValue(func)
    success, result = pcall(func)
    if success then
        return result
    else
        warn("Error: " .. tostring(result))
        return "Error"
    end
end

data = safeGetValue(function() return game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId) end)

function getrebprice()
    success, result = pcall(function()
        return (data.Rebirth.Value * 3e6) + 2e6
    end)
    if success then
        return result
    else
        warn("Error al obtener el precio de rebirth: " .. tostring(result))
        return 0
    end
end

function formatNumber(number)
    success, result = pcall(function()
        suffixes = {"", "K", "M", "B", "T", "QD"}
        suffix_index = 1
        while math.abs(number) >= 1000 and suffix_index < #suffixes do
            number = number / 1000.0
            suffix_index = suffix_index + 1
        end
        return string.format("%.2f%s", number, suffixes[suffix_index])
    end)
    if success then
        return result
    else
        warn("Error al formatear número: " .. tostring(result))
        return tostring(number)
    end
end

function calculatePercentage(currentValue, maxValue)
    success, result = pcall(function()
        return math.floor((currentValue / maxValue) * 100)
    end)
    if success then
        return result
    else
        warn("Error al calcular porcentaje: " .. tostring(result))
        return 0
    end
end

function getPing()
    return safeGetValue(function()
        return game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
end

function getMastery()
    return safeGetValue(function()
        local folderData = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
        local transformation = game.PlaceId == 5151400895 and 
            safeGetValue(function() return game.Workspace.Living[player.Name].Status.Transformation.Value end) or
            player.Status and player.Status.Transformation and player.Status.Transformation.Value
        if transformation and folderData:FindFirstChild(transformation) then
            return folderData[transformation].Value
        end
        return 0
    end)
end

function getTransformation()
    local player = game:GetService("Players").LocalPlayer
    if game.PlaceId == 5151400895 then
        return safeGetValue(function() return game.Workspace.Living[player.Name].Status.Transformation.Value end)
    else
        return safeGetValue(function() return player.Status and player.Status.Transformation and player.Status.Transformation.Value end)
    end
end

local function getGameTime()
    local currentHour = math.floor(game.Lighting.ClockTime)
    local currentMinute = math.floor((game.Lighting.ClockTime % 1) * 60)
    local timeOfDay = (currentHour >= 6 and currentHour < 18) and "Día" or "Noche"
    return string.format("Hora actual: %02d:%02d\nEstado: %s", currentHour, currentMinute, timeOfDay)
end

local function updateDisplay()
    while true do
        local success, err = pcall(function()
            local gameTime = getGameTime()
            transformationLabel.Text = gameTime
        end)

        if not success then
            warn("Error en updateDisplay: " .. tostring(err))
        end

        task.wait(.1)
    end
end

function getRebirths()
    return safeGetValue(function()
        folderData = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)
        return folderData.Rebirth.Value
    end)
end

local function getAdditionalStrength()
    local statsFolder = player.Character and player.Character:FindFirstChild("Stats")
    if statsFolder and statsFolder:FindFirstChild("Strength") then
        return statsFolder.Strength.Value
    end
    return 0
end

folderData = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId)

local additionalStrength = getAdditionalStrength()

function createFrame(positionOffset, text, textSize)
    success, frame = pcall(function()
        frame = Instance.new("Frame")
        frame.Size = UDim2.new(0.100061566, 0, 0.100026964, 0)
        frame.Position = UDim2.new(0.0116822431 + positionOffset, 0, 0.0248226952, 0)
        frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        frame.BackgroundTransparency = 0.5
        frame.ClipsDescendants = true
        frame.Parent = gui

        corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = frame

        label = Instance.new("TextLabel")
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
    end)

    if success then
        return frame
    else
        warn("Error al crear el frame: " .. tostring(frame))
        return nil
    end
end

pingLabel = createFrame(0, "Ping: Loading...", 18)
masteryLabel = createFrame(0.11, "Loading Mastery...", 14)
fpsLabel = createFrame(0.22, "FPS: Loading...", 18)
rebirthLabel = createFrame(0.33, "Loading...", 18)
 transformationLabel = createFrame(0.44, "Hora del juego: Loading...", 18)
rebirthFrameLabel = createFrame(0.55, "Rebirths: Loading...", 18)

lastUpdate = tick()
frameCount = 0

game:GetService("HttpService")

local FILE_PATH = "Reta.json"
local gui = Instance.new("ScreenGui")
local timerLabel, rebirthTimeValue, previousRebirthValue
gui.Name = "RebirthTimerGui"
gui.Parent = game.CoreGui

timerLabel = nil
rebirthTimeValue = Instance.new("IntValue")
rebirthTimeValue.Name = "RebirthTimeValue"
rebirthTimeValue.Parent = game:GetService("ReplicatedStorage")

previousRebirthValue = 0

function createLabel(name, text, position, size, textSize, textColor)
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

timerLabel = createLabel("Timer", "0:00", UDim2.new(0.0116822431 + 0.66, 0, 0.0248226952, 0), UDim2.new(0.100, 0, 0.100, 0), 48, Color3.fromRGB(255, 0, 0))

local playerStats = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stats")

function updateTimer()
    local success, lastRebirthTime = pcall(function()
        return game:GetService("ReplicatedStorage"):WaitForChild("RebirthTimeValue").Value
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

function saveRebirthData()
    local success, errorMsg = pcall(function()
        local rebirthTime = game:GetService("ReplicatedStorage"):WaitForChild("RebirthTimeValue").Value
        local rebirthValue = playerStats and playerStats:FindFirstChild("Rebirth") and playerStats.Rebirth.Value or 0

        local rebirthInfo = {
            LastRebirthTime = rebirthTime,
            PlayerRebirth = rebirthValue
        }
        local jsonData = game:GetService("HttpService"):JSONEncode(rebirthInfo)
        writefile(FILE_PATH, jsonData)
    end)
    
    if not success then
        warn("Error al guardar datos: " .. errorMsg)
    end
end

function loadRebirthData()
    local success, errorMsg = pcall(function()
        if isfile(FILE_PATH) then
            local fileContents = readfile(FILE_PATH)
            if fileContents then
                local rebirthData = game:GetService("HttpService"):JSONDecode(fileContents)
                if rebirthData then
                    if rebirthData.LastRebirthTime then
                        game:GetService("ReplicatedStorage"):WaitForChild("RebirthTimeValue").Value = rebirthData.LastRebirthTime
                    end
                    if rebirthData.PlayerRebirth then
                        playerStats.Rebirth.Value = rebirthData.PlayerRebirth
                        previousRebirthValue = rebirthData.PlayerRebirth
                    end
                end
            end
        else
            game:GetService("ReplicatedStorage"):WaitForChild("RebirthTimeValue").Value = tick()
            playerStats.Rebirth.Value = 0
            previousRebirthValue = 0
        end
    end)
    
    if not success then
        warn("Error al cargar datos: " .. errorMsg)
    end
end

game:GetService("RunService").Stepped:Connect(function()
    updateTimer()

    local currentRebirthValue = playerStats and playerStats.Rebirth.Value or 0

    if currentRebirthValue > previousRebirthValue then
        game:GetService("ReplicatedStorage"):WaitForChild("RebirthTimeValue").Value = tick()
        previousRebirthValue = currentRebirthValue
    end

    saveRebirthData()
end)

loadRebirthData()


function updateDisplay()
    while true do
        success, err = pcall(function()
        
            currentRebirths = safeGetValue(function() return folderData.Rebirth.Value end)
            nextRebirthPrice = getrebprice()
            strength = safeGetValue(function() return folderData.Strength.Value end)
            
            formattedStrength = formatNumber(strength)
            formattedAdditionalStrength = formatNumber(getAdditionalStrength())  -- Actualización aquí

            ping = getPing()
            mastery = getMastery()
            transformation = getTransformation()
            rebirths = getRebirths()
            maxMastery = 332526


local gameTime = getGameTime()

            transformationLabel.Text = "Hora del juego: " .. gameTime
            pingLabel.Text = "Ping: " .. formatNumber(ping)
            masteryLabel.Text = "%" .. formatNumber(mastery) .. " (" .. calculatePercentage(mastery, maxMastery) .. "%)"
            rebirthLabel.Text = formatNumber(nextRebirthPrice) .. " / " .. formattedStrength .. "\n" .. formattedAdditionalStrength
            
            rebirthFrameLabel.Text = "" .. formatNumber(rebirths)

            currentTime = tick()
            if currentTime - lastUpdate >= 1 then
                fps = frameCount / (currentTime - lastUpdate)
                fpsLabel.Text = "FPS: " .. math.floor(fps)
                frameCount = 0
                lastUpdate = currentTime
            end

            frameCount = frameCount + 1
        end)
        
        if not success then
            warn("Error en updateDisplay: " .. tostring(err))
        end
        
        task.wait(0.4)
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    success, err = pcall(function()
        frameCount = frameCount + 1
    end)

    if not success then
        warn("Error en RenderStepped: " .. tostring(err))
    end
end)

spawn(function()
    success, err = pcall(updateDisplay)
    if not success then
        warn("Error al iniciar updateDisplay: " .. tostring(err))
    end
end)
