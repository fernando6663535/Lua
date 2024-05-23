

local player = game.Players.LocalPlayer
local Players = game:GetService("Players")
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local missionTextLabel = Instance.new("TextLabel")
local farmLabel = Instance.new("TextLabel")
local formsLabel = Instance.new("TextLabel")
local meleeLabel = Instance.new("TextLabel")
local tpLabel = Instance.new("TextLabel")
local Stats = Instance.new("TextLabel")
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
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Panel = Instance.new("ImageLabel")
local sound = Instance.new("Sound", game.Workspace)
local panelExpanded = false
local imageLabel = Instance.new("ImageLabel")
local billsImageLabel = Instance.new("ImageLabel")
local earthImageLabel = Instance.new("ImageLabel")
local userId = player.UserId
local thumbnailType = Enum.ThumbnailType.HeadShot
local thumbnailSize = Enum.ThumbnailSize.Size48x48
local thumbnailUrl = Players:GetUserThumbnailAsync(userId, thumbnailType, thumbnailSize)
local UICorner = Instance.new("UICorner")
local Notify = loadstring(game:HttpGet('https://raw.githubusercontent.com/fernando6663535/Lua/main/NotificationLibrary.lua'))()


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
TextLabel.Text = "Creado×Pvtin                                                      "
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
farmButton.Text = "Farm"
farmButton.Font = Enum.Font.SourceSans
farmButton.TextSize = 18
farmButton.TextColor3 = Color3.fromRGB(0, 0, 0)
farmButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
farmButton.TextStrokeTransparency = 0
farmButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
farmButton.BorderSizePixel = 1
farmButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
farmButton.TextScaled = true

formsButton.Parent = MenuPanel
formsButton.Size = UDim2.new(1/3, -10, 0, 30)
formsButton.Position = UDim2.new(1/3, 5, 0, 5)
formsButton.Text = "Forms"
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

Stats.Parent = MenuPanel
Stats.BackgroundTransparency = 1
Stats.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Stats.BorderSizePixel = 0
Stats.Position = UDim2.new(0.01, 5, 0.3,24)
Stats.Size = UDim2.new(0, 89, 0, 60)
Stats.Font = Enum.Font.SourceSans
Stats.Text = "Stats"
Stats.TextColor3 = Color3.fromRGB(0, 0, 0)
Stats.TextScaled = true
Stats.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Stats.TextStrokeTransparency = 0

UICorner.CornerRadius = UDim.new(0, 13) 
UICorner.Parent = MainButton
MainButton.Parent = ScreenGui
MainButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainButton.BorderSizePixel = 0
MainButton.Position = UDim2.new(0.1, 39, 0, -32)
MainButton.Size = UDim2.new(0, 70, 0, 30)
MainButton.Font = Enum.Font.SourceSans
MainButton.Text = "Creador"
MainButton.TextColor3 = Color3.fromRGB(0, 0, 255)
MainButton.TextSize = 18

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
missionTextLabel.TextSize = 17 -- Tamaño de letra pequeño
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




local TweenService = game:GetService("TweenService")
local colorArray = {
    Color3.fromRGB(255, 255, 0),   
    Color3.fromRGB(255, 0, 0),     
    Color3.fromRGB(139, 69, 19), 
    Color3.fromRGB(255, 165, 0)
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
        wait(1.7)
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
    missionTextLabel.Text = "Misión actual: " .. currentMission
end

updateMissionName()
ReplicatedStorage.Datas[Players.LocalPlayer.UserId].Quest:GetPropertyChangedSignal("Value"):Connect(updateMissionName)


--funcion de id del avatar
local function togglePanel()
    panelExpanded = not panelExpanded
    local targetSize = panelExpanded and UDim2.new(0, 150, 0, 100) or UDim2.new(0, 100, 0, 0)
    local targetPosition = panelExpanded and UDim2.new(0.1, 0, 0, -6) or UDim2.new(0.1, 39, 0, -32)
    local targetText = panelExpanded and "Creador" or "Creador"
    
    local playerId = 4527490574
    local thumbnailType = Enum.ThumbnailType.AvatarThumbnail
    local thumbnailSize = Enum.ThumbnailSize.Size420x420
    local thumbnailUrl = Players:GetUserThumbnailAsync(playerId, thumbnailType, thumbnailSize)
    
    Panel.Image = thumbnailUrl
    
    local panelTween = TweenService:Create(Panel, TweenInfo.new(0.2), {Size = targetSize, Position = targetPosition})
    panelTween:Play()
    MainButton.Text = targetText
end

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

local function loop1()
    while true do
        if isLoop1Active then
              		 local yo = game:GetService('Players').LocalPlayer
local folderData = game.ReplicatedStorage.Datas[yo.UserId]
local afk = game:service'VirtualUser'
local statsRequeridosFarm = 10000
local events = game.ReplicatedStorage.Package.Events
local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill 
local cargaAndBloqueo = true
local activadaSpeed = false
local statsPlayerFarmSa



local multiQuest = {
	bossEarth = {
		{nombre= "SSJG Kakata",minimo = 100500000},
		{nombre= "Broccoli",minimo = 48500000},
		{nombre= "SSJB Wukong",minimo = 8000000},
		{nombre= "Kai-fist Master",minimo = 6025000},
		{nombre= "SSJ2 Wukong",minimo = 1250000},
		{nombre= "Perfect Atom",minimo = 975000},
		{nombre= "Chilly",minimo = 550000},
		{nombre= "Super Vegetable",minimo = 299500},
		{nombre= "Mapa",minimo = 80000},
		{nombre= "Radish",minimo = 39000},
		{nombre= "Kid Nohag",minimo = 30000},
		{nombre= "Klirin",minimo = 10000},
	},
	bossBills = {
		{nombre= "Vekuta (SSJBUI)",minimo = 5000000000},
		{nombre= "Wukong Rose",minimo = 4500000000},
		{nombre= "Vekuta (LBSSJ4)",minimo = 3700000000},
		{nombre= "Wukong (LBSSJ4)",minimo = 3000000000},
		{nombre= "Vegetable (LBSSJ4)",minimo = 1400000000},
		{nombre= "Vis (20%)",minimo = 900000000},
		{nombre= "Vills (50%)",minimo = 600000000},
		{nombre= "Wukong (Omen)",minimo = 170000000},
		{nombre= "Vegetable (GoD in-training)",minimo = 170000000},
	}
}




local function rebirthzzzz()
	return folderData.Rebirth.Value
end
local function strength()
	return folderData.Strength.Value
end
local function energy()
	return folderData.Energy.Value
end
local function defense()
	return folderData.Defense.Value
end
local function speed()
	return folderData.Speed.Value
end

function characterInvisible()
	return yo.Character
end

function player()
	return yo.Character and yo.Character.Humanoid and yo.Character.Humanoid.Health > 0 and yo.Character:FindFirstChild("HumanoidRootPart")
end

function misionSeleccionada()
	return game:GetService("ReplicatedStorage").Datas[yo.UserId].Quest.Value
end

local function sigueEnemigo(enemigo)
	yo.Character.HumanoidRootPart.CFrame = enemigo	
end

local function kiRequerido()
	return game:GetService("Players").LocalPlayer.Character.Stats.Ki.MaxValue / 10
end
local function kiTotal()
	return game:GetService("Players").LocalPlayer.Character.Stats.Ki.MaxValue / 2
end
local function ki()
	return game.Workspace.Living[yo.Name].Stats.Ki.Value
end

function rebirth()
	game:GetService("ReplicatedStorage"):WaitForChild("Package"):WaitForChild("Events"):WaitForChild("reb"):InvokeServer()
end

                      local function Fly8()
local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
char.Humanoid.PlatformStand = true
local torso = char:WaitForChild("LowerTorso")
Instance.new("BodyGyro", torso).MaxTorque = Vector3.new(9e9, 9e9, 9e9)
Instance.new("BodyVelocity", torso).MaxForce = Vector3.new(9e9, 9e9, 9e9)
end

function iniciarJuego()
	local player = game.Players.LocalPlayer
	local data = game.ReplicatedStorage.Datas[player.UserId]
	game:GetService("ReplicatedStorage").Package.Events.Start:InvokeServer()
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
	if data.Strength.Value>=8000000 then
		wait(5)
		game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Godly SSJ2")
		game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
	else
		wait(4.95)
		game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Mystic")
		game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
	end
	task.wait()
end



function noTierraID()
	return game.placeId ~= 3311165597
end

local function valorMinimo()
	local valueMinimo = strength()

	if energy() < valueMinimo then
		valueMinimo = energy()
	end
	if defense() < valueMinimo then
		valueMinimo = defense()
	end
	if speed() < valueMinimo then
		valueMinimo = speed()
	end

	return valueMinimo
end


local function Melees()
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("High Power Rush", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Mach Kick", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("High Power Rush", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Mach Kick", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Super Dragon Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Spirit Barrage", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")
                              wait(0.1)
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("God Slicer", "Blacknwhite27")                           
                            wait(0.1)
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                            wait(0.1)
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("High Power Rush", "Blacknwhite27")
                            
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Super Dragon Fist", "Blacknwhite27")
                             
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Spirit Barrage", "Blacknwhite27")
                             
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("God Slicer", "Blacknwhite27")
                           wait(0.1)
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("High Power Rush", "Blacknwhite27")
                            end

function iteradorQuest(array)
	print('Seccion iterador quest')
	local enemigo
	for _,jefe in pairs(multiQuest[array]) do 
		if valorMinimo() > jefe.minimo and player() then
			print('El elegigo')
			for indice, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do 
				print('enemigo '..v.Name)
				if jefe.nombre == v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and yo and v.Humanoid.Health > 0 then
					print('Mision seleccionada y retornando enemigo')
					return v.Name 
				end
			end
		end
	end
end

function earth()
	pcall(function()
		local A_1 = "Earth"
		local Event = game:GetService("ReplicatedStorage").Package.Events.TP
		Event:InvokeServer(A_1)
	end)
end
function mundoBills()
	game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Vills Planet")
end

function validacionPlanetas()
	local billsTP = 300000000

	print('Validando el planeta')

	if noTierraID() then 
			   while isLoop1Active and  valorMinimo() < billsTP and noTierraID() do 
			print('Ir a la tierra')
			earth()
			wait()
		end
	else 
		if valorMinimo() >= billsTP  then 
			pcall(function()
				print('Llendo a bills')
				mundoBills()
			end)
		end
	end
end

local function masFuerza()
    local requiredStrength = statsRequeridosFarm
    for _, attack in ipairs(arregloAtaques) do
        if strength() < attack.requerido then
            requiredStrength = attack.requerido
            break
        end
    end

    if strength() < requiredStrength then
        local args = {[1] = "Blacknwhite27",[2] = 1}
        game:GetService("ReplicatedStorage").Package.Events.p:FireServer(unpack(args))
        print('Ejecutando golpeo')
    else
        print('Tienes suficiente fuerza!')
    end
end



local function masEnergy()
	if energy() < statsRequeridosFarm then
		local args = {[1] = 1,[2] = true,[3] = CFrame.new(12, 12, 12)}
		game:GetService("ReplicatedStorage").Package.Events.kb:FireServer(unpack(args))
		print('Ejecutando energy!')
	else
		print('Suficiente energy!')
	end
end
local function masDefensa()
	if defense() < statsRequeridosFarm then
		local args = {[1] = "Blacknwhite27"}
		game:GetService("ReplicatedStorage").Package.Events.def:InvokeServer(unpack(args))
		print('Ejecutando energy!')
	else
		print('Suficiente energy!')
	end
end
local function Zom() 
for i = 1, 26 do
    keypress(Enum.KeyCode.O)
end
end
local function masSpeed() 
	keypress(Enum.KeyCode.LeftShift)
	print('Ejecutando Speed!')
end
local function cancelarSpeed() 
	keyrelease(Enum.KeyCode.LeftShift)
	print('Cancelando Speed!')
end
local function masCarga() 
	keypress(Enum.KeyCode.C)
	print('Carga!')
end
local function cancelarCarga() 
	keyrelease(Enum.KeyCode.C)
	print('Cancelando Carga!')
end

local function fly()
	local succes,fallo = pcall(function ()
	wait()
			Zom() 
		keypress(Enum.KeyCode.Space)
		task.wait()
		keyrelease(Enum.KeyCode.Space)
		task.wait()
		keypress(Enum.KeyCode.Space)
		task.wait()
		keyrelease(Enum.KeyCode.Space)
		task.wait()
		Zom() 
	end)
	if fallo then
		warn('fly error '..fallo)
	end
end

local function ataquesParaStats()
	print('Atacando...')
	
	if speed() < statsRequeridosFarm and ki() >= kiRequerido() and not activadaSpeed and player() then
		masSpeed() 
		activadaSpeed = true
	end

    if (speed() >= statsRequeridosFarm and activadaSpeed) or (ki() < kiRequerido() and activadaSpeed) or (not player() and activadaSpeed) then
		cancelarSpeed() 
		cancelarSpeed() 
		activadaSpeed = false
	end

	masFuerza()
	task.wait()
	masEnergy()
	task.wait()
	masDefensa()
	task.wait()
end

local function aver(enlace)

end

local function flyi()

end

local function stats()
local player = game.Players.LocalPlayer
local playerName = player.Name

local s = game.Players.LocalPlayer.PlayerGui.Main.MainFrame.Frames.Stats
s.Visible, s.Position = true, UDim2.new(0.408, 0, 0.520, 74)
s.BackgroundColor3 = Color3.new(0, 0, 9)
s.Size = UDim2.new(0.1, 100, 0.1, 100)


for _, child in ipairs(s:GetChildren()) do
    if child:IsA("TextLabel") and child.Name == "Stats" then
        child.Text = playerName
    end
end

local UserInputService = game:GetService("UserInputService")
local dragging
local dragStart
local startPos
s.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = s.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

s.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if dragging then
            local delta = input.Position - dragStart
            s.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end
end)


for _, child in ipairs(s:GetChildren()) do
    if child:IsA("TextLabel") then
        child.TextColor3 = Color3.new(0, 0, 0)
        child.TextStrokeColor3 = Color3.new(0, 1, 0)
        child.TextStrokeTransparency = 0
    elseif child.Name == "Close" and child:IsA("TextButton") then
        child.BackgroundColor3 = Color3.new(0, 1, 0) 
    end
end
end

local function esperandoCargaxd()

	if (speed() >= statsRequeridosFarm and activadaSpeed) or (ki() < kiRequerido() and activadaSpeed) or (not player() and activadaSpeed) then
		cancelarSpeed() 
		cancelarSpeed() 
		activadaSpeed = false
	end

	masCarga() 
	repeat
		wait()
		warn('Esperando mas ki')
	until ki() >= kiTotal() or not player()
	warn('Ki completado o estas muerto!')
	task.wait()
	cancelarCarga()
	cancelarCarga()
end

local function acumularStats()
	repeat
		wait()
		print('Esperando vida....')
	until player() 
	task.wait()

		   while isLoop1Active and  valorMinimo() < statsRequeridosFarm do
		
		cargaAndBloqueo = false

		
		if ki() >= kiRequerido() then
			ataquesParaStats()
		else
			esperandoCargaxd()
		end
	end
	print('Tienes estadisticas suficientes!')
	cargaAndBloqueo = true
end

local function validacionVida()
end

function empezarQuest(array) 
	acumularStats() 
	task.wait()

	validacionPlanetas()

	local enemigo = iteradorQuest(array)

	print('Enemigo seleccionado')

		   while isLoop1Active and  misionSeleccionada() ~= enemigo and player() do
		wait()
		print('Ejecutando quest')
		events.Qaction:InvokeServer(game:GetService("Workspace").Others.NPCs[enemigo])
	end
end

function rival(array)
	local enemigo = iteradorQuest(array)

	for indice, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
		if enemigo == v.Name then
			return v
		end
	end
end

function mision()
	print('Seleccionando mision')
	if noTierraID() then
		print('Estas en bills')
		empezarQuest('bossBills')
	else
		print('Estas en la tierra')
		empezarQuest('bossEarth')
	end
end

function misionRival()
	local buscador

	if noTierraID() then
		buscador = rival('bossBills')
	else
		buscador = rival('bossEarth')
	end

	return buscador
end

function empezarFarm() 
	fly()
		   while isLoop1Active and  true do
		pcall(function()
			if player() then
				rebirth() 

				warn('estadisticas elegidas '..tostring(statsRequeridosFarm))

				mision()

				print('Mision seleccionada')

				local enemigo = misionRival()

				statsPlayerFarmSa = flyi

				local function frameEnemigo()
					return enemigo.HumanoidRootPart.CFrame
				end
				pcall(function ()
					validacionVida()
				end)
				local function vidaEnemigo()
					return enemigo.Humanoid.Health > 0
				end

				   while isLoop1Active and  enemigo:FindFirstChild("Humanoid") and vidaEnemigo() and player() and isLoop4Active do
					pcall(function()
										spawn(function() 
							sigueEnemigo(frameEnemigo() * CFrame.new(0, 0, 4.6)) 
							pcall(function ()
								statsPlayerFarmSa()
													stats()
													Fly8()
							end)
						end)
						spawn(function() 
							if valorMinimo() >= 10000 and isLoop3Active then
								Melees()
							else
								game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
							end
						end)
						spawn(function()
							if valorMinimo() >= 2000 and isLoop3Active then
							Melees()
							end
						end)
					end)
					wait()
				end
				if misionSeleccionada() == '' then
					wait(1)
				end
				if yo.Character.Humanoid.Health <= 0 then
					repeat
						wait()
					until yo.Character.Humanoid.Health > 0
					wait(1)
					fly()
				end
			end
		end)
		wait()
	end
end



yo.Idled:Connect(function() 
	afk:CaptureController()
	afk:ClickButton2(Vector2.new())
end)
iniciarJuego()
task.wait()

spawn(function()
	while isLoop1Active and true do
		if cargaAndBloqueo then
			pcall(function()
				spawn(function()
					local args = {[1] = "Blacknwhite27"}
					game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer(unpack(args))
				end)
				spawn(function()
					local args = {[1] = true}
					game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
				end)
								spawn(function()
		local args = {[1] = "Blacknwhite27",[2] = 1}
		game:GetService("ReplicatedStorage").Package.Events.p:FireServer(unpack(args))
				end)
			end)
		end
		wait()
	end
end)
task.wait()


empezarFarm()
        end
        wait()
    end
end

local function loop2()
    while true do
        if isLoop2Active then
         wait(8)
if (game.PlaceId ~= 5151400895) then
    repeat
        wait()
    until game.Players.LocalPlayer.CharacterAdded and
        game.ReplicatedStorage.Datas:WaitForChild(game.Players.LocalPlayer.UserId)

    wait()
    game.ReplicatedStorage.Package.Events.Start:InvokeServer()
    game.ReplicatedStorage.Package.Events.Start:InvokeServer()
    game.ReplicatedStorage.Package.Events.Start:InvokeServer()
end
_G.rebirthed = false;
local HttpService = game:GetService("HttpService")
local player = game:GetService("Players").LocalPlayer
repeat
    wait()
until player.CharacterAdded
local userId = player.UserId

local character = player.Character
local stats = character:WaitForChild("Stats")
local playerHumanoid = character:WaitForChild("Humanoid")

local RunService = game:GetService('RunService')
local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill

local Forms = {'Beast','Ultra Ego','SSJB4','True God of Creation','True God of Destruction','Super Broly', 
                'LSSJG','LSSJ4','SSJG4','LSSJ3','Mystic Kaioken','LSSJ Kaioken','SSJR3','SSJB3','God Of Destruction','God Of Creation',
                'Jiren Ultra Instinct', 'Mastered Ultra Instinct','Godly SSJ2', 'Ultra Instinct Omen', 'Evil SSJ','Blue Evolution',
                'Dark Rose','Kefla SSJ2','SSJ Berserker','True Rose', 'SSJB Kaioken','SSJ Rose', 'SSJ Blue','Corrupt SSJ',
                'SSJ Rage','SSJG','SSJ4','Mystic','LSSJ','SSJ3','Spirit SSJ','SSJ2 Majin','SSJ2','SSJ Kaioken','SSJ','FSSJ','Kaioken'}




local function transform()
    pcall(function()
        for i, v in pairs(Forms) do
            if equipRemote:InvokeServer(v) then
                break
            end
        end
        repeat
            wait()
            if player.Status.SelectedTransformation.Value ~= player.Status.Transformation.Value then
                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
            end
        until game.Players.LocalPlayer.Status.SelectedTransformation.Value ==
            game.Players.LocalPlayer.Status.Transformation.Value
    end)
end


while isLoop2Active and  true and wait() do
    if (stats.Strength.Value > 5000 and stats.Defense.Value > 5000 and stats.Energy.Value > 5000 and stats.Speed.Value >
        5000) then
        transform()
  game:GetService("ReplicatedStorage").Package.Events.AuraTrigger:InvokeServer()
    end
end
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
    while true do
        if isLoop4Active then
            local player = game.Players.LocalPlayer 
local npcPosition = CFrame.new(0, 0, 4.6) 

function returnQuest(useObjective)
    return game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value
end

repeat
    local questValue = returnQuest(true)
    if questValue ~= "" then
        for _, boss in ipairs(game.Workspace.Living:GetChildren()) do
            if boss.Name == questValue and
               not player.PlayerGui.Main.MainFrame.Frames.Quest.Nop.Visible and
               boss:FindFirstChild('Humanoid') and
               boss:FindFirstChild('HumanoidRootPart') and isLoop4Active then
                player.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * npcPosition
            end
        end
    end
    wait() 
until false 
        end
        wait() 
    end
end

local function loop5()
    while true do
        if isLoop5Active then
                     local function mundoDeBills()
                          game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Vills Planet")
                        end
                        local function statsAltos()
                          local player = game.Players.LocalPlayer
                          local statsFolder = game.Workspace.Living[player.Name].Stats
                          local strength = statsFolder.Strength
                          local speed = statsFolder.Speed
                          local energy = statsFolder.Energy
                          local defense = statsFolder.Defense
                          local statsrequerimiento = game.Workspace.Living[player.Name].Stats.Rebirth.Value
                          local b= statsrequerimiento*0
                          local function s()
                            while strength.Value<b do
                              wait()
                              --PUNCH
           
                              if strength.Value>=b then
                                break
                              end
                            end
                          end
                          spawn (s)
                          local function l()
                            while energy.Value<b do
                              wait()
                              --KIBLAST
            
                              if  energy.Value >=b then
                                break
                              end
                            end
                          end
                          spawn (l)
                          local function m()
                            while defense.Value <b do
                              --DEFENSE
                              wait()
       
                              if defense.Value >=b then
                                break
                              end
                            end
                          end
                          spawn (m)
                          local function p()
                            while speed.Value <b do
                              wait()
                              game:GetService("ReplicatedStorage"):WaitForChild("Package"):WaitForChild("Events"):WaitForChild("of"):FireServer()
                              if speed.Value >=b then
                                break
                              end
                            end
                          end
                          spawn (p)
                          while speed.Value <b do
                            wait()
           
                            if speed.Value >=b then
                              break
                            end
                          end
                        end

                        local function statsBajos()
                          local player = game.Players.LocalPlayer
                          local statsFolder = game.Workspace.Living[player.Name].Stats
                          local strength = statsFolder.Strength
                          local speed = statsFolder.Speed
                          local energy = statsFolder.Energy
                          local defense = statsFolder.Defense
                          local function s()
                            while strength.Value<1 do
                              wait()
                              --PUNCH
      
                              if strength.Value>=1 then
                                break
                              end
                            end
                          end
                          spawn (s)
                          local function l()
                            while energy.Value<1 do
                              wait()
                              --KIBLAST
       
                              if  energy.Value >=1 then
                                break
                              end
                            end
                          end
                          spawn (l)
                          local function m()
                            while defense.Value <1 do
                              --DEFENSE
                              wait()
                
                              if defense.Value >=1 then
                                break
                              end
                            end
                          end
                          spawn (m)
                          local function p()
                            while speed.Value <1 do
                              wait()
                              game:GetService("ReplicatedStorage"):WaitForChild("Package"):WaitForChild("Events"):WaitForChild("of"):FireServer()
                              if speed.Value >=1 then
                                break
                              end
                            end
                          end
                          spawn (p)
                          while speed.Value <1 do
                            wait()
                            
                            if speed.Value >=50000 then
                              break
                            end
                          end
                        end

                        firstquest = true
                        autostack = false
                        local plr = game.Players.LocalPlayer
                        local player = game.Players.LocalPlayer
                        local rs = game:GetService("RunService")
                        local data = game.ReplicatedStorage.Datas[player.UserId]
                        local events = game.ReplicatedStorage.Package.Events


                        game:GetService("ReplicatedStorage").Package.Events.Start:InvokeServer()
                        game:GetService("ReplicatedStorage").Package.Events.Start:InvokeServer()
                        if data.Strength.Value>=8000000 then
                          wait()
                          game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("")
                        else
                          wait()
                          game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("")                          
                        end
                        wait()
                        -- ANTIAFK
                        local bb=game:service'VirtualUser'
                        game:service'Players'.LocalPlayer.Idled:connect(function()
                          bb:CaptureController()bb:ClickButton2(Vector2.new())end)

                        --carga y bloqueo infinito
                        _G.charge = true
                        spawn(function()
                          while _G.charge == true  do

                            local args = {
                              [1] = "Blacknwhite27"
                            }
                            game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer(unpack(args))
                            wait ()	
                          end 
                        end)
                        _G.block = true
                        spawn(function ()
                          while _G.block == true  do
                            local args = {
                              [1] = true
                            }

                            game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
                            
                            wait()
                          end 
                        end)

                      local function Fly()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local function toggleFly(enable)
    char.Humanoid.PlatformStand = enable
    local torso = char:WaitForChild("LowerTorso")
    for _, child in ipairs(torso:GetChildren()) do
        if child:IsA("BodyGyro") or child:IsA("BodyVelocity") then
            child:Destroy()
        end
    end
    if enable then
        local bodyGyro = Instance.new("BodyGyro", torso)
        bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        local bodyVelocity = Instance.new("BodyVelocity", torso)
        bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    end
end

local function checkQuest()
    toggleFly(ReplicatedStorage.Datas[player.UserId].Quest.Value ~= "")
end

checkQuest()

local questValue = ReplicatedStorage.Datas[player.UserId].Quest
questValue:GetPropertyChangedSignal("Value"):Connect(checkQuest)

player.CharacterAdded:Connect(function(newChar)
    char = newChar
    char:WaitForChild("Humanoid")
    checkQuest()
end)
end
                        local function kiRequerimiento()
                          energya = game.Workspace.Living[player.Name].Stats.Energy.Value
                          ki = game.Workspace.Living[player.Name].Stats.Ki.Value
                          kiUsuario = energya / 500
                          local function a(number)
                            return math.floor(number + 0.5)
                          end
                          kiOriginal = a(kiUsuario)
                          caca = kiOriginal / 6 + 100
                          warn("Actualizada "..caca.." - "..kiOriginal)
                        end
                        kiRequerimiento()

                        _G.fasesalv=true
                        spawn(function ()
                          while _G.fasesalv do
                            local fases={"J"}
                            local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
                            local player = game.Players.LocalPlayer
                            local skills = game.ReplicatedStorage.Package.Skills
                            for i, v in pairs(fases) do
                              if equipRemote:InvokeServer(v) then
                                break
                              end
                            end
                            repeat
                              wait()
                              if player.Status.SelectedTransformation.Value ~= player.Status.Transformation.Value then
                                kiRequerimiento()
                                if ki >= caca then
                                  warn("Tu ki es de: "..ki.." y el requerimiento es de "..caca)
                                  game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
                                else
                                  warn("No tienes ki")
                                end
                              else
                                warn("Ya tienes la fase")
                              end
                            until game.Players.LocalPlayer.Status.SelectedTransformation.Value == game.Players.LocalPlayer.Status.Transformation.Value
                            wait()
                          end
                        end)

 local function Detruir()
      local function makeObjectsInvisible()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Part") and obj.Name == "Part" then
            obj.Transparency = 1
        elseif obj:IsA("BasePart") and (obj.Name == "Glass" or obj.Name == "ROCKY") and obj.Parent then
            obj.Transparency = 1
        end
    end
end

makeObjectsInvisible()
end
                        -- validacion de stats
                        local  function billsplanet()
                          while isLoop5Active do 
                            local A_1 = "Earth"
                            local Event = game:GetService("ReplicatedStorage").Package.Events.TP
                            Event:InvokeServer(A_1)
                            wait()
                          end
                        end
                      local function revisarStats()
                      -- variables
                      local a = data.Strength.Value
                      local b = data.Energy.Value
                      local c = data.Defense.Value
                      local d = data.Speed.Value
                      local f = data.Rebirth.Value
                      local treinkaK = 30000
                      if a < treinkaK or b < treinkaK or c < treinkaK or d < treinkaK then
                        wait()
                      if f >=300 then
                        statsAltos()
                      wait()
                        if game.placeId ~= 3311165597 then 
                          billsplanet()
                        end
                      else
                        statsBajos()
                      wait()
                        if game.placeId ~= 3311165597 then 
                          billsplanet()
                        end
                      end
                      end
                      end

                        -- Farm Logica
                        local function autoquest(boolean)
                          SelectedMobs = ""
                          local a = data.Strength.Value
                          local b = data.Energy.Value
                          local c = data.Defense.Value
                          local d = data.Speed.Value

                          local minimo = a  -- initialize smallest variable to the first number

                          if b < minimo then
                            minimo = b
                          end

                          if c < minimo then
                            minimo = c
                          end

                          if d < minimo then
                            minimo = d
                          end

                          checkValue = minimo
                          revisarStats()
                 		for indice, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
			revisarStats()-- revisa si tienes stats
				if minimo >= 10000 and minimo < 200000 then
					if v.Humanoid.Health >0 and v.Name == "Klirin" then
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
					end
				elseif minimo >=200000 and minimo < 750000 then
					if v.Humanoid.Health >0 and v.Name == "Mapa" then
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
					end
				elseif minimo >=750000 and minimo < 1150000 then
					if v.Humanoid.Health >0 and v.Name == "Super Vegetable" then
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
								        elseif v.Humanoid.Health >0 and v.Name == "Mapa" then
                                  SelectedQuests = v.name
                                  SelectedMobs = SelectedQuests
                                  return
					end
				elseif minimo >=1150000 and minimo < 4000000 then
					if v.Humanoid.Health >0 and v.Name == "Chilly" then
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
					end
				elseif minimo >=4000000 and minimo < 8000000 then
					if v.Humanoid.Health >0 and v.Name == "Perfect Atom" then
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
						        elseif v.Humanoid.Health >0 and v.Name == "Super Vegetable" then
                                  SelectedQuests = v.name
                                  SelectedMobs = SelectedQuests
                                  return
					end
				elseif minimo >=8000000 and minimo < 50000000 then
					if v.Humanoid.Health >0 and v.Name == "SSJB Wukong" then
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
						        elseif v.Humanoid.Health >0 and v.Name == "Perfect Atom" then
                                  SelectedQuests = v.name
                                  SelectedMobs = SelectedQuests
                                  return
					elseif v.Humanoid.Health >0 and v.Name == "SSJ2 Wukong" then
                                  SelectedQuests = v.name
                                  SelectedMobs = SelectedQuests
                                  return
					end
					
				elseif minimo >=50000000 and minimo < 100000000 then
					if v.Humanoid.Health >0 and v.Name == "Broccoli" then
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
						  elseif v.Humanoid.Health >0 and v.Name == "SSJB Wukong" then
                                  SelectedQuests = v.name
                                  SelectedMobs = SelectedQuests
                                  return
				end
					elseif minimo >=100000000 and minimo < 300000000 then
					if v.Humanoid.Health >0 and v.Name == "SSJG Kakata" then
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
					   elseif v.Humanoid.Health >0 and v.Name == "Broccoli" then
                                  SelectedQuests = v.name
                                  SelectedMobs = SelectedQuests
                                  return
				end
				elseif minimo >=300000000 and minimo < 350000000 then
					if v.Humanoid.Health >0 and v.Name == "Vegetable (GoD in-training)" then
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
					end
			elseif minimo >=350000000 and minimo < 600000000 then
					if v.Humanoid.Health >0 and v.Name == "Wukong (Omen)" then

						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
						  elseif v.Humanoid.Health >0 and v.Name == "Vegetable (GoD in-training)" then
                                  SelectedQuests = v.name
                                  SelectedMobs = SelectedQuests
                                  return
					end
			elseif minimo >=600000000 and minimo < 1000000000 then
					if v.Humanoid.Health >0 and v.Name == "Vills (50%)" then
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
						  elseif v.Humanoid.Health >0 and v.Name == "Vegetable (GoD in-training)" then
                                  SelectedQuests = v.name
                                  SelectedMobs = SelectedQuests
                                  return
					end

                 elseif minimo >= 1000000000 and minimo < 1700000000 then
					if v.Humanoid.Health >0 and v.Name == "Vis (20%)" then

						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
						        elseif v.Humanoid.Health >0 and v.Name == "Vills (50%)" then
                                  SelectedQuests = v.name
                                  SelectedMobs = SelectedQuests
                                  return
					end


         		elseif minimo >=1700000000 and minimo < 3000000000 then
					if v.Humanoid.Health >0 and v.Name == "Vegetable (LBSSJ4)" then
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
						        elseif v.Humanoid.Health >0 and v.Name == "Vis (20%)" then
                                  SelectedQuests = v.name
                                  SelectedMobs = SelectedQuests
                                  return
                             
					end
				elseif minimo >=3000000000 and minimo < 5000000000 then
					if v.Humanoid.Health >0 and v.Name == "Wukong (LBSSJ4)" then
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
						                            elseif v.Humanoid.Health >0 and v.Name == "Vekuta (LBSSJ4)" then
                                  SelectedQuests = v.name
                                  SelectedMobs = SelectedQuests
                                  return
					end
				elseif minimo >=5000000000 then
					if v.Humanoid.Health >0 and v.Name == "Vekuta (SSJBUI)" then					
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
						   elseif v.Humanoid.Health >0 and v.Name== "Wukong Rose" then
                                  SelectedQuests = v.name
                                  SelectedMobs = SelectedQuests
                                  return
					end
				end
		end

                          if checkValue >= 300000000 and game.placeId ~= 5151400895  then
                            for indice, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
                              delay(0.5,mundoDeBills)
                              if v.Humanoid.Health>0 and v.Name == "SSJG Kakata" then
                                SelectedQuests = v.name
                                SelectedMobs = SelectedQuests
                                return
                              elseif v.Humanoid.Health>0 and v.Name == "Broccoli" then
                                SelectedQuests = v.name
                                SelectedMobs = SelectedQuests
                                return
                              elseif v.Humanoid.Health>0 and v.Name == "SSJB Wukong" then
                                SelectedQuests = v.name
                                SelectedMobs = SelectedQuests
                                return
                              end
                            end
                          end
                        end

                        local function ataquesMultiquest()
                          kiRequerimiento()
                          
                             if data.Strength.Value >0 and ki > caca and data.Strength.Value <2000000000000 then
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("High Power Rush", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Mach Kick", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("High Power Rush", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Mach Kick", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Super Dragon Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Spirit Barrage", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")

                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("God Slicer", "Blacknwhite27")
                           
                          elseif data.Strength.Value <= 0 and ki > caca then
                           
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                           
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("High Power Rush", "Blacknwhite27")
                            
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Super Dragon Fist", "Blacknwhite27")
                             
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Spirit Barrage", "Blacknwhite27")
                             
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("God Slicer", "Blacknwhite27")
                           
                          elseif data.Strength.Value <= 0 and ki > caca then
                           
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                           wait(0.1)
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("High Power Rush", "Blacknwhite27")
                          end
                        end

                        getgenv().stacked = false 

                        --Function
                        local function quest()
                          if game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value ~= SelectedQuests then
                            player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Others.NPCs[SelectedQuests].HumanoidRootPart.CFrame
                            repeat
                              wait()
                              revisarStats()-- revisa si tienes stats
                              events.Qaction:InvokeServer(game:GetService("Workspace").Others.NPCs[SelectedQuests])
                            until game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value == SelectedQuests
                          end
                        end

                        spawn(function()
                          while true and wait() do
                            pcall(function()
                              while true and wait() do
                                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  
                                then
                                  for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
                                    revisarStats()-- revisa si tienes stats
                                    autoquest()	--inicia el farm
                                    Fly()
                                             Detruir()
                                    if v.Name:lower() == SelectedMobs:lower() and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and isLoop5Active then
                                      quest()
                                      getgenv().farm = true
                                      repeat
                                        wait()
                        task.spawn(function()
                      plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
                      game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
                      end)
                      task.spawn(function()
                      ataquesMultiquest()
                      task.wait()
                      end)
                                      until getgenv().farm == false or v == nil or v.Humanoid.Health <= 0 or plr.Character.Humanoid.Health <= 0

                                      if plr.Character.Humanoid.Health <= 0 then 
                                        getgenv().farm = false
                                        getgenv().stacked = false
                                        repeat
                                          print("in auto loop died check")
                                          wait(1)

                                        until plr.Character.Humanoid.Health >= 0
                                        wait(1)
                                      end

                                    end
                                  end
                                end
                              end
                            end)
                          end
                        end)

                        state = true

                        repeat wait(1)
                          pcall(function()

                            if getgenv().stacked == false then
                              count = 0
                              repeat 
                                count = 1
                                wait()
                                stack()
                                getgenv().stacked = true
                              until count == 1
                            end
                            wait()
                          end)
                        until sddddddddddddddddd == 1032131313131313
        end
        wait()
    end
end

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

toggleSwitch(isLoop1Active, switchBall1)
toggleSwitch(isLoop2Active, switchBall2)
toggleSwitch(isLoop3Active, switchBall3)
toggleSwitch(isLoop4Active, switchBall4)
toggleSwitch(isLoop5Active, switchBall5)

coroutine.wrap(loop1)()
coroutine.wrap(loop2)()
coroutine.wrap(loop3)()
coroutine.wrap(loop4)()
coroutine.wrap(loop5)()
end

initSwitches(MenuPanel)
            MainButton.MouseButton1Click:Connect(togglePanel)
earthButton.MouseButton1Click:Connect(function()
  game.ReplicatedStorage.Package.Events.TP:InvokeServer("Vills Planet")
end)

billsButton.MouseButton1Click:Connect(function()
game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
end)

showPlayerThumbnail()
        
