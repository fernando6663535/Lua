local MenuPanel = game.CoreGui:FindFirstChild("Fernando")
if MenuPanel then
    return  
end

local player = game.Players.LocalPlayer
local Players = game:GetService("Players")
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local missionTextLabel = Instance.new("TextLabel")
local farmLabel = Instance.new("TextLabel")
local formsLabel = Instance.new("TextLabel")
local meleeLabel = Instance.new("TextLabel")
local tpLabel = Instance.new("TextLabel")
local Reb = Instance.new("TextLabel")
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
local panelExpanded = false
local sound = Instance.new("Sound", game.Workspace)
local imageLabel = Instance.new("ImageLabel")
local billsImageLabel = Instance.new("ImageLabel")
local earthImageLabel = Instance.new("ImageLabel")
local userId = player.UserId
local thumbnailType = Enum.ThumbnailType.HeadShot
local thumbnailSize = Enum.ThumbnailSize.Size48x48
local thumbnailUrl = Players:GetUserThumbnailAsync(userId, thumbnailType, thumbnailSize)
local UICorner = Instance.new("UICorner")



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
local statsRequeridosFarm = 4000
local events = game.ReplicatedStorage.Package.Events
local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill 
local cargaAndBloqueo = true
local activadaSpeed = false
local statsPlayerFarmSa



local millon = 1000000
local arregloAtaques = {

}
local ataquesEnergy = {
	{name = 'Soul Punisher',subName = 'Hak',fuerza = 40000000},
	{name = 'Destruction',subName = 'Hak',fuerza = 40000000},
}

local multiQuest = {
	bossEarth = {
		{nombre= "SSJG Kakata",minimo = 100500000},
		{nombre= "Broccoli",minimo = 52500000},
		{nombre= "SSJB Wukong",minimo = 8000000},
		{nombre= "Kai-fist Master",minimo = 6025000},
		{nombre= "SSJ2 Wukong",minimo = 2950000},
		{nombre= "Perfect Atom",minimo = 1375000},
		{nombre= "Chilly",minimo = 950000},
		{nombre= "Super Vegetable",minimo = 287500},
		{nombre= "Mapa",minimo = 90000},
		{nombre= "Radish",minimo = 69000},
		{nombre= "Kid Nohag",minimo = 30000},
		{nombre= "Klirin",minimo = 4000},
	},
	bossBills = {
		{nombre= "Vekuta (SSJBUI)",minimo = 5000000000},
		{nombre= "Wukong Rose",minimo = 4500000000},
		{nombre= "Vekuta (LBSSJ4)",minimo = 3700000000},
		{nombre= "Wukong (LBSSJ4)",minimo = 3000000000},
		{nombre= "Vegetable (LBSSJ4)",minimo = 1700000000},
		{nombre= "Vis (20%)",minimo = 1200000000},
		{nombre= "Vills (50%)",minimo = 600000000},
		{nombre= "Wukong (Omen)",minimo = 300000000},
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

end


                   


function iniciarJuego()
	local player = game.Players.LocalPlayer
	local data = game.ReplicatedStorage.Datas[player.UserId]
	game:GetService("ReplicatedStorage").Package.Events.Start:InvokeServer()
	game.Workspace.Gravity = Vector3.new(1, 0, 0)
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

function detectarAtaque(name, subname, enemigo)
	local args = {
		[1] = name,
		[2] = {
			["FaceMouse"] = true,
			["MouseHit"] = enemigo
		},
		[3] = "Blacknwhite27"
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Package"):WaitForChild("Events"):WaitForChild(subname):InvokeServer(unpack(args))
end
function ataqueMelee(vida) 
	for i,v in pairs(arregloAtaques) do
		if valorMinimo() > v.requerido and ki() >= kiRequerido() and vida then
			game:GetService("ReplicatedStorage").Package.Events.mel:InvokeServer(v.name, "Blacknwhite27")
		end
	end
end

function ataqueEnergy(enem, vida) 
	for i,v in pairs(ataquesEnergy) do
		pcall(function()
			if valorMinimo() > v.fuerza and vida and ki() >= kiRequerido() then
				detectarAtaque(v.name, v.subName, enem)
			end
		end)
		wait()
	end
end

function iteradorQuest(array)
	print('Seccion iterador quest')
	local enemigo
	for _,jefe in pairs(multiQuest[array]) do 
		if valorMinimo() > jefe.minimo and player() then
			print('El elegigo')
			for indice, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do 
				print('enemigo '..v.Name)
				if jefe.nombre == v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and yo and v.Humanoid.Health > 0 and isLoop1Active then
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
			   while  valorMinimo() < billsTP and noTierraID() do 
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
	wait(2)
		keypress(Enum.KeyCode.Space)
		task.wait()
		keyrelease(Enum.KeyCode.Space)
		task.wait()
		keypress(Enum.KeyCode.Space)
		task.wait()
		keyrelease(Enum.KeyCode.Space)
		task.wait()
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

		   while  valorMinimo() < statsRequeridosFarm do
		
		cargaAndBloqueo = false

		print('Tienes pocas estadisticas')

		
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

		   while  misionSeleccionada() ~= enemigo and player() do
		print('Ejecutando quest')
		events.Qaction:InvokeServer(game:GetService("Workspace").Others.NPCs[enemigo])
	end
	wait(1)
end

function rival(array)
	local enemigo = iteradorQuest(array)
	for indice, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
		if enemigo == v.Name then
			return v
		end
		wait(2)
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

function Fhjo()

end





local function Melees()
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("High Power Rush", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Mach Kick", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Super Dragon Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Spirit Barrage", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("God Slicer", "Blacknwhite27")      
                            game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)                     
                            end
                            

function empezarFarm() 
	fly()
		   while  true do
		pcall(function()
			if player() then
				rebirth() 

				warn('estadisticas elegidas '..tostring(statsRequeridosFarm))

			
				mision()

				print('Mision seleccionada')

				local enemigo = misionRival()

				statsPlayerFarmSa = flyi

				print('Enemigo: '..enemigo.Name)

				local function frameEnemigo()
					return enemigo.HumanoidRootPart.CFrame
				end
				pcall(function ()
					validacionVida()
				end)
				local function vidaEnemigo()
					return enemigo.Humanoid.Health > 0
				end

				   while  enemigo:FindFirstChild("Humanoid") and vidaEnemigo() and player() and isLoop4Active do
					pcall(function()
						spawn(function() 
							sigueEnemigo(frameEnemigo() * CFrame.new(0, 0, 4))
							pcall(function ()
								statsPlayerFarmSa()
							end)
						end)
						spawn(function() 
							if ki() >= kiRequerido() and valorMinimo() >= 4000 and isLoop3Active then
								ataqueEnergy(frameEnemigo(), vidaEnemigo())
								Melees()
								Fhjo()
								wait()
							else
								game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
							end
						end)
						spawn(function()
								local args = {[1] = true}
					game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
				
							if ki() >= kiRequerido() and valorMinimo() >= 2000 and isLoop1Active then
								ataqueMelee(vidaEnemigo())
								Melees()
							end
						end)
					end)
					wait()
				end
				if misionSeleccionada() == '' and isLoop1Active then
					wait(3)
				end
				if yo.Character.Humanoid.Health <= 0 and isLoop1Active then
					repeat
						wait(2)
					until yo.Character.Humanoid.Health > 0
					wait(3)
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
	while true do
		if cargaAndBloqueo  and isLoop1Active then
			pcall(function()
				spawn(function()
					local args = {[1] = "Blacknwhite27"}
					game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer(unpack(args))
				end)
	
				spawn(function()
					local args = {[1] = true}
					game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
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
if (game.PlaceId ~= 5151400895) and isLoop2Active then
    repeat
        wait()
    until game.Players.LocalPlayer.CharacterAdded and
        game.ReplicatedStorage.Datas:WaitForChild(game.Players.LocalPlayer.UserId)

    wait()
    game.ReplicatedStorage.Package.Events.Start:InvokeServer()
    game.ReplicatedStorage.Package.Events.Start:InvokeServer()
    game.ReplicatedStorage.Package.Events.Start:InvokeServer()
end
_G.rebrthed = false;
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


local function hju()

end


local function transform()
    pcall(function()
        for i, v in pairs(Forms) do
            if equipRemote:InvokeServer(v) and isLoop2Active then
                break
            end
        end
        repeat
            wait()
            if player.Status.SelectedTransformation.Value ~= player.Status.Transformation.Value and isLoop2Active then
                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
            end
        until game.Players.LocalPlayer.Status.SelectedTransformation.Value ==
            game.Players.LocalPlayer.Status.Transformation.Value
    end)
end


while  true and wait() do
    if (stats.Strength.Value > 5000 and stats.Defense.Value > 5000 and   stats.Energy.Value > 5000 and stats.Speed.Value >
        5000) and isLoop2Active  then
        transform()
        hju()
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

        end
        wait() 
    end
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
        
        
         
