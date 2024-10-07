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
