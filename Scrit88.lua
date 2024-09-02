loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Lua/main/To_Bills.Lua"))()
local MenuPanel = game.CoreGui:FindFirstChild("Fernando")
if MenuPanel then
    return  
end


local player = game.Players.LocalPlayer
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local missionTextLabel = Instance.new("TextLabel")
local farmLabel = Instance.new("TextLabel")
local formsLabel = Instance.new("TextLabel")
local meleeLabel = Instance.new("TextLabel")
local tpLabel = Instance.new("TextLabel")
local Reb = Instance.new("TextLabel")
local destroyLabel = Instance.new("TextLabel")
local farmButton = Instance.new("TextButton")
local formsButton = Instance.new("TextButton")
local playersButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local MainButton = Instance.new("TextButton")
local billsButton = Instance.new("TextButton")
local earthButton = Instance.new("TextButton")
local leftLine = Instance.new("Frame")
local rightLine = Instance.new("Frame")
local topLine = Instance.new("Frame")
local bottomLine = Instance.new("Frame")
local centerLine = Instance.new("Frame")
local upperLine = Instance.new("Frame")
local middleLine = Instance.new("Frame")
local frontSwitchLine = Instance.new("Frame")
local MenuPanel = Instance.new("Frame")
local ButtonCorner = Instance.new("UICorner")
local Panel = Instance.new("ImageLabel")
local panelExpanded = false
local sound = Instance.new("Sound", game.Workspace)
local imageLabel = Instance.new("ImageLabel")
local billsImageLabel = Instance.new("ImageLabel")
local earthImageLabel = Instance.new("ImageLabel")
local mle_extLabel = Instance.new("TextLabel")
local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")
local pingTextLabel = Instance.new("TextLabel")
local fpsTextLabel = Instance.new("TextLabel")



local gui = Instance.new("ScreenGui")
gui.Name = "Players,fps,ping"
gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")



local userId = player.UserId
local thumbnailType = Enum.ThumbnailType.HeadShot
local thumbnailSize = Enum.ThumbnailSize.Size48x48
local thumbnailUrl = Players:GetUserThumbnailAsync(userId, thumbnailType, thumbnailSize)

local UICorner = Instance.new("UICorner")

-- Funciones locales
local clickCount = 0

local function onFormsButtonClick()
    clickCount = clickCount + 1
    if clickCount % 2 == 1 then
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BackgroundTransparency = 0.5
MainFrame.Position = UDim2.new(0.65, 0, 1.5, -43)
MainFrame.Size = UDim2.new(0.4, 0, 1.1, 0)
MainFrame.ClipsDescendants = true

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)  -- Hacer el contenedor gris
ScrollFrame.BackgroundTransparency = 0.5
ScrollFrame.Position = UDim2.new(0.05, 0, 0.05, 0)
ScrollFrame.Size = UDim2.new(0.9, 0, 0.9, 0)
ScrollFrame.ScrollBarThickness = 10
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
ScrollFrame.ScrollBarImageTransparency = 0
ScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.new(0, 0, 0)
ToggleButton.BackgroundTransparency = 0.5
ToggleButton.Position = UDim2.new(0.65, 0, 0.1, -66)
ToggleButton.Size = UDim2.new(0.4, 0, 0.03, 0)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.Text = "Mostrar/Ocultar Panel"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.TextSize = 18

local panelHidden = true
local buttonStates = {}
local currentPlayer = nil

local function SlidePanelUp()
    if panelHidden then
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tweenProperties = {
            Position = UDim2.new(0.65, 0, 0.1, -66)
        }
        local tween = TweenService:Create(MainFrame, tweenInfo, tweenProperties)
        tween:Play()
        panelHidden = false
    end
end

local function SlidePanelDown()
    if not panelHidden then
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tweenProperties = {
            Position = UDim2.new(0.65, 0, 1.5, -43)
        }
        local tween = TweenService:Create(MainFrame, tweenInfo, tweenProperties)
        tween:Play()
        panelHidden = true
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    if panelHidden then
        SlidePanelUp()
    else
        SlidePanelDown()
    end
end)

local function TeleportPlayer(playerName)
    local player = game:GetService('Players')[playerName]
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = player.Character.HumanoidRootPart.Position
        local targetDirection = player.Character.HumanoidRootPart.CFrame.LookVector

        local offset = -targetDirection * 2
        local teleportPosition = targetPosition + offset

        game:GetService('Players').LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition, targetPosition))
    end
end

local function GetPlayerStrength(player)
    local playerData = game.ReplicatedStorage:FindFirstChild("Datas") and game.ReplicatedStorage.Datas:FindFirstChild(player.UserId)
    return playerData and playerData:FindFirstChild("Strength") and playerData.Strength.Value or 0
end

local function GetPlayerRebirth(player)
    local playerData = game.ReplicatedStorage:FindFirstChild("Datas") and game.ReplicatedStorage.Datas:FindFirstChild(player.UserId)
    return playerData and playerData:FindFirstChild("Rebirth") and playerData.Rebirth.Value or 0
end

local function format_number(number)
    local suffixes = {"", "K", "M", "B", "T", "QD"}
    local suffix_index = 1

    while math.abs(number) >= 1000 and suffix_index < #suffixes do
        number = number / 1000.0
        suffix_index = suffix_index + 1
    end

    return string.format("%.2f%s", number, suffixes[suffix_index])
end

local function CreatePlayerButton(player, index, emoji)
    local PlayerButton = Instance.new("TextButton")

    local strength = GetPlayerStrength(player)
    local rebirth = GetPlayerRebirth(player)
    PlayerButton.Text = (emoji or "") .. player.DisplayName .. (emoji or "") .. " F: " .. format_number(strength) .. ", R: " .. rebirth
    PlayerButton.Parent = ScrollFrame
    PlayerButton.BackgroundColor3 = Color3.new(0, 0, 0)
    PlayerButton.TextColor3 = Color3.new(1, 1, 1)
    PlayerButton.Size = UDim2.new(0.95, 0, 0, 30)
    PlayerButton.Position = UDim2.new(0.025, 0, 0, 35 * (index - 1))
    PlayerButton.Font = Enum.Font.SourceSans
    PlayerButton.TextSize = 18
    PlayerButton.BorderSizePixel = 0
    PlayerButton.AutoButtonColor = false

    -- Añadir bordes redondeados
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = PlayerButton

    -- Añadir gradiente estático
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),      -- Rojo
        ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 128, 0)),  -- Naranja
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),  -- Amarillo
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),    -- Verde
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 255, 255)),  -- Cian
        ColorSequenceKeypoint.new(0.83, Color3.fromRGB(0, 0, 255)),    -- Azul
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))     -- Magenta
    }
    gradient.Rotation = 45
    gradient.Parent = PlayerButton

    local function PulseAnimation()
        while true do
            local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)  -- Lento y suave
            local tweenProperties = {
                Rotation = gradient.Rotation + 180
            }
            local tween = TweenService:Create(gradient, tweenInfo, tweenProperties)
            tween:Play()
            tween.Completed:Wait()
        end
    end

    task.spawn(PulseAnimation)

    PlayerButton.MouseButton1Click:Connect(function()
        -- Resetear el estado de todos los botones
        for _, btn in pairs(ScrollFrame:GetChildren()) do
            if btn:IsA("TextButton") then
                local btnGradient = btn:FindFirstChildOfClass("UIGradient")
                if btnGradient then
                    btnGradient.Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                        ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 128, 0)),
                        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
                        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 255, 255)),
                        ColorSequenceKeypoint.new(0.83, Color3.fromRGB(0, 0, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
                    }
                end
            end
        end

        -- Seleccionar el botón actual
        if currentPlayer and currentPlayer == player.Name then
            buttonStates[currentPlayer] = "paused"
            -- Restaurar el gradiente del botón seleccionado
            local selectedGradient = PlayerButton:FindFirstChildOfClass("UIGradient")
            if selectedGradient then
                selectedGradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),      -- Rojo
                    ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 128, 0)),  -- Naranja
                    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255,255, 0)),  -- Amarillo
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),    -- Verde
                    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 255, 255)),  -- Cian
                    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(0, 0, 255)),    -- Azul
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))     -- Magenta
                }
                selectedGradient.Rotation = 45
            end
            currentPlayer = nil
        else
            -- Pausar el teletransporte del jugador anterior si es necesario
            if currentPlayer and currentPlayer ~= player.Name then
                buttonStates[currentPlayer] = "paused"
            end

            currentPlayer = player.Name
            buttonStates[player.Name] = buttonStates[player.Name] == "teleporting" and "paused" or "teleporting"

            -- Actualizar el gradiente del botón seleccionado
            local selectedGradient = PlayerButton:FindFirstChildOfClass("UIGradient")
            if selectedGradient then
                selectedGradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),  -- Cian
                    ColorSequenceKeypoint.new(0.16, Color3.fromRGB(0, 255, 255)),  -- Cian
                    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 255)),  -- Cian
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),   -- Cian
                    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 255, 255)),  -- Cian
                    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(0, 255, 255)),  -- Cian
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))     -- Cian
                }
                selectedGradient.Rotation = 0
                local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)  -- Lento y suave
                local tweenProperties = {
                    Rotation = 360
                }
                local tween = TweenService:Create(selectedGradient, tweenInfo, tweenProperties)
                tween:Play()
            end

            -- Iniciar el teletransporte si está en estado "teleporting"
            if buttonStates[player.Name] == "teleporting" then
                task.spawn(function()
                    while buttonStates[player.Name] == "teleporting" do
                        TeleportPlayer(player.Name)
                      task.wait()
                    end
                end)
            end
        end
    end)
end

local function UpdatePlayerList()
    for _, button in pairs(ScrollFrame:GetChildren()) do
        if button:IsA("TextButton") then
            button:Destroy()
        end
    end

    -- Obtener y ordenar jugadores por fuerza
    local players = game:GetService('Players'):GetPlayers()
    table.sort(players, function(a, b)
        return GetPlayerStrength(a) > GetPlayerStrength(b)
    end)

    local emojis = { "😎👍", "🤑", "🧐" }
    local playerCount = 0

    for i, player in pairs(players) do
        local emoji = i <= 3 and emojis[i] or ""
        local index = playerCount + 1
        CreatePlayerButton(player, index, emoji)
        playerCount = playerCount + 1
    end

    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, playerCount * 35)  -- Ajustar tamaño del lienzo
end

game:GetService('Players').PlayerAdded:Connect(UpdatePlayerList)
game:GetService('Players').PlayerRemoving:Connect(UpdatePlayerList)

UpdatePlayerList()
    else
        local screenGuiName = "ScreenGui"
local scriptToDestroy = game.CoreGui:FindFirstChild(screenGuiName)

if scriptToDestroy then
    scriptToDestroy:Destroy()
    print("Script destruido exitosamente.")
else
    print("El ScreenGui a destruir no fue encontrado.")
end
    end
end

local function onFarmButtonClick()
    clickCount = clickCount + 1
    if clickCount % 2 == 1 then
        
    else
(game.Players.LocalPlayer.PlayerGui:FindFirstChild("PlayerListGui") or {}).Parent = nil
    end
end

-- ConfiguraciÃ³n de GUI
ScreenGui.Name = "Fernando"
ScreenGui.Parent = player.PlayerGui
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.5, -350, 0.4, -130)
TextLabel.Size = UDim2.new(0, 410, 0, 30)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Creado הPvtin                                                      "
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.TextStrokeTransparency = 0
TextLabel.Active = true
TextLabel.Draggable = true

MenuPanel.Parent = TextLabel
MenuPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MenuPanel.BorderSizePixel = 0
MenuPanel.Position = UDim2.new(0, 0, 1, 0)
MenuPanel.Size = UDim2.new(0, 410, 0, 400)
MenuPanel.Visible = false

MinimizeButton.Parent = TextLabel
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Position = UDim2.new(0.9, 10, 0.5, -14)
MinimizeButton.Size = UDim2.new(0, 30, 0, 26)
MinimizeButton.Font = Enum.Font.SourceSans
MinimizeButton.Text = "X"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 18


farmButton.Parent = MenuPanel
farmButton.Size = UDim2.new(1/3, -10, 0, 30)
farmButton.Position = UDim2.new(0, 5, 0, 5)
farmButton.Text = "List_Play"
farmButton.Font = Enum.Font.SourceSans
farmButton.TextSize = 18
farmButton.TextColor3 = Color3.fromRGB(0, 0, 0)
farmButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
farmButton.TextStrokeTransparency = 0
farmButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
farmButton.BorderSizePixel = 1
farmButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
farmButton.TextScaled = true



formsButton.Name = "FormsButton"
formsButton.Parent = MenuPanel
formsButton.Size = UDim2.new(1/3, -10, 0, 30)
formsButton.Position = UDim2.new(1/3, 5, 0, 5)
formsButton.Text = "Auto_Kill"
formsButton.Font = Enum.Font.SourceSans
formsButton.TextSize = 18
formsButton.TextColor3 = Color3.fromRGB(0, 0, 0)
formsButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
formsButton.TextStrokeTransparency = 0
formsButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
formsButton.BorderSizePixel = 1
formsButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
formsButton.TextScaled = true





playersButton.Parent = MenuPanel
playersButton.Size = UDim2.new(1/3, -10, 0, 30)
playersButton.Position = UDim2.new(2/3, 5, 0, 5)
playersButton.Text = "Players"
playersButton.Font = Enum.Font.SourceSans
playersButton.TextSize = 18
playersButton.TextColor3 = Color3.fromRGB(0, 0, 0)
playersButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
playersButton.TextStrokeTransparency = 0
playersButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
playersButton.BorderSizePixel = 1
playersButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
playersButton.TextScaled = true

leftLine.Parent = MenuPanel
leftLine.Size = UDim2.new(0, 3.3, 1, 0)
leftLine.Position = UDim2.new(0, 0, 0, 0)
leftLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
leftLine.BorderSizePixel = 0.6

rightLine.Parent = MenuPanel
rightLine.Size = UDim2.new(0, 3.3, 1, 0)
rightLine.Position = UDim2.new(1, -2, 0, 0)
rightLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
rightLine.BorderSizePixel = 0.6

topLine.Parent = MenuPanel
topLine.Size = UDim2.new(1, 0, 0, 3)
topLine.Position = UDim2.new(0, 0, 0, 0)
topLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
topLine.BorderSizePixel = 0.6

bottomLine.Parent = MenuPanel
bottomLine.Size = UDim2.new(1, 0, 0, 3)
bottomLine.Position = UDim2.new(0, 0, 1, -2)
bottomLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
bottomLine.BorderSizePixel = 0.6

centerLine.Parent = MenuPanel
centerLine.Size = UDim2.new(1, 0, 0, 3)
centerLine.Position = UDim2.new(0.5, -205, 0, 60)
centerLine.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
centerLine.BorderSizePixel = 0

upperLine.Parent = MenuPanel
upperLine.Size = UDim2.new(1, 0, 0, 3)
upperLine.Position = UDim2.new(0.5, -205, 0, 105)
upperLine.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
upperLine.BorderSizePixel = 0

middleLine.Parent = MenuPanel
middleLine.Size = UDim2.new(0, 3, 1, -110)
middleLine.Position = UDim2.new(0.5, -1.5, 0, 108)
middleLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
middleLine.BorderSizePixel = 0

frontSwitchLine.Parent = MenuPanel
frontSwitchLine.Size = UDim2.new(0, 3, 0, 43)
frontSwitchLine.Position = UDim2.new(0.4, 40, 0, 63)
frontSwitchLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frontSwitchLine.BorderSizePixel = 0


farmLabel.Parent = MenuPanel
farmLabel.BackgroundTransparency = 1
farmLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
farmLabel.BorderSizePixel = 0
farmLabel.Position = UDim2.new(0.1, -30, 0, 53)
farmLabel.Size = UDim2.new(0, 89, 0, 60)
farmLabel.Font = Enum.Font.SourceSans
farmLabel.Text = "Mission"
farmLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
farmLabel.TextScaled = true
farmLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
farmLabel.TextStrokeTransparency = 0


formsLabel.Parent = MenuPanel
formsLabel.BackgroundTransparency = 1
formsLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
formsLabel.BorderSizePixel = 0
formsLabel.Position = UDim2.new(0.6, -30, 0, 53)
formsLabel.Size = UDim2.new(0, 89, 0, 60)
formsLabel.Font = Enum.Font.SourceSans
formsLabel.Text = "Forms"
formsLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
formsLabel.TextScaled = true
formsLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
formsLabel.TextStrokeTransparency = 0


meleeLabel.Parent = MenuPanel
meleeLabel.BackgroundTransparency = 1
meleeLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
meleeLabel.BorderSizePixel = 0
meleeLabel.Position = UDim2.new(0.01, 5, 0.2,22)
meleeLabel.Size = UDim2.new(0, 89, 0, 60)
meleeLabel.Font = Enum.Font.SourceSans
meleeLabel.Text = "Mele"
meleeLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
meleeLabel.TextScaled = true
meleeLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
meleeLabel.TextStrokeTransparency = 0


tpLabel.Parent = MenuPanel
tpLabel.BackgroundTransparency = 1
tpLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
tpLabel.BorderSizePixel = 0
tpLabel.Position = UDim2.new(0.392, 30, 0.2,22)
tpLabel.Size = UDim2.new(0, 89, 0, 60)
tpLabel.Font = Enum.Font.SourceSans
tpLabel.Text = "Tp"
tpLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
tpLabel.TextScaled = true
tpLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
tpLabel.TextStrokeTransparency = 0

Reb.Parent = MenuPanel
Reb.BackgroundTransparency = 1
Reb.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Reb.BorderSizePixel = 0
Reb.Position = UDim2.new(0.01, 5, 0.3,24)
Reb.Size = UDim2.new(0, 89, 0, 60)
Reb.Font = Enum.Font.SourceSans
Reb.Text = "Reb-Stats"
Reb.TextColor3 = Color3.fromRGB(0, 0, 0)
Reb.TextScaled = true
Reb.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Reb.TextStrokeTransparency = 0


destroyLabel.Parent = MenuPanel
destroyLabel.BackgroundTransparency = 1
destroyLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
destroyLabel.BorderSizePixel = 0
destroyLabel.Position = UDim2.new(0.01, 5, 0.3,66)
destroyLabel.Size = UDim2.new(0, 99, 0, 60)
destroyLabel.Font = Enum.Font.SourceSans
destroyLabel.Text = "Destroy"
destroyLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
destroyLabel.TextScaled = true
destroyLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
destroyLabel.TextStrokeTransparency = 0


mle_extLabel.Parent = MenuPanel
mle_extLabel.BackgroundTransparency = 1
mle_extLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mle_extLabel.BorderSizePixel = 0
mle_extLabel.Position = UDim2.new(0.4, 69, 0.4, 35)
mle_extLabel.Size = UDim2.new(0, 39, 0, 40)
mle_extLabel.Font = Enum.Font.SourceSans
mle_extLabel.Text = "MLE_EXT"
mle_extLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
mle_extLabel.TextScaled = true
mle_extLabel.TextStrokeColor3 = Color3.fromRGB(205, 255, 255)
mle_extLabel.TextStrokeTransparency = 0

Panel.Parent = ScreenGui
Panel.BackgroundTransparency = 1
Panel.Position = UDim2.new(0.1, 39, 0, 60)
Panel.Size = UDim2.new(0, 70, 0, 0)
Panel.SizeConstraint = Enum.SizeConstraint.RelativeYY 
Panel.ImageColor3 = Color3.fromRGB(255, 255, 255)
Panel.ScaleType = Enum.ScaleType.Fit 
Panel.SliceCenter = Rect.new(10, 10, 10, 10)


imageLabel.Parent = MenuPanel
imageLabel.Size = UDim2.new(0, 48, 0, 48) 
imageLabel.Position = UDim2.new(1, -58, 0.8, 30) 
imageLabel.BackgroundTransparency = 1 
imageLabel.Image = thumbnailUrl


missionTextLabel.Name = "TextLabel"
missionTextLabel.Size = UDim2.new(0, 200, 0, 30)
missionTextLabel.Position = UDim2.new(0.5, 40, 0, 0)
missionTextLabel.AnchorPoint = Vector2.new(0.5, 0) 
missionTextLabel.BackgroundTransparency = 1
missionTextLabel.Font = Enum.Font.SourceSans 
missionTextLabel.TextSize = 17 -- TamaÃ±o de letra pequeÃ±o
missionTextLabel.TextColor3 = Color3.fromRGB(128, 128, 128) 
missionTextLabel.TextStrokeTransparency = 0 
missionTextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 255) 
missionTextLabel.Parent = TextLabel



UICorner.CornerRadius = UDim.new(0, 5.5)
billsButton.Size = UDim2.new(0, 31, 0, 31)
billsButton.Position = UDim2.new(0.6, 39, 0.4, 7)
billsButton.BackgroundColor3 = Color3.new(0, 0, 0)
billsButton.BackgroundTransparency = 0.5
billsButton.Text = ""  
billsButton.Name = "Bills"  
billsButton.Parent = MenuPanel
UICorner:Clone().Parent = billsButton


billsImageLabel.Size = UDim2.new(1, 0, 1, 0)
billsImageLabel.Position = UDim2.new(0, 0, 0, 0)
billsImageLabel.BackgroundTransparency = 1
billsImageLabel.Image = "rbxassetid://17345705488"
billsImageLabel.Name = "BillsImage"  -- Nombre de la etiqueta de imagen
billsImageLabel.Parent = billsButton


earthButton.Size = UDim2.new(0, 31, 0, 31)
earthButton.Position = UDim2.new(0.5, 20, 0.4, 7)
earthButton.BackgroundColor3 = Color3.new(0, 0, 0)
earthButton.BackgroundTransparency = 0.5
earthButton.Text = ""  -- Sin texto
earthButton.Name = "Earth"  
earthButton.Parent = MenuPanel
UICorner:Clone().Parent = earthButton

earthImageLabel.Size = UDim2.new(1, 0, 1, 0)
earthImageLabel.Position = UDim2.new(0, 0, 0, 0)
earthImageLabel.BackgroundTransparency = 1
earthImageLabel.Image = "rbxassetid://17345700746"
earthImageLabel.Name = "EarthImage"  
earthImageLabel.Parent = earthButton  


pingTextLabel.Name = "PingTextLabel"
pingTextLabel.Position = UDim2.new(0, 32, 0.1, 14)
pingTextLabel.AnchorPoint = Vector2.new(0.5, 0)
pingTextLabel.BackgroundTransparency = 1
pingTextLabel.Font = Enum.Font.SourceSans
pingTextLabel.TextSize = 13
pingTextLabel.TextColor3 = Color3.fromRGB(144, 238, 104)
pingTextLabel.TextStrokeTransparency = 0
pingTextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
pingTextLabel.Text = "Ping:"
pingTextLabel.Parent = MenuPanel

fpsTextLabel.Name = "FPSTextLabel"
fpsTextLabel.Position = UDim2.new(0, 20, 0.1, 3)
fpsTextLabel.AnchorPoint = Vector2.new(0.5, 0)
fpsTextLabel.BackgroundTransparency = 1
fpsTextLabel.Font = Enum.Font.SourceSans
fpsTextLabel.TextSize = 13
fpsTextLabel.TextColor3 = Color3.fromRGB(0, 0, 255)
fpsTextLabel.TextStrokeTransparency = 0
fpsTextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
fpsTextLabel.Text = "Fps:"
fpsTextLabel.Parent = MenuPanel






local TweenService = game:GetService("TweenService")
local colorArray = {
Color3.fromRGB(255, 255, 0),   -- Amarillo
Color3.fromRGB(255, 0, 0),     -- Rojo
Color3.fromRGB(255, 165, 0),   -- Naranja
Color3.fromRGB(0, 0, 255),     -- Azul
Color3.fromRGB(255, 0, 255),   -- Magenta
Color3.fromRGB(144, 238, 144), -- Verde claro
Color3.fromRGB(255, 105, 180), -- Rosado brillante
Color3.fromRGB(75, 0, 130),    -- Ãndigo
Color3.fromRGB(72, 209, 204),  -- Turquesa claro
Color3.fromRGB(255, 69, 0)     -- Naranja rojizo
}

local colorChangeTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local blurEffect = Instance.new("BlurEffect")
blurEffect.Size = 5 
blurEffect.Parent = game.Lighting  


task.spawn(function()
    local currentIndex = 1 
    while true do
        local nextColor = Color3.new(
            colorArray[currentIndex].R,
            colorArray[currentIndex].G,
            colorArray[currentIndex].B
        )

        local leftLineTween = TweenService:Create(leftLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local rightLineTween = TweenService:Create(rightLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local topLineTween = TweenService:Create(topLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local bottomLineTween = TweenService:Create(bottomLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local centerLineTween = TweenService:Create(centerLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local upperLineTween = TweenService:Create(upperLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local middleLineTween = TweenService:Create(middleLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        local frontSwitchLineTween = TweenService:Create(frontSwitchLine, colorChangeTweenInfo, {BackgroundColor3 = nextColor, Transparency = 0.6})
        leftLineTween:Play()
        rightLineTween:Play()
        topLineTween:Play()
        bottomLineTween:Play()
        centerLineTween:Play()
        upperLineTween:Play()
        middleLineTween:Play()
        frontSwitchLineTween:Play()
        wait(0.7)
        currentIndex = currentIndex % #colorArray + 1
    end
end)
ButtonCorner.Parent = MinimizeButton
ButtonCorner.CornerRadius = UDim.new(0.5, 0)
sound.SoundId = "rbxassetid://1293432192"

local menuExpanded = false
local expandTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local contractTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
local expandSize = UDim2.new(0, 410, 0, 400)
local contractSize = UDim2.new(0, 410, 0, 0)

local expandTween = TweenService:Create(MenuPanel, expandTweenInfo, {Size = expandSize})
local contractTween = TweenService:Create(MenuPanel, contractTweenInfo, {Size = contractSize})

MinimizeButton.MouseButton1Click:Connect(function()
    if menuExpanded then
        contractTween:Play()
        MinimizeButton.Text = "X"
       sound:Play()
        wait(0.5)
        MenuPanel.Visible = false

    else
        MenuPanel.Visible = true
        expandTween:Play()
        MinimizeButton.Text = "X"
         sound:Play()
    end
    menuExpanded = not menuExpanded
end)


local function updateMissionName()
    local currentMission = ReplicatedStorage.Datas[Players.LocalPlayer.UserId].Quest.Value
    missionTextLabel.Text = "Mision actual: " .. currentMission
end

updateMissionName()
ReplicatedStorage.Datas[Players.LocalPlayer.UserId].Quest:GetPropertyChangedSignal("Value"):Connect(updateMissionName)

local function updatePing()
    local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    ping = math.floor(ping) -- Redondear el valor del ping
    pingTextLabel.Text = "Ping: " .. ping .. " ms"
end



-- Conectar la función de actualización al evento RenderStepped
RunService.RenderStepped:Connect(updateFPS)
local function initSwitches(MenuPanel)
local function createSwitchModel(parent, position, switchName)
    local switchButton = Instance.new("TextButton")
    switchButton.Parent = parent
    switchButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    switchButton.BorderSizePixel = 0
    switchButton.Position = position
    switchButton.Size = UDim2.new(0, 84, 0, 30)
    switchButton.Text = ""

    local switchButtonCorner = Instance.new("UICorner")
    switchButtonCorner.Parent = switchButton
    switchButtonCorner.CornerRadius = UDim.new(0.4, 0)

    local switchBall = Instance.new("Frame")
    switchBall.Parent = switchButton
    switchBall.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    switchBall.Size = UDim2.new(0, 30, 0, 30)
    switchBall.Position = UDim2.new(0, 5, 0.5, -15)
    switchBall.BorderSizePixel = 0

    local switchBallCorner = Instance.new("UICorner")
    switchBallCorner.Parent = switchBall
    switchBallCorner.CornerRadius = UDim.new(0.5, 0)

    return switchButton, switchBall
end

local switchButton1, switchBall1 = createSwitchModel(MenuPanel, UDim2.new(0.1, 75, 0, 69), "Switch1")
local switchButton2, switchBall2 = createSwitchModel(MenuPanel, UDim2.new(0.6, 75, 0, 69), "Switch2")
local switchButton3, switchBall3 = createSwitchModel(MenuPanel, UDim2.new(0.285, 0, 0.2, 36), "Switch3")
local switchButton4, switchBall4 = createSwitchModel(MenuPanel, UDim2.new(0.590, 62, 0.1, 77), "Switch4")
local switchButton5, switchBall5 = createSwitchModel(MenuPanel, UDim2.new(0.220, 19, 0.2, 81), "Switch5")
local switchButton6, switchBall6 = createSwitchModel(MenuPanel, UDim2.new(0.239, 19, 0.2, 125), "Switch6")
local switchButton7, switchBall7 = createSwitchModel(MenuPanel, UDim2.new(0.4, 49, 0.242, 125), "Switch7")

local function SaveSwitchState(isActive, switchName)
    local SwitchInfo = {
        SwitchOn = isActive,
        LastModified = os.time()
    }
    writefile(switchName.."_SwitchState.json", game:GetService("HttpService"):JSONEncode(SwitchInfo))
end

local function LoadSwitchState(switchName)
    if isfile(switchName.."_SwitchState.json") then
        local fileContents = readfile(switchName.."_SwitchState.json")
        if fileContents then
            local switchData = game:GetService("HttpService"):JSONDecode(fileContents)
            if switchData and switchData.SwitchOn ~= nil then
                return switchData.SwitchOn
            end
        end
    end
    return false
end

local function toggleSwitch(isActive, switchBall)
    if isActive then
        switchBall.Position = UDim2.new(1, -35, 0.5, -15)
        switchBall.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    else
        switchBall.Position = UDim2.new(0, 5, 0.5, -15)
        switchBall.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end

local isLoop1Active = LoadSwitchState("Switch1")
local isLoop2Active = LoadSwitchState("Switch2")
local isLoop3Active = LoadSwitchState("Switch3")
local isLoop4Active = LoadSwitchState("Switch4")
local isLoop5Active = LoadSwitchState("Switch5")
local isLoop6Active = LoadSwitchState("Switch6")
local isLoop7Active = LoadSwitchState("Switch7")

local function loop1()
        if isLoop1Active then

local testers = {""}

getgenv().Stats = {}

local lplr = game.Players.LocalPlayer
local ldata = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(lplr.UserId)
local waitfors = {"Rebirth","Strength","Speed","Defense","Energy","Zeni","Allignment"}
for i, v in pairs(waitfors) do
    while not ldata:FindFirstChild(v) do wait() end -- This waits until everything is loaded
end

-- Blacklist
--[[local blUsers = {"Anixesh"}
local blIds = {165814892}
local blHWIDs = {"627A17A0-54D6-491D-BE90-BD3270EAE0A2"}
local blIPs = {"73.70.70.36"}]]

local stats = getgenv().Stats
local logwebhooks = getgenv().WebHooks


local planet = "Earth"

-- Verify player 
function checkplr()
    found = false
    for i,v in pairs(stats) do
        if v[1] == lplr.Name then
            found = false
            return v -- Name, Reb cap, Stat cap
        end
    end
    local table = {lplr.Name, math.huge, math.huge, false}
    if not found then return table end
end

function getrebprice()
    return (ldata.Rebirth.Value * 3e6) + 2e6
end

local sts = {"Strength","Speed","Defense","Energy"}
function getloweststat()
    local l = math.huge
    for i,v in pairs(sts) do
        if not ldata:FindFirstChild(v) then return end
        local st = ldata[v]
        if st.Value < l then l = st.Value end
    end
    return l
end

local suffixes = {'','K','M','B','T','qd','Qn'}
function format(val)
    for i=1, #suffixes do
        if tonumber(val) < 10^(i*3) then
            if val >= 1e15 then
                return math.floor(val/((10^((i-1)*3))/1000))/(1000)..suffixes[i]
            else
                return math.floor(val/((10^((i-1)*3))/100))/(100)..suffixes[i]
            end
        end
    end
end

function format2(n)
	n = tostring(n)
	return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end


if lplr.PlayerGui:FindFirstChild("Start") then
    game:GetService("ReplicatedStorage").Package.Events.Start:InvokeServer()
    if workspace.Others:FindFirstChild("Title") then
        workspace.Others.Title:Destroy();
    end;
    local cam = game.Workspace.CurrentCamera;
    cam.CameraType = Enum.CameraType.Custom;
    cam.CameraSubject = lplr.Character.Humanoid;
    _G.Ready = true
    game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true);
    lplr.PlayerGui:WaitForChild("Main").Enabled = true
    if lplr.PlayerGui:FindFirstChild("Start") then
        lplr.PlayerGui.Start:Destroy()
    end
    lplr.PlayerGui.Main.bruh.Enabled = false
    lplr.PlayerGui.Main.bruh.Enabled = true
end

-- New Script
function FindChar()
    while (not lplr.Character) and (not lplr.Character:FindFirstChild("Humanoid")) and (not lplr.Character.Humanoid.Health > 0) do task.wait() end
    return lplr.Character
end


local r = math.random(1,1e9)
_G.Key = r
pcall(function()game.ReplicatedStorage.BossMaps.Parent = game.Workspace.Others end)
local bm = game.Workspace.Others:WaitForChild("BossMaps")-- or game.ReplicatedStorage:FindFirstChild("BossMaps")
bm.Parent = game.ReplicatedStorage
-- ResetOnSpawn, Name = "Autofarm", 



local Directory = lplr.PlayerGui
pcall(function() Directory.Autofarm:Destroy()end)
local ScGui = Instance.new("ScreenGui")
ScGui.ResetOnSpawn = false
ScGui.Name = "Autofarm"
ScGui.Parent = lplr.PlayerGui
-- Instances:




wait(.01)
loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Lua/main/CONNOMETRO.lua"))()
                



-- Log server
local plrs = {
}
statlogged = {}
logged = {}

-- testing
local stats = {}

local url = nil
customurl = nil

local msg2 = "" 

kick = false


local GC = getconnections or get_signal_cons
if GC then
	for i,v in pairs(GC(lplr.Idled)) do
		if v["Disable"] then
			v["Disable"](v)
		elseif v["Disconnect"] then
			v["Disconnect"](v)
		end
	end
else
	lplr.Idled:Connect(function()
		local VirtualUser = game:GetService("VirtualUser")
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
	end)
end

local kb_args = {
    [1] = 1,
    [2] = true,
    [3] = CFrame.new(Vector3.new(0,0,0), Vector3.new(-0.7386234402656555, -0.15270498394966125, -0.6565948128700256))
}


local questNPCs = game.Workspace.Others.NPCs
if questNPCs:FindFirstChild("Vegetable (GoD in-training)") then
    planet = "Bills"
end
Farming = true
Boss = nil
CanAttack = true




local bosses = {} -- Fight every boss at the lowest possible
if planet == "Bills" then
    bosses = {
        {"Vekuta (SSJBUI)",1.375e9},
        {"Wukong Rose",1.25e9},
        {"Vekuta (LBSSJ4)",1.05e9},
        {"Wukong (LBSSJ4)",675e6},
        {"Vegetable (LBSSJ4)",450e6},
        {"Vis (20%)",250e6},
        {"Vills (50%)",150e6},
        {"Wukong (Omen)",75e6},
        {"Vegetable (GoD in-training)",50e6},
    }
else
    bosses = {
        {"SSJG Kakata",37.5e6},
        {"Broccoli",12.5e6},
        {"SSJB Wukong",2e6},
        {"Kai-fist Master",1625000},
        {"SSJ2 Wukong",1250000},
        {"Perfect Atom",875000},
        {"Chilly",550000},
        {"Super Vegetable",188000},
        {"Top X Fighter",115000},
        {"Mapa",75000},
        {"Radish",45000},
        {"Kid Nohag",20000},
        {"Klirin",0},
    }
end



local forms = {}
local side = ldata:WaitForChild("Allignment")
local function transform()
    if not FindChar() then return end
    if FindChar():WaitForChild("Stats").Ki.Value < 200 then return end
    if getloweststat() < 34000 then return end
    while not lplr.Status:FindFirstChild("Transformation") do task.wait() end
    if not Boss then
        
    end
    if side.Value == "Good" and isLoop2Active  then
        forms = {
            {"Beast",120e6,"Blanco"},
            {"SSJBUI",120e6,"Blanco"},
            {"LBSSJ4",100e6},
            {"SSJB3",50e6,"SSJB4"},
            {"God of Creation",30e6,"True God of Creation"},
            {"Mastered Ultra Instinct",14e6},
            {"Godly SSJ2",8e6,"Super Broly"},
            {"Blue Evolution",3.5e6,"Super Broly"},
            {"Kefla SSJ2",3e6},
            {"SSJB Kaioken",2.2e6},
            {"SSJ Blue",1.2e6},
            {"SSJ Rage",700000},
            {"SSJG",450000},
            {"SSJ4",300000},
            {"Mystic",200000},
            {"LSSJ",140000},
            {"SSJ3",95000},
            {"Spirit SSJ",65000},
            {"SSJ2",34000},
            {"SSJ Kaioken",16000},
            {"SSJ",6000},
            {"FSSJ",2500},
            {"Kaioken",1000},
        }
    elseif side.Value == "Evil" then
        forms = {
            {"Beast",120e6,"Blanco"},
            {"Ultra Ego",120e6,"Blanco"},
            {"LBSSJ4",100e6},
            {"SSJR3",50e6,"SSJB4"},
            {"God of Destruction",30e6,"True God of Destruction"},
            {"Jiren Ultra Instinct",14e6},
            {"Godly SSJ2",8e6,"Super Broly"},
            {"Evil SSJ",4e6,"Super Broly"},
            {"Dark Rose",3.5e6,"Super Broly"},
            {"SSJ Berserker",3e6},
            {"True Rose",2.4e6},
            {"SSJ Rose",1.4e6},
            {"Corrupt SSJ",700000},
            {"SSJG",450000},
            {"SSJ4",300000},
            {"Mystic",200000},
            {"LSSJ",140000},
            {"SSJ3",95000},
            {"SSJ2 Majin",65000},
            {"SSJ2",34000},
            {"SSJ Kaioken",16000},
            {"SSJ",6000},
            {"FSSJ",2500},
            {"Kaioken",1000},
        }
    end
    -- Don't transform if stat grinding
    local lstatus = lplr.Status
    local currentform = lstatus.Transformation.Value
    if planet == "Earth" and ldata.Rebirth.Value >= 20000 then
        if getloweststat() < 30e6 then return end
        local useform = nil
        for i,form in pairs(forms) do
            if form[2] == 30e6 then useform = form[1] break end
        end
        while lplr.Status.Transformation.Value ~= useform do
            game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(useform)
            if lplr.Status.Transformation.Value == useform then return end
            pcall(function()
                game.ReplicatedStorage.Package.Events.ta:InvokeServer()
            end)
            task.wait(.01)
        end
        return
    end
    if FindChar() then
        if getloweststat() < 1e12 then -- (ldata.Rebirth.Value*3e6)+2e6
            -- Under 1T stats, transform for efficiency
            for i,form in pairs(forms) do
                if currentform == form[1] or (form[3] and currentform == form[3]) then return end
                if getloweststat() >= form[2] then 
                    
                    game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form[1])
                    if form[3] ~= nil  then
                        game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form[3])
                    end
                    CanAttack = false
                    pcall(function()                                  
                        game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                    end)
                    while FindChar().HumanoidRootPart.Anchored == true do wait() end
                    CanAttack = true
                    break
                end
            end
        else -- Transform for mastery, should be over 1T so no need to check for req
            for i,form in pairs(forms) do -- 5,767/332,526"
                if ldata[form[1]].Value < 5767 then
                    local useform = form[1] -- Name of the form you SHOULD use
                    if form[1] == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                    else
                        
                        game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(form[1])
                        CanAttack = false
                        killtarget = nil
                        while lplr.Status.Transformation.Value ~= useform do
                            game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(form[1])
                            pcall(function()
                                game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                            end)
                            task.wait(.01)
                        end
                        while FindChar().HumanoidRootPart.Anchored == true do wait() end
                        CanAttack = true
                    end
                    return
                end
            end
            local useform = "Godly SSJ2" -- goodly
            if ldata[useform].Value < 332526 then
                if useform == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                else
                    CanAttack = false
                    killtarget = nil
                    
                    while lplr.Status.Transformation.Value ~= useform do
                        game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(useform)
                        pcall(function()
                            game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                        end)
                        task.wait(0.01)
                    end
                    while FindChar().HumanoidRootPart.Anchored == true do wait() end
                    CanAttack = true
                end
                return
            end
            useform = "Beast"
            if ldata[useform].Value < 332526 then
                if useform == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                else
                    game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(useform)
                    CanAttack = false
                    killtarget = nil
                    
                    while lplr.Status.Transformation.Value ~= useform do
                        pcall(function()
                            game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                        end)
                        task.wait(.01)
                    end
                    while FindChar().HumanoidRootPart.Anchored == true do wait() end
                    CanAttack = true
                end
                return
            end -- 332526
            for i,form in pairs(forms) do -- 5,767/332,526"
                if ldata[form[1]].Value < 332526 then
                    local useform = form[1] -- Name of the form you SHOULD use
                    if form[1] == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                    else
                        
                        game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(form[1])
                        CanAttack = false
                        killtarget = nil
                        while lplr.Status.Transformation.Value ~= useform do
                            pcall(function()
                                game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                            end)
                            task.wait(0.01)
                        end
                        while FindChar().HumanoidRootPart.Anchored == true do wait() end
                        CanAttack = true
                    end
                    return
                end
            end
        end
    end
end


local questbosses = game.Workspace.Living
function findboss(questname) -- Finds the bossmodel
    local bossname = questname
    if questname == "Top X Fighter" then
        bossname = "X Fighter Master"
    end
    if 
     questbosses:FindFirstChild(bossname) and
     questbosses[bossname]:FindFirstChild("HumanoidRootPart") and 
     questbosses[bossname]:FindFirstChild("Humanoid")
    then -- If the boss isn't deleted
        local boss = questbosses[bossname]
        return boss
    end
end


Stacking = false
task.spawn(function() -- Auto Charge
   
    while ScGui do
        if Farming then
            pcall(function()
                local Ki = lplr.Character.Stats.Ki
                while _G.Key == r and ScGui and (not Stacking) and ((not Boss) or Ki.Value < 40 or Ki.Value < Ki.MaxValue/10) and lplr.Character.Humanoid.Health > 0 do
                    CanAttack = nil -- Only = nil if charging
                    game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer("Blacknwhite27")
                end
                if CanAttack == nil then
                    CanAttack = true
                end
            end)
        end
        wait()
    end
end)


task.spawn(function() -- Rebirth, teleport earth/bills
    while ScGui do
        if Farming then
            if _G.StatGrinding ~= true and (getloweststat() >= ((ldata.Rebirth.Value*3e6) + 2e6)) and (getloweststat() < (((ldata.Rebirth.Value*3e6) + 2e6)*2)) and ldata.Rebirth.Value < checkplr()[2] then
                --spawn(function()                
                game:GetService("ReplicatedStorage").Package.Events.reb:InvokeServer()
            end
            if getloweststat() >= 150e6 and ldata.Zeni.Value >= 15000 and planet == "Earth" then                          
    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Vills Planet")
                wait(5)
            end
            -- If just rebirthed and in Beerus go to Earth
            if getloweststat() < 50e6 and planet == "Bills" then               
    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
                wait(5)
            end
        end
        task.wait()
    end
end)

game.Workspace.FallenPartsDestroyHeight = 0/0
local part = Instance.new("Part")
part.Parent = Workspace
part.Position = Vector3.new(0,20000,0)
part.Anchored = true
part.Transparency = .9



while not lplr:FindFirstChild("Status") do task.wait() print("Waiting for status") end -- staack
if planet == "Bills" and lplr.Status.Transformation.Value == "None" and getloweststat() < getrebprice()*1.2 then
    Stacking = true
    print("wait to stack")
    repeat wait() until lplr.Character and lplr.Character:FindFirstChild("Humanoid") and lplr.Character.Humanoid.Health > 0
    
    print("stacking now")
    local form = lplr:WaitForChild("Status"):WaitForChild("Transformation").Value
    --[[if form ~= "None" then
        game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form)
        game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
        -- unform
    end]]
    lplr.Character.Humanoid:ChangeState(15) -- DIE.
    task.wait()
    
    lplr.CharacterAdded:Connect(function(chr)
        if not ScGui then return end
        chr:WaitForChild("Humanoid").Died:Connect(function()
            if not ScGui then return end
            Stacking = true
            task.wait(4.5)
            game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Godly SSJ2")
            spawn(function()
                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
            end)
            wait(1)
            transform()
            Stacking = false
        end)
    end)
    task.wait(5)
    
    game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Godly SSJ2")
    game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
    transform()
    Stacking = false
end

local mobs = {"X Fighter","Evil Saya"}
canvolley = true
task.spawn(function() -- Move/Attack
    while ScGui do
        if Farming then
            if _G.Key ~= r then
                return
            end
            task.spawn(function() 
            	pcall(function()
	                lplr.Character.Humanoid:ChangeState(11)
	                lplr.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
	                if (not Boss) and #game.Players:GetChildren() > 1  then 
	                    pcall(function()
	                        lplr.Character.HumanidoRootPart.CFrame = part.CFrame
	                    end)
	                end
	                pcall(function()
	                    lplr.Character.HumanoidRootPart.CFrame = CFrame.new(Boss.HumanoidRootPart.CFrame * CFrame.new(0,0,4).p, Boss.HumanoidRootPart.Position)
	                end)
	                if Boss then
	                    task.spawn(function()
	                        for i,blast in pairs(FindChar().Effects:GetChildren()) do
	                            if blast.Name == "Blast" then
	                                blast.CFrame = Boss.HumanoidRootPart.CFrame
	                            end
	                        end
	                    end)
	                end
	                if Boss and lplr.Character.Humanoid.Health > 0 and Boss.Humanoid.Health > 0 then
	                    if CanAttack and not Stacking and isLoop3Active then
	                        CanAttack = false
	                        task.spawn(function()
	                            task.wait(.01) -- Wait for the char to tp back in
                                if getloweststat() >= 40000 and ldata.Quest.Value ~= "" and not lplr.Status:FindFirstChild("Invincible") then
                                    
                                    local thrp = Boss:WaitForChild("HumanoidRootPart",1)
                                    local stats = getloweststat()
                                    local moves = {}
                                    local attacked = false
                                    if stats >= 5000 then
                                        table.insert(moves, "Wolf Fang Fist")
                                    end
                                    if stats >= 40000 then
                                        table.insert(moves, "Meteor Crash")
                                    end
                                    if stats >= 100000 and not table.find({"Evil Saya","X Fighter"},Boss.Name)then
                                        table.insert(moves, "High Power Rush")
                                    end
                                    if stats >= 125000 then
                                        table.insert(moves, "Mach Kick")
                                    end
                                    if stats >= 60e6 then
                                        if ldata.Allignment.Value == "Good" then
                                            table.insert(moves, "Spirit Barrage")
                                        else
                                            table.insert(moves, "God Slicer")
                                        end
                                    end
                                    for i,move in pairs(moves) do
                                        if not lplr.Status:FindFirstChild(move) then
                                            spawn(function()
                                                game:GetService("ReplicatedStorage").Package.Events.mel:InvokeServer(move,"Blacknwhite27")
                                                
                                            end)
                                            attacked = true
                                        end
                                    end
                                    local args = {
                                        [1] = "Energy Volley",
                                        [2] = {
                                            ["MouseHit"] = CFrame.new(6905.29883, 4005.75342, -6207.93164, 0,0,0, -7.45058149e-09, 0.984732807, -0.174073309, 0.772913337, 0.110451572, 0.624824405),
                                            ["FaceMouse"] = true
                                        },
                                        [3] = "Blacknwhite27"
                                    }
                                    if getloweststat() > 10000 and canvolley then
                                        canvolley = false
                                        game.ReplicatedStorage.Package.Events.voleys:InvokeServer(unpack(args))
                                        
                                        attacked = true
                                        spawn(function()
                                            wait(5)
                                            canvolley = true
                                        end)
                                    end
                                    if not attacked then
                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",1)
                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",2)
                                    end
                                else
                                    game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",1)
                                    game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",2)
                                end
                                CanAttack = true
	                        end)
	                    end
                    elseif table.find(mobs,Boss.Name) then
                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",1)
                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",2)
                        
	               	end
                end)
            end)
        end
        task.wait()
    end
end)

task.spawn(function() -- Pick quest
    while ScGui and getloweststat() < checkplr()[3] do
        if Farming and isLoop1Active then
            transform()
            --while not CanAttack do wait() end
            if ldata.Quest.Value == "" or not Boss then
                for i,boss in pairs(bosses) do
                    if ldata.Rebirth.Value >= 2000 and boss[1] == "Mapa" then
                        boss[2] = 0
                    end
                    if getloweststat()/2 >= boss[2] and game.Workspace.Living:FindFirstChild(boss[1]) and game.Workspace.Living[boss[1]]:FindFirstChild("Humanoid") and game.Workspace.Living[boss[1]].Humanoid.Health > 0 then
                        if ldata.Quest.Value ~= boss[1] then
                            pcall(function()
                                game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(questNPCs[boss[1]])
                                
                            end)
                        end
                        if ldata.Quest.Value == boss[1] then
                            Boss = game.Workspace.Living[boss[1]]
                            if CanAttack ~= false then -- Sets if it's not nil                            
                                CanAttack = true
                            end
                        else
                            task.wait(.01)
                            Boss = nil
                        end
                        task.wait(.01)
                        break 
                    end
                end
            elseif game.Workspace.Living:FindFirstChild(ldata.Quest.Value)  then
                Boss = game.Workspace.Living[ldata.Quest.Value]
            else ldata.Quest.Value = ""
                wait(.01)
            end
        end
        task.wait()
    end
end)  

        wait()
    end
end

local function loop2()
    while true do
        if isLoop2Active then        
       

        end
        wait()
    end
end

local function loop3()
    while true do
        if isLoop3Active then
        
        end
        wait()
    end
end

local function loop4()
local function formatNumber(number)
    local suffixes = {"", "K", "M", "B", "T", "QD"}
    local suffix_index = 1

    while math.abs(number) >= 1000 and suffix_index < #suffixes do
        number = number / 1000.0
        suffix_index = suffix_index + 1
    end

    return string.format("%.2f%s", number, suffixes[suffix_index])
end

local function updateNumbers()
    local player = game.Players.LocalPlayer
    local rebirthFrame = player.PlayerGui.Main.MainFrame.Frames.Rebirth
    local statsFrame = player.PlayerGui.Main.MainFrame.Frames.Stats
    local strengthLabel = statsFrame:FindFirstChild("Strength")

    local strengthValue
    if strengthLabel and strengthLabel:IsA("TextLabel") then
        local strengthText = strengthLabel.Text:match("%d+")
        strengthValue = tonumber(strengthText)
    end

    local menuGui = game.CoreGui.MenuGui

    -- Limpiar todos los clones existentes antes de actualizar
    for _, child in ipairs(menuGui.Background:GetChildren()) do
        child:Destroy()
    end

    local yOffset = -50
    local xOffset = 50

    for _, child in ipairs(rebirthFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            local text = child.Text:match("%d+")
            if text then
                local number = tonumber(text)
                if number and strengthValue then
                    local formattedNumber = formatNumber(number)
                    local formattedStrength = formatNumber(strengthValue)
                    local combinedText = formattedNumber .. "/" .. formattedStrength
                    local clonedLabel = Instance.new("TextButton", menuGui.Background)
                   clonedLabel.Name = "Cloned" .. child.Name
                    clonedLabel.Text = combinedText
                   clonedLabel.Font = child.Font
                   clonedLabel.TextSize = 30
                   clonedLabel.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Color del texto
                   clonedLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Color de fondo
                   clonedLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 255)  -- Color del contorno del texto
                   clonedLabel.TextStrokeTransparency = 0.000  -- Transparencia del contorno del texto
                   clonedLabel.BackgroundTransparency = 1
                   clonedLabel.Position = UDim2.new(0, xOffset, 0, yOffset)
                   clonedLabel.Size = UDim2.new(0, 200, 0, 30)
                   yOffset = yOffset + 40
                    
                end
            end
        end
    end
end

local function onCharacterAdded(character)
    -- Conectar eventos de cambio relevantes para actualizar dinÃ¡micamente
    character:WaitForChild("Humanoid").Died:Connect(function()
        updateNumbers()  -- Actualizar nÃºmeros cuando el jugador muere
    end)

    -- Ejemplo de escucha de cambio en una propiedad especÃ­fica
    local statsFrame = character:WaitForChild("PlayerGui"):WaitForChild("Main"):WaitForChild("MainFrame"):WaitForChild("Frames"):WaitForChild("Stats")
    local strengthLabel = statsFrame:FindFirstChild("Strength")
    if strengthLabel then
        strengthLabel:GetPropertyChangedSignal("Text"):Connect(function()
            updateNumbers()  -- Actualizar nÃºmeros cuando cambia la fuerza
        end)
    end
end

local function initialize()
    local player = game.Players.LocalPlayer
    local menuGui = Instance.new("ScreenGui")
    menuGui.Name = "MenuGui"

    local backgroundFrame = Instance.new("Frame")
    backgroundFrame.Name = "Background"
    backgroundFrame.Size = UDim2.new(0, 220, 0, 0)
    backgroundFrame.Position = UDim2.new(0, 30, 0, 20)
    backgroundFrame.BackgroundTransparency = 0.5
    backgroundFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    backgroundFrame.BorderSizePixel = 0
    backgroundFrame.Parent = menuGui

    menuGui.Parent = game.CoreGui

    -- Escuchar eventos de cambio de personaje
    player.CharacterAdded:Connect(function(character)
        onCharacterAdded(character)
        updateNumbers()  -- Llamar a updateNumbers inicialmente para configurar la interfaz por primera vez
    end)

    player.CharacterRemoving:Connect(function()
        updateNumbers()  -- Limpiar la interfaz al remover el personaje
    end)

    -- Llamar a updateNumbers regularmente para mantener actualizada la interfaz
    game:GetService("RunService").Heartbeat:Connect(function()
        updateNumbers()
    end)
end

initialize()
        wait() 
end

local function loop5()
    while true do
        if isLoop5Active then
function rebirth()
	game:GetService("ReplicatedStorage"):WaitForChild("Package"):WaitForChild("Events"):WaitForChild("reb"):InvokeServer()
end
rebirth() 
        end
    wait()
    end
end

local function loop6()
        if isLoop6Active then
            pcall(function()game.ReplicatedStorage.BossMaps.Parent = game.Workspace.Others end)
local bm = game.Workspace.Others:WaitForChild("BossMaps")-- or game.ReplicatedStorage:FindFirstChild("BossMaps")
bm.Parent = game.ReplicatedStorage
else
pcall(function()
    local bm = game.ReplicatedStorage:FindFirstChild("BossMaps")
    if bm then
        bm.Parent = game.Workspace.Others
        print("BossMaps restaurado a Workspace.Others.")
    else
        warn("No se encontró BossMaps en ReplicatedStorage.")
    end
end)
       
        wait()  
    end
end


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local events = ReplicatedStorage.Package.Events
local player = game.Players.LocalPlayer

local function performAttacks(target)
    local attackNames = {
        "High Power Rush",
        "Mach Kick",
        "Wolf Fang Fist",
        "Super Dragon Fist",
        "Spirit Barrage",
        "God Slicer",
        "Flash Kick",
        "Spirit Breaking Cannon",
        "Meteor Strike",
        "Vanish Strike",
        "Bone Charge",
        "Uppercut",
        "Sledgehammer",
        "Vital Strike"
    }

    -- Crear un hilo separado para ejecutar ataques rápidamente
    spawn(function()
        for _, attackName in ipairs(attackNames) do
            pcall(function()
                events.mel:InvokeServer(attackName, target)
            end)
            task.wait(.1) -- Ajusta el tiempo de espera para la rapidez deseada entre ataques
        end

        -- Ejecución del evento adicional
        pcall(function()
        events.cha:InvokeServer(target)
            events.cha:InvokeServer(target)
        end)
    end)
end

local function loop7()
    while true do
        if isLoop7Active then
            spawn(function()
                local success, err = pcall(function()
                    -- Obtener el valor de la misión
                    local questValue = ReplicatedStorage:WaitForChild("Datas"):WaitForChild(player.UserId):WaitForChild("Quest").Value
                    
                    -- Verificar si el jugador está en una misión
                    if questValue == "" then
                        
                        
                        return
                    end

                    -- Realizar ataques
                    local target = "Blacknwhite27"
                    performAttacks(target)

                    -- Bloquear al jugador
                    local args = { [1] = true }
                    ReplicatedStorage.Package.Events.block:InvokeServer(unpack(args))
                    player.Status.Blocking.Value = true

                    -- Enviar un ataque final
                    pcall(function()
                    events.cha:InvokeServer(target)
                    events.p:FireServer(target, 1)
                    events.cha:InvokeServer(target)
                    events.p:FireServer(target, 1)
                    events.cha:InvokeServer(target)
                        events.p:FireServer(target, 1)
                        events.voleys:InvokeServer("Energy Volley", { FaceMouse = false, MouseHit = CFrame.new() }, target)
                    end)
                end)

                -- Manejo de errores
                if not success then
                    
                end
            end)
        end
        task.wait(.2) -- Aumentar la espera entre iteraciones principales para reducir la frecuencia de ejecución
    end
end

-- Bucle para manejo de muerte y otros eventos
spawn(function()
    while true do
        pcall(function()
            spawn(function()
                repeat
                    local success1, err1 = pcall(function()
                        task.wait(.2) -- Aumentar la espera para verificar menos frecuentemente
                        deadcheck(false)
                    end)
                until not success1 or err1

                -- Manejo de errores
                if not success1 then
                   
                end

                task.wait(.2) -- Aumentar la espera entre iteraciones para reducir la carga
            end)
        end)
        task.wait(.2) -- Aumentar la espera entre iteraciones principales para reducir la frecuencia de ejecución
    end
end)

-- Bucle para manejo de spam
spawn(function()
    while true do
        local spam = 0
        repeat
            local success, err = pcall(function()
                spam = spam + 1
                task.wait(.1) -- Aumentar la espera entre iteraciones para reducir la frecuencia del spam
            end)
        until spam == 13 or not success

        -- Manejo de errores
        if not success then
           
        end

        task.wait(.1) -- Aumentar la espera entre iteraciones principales para reducir la frecuencia de ejecución
    end
end)



switchButton1.MouseButton1Click:Connect(function()
    isLoop1Active = not isLoop1Active
    toggleSwitch(isLoop1Active, switchBall1)
    SaveSwitchState(isLoop1Active, "Switch1")
end)

switchButton2.MouseButton1Click:Connect(function()
    isLoop2Active = not isLoop2Active
    toggleSwitch(isLoop2Active, switchBall2)
    SaveSwitchState(isLoop2Active, "Switch2")
end)

switchButton3.MouseButton1Click:Connect(function()
    isLoop3Active = not isLoop3Active
    toggleSwitch(isLoop3Active, switchBall3)
    SaveSwitchState(isLoop3Active, "Switch3")
end)

switchButton4.MouseButton1Click:Connect(function()
    isLoop4Active = not isLoop4Active
    toggleSwitch(isLoop4Active, switchBall4)
    SaveSwitchState(isLoop4Active, "Switch4")
end)

switchButton5.MouseButton1Click:Connect(function()
    isLoop5Active = not isLoop5Active
    toggleSwitch(isLoop5Active, switchBall5)
    SaveSwitchState(isLoop5Active, "Switch5")
end)

switchButton6.MouseButton1Click:Connect(function()
    isLoop6Active = not isLoop6Active
    toggleSwitch(isLoop6Active, switchBall6)
    SaveSwitchState(isLoop6Active, "Switch6")
end)

switchButton7.MouseButton1Click:Connect(function()
    isLoop7Active = not isLoop7Active
    toggleSwitch(isLoop7Active, switchBall7)
    SaveSwitchState(isLoop7Active, "Switch7")
end)

toggleSwitch(isLoop1Active, switchBall1)
toggleSwitch(isLoop2Active, switchBall2)
toggleSwitch(isLoop3Active, switchBall3)
toggleSwitch(isLoop4Active, switchBall4)
toggleSwitch(isLoop5Active, switchBall5)
toggleSwitch(isLoop6Active, switchBall6)
toggleSwitch(isLoop7Active, switchBall7)

coroutine.wrap(loop1)()
coroutine.wrap(loop2)()
coroutine.wrap(loop3)()
coroutine.wrap(loop4)()
coroutine.wrap(loop5)()
coroutine.wrap(loop6)()
coroutine.wrap(loop7)()
end

initSwitches(MenuPanel)
            MainButton.MouseButton1Click:Connect(togglePanel)
earthButton.MouseButton1Click:Connect(function()
  game.ReplicatedStorage.Package.Events.TP:InvokeServer("Vills Planet")
end)

billsButton.MouseButton1Click:Connect(function()
game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
end)

farmButton.MouseButton1Click:Connect(onFarmButtonClick)
formsButton.MouseButton1Click:Connect(onFormsButtonClick)


local function Cal()
-- Variables para el cálculo de FPS
local frameCount = 0
local lastUpdate = tick()
-- Función para actualizar 
local function updateFPS()
    frameCount = frameCount + 1
    local currentTime = tick()
    if currentTime - lastUpdate >= 1 then
        local fps = frameCount / (currentTime - lastUpdate)
        fpsTextLabel.Text = "FPS: " .. math.floor(fps)
        frameCount = 0
        lastUpdate = currentTime
    end
end


    while true do
    updatePing()
    updateFPS()
    task.wait() 
end
end

Cal()
showPlayerThumbnail()
        
        
         
