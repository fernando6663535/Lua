

-- Instances:
local player = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
local ScrollingFrame = Instance.new("ScrollingFrame")
local verificacion = Instance.new("Frame")
local Frame_3 = Instance.new("Frame")
local names = Instance.new("TextLabel")
local nombresLabel = Instance.new("TextLabel")
local scriptIdentifier = "Fernando_ScriptExecuted"




--no borrar
ScreenGui.Name = "modified x kevin"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = player.PlayerGui

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ScrollingFrame.Parent = ScreenGui
ScrollingFrame.Active = true
ScrollingFrame.AnchorPoint = Vector2.new(1, 0.5)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(1, 0, 0.499023467, 0)
ScrollingFrame.Size = UDim2.new(0.292203009, 0, 0.712890625, 0)
ScrollingFrame.Visible = false


verificacion.Name = "verificacion"
verificacion.Parent = ScreenGui
verificacion.BackgroundColor3 = Color3.fromRGB(0, 4, 77)
verificacion.BorderColor3 = Color3.fromRGB(0, 0, 0)
verificacion.BorderSizePixel = 0
verificacion.Position = UDim2.new(0.400725305, 0, 0.19921878, 0)
verificacion.Size = UDim2.new(0.198549405, 0, 0.599609315, 0)


Frame_3.Parent = verificacion
Frame_3.AnchorPoint = Vector2.new(0.5, 0)
Frame_3.BackgroundColor3 = Color3.fromRGB(156, 156, 156)
Frame_3.BackgroundTransparency = 0.5 -- Cambié la transparencia a 0.5 para hacerlo semi-transparente
Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0.5, 0, 0.239999995, 0)
Frame_3.Size = UDim2.new(0.800000012, 0, 0.300000012, 0)

nombresLabel.Name = "nombresLabel"
nombresLabel.Parent = verificacion
nombresLabel.AnchorPoint = Vector2.new(0.5, 1)
nombresLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
nombresLabel.BorderSizePixel = 0
nombresLabel.Position = UDim2.new(0.5, 0, 0, 0)
nombresLabel.Size = UDim2.new(1, 0, 0.1, 0)
nombresLabel.Font = Enum.Font.SourceSans
nombresLabel.Text = "Script_De_Pvtin" -- Cambio de texto aquí
nombresLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Cambio de color aquí
nombresLabel.TextScaled = true
nombresLabel.TextSize = 14.000
nombresLabel.TextWrapped = true

names.Name = "names"
names.Parent = Frame_3
names.AnchorPoint = Vector2.new(0.5, 0)
names.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
names.BackgroundTransparency = 1 -- Haciendo el cuadro de texto completamente transparente
names.BorderColor3 = Color3.fromRGB(0, 0, 0)
names.BorderSizePixel = 0
names.Position = UDim2.new(0.5, 0, 0.449999988, 0)
names.Size = UDim2.new(0.899999976, 0, 0.400000006, 0)
names.Font = Enum.Font.SourceSans
names.Text = "Iniciando Farm"
names.TextColor3 = Color3.fromRGB(255, 0, 0) -- Cambié el color del texto a rojo
names.TextScaled = true
names.TextSize = 1.000
names.TextWrapped = true

-- Función para la verificación de usuarios
local function PGPDYH_fake_script() 
    -- Verificación
    -- Variables
    local player = game.Players.LocalPlayer
    local tetxo = verificacion.Frame.names
    local frameFarm = verificacion
    local frameOriginal = verificacion
    local verdad = true
 
  tetxo.Text = "Iniciando Farm"
    wait(0.1)
    frameOriginal:Destroy()
    wait()
    frameFarm.Visible = true

         

local player = game.Players.LocalPlayer
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = Instance.new("ScreenGui")
local Frame_2 = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.ResetOnSpawn = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Scritp_iconos-.Lua"))()



-- Variable para controlar la visibilidad del menú principal
local menuVisible = false

-- Función para alternar la visibilidad de los botones del menú principal
local function ToggleMainMenuVisibility()
    menuVisible = not menuVisible
    local guiChildren = gui:GetChildren()
    local yOffset = menuVisible and -150 or 100 -- Ajuste el valor de desplazamiento según sea necesario
    for i = 1, #guiChildren do
        if guiChildren[i]:IsA("TextButton") then
            if menuVisible then
                guiChildren[i]:TweenPosition(UDim2.new(guiChildren[i].Position.X.Scale, guiChildren[i].Position.X.Offset, 0.8, yOffset), "Out", "Quad", 0.5, true)
            else
                guiChildren[i].Position = UDim2.new(guiChildren[i].Position.X.Scale, guiChildren[i].Position.X.Offset, 2, yOffset)
            end
        end
    end
end

-- Función para alternar la visibilidad del menú "Farm Clan"
local function ToggleFarmClanMenu()
    local ScreenGui = player.PlayerGui:FindFirstChild("modified x kevin")
    if ScreenGui then
        local Frame_2 = ScreenGui:FindFirstChild("Frame_2")
        if Frame_2 then
            Frame_2.Visible = not Frame_2.Visible
        end
    end
end


-- Configuración de la GUI:
ScreenGui.Name = "modified x kevin"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = player.PlayerGui

-- Configuración del marco:
Frame_2.Parent = ScreenGui
Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.4, 0, 0.4, 0)
Frame_2.Size = UDim2.new(0.2, 0, 0.6, 0)
Frame_2.Visible = false




-- Configuración del botón:
TextButton.Parent = ScreenGui
TextButton.AnchorPoint = Vector2.new(0, 1)
TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 0, 1, 0)
TextButton.Size = UDim2.new(0.2, 0, 0.1, 0)
TextButton.Font = Enum.Font.Unknown
TextButton.Text = "Farm-Gratis"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 255)
TextButton.TextStrokeTransparency = 0.000
TextButton.TextWrapped = true




-- Instances:
local player = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
local Frame_2 = Instance.new("Frame")
local TextButton1 = Instance.new("TextButton")
local TextButton2 = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")

-- Configuración de la GUI:
ScreenGui.Name = "modified x kevin"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = player.PlayerGui

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame_2.Parent = ScreenGui
Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.400027215, 0, 0.400656223, 0)
Frame_2.Size = UDim2.new(0.199456096, 0, 0.64453125, 0)
Frame_2.Visible = false


local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = Frame_2
TextLabel.AnchorPoint = Vector2.new(0, 1)
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.003, 0, 0.01, 0)  -- Posición más arriba
TextLabel.Size = UDim2.new(1, 0, 0.100000001, 0)
TextLabel.Font = Enum.Font.Unknown
TextLabel.Text = "Creado×Pvtin"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.TextStrokeTransparency = 0.000
TextLabel.TextWrapped = true


local TextButton1 = Instance.new("TextButton")
TextButton1.Parent = Frame_2
TextButton1.AnchorPoint = Vector2.new(0.5, 0)
TextButton1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton1.BorderColor3 = Color3.fromRGB(57, 11, 240)
TextButton1.BorderSizePixel = 2
TextButton1.Position = UDim2.new(0.5, 0, 0, 1)
TextButton1.Size = UDim2.new(0.99, 0, 0.1, 0)
TextButton1.Font = Enum.Font.SourceSans
TextButton1.Text = "[Farm-ON]"
TextButton1.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton1.TextScaled = true
TextButton1.TextSize = 14.000
TextButton1.TextStrokeColor3 = Color3.fromRGB(82, 2, 255)
TextButton1.TextStrokeTransparency = 0.000
TextButton1.TextWrapped = true

local TextButton2 = Instance.new("TextButton")
TextButton2.Parent = Frame_2
TextButton2.AnchorPoint = Vector2.new(0.5, 0)
TextButton2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton2.BorderColor3 = Color3.fromRGB(57, 11, 240)
TextButton2.BorderSizePixel = 2
TextButton2.Position = UDim2.new(0.5, 0, 0.1, 8)
TextButton2.Size = UDim2.new(0.99, 0, 0.1, 0)
TextButton2.Font = Enum.Font.SourceSans
TextButton2.Text = "Reb-[ON]"
TextButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton2.TextScaled = true
TextButton2.TextSize = 14
TextButton2.TextStrokeColor3 = Color3.fromRGB(82, 2, 255)
TextButton2.TextStrokeTransparency = 0
TextButton2.TextWrapped = true

local TextButton3 = Instance.new("TextButton")
TextButton3.Parent = Frame_2
TextButton3.AnchorPoint = Vector2.new(0.5, 0)
TextButton3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton3.BorderColor3 = Color3.fromRGB(57, 11, 240)
TextButton3.BorderSizePixel = 2
TextButton3.Position = UDim2.new(0.5, 0, 0.2, 15)
TextButton3.Size = UDim2.new(0.99, 0, 0.1, 0)
TextButton3.Font = Enum.Font.SourceSans
TextButton3.Text = "Mele-[ON]"
TextButton3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton3.TextScaled = true
TextButton3.TextSize = 14
TextButton3.TextStrokeColor3 = Color3.fromRGB(82, 2, 255)
TextButton3.TextStrokeTransparency = 0
TextButton3.TextWrapped = true

ScreenGui.ResetOnSpawn = false
-- Crear el GUI y los botones del menú principal
local primerBoton = Instance.new("TextButton")
primerBoton.Name = "PrimerBoton"
primerBoton.Parent = gui
primerBoton.AnchorPoint = Vector2.new(0.5, 0)
primerBoton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Negro
primerBoton.BorderColor3 = Color3.fromRGB(57, 11, 240) -- Color del borde
primerBoton.BorderSizePixel = 2
primerBoton.Position = UDim2.new(0.40908, -30, 2, 150) -- Inicialmente fuera de la pantalla
primerBoton.Size = UDim2.new(0.1, -46, 0.5, 0)
primerBoton.Font = Enum.Font.SourceSans
primerBoton.Text = "Atrás"  -- Texto cambiado a "Atrás"
primerBoton.TextColor3 = Color3.fromRGB(24, 116, 205) -- Azul marino
primerBoton.TextSize = 14
primerBoton.TextWrapped = true
primerBoton.TextStrokeColor3 = Color3.fromRGB(165, 10, 255) -- Color del borde del texto
primerBoton.TextStrokeTransparency = 0.000

-- Segundo botón del menú principal
local segundoBoton = Instance.new("TextButton")
segundoBoton.Name = "SegundoBoton"
segundoBoton.Parent = gui
segundoBoton.AnchorPoint = Vector2.new(0.5, 0)
segundoBoton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Negro
segundoBoton.BorderColor3 = Color3.fromRGB(57, 11, 240) -- Color del borde
segundoBoton.BorderSizePixel = 2
segundoBoton.Position = UDim2.new(0.590, 30, 2, 150) -- Inicialmente fuera de la pantalla
segundoBoton.Size = UDim2.new(0.1, -46, 0.5, 0)
segundoBoton.Font = Enum.Font.SourceSans
segundoBoton.Text = "Sigui"  -- Texto cambiado a "Siguiente"
segundoBoton.TextColor3 = Color3.fromRGB(24, 116, 205) -- Azul marino
segundoBoton.TextSize = 14
segundoBoton.TextWrapped = true
segundoBoton.TextStrokeColor3 = Color3.fromRGB(165, 10, 255) -- Color del borde del texto
segundoBoton.TextStrokeTransparency = 0.000

-- Inicializar el número de jugador
local plrNum = 1

-- Función para cambiar el enfoque de la cámara al jugador anterior
primerBoton.MouseButton1Down:Connect(function()
    if plrNum ~= 1 then
        plrNum = plrNum - 1
    end
    for _, player in ipairs(game.Players:GetPlayers()) do
        if _ == plrNum then
            game.Workspace.Camera.CameraSubject = player.Character.Humanoid
        end
    end
end)

-- Función para cambiar el enfoque de la cámara al siguiente jugador
segundoBoton.MouseButton1Down:Connect(function()
    if plrNum < #game.Players:GetPlayers() then
        plrNum = plrNum + 1
        for _, player in ipairs(game.Players:GetPlayers()) do
            if _ == plrNum then
                game.Workspace.Camera.CameraSubject = player.Character.Humanoid
            end
        end
    end
end)



-- Scripts:

local function ToggleFrameVisibility()
    if Frame_2.Visible then
        -- Si el marco está visible, lo ocultamos con una animación de desplazamiento hacia abajo
        Frame_2:TweenPosition(UDim2.new(0.4, 0, 1.2, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
    else
        -- Si el marco está oculto, lo mostramos con una animación de desplazamiento hacia arriba
        Frame_2:TweenPosition(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true)
    end
    -- Cambiar la visibilidad del marco
    Frame_2.Visible = not Frame_2.Visible
end



-- Conectar el botón al script para mostrar u ocultar el marco con animación:
TextButton.MouseButton1Click:Connect(ToggleFrameVisibility)

-- Agregar esquinas redondeadas al botón:
UICorner.CornerRadius = UDim.new(0, 20)  -- Ajuste este valor según sea necesario
UICorner.Parent = TextButton




-- Conectar el botón "Farm Clan" al script para mostrar u ocultar el marco y los botones principales
TextButton.MouseButton1Click:Connect(function()
    ToggleFarmClanMenu()
    ToggleMainMenuVisibility()
    if _G[scriptIdentifier] then
    return  -- Terminate the script if it has already been executed
end

_G[scriptIdentifier] = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/Fernanflop091o/FUTUROS_NEW_GAME/main/Scritp_para_verjugadores.Lua"))()
end)

local isLoop1Active = true  -- Cambiado a true para iniciar encendido
local isLoop2Active = true  -- Cambiado a true para iniciar encendido
local isLoop3Active = true  -- Inicialmente establecido en true


-- Función para el primer botón:
local function Button1Click()
    isLoop1Active = not isLoop1Active
    TextButton1.Text = isLoop1Active and "[Farm-[ON]" or "[Farm-OFF]"
end

-- Función para el segundo botón:
local function Button2Click()
    isLoop2Active = not isLoop2Active
    TextButton2.Text = isLoop2Active and "Reb-[ON]" or "Reb-[OFF]"
end

-- Función para el segundo botón:
local function Button3Click()
    isLoop3Active = not isLoop3Active
    TextButton3.Text = isLoop3Active and "Mele-[ON]" or "Mele-[OFF]"
end

-- Conectar los botones a sus respectivas funciones:
TextButton1.MouseButton1Click:Connect(Button1Click)
TextButton2.MouseButton1Click:Connect(Button2Click)
TextButton3.MouseButton1Click:Connect(Button3Click)


-- Ejecutar bucle 1:
coroutine.wrap(function()
    while true do
        if isLoop1Active then

 local loaded = false
 
   success, err = pcall(function()
       while not loaded do
    if game["loaded"] then
        
        loaded = true
        break
    end
    end
   end)
            if success then

                warn(" game loaded Function executed successfully")

             
                
            else
                warn("Error occurred:", err)
            
            end

print("game loaded")
local success, result = pcall(function()
    repeat
        task.wait()
    until game.Players.LocalPlayer ~= nil and game.Players.LocalPlayer.Name ~= nil and
        game.Players.LocalPlayer:GetMouse() ~= nil

    repeat
        task.wait()
    until game:IsLoaded()
    game:WaitForChild("ReplicatedStorage")
    game.ReplicatedStorage:WaitForChild("Datas")
    game.ReplicatedStorage.Datas:WaitForChild(game.Players.LocalPlayer.UserId)
end)
if success then



                warn(" game loaded Function executed successfully")

                
            else
                warn("Error occurred:", err)
            
            end

task.wait()


local stackneeded = true
local targetted;
local transformStatus = false
local autoFarmLoopRunning = false
local stacked = false
local flying = false

local charge = false
local checkValue;

getgenv().dead = false
getgenv().rebirthed = false

function format_number(number)
    local suffixes = {"", "K", "M", "B", "T", "QD"}
    local suffix_index = 1

    while math.abs(number) >= 1000 and suffix_index < #suffixes do
        number = number / 1000.0
        suffix_index = suffix_index + 1
    end

    return string.format("%.2f%s", number, suffixes[suffix_index])
end


function getCheckValue()
    data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
    local a = data.Strength.Value
    local b = data.Energy.Value
    local c = data.Defense.Value
    local d = data.Speed.Value

    local smallest = a 

    if b < smallest then
        smallest = b
    end

    if c < smallest then
        smallest = c
    end

    if d < smallest then
        smallest = d
    end

    checkValue = smallest
    return checkValue
end
local PaidFormsList = {
    Evil = {{
        name = "SSJ2 Kaioken",
        reqvalue = 50000,
        endrangevalue = 160000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "LSSJ Kaioken",
        reqvalue = 160001,
        endrangevalue = 250000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "Mystic Kaioken",
        reqvalue = 250001,
        endrangevalue = 550000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "SSJ5",
        reqvalue = 550001,
        endrangevalue = 800000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950469
    }, {
        name = "LSSJ3",
        reqvalue = 800001,
        endrangevalue = 1000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "SSJG4",
        reqvalue = 1000001,
        endrangevalue = 1800000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950465
    }, {
        name = "LSSJ4",
        reqvalue = 1800001,
        endrangevalue = 3000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "LSSJG",
        reqvalue = 3000001,
        endrangevalue = 4000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "Super Broly",
        reqvalue = 4000000,
        endrangevalue = 30000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 7837022
    }, {
        name = "True God of Destruction",
        reqvalue = 30000001,
        endrangevalue = 50000000,
        alignment = "Evil",
        rebirthReq = 10,
        formOwned = false,
        GamePassID = 9848987
    }, {
        name = "SSJB4",
        reqvalue = 50000001,
        endrangevalue = 120000000,
        alignment = "Neutral",
        rebirthReq = 13,
        formOwned = false,
        GamePassID = 6950465
    }, {
        name = "Blanco",
        reqvalue = 120000001,
        endrangevalue = 120000000986636346000000000,
        alignment = "Neutral",
        rebirthReq = 24,
        formOwned = false,
        GamePassID = 676684901
    }},

    Good = {{
        name = "SSJ2 Kaioken",
        reqvalue = 50000,
        endrangevalue = 160000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "LSSJ Kaioken",
        reqvalue = 160001,
        endrangevalue = 250000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "Mystic Kaioken",
        reqvalue = 250001,
        endrangevalue = 550000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950449
    }, {
        name = "SSJ5",
        reqvalue = 550001,
        endrangevalue = 800000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950469
    }, {
        name = "LSSJ3",
        reqvalue = 800001,
        endrangevalue = 1000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "SSJG4",
        reqvalue = 1000001,
        endrangevalue = 1800000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6950465
    }, {
        name = "LSSJ4",
        reqvalue = 1800001,
        endrangevalue = 3000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "LSSJG",
        reqvalue = 3000001,
        endrangevalue = 4000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 6951002
    }, {
        name = "Super Broly",
        reqvalue = 4000000,
        endrangevalue = 30000000,
        alignment = "Neutral",
        rebirthReq = 0,
        formOwned = false,
        GamePassID = 7837022
    }, {
        name = "SSJB4",
        reqvalue = 50000001,
        endrangevalue = 120000001,
        alignment = "Neutral",
        rebirthReq = 13,
        formOwned = false,
        GamePassID = 6950465
    }, {
        name = "Blanco",
        reqvalue = 120000000,
        endrangevalue = 120000000986636346000000000,
        alignment = "Neutral",
        rebirthReq = 24,
        formOwned = false,
        GamePassID = 676684901
    }}
}

local FormsList = {

    Evil = {{
        name = "Kaioken",
        reqvalue = 1000,
        endrangevalue = 2500,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "FSSJ",
        reqvalue = 2501,
        endrangevalue = 6000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ",
        reqvalue = 6001,
        endrangevalue = 16000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ Kaioken",
        reqvalue = 16001,
        endrangevalue = 34000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ2",
        reqvalue = 34001,
        endrangevalue = 65000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ2 Majin",
        reqvalue = 65001,
        endrangevalue = 95000,
        alignment = "Evil",
        rebirthReq = 0
    }, {
        name = "SSJ3",
        reqvalue = 95001,
        endrangevalue = 140000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "LSSJ",
        reqvalue = 140001,
        endrangevalue = 200000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "Mystic",
        reqvalue = 200001,
        endrangevalue = 300000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ4",
        reqvalue = 300001,
        endrangevalue = 450000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJG",
        reqvalue = 450001,
        endrangevalue = 700000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "Corrupt SSJ",
        reqvalue = 700001,
        endrangevalue = 1400000,
        alignment = "Evil",
        rebirthReq = 0
    }, {
        name = "SSJ Rose",
        reqvalue = 1400001,
        endrangevalue = 2400000,
        alignment = "Evil",
        rebirthReq = 0
    }, {
        name = "True Rose",
        reqvalue = 2400001,
        endrangevalue = 3000000,
        alignment = "Evil",
        rebirthReq = 0
    }, {
        name = "SSJ Berserker",
        reqvalue = 3000001,
        endrangevalue = 3500000,
        alignment = "Evil",
        rebirthReq = 1
    }, {
        name = "Dark Rose",
        reqvalue = 3500001,
        endrangevalue = 4000000,
        alignment = "Evil",
        rebirthReq = 2
    }, {
        name = "Evil SSJ",
        reqvalue = 4000001,
        endrangevalue = 5000000,
        alignment = "Evil",
        rebirthReq = 3
    }, {
        name = "Ultra Instinct Omen",
        reqvalue = 5000001,
        endrangevalue = 8000000,
        alignment = "Neutral",
        rebirthReq = 3
    }, {
        name = "Godly SSJ2",
        reqvalue = 8000001,
        endrangevalue = 14000000,
        alignment = "Neutral",
        rebirthReq = 4
    }, {
        name = "Jiren Ultra Instinct",
        reqvalue = 14000001,
        endrangevalue = 30000000,
        alignment = "Evil",
        rebirthReq = 6
    }, {
        name = "God of Destruction",
        reqvalue = 30000001,
        endrangevalue = 50000000,
        alignment = "Evil",
        rebirthReq = 10
    }, {
        name = "SSJR3",
        reqvalue = 50000001,
        endrangevalue = 100000000,
        alignment = "Evil",
        rebirthReq = 12
    }, {
        name = "LBSSJ4",
        reqvalue = 100000001,
        endrangevalue = 120000000,
        alignment = "Good",
        rebirthReq = 18
    }, {
        name = "Ultra Ego",
        reqvalue = 120000001,
        endrangevalue = 120000002,
        alignment = "Evil",
        rebirthReq = 20
    },
{
        name = "Beast",
        reqvalue = 120000003,
        endrangevalue = 100000000000000000000000,
        alignment = "Evil",
        rebirthReq = 24
    }}, -- close evil

    Good = {{
        name = "Kaioken",
        reqvalue = 1000,
        endrangevalue = 2500,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "FSSJ",
        reqvalue = 2501,
        endrangevalue = 6000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ",
        reqvalue = 6001,
        endrangevalue = 16000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ Kaioken",
        reqvalue = 16001,
        endrangevalue = 34000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ2",
        reqvalue = 34001,
        endrangevalue = 65000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "Spirit SSJ",
        reqvalue = 65001,
        endrangevalue = 95000,
        alignment = "Good",
        rebirthReq = 0
    }, {
        name = "SSJ3",
        reqvalue = 95001,
        endrangevalue = 140000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "LSSJ",
        reqvalue = 140001,
        endrangevalue = 200000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "Mystic",
        reqvalue = 200001,
        endrangevalue = 300000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ4",
        reqvalue = 300001,
        endrangevalue = 450000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJG",
        reqvalue = 450001,
        endrangevalue = 700000,
        alignment = "Neutral",
        rebirthReq = 0
    }, {
        name = "SSJ Rage",
        reqvalue = 700001,
        endrangevalue = 1200000,
        alignment = "Good",
        rebirthReq = 0
    }, {
        name = "SSJ Blue",
        reqvalue = 1200001,
        endrangevalue = 2200000,
        alignment = "Good",
        rebirthReq = 0
    }, {
        name = "SSJB Kaioken",
        reqvalue = 2200001,
        endrangevalue = 3000000,
        alignment = "Good",
        rebirthReq = 0
    }, {
        name = "Kefla SSJ2",
        reqvalue = 3000001,
        endrangevalue = 3500000,
        alignment = "Good",
        rebirthReq = 1
    }, {
        name = "Blue Evolution",
        reqvalue = 3500001,
        endrangevalue = 5000000,
        alignment = "Good",
        rebirthReq = 2
    }, {
        name = "Ultra Instinct Omen",
        reqvalue = 5000001,
        endrangevalue = 8000000,
        alignment = "Neutral",
        rebirthReq = 3
    }, {
        name = "Godly SSJ2",
        reqvalue = 8000001,
        endrangevalue = 14000000,
        alignment = "Neutral",
        rebirthReq = 4
    }, {
        name = "Mastered Ultra Instinct",
        reqvalue = 14000001,
        endrangevalue = 30000000,
        alignment = "Good",
        rebirthReq = 6
    }, {
        name = "God of Creation",
        reqvalue = 30000001,
        endrangevalue = 50000000,
        alignment = "Good",
        rebirthReq = 10
    }, {
        name = "SSJB3",
        reqvalue = 50000001,
        endrangevalue = 100000000,
        alignment = "Good",
        rebirthReq = 12
    }, {
        name = "LBSSJ4",
        reqvalue = 100000001,
        endrangevalue = 120000001,
        alignment = "Good",
        rebirthReq = 18
    }, {
        name = "SSJBUI",
        reqvalue = 120000001,
        endrangevalue = 120000002,
        alignment = "Good",
        rebirthReq = 20
    },
{
        name = "Beast",
        reqvalue = 120000003,
        endrangevalue = 100000000000000000000000,
        alignment = "Good",
        rebirthReq = 24
    }}
}

local quests = {{
    name = "X Fighter Trainer",
    nickname = "X Fighter",
    requiredValue = 0,
    endRange = 30000,
    planet = "Earth"
}, {
    name = "Klirin",
    nickname = "Klirin",
    requiredValue = 30001,
    endRange = 60000,
    planet = "Earth"
}, {
    name = "Kid Nohag",
    nickname = "Kid Nohag",
    requiredValue = 60001,
    endRange = 80000,
    planet = "Earth"
}, {
    name = "Turtle Student",
    nickname = "Turtle Student",
    requiredValue = 80001,
    endRange = 100000,
    planet = "Earth"
}, {
    name = "Radish",
    nickname = "Radish",
    requiredValue = 100001,
    endRange = 200000,
    planet = "Earth"
}, {
    name = "Mapa",
    nickname = "Mapa",
    requiredValue = 200001,
    endRange = 300000,
    planet = "Earth"
}, {
    name = "Citizen",
    nickname = "Evil Saya",
    requiredValue = 300001,
    endRange = 400000,
    planet = "Earth"
}, {
    name = "Top X Fighter",
    nickname = "X Fighter Master",
    requiredValue = 400001,
    endRange = 750000,
    planet = "Earth"
}, {
    name = "Super Vegetable",
    nickname = "Super Vegetable",
    requiredValue = 750001,
    endRange = 1000000,
    planet = "Earth"
}, {
    name = "Chilly",
    nickname = "Chilly",
    requiredValue = 100001,
    endRange = 3000000,
    planet = "Earth"
}, {
    name = "Perfect Atom",
    nickname = "Perfect Atom",
    requiredValue = 3000001,
    endRange = 5100000,
    planet = "Earth"
}, {
    name = "SSJ2 Wukong",
    nickname = "SSJ2 Wukong",
    requiredValue = 5100001,
    endRange = 6000000,
    planet = "Earth"
}, {
    name = "SSJB Wukong",
    nickname = "SSJB Wukong",
    requiredValue = 6000001,
    endRange = 30500000,
    planet = "Earth"
}, {
    name = "Broccoli",
    nickname = "Broccoli",
    requiredValue = 30500001,
    endRange = 100000000,
    planet = "Earth"
}, {
    name = "SSJG Kakata",
    nickname = "SSJG Kakata",
    requiredValue = 100000000,
    endRange = 150000000,
    planet = "Earth"
}, {
    name = "Vegetable (GoD in-training)",
    nickname = "Vegetable (GoD in-training)",
    requiredValue = 150000001,
    endRange = 250000000,
    planet = "Bills"
}, {
    name = "Wukong (Omen)",
    nickname = "Wukong (Omen)",
    requiredValue = 250000001,
    endRange = 320000000,
    planet = "Bills"
}, {
    name = "Vills (50%)",
    nickname = "Vills (50%)",
    requiredValue = 320000001,
    endRange = 500000000,
    planet = "Bills"
}, {
    name = "Vis (20%)",
    nickname = "Vis (20%)",
    requiredValue = 500000001,
    endRange = 1000000000,
    planet = "Bills"
}, {
    name = "Vegetable (LBSSJ4)",
    nickname = "Vegetable (LBSSJ4)",
    requiredValue = 1000000001,
    endRange = 1900000000,
    planet = "Bills"
}, {
    name = "Wukong (LBSSJ4)",
    nickname = "Wukong (LBSSJ4)",
    requiredValue = 1500000001,
    endRange = 3000000000,
    planet = "Bills"
}, {
    name = "Vekuta (LBSSJ4)",
    nickname = "Vekuta (LBSSJ4)",
    requiredValue = 3000000001,
    endRange = 3500000000,
    planet = "Bills"
}, {
    name = "Wukong Rose",
    nickname = "Wukong Rose",
    requiredValue = 3500000001,
    endRange = 5250000000,
    planet = "Bills"
}, {
    name = "Vekuta (SSJBUI)",
    nickname = "Vekuta (SSJBUI)",
    requiredValue = 4450000001,
    endRange = 2000000000000000000,
    planet = "Bills"
}}



local function check1()
    pcall(function()
    local checkValue = getCheckValue()

    if checkValue >= 150000000 and game.placeId ~= 5151400895 then
        data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
        if data.Zeni.Value >= 15000 then

            local A_1 = "Vills Planet"
            local Event = game:GetService("ReplicatedStorage").Package.Events.TP
            Event:InvokeServer(A_1)
            tp = true
            return tp
        else
            SelectedQuests = "SSJG Kakata"
            SelectedMobs1 = "SSJG Kakata"

            tp = false
            return SelectedQuests, SelectedMobs, tp

        end
    end

    if checkValue <= 150000000 and game.placeId == 5151400895 then

        if checkValue < 150000000 and game.placeId ~= 3311165597 then
            local A_1 = "Earth"
            local Event = game:GetService("ReplicatedStorage").Package.Events.TP
            Event:InvokeServer(A_1)
            task.wait(8)
        end
    end
end)
end

function target()
    targetted = game.Players.LocalPlayer.name

end
pcall(function() target() end)
local function deadcheck(LDCheck)
    success, err = pcall(function()
        task.wait()
        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
            getgenv().dead = true
            transformStatus = false
            autoFarmLoopRunning = false
            flying = false
            questneeded = true
            

        else
            autoFarmLoopRunning = true
            getgenv().dead = false
            
        end
    end)
    if LDCheck then
        getgenv().stackneeded = false
        autoFarmLoopRunning = true
        print("last dead check passed")
    end
    if success then
        warn("Stack loop Function executed successfully with a value of " .. tostring(getgenv().dead))
      
        
    else
        warn("Error occurred:", err)
        
    end
    return autoFarmLoopRunning, transformStatus, flying
end

function startgame()
    pcall(function()

        repeat

            if game.workspace[targetted] then
                task.wait()
                local Event = game:GetService("ReplicatedStorage").Package.Events.Start
                Event:InvokeServer()
                task.wait()

                local Event = game:GetService("ReplicatedStorage").Package.Events.Start
                Event:InvokeServer()

                task.wait()

                game.Players.LocalPlayer.PlayerGui.Main.bruh.Disabled = true

                game.Players.LocalPlayer.PlayerGui.Main.bruh.Disabled = false

                task.wait()
                local Event = game:GetService("ReplicatedStorage").Package.Events.Start
                Event:InvokeServer()

            end
        until game.workspace.Living[targetted]

    end)

end
repeat
 success, err = pcall(function() 
local function CheckGamePass(UserId, GamePassID)
    local MarketplaceService = game:GetService("MarketplaceService")
    return MarketplaceService:UserOwnsGamePassAsync(UserId, GamePassID)
end

local userId = game.Players.LocalPlayer.UserId 

for _, form in ipairs(PaidFormsList["Evil"]) do

    form.formOwned = CheckGamePass(userId, form.GamePassID)

end

for _, form in ipairs(PaidFormsList["Good"]) do
    form.formOwned = CheckGamePass(userId, form.GamePassID)
end

for _, form in ipairs(PaidFormsList["Good"]) do

    print(string.format("Name: %s, ReqValue: %d, EndRangeValue: %d, Alignment: %s, RebirthReq: %d, FormOwned: %s",
        form.name, form.reqvalue, form.endrangevalue, form.alignment, form.rebirthReq, tostring(form.formOwned)))

end
end)
task.wait()
until success


local function autostack(stack1)
    pcall(function()
        targetted = game.Players.LocalPlayer.name
        data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
        if stack1 == true and data.Energy.Value > 8000000 and getgenv().dead == false then
            task.wait(1)
          

            game.workspace.Living[targetted].UpperTorso:Destroy()
            task.wait(5)
            local Remote = game.ReplicatedStorage.Package.Events['equipskill']
            local Arguments = {
                [1] = "Godly SSJ2"
            }
            Remote:InvokeServer(unpack(Arguments))
            local Remote = game.ReplicatedStorage.Package.Events['ta']
            i = 0
            repeat
                Remote:InvokeServer(unpack(Arguments))
                i = i + 1
                task.wait(.1)
            until i == 8
            task.wait()
            getgenv().stackneeded = false
            transformStatus = true
            autoFarmLoopRunning = true
            flying = false
            return transformStatus, autoFarmLoopRunning, flying
        elseif stack1 == false then
            getgenv().stackneeded = false
            transformStatus = true
            autoFarmLoopRunning = true
            flying = false
            return  transformStatus, autoFarmLoopRunning, flying
        elseif stack1 == true and data.Energy.Value < 8000000 then
            task.wait()
            getgenv().stackneeded = false
            transformStatus = true
            autoFarmLoopRunning = true
            flying = false
            return  transformStatus, autoFarmLoopRunning, flying
        end
    end)
end

pcall(function()
    task.wait()
    check1()

    repeat

        startgame()

    until game.workspace.Living[targetted]

end)
task.spawn(function()
pcall(function()
    local bb = game:service 'VirtualUser'
    game:service 'Players'.LocalPlayer.Idled:connect(function()
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
        task.wait(2)

    end)
end)
end)
sameplanet = true
SelectedQuests = ""
SelectedMobs = ""
local planet1 = ""

local function getQuest(switch1)
    switch1 = getgenv().switch1

    local checkValue = getCheckValue()

    local previousQuestName -- Variable to keep track of the previous quest's name for switch == 1
  

    for i, quest in ipairs(quests) do
        if checkValue >= quest.requiredValue and checkValue <= quest.endRange then
            currentQuestIndex = i

            if switch1 == 1 then

                SelectedQuests = quest.name
                SelectedMobs = quest.nickname
                planet1 = quest.planet

                return SelectedQuests, SelectedMobs, planet1 -- exit the loop if a quest is found
            elseif switch1 == 2 then
                if currentQuestIndex >= 2 then

                    for j = i - 1, 1, -1 do -- search for the previous quest
                        local prevQuest = quests[j]

                        if planet1 == prevQuest.planet then

                            SelectedQuests = prevQuest.name
                            SelectedMobs = prevQuest.nickname
                            sameplanet = true

                            return SelectedQuests, SelectedMobs, sameplanet -- exit the loop once the previous quest is found
                        else
                            sameplanet = false

                            SelectedQuests = quest.name
                            SelectedMobs = quest.nickname
                            return SelectedQuests, SelectedMobs, switch1, sameplanet
                        end
                    end

                elseif currentQuestIndex <= 1 then
                    SelectedQuests = quest.name
                    SelectedMobs = quest.nickname

                    return SelectedQuests, SelectedMobs, switch1
                end
                break -- exit the loop if a quest is found (could also remove this line if the loop should continue searching for quests)
            end

        end
    end

end
questneeded = false
-- Function
local attacks2 = {"Super Dragon Fist", "God Slicer", "Spirit Barrage", "Mach Kick", "Wolf Fang Fist", "High Power Rush",
                  "Meteor Strike", "Meteor Charge", "Spirit Breaking Cannon", "Vital Strike", "Flash Kick", "Meteor Charge", "Flash Kick"}

-- Function
local attacks = {"Spirit Breaking Cannon", "Vanish Strike", "Uppercut"
                }

local RebValue = ""

local rebirthOnJoin = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId].Rebirth.Value


task.spawn(function()
    while true and task.wait() do
        pcall(function()
            data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
            while true and task.wait() do
                task.wait()
                RebValue = data.Rebirth.Value
                if rebirthOnJoin ~= RebValue then
                   

                    local A_1 = "Earth"
                    local Event = game:GetService("ReplicatedStorage").Package.Events.TP

                    Event:InvokeServer(A_1)

                    task.wait()
                end
            end
        end)
    end
end)

task.spawn(function()
    while true and task.wait() do
        pcall(function()
local args = {
                [1] = true
            }
            game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
  game.Players.LocalPlayer.Status.Blocking.Value = true
      end)
    end
end)


questneeded = true
SelectedMobs1 = ""
getgenv().autostackloop = true
getgenv().stackneeded = true
-- main loop

while true do
    warn("in main loop")
    success1, err1 = pcall(function()
        task.wait()
        deadcheck(false)
        if getgenv().stackneeded == true then
            deadcheck(false)
            repeat
                task.wait()
                deadcheck(false)
            until getgenv().dead == false
            if getgenv().stackneeded == true then

                stack1 = true
                --autostack(stack1)
                repeat
                    success, err = pcall(function()
                        targetted = game.Players.LocalPlayer.name
                        data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
                        if stack1 == true and data.Energy.Value > 8000000 and getgenv().dead == false then
                            task.wait(1)
                
                            game.workspace.Living[targetted].UpperTorso:Destroy()
                            task.wait(5)
                            local Remote = game.ReplicatedStorage.Package.Events['equipskill']
                            local Arguments = {
                                [1] = "Godly SSJ2"
                            }
                            Remote:InvokeServer(unpack(Arguments))
                            local Remote = game.ReplicatedStorage.Package.Events['ta']
                            i = 0
                            repeat
                                Remote:InvokeServer(unpack(Arguments))
                                i = i + 1
                                task.wait(.1)
                            until i == 3
                            task.wait()
                            getgenv().stackneeded = false
                            transformStatus = true
                            autoFarmLoopRunning = true
                            flying = false
                            
                        elseif stack1 == false then
                            getgenv().stackneeded = false
                            transformStatus = true
                            autoFarmLoopRunning = true
                            flying = false
                            
                        elseif stack1 == true and data.Energy.Value < 8000000 then
                            task.wait()
                            getgenv().stackneeded = false
                            transformStatus = true
                            autoFarmLoopRunning = true
                            flying = false
                            
                        end
                    end)
                    if success then
                        warn("(1)Stack loop Function executed successfully with a value of " .. tostring(getgenv().stackneeded))
                        -- Access the result returned by the function
                        getgenv().stackneeded = false
                    else
                        warn("Error occurred:", err)
                        
                    end
                    task.wait()
                until getgenv().stackneeded == false
                deadcheck(true)
                getgenv().stackneeded = false
                questneeded = true
                autoFarmLoopRunning = true
            end
            
        end
        autoFarmLoopRunning = true
        getgenv().stackneeded = false
    end)
    getgenv().stackneeded = false
    if success1 then
        warn("(2)Stack loop Function executed successfully with a value of " .. tostring(getgenv().stackneeded))
        -- Access the result returned by the function
        
    else
        warn("Error occurred:", err1)
        
    end

warn("line 1100 quest status = " .. tostring(questneeded))
warn("line 1100 enter loop status status = " .. tostring(autoFarmLoopRunning))
    checkstackreq = getCheckValue()
    if checkstackreq < 8000000 then
        autoFarmLoopRunning = true
    end

    if getgenv().rebirthed == true and game.placeId == 5151400895 then
        task.wait(10)
check1()
        return

    elseif getgenv().rebirthed == true and game.placeId ~= 5151400895 then
        task.wait(3)
check1()
    end

    pcall(function()

        game.Workspace.Living:WaitForChild(targetted)
        game.Workspace.Living[targetted]:WaitForChild("HumanoidRootPart")

    end)

    if charge == false and getgenv().dead == false and autoFarmLoopRunning == true then

        task.spawn(function()
            while autoFarmLoopRunning do
                pcall(function()
                local args = {
                    [1] = "Blacknwhite27"
                }

                game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer(unpack(args))
                task.wait()
            end)
            end
        end)
        task.spawn(function()
            while autoFarmLoopRunning do
                pcall(function()
                    data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
                    local formtouse;

                    if transformStatus == true and game.Workspace.Living[targetted].Stats.Ki.Value > 300 and
                        game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId].Quest.Value ~=
                        "X Fighter Trainer" then

                        local value = getCheckValue()
                        local alignment = data.Allignment.Value
                        local forms = FormsList[alignment]
                        local Paidforms = PaidFormsList[alignment]

                        local matchFound = false 
                        local paidmatchFound = false

                        for _, form in ipairs(Paidforms) do
                            if value >= form.reqvalue and value <= form.endrangevalue and form.reqvalue >=
                                data.Rebirth.Value and form.formOwned == true then

                                formtouse = form.name
                                paidmatchFound = true 
                                break 
                            end

                        end

                        if paidmatchFound == false and isLoop1Active then
                            for _, form in ipairs(forms) do
                                if value >= form.reqvalue and value <= form.endrangevalue and form.reqvalue >=
                                    data.Rebirth.Value then
                                    formtouse = form.name
                                    matchFound = true 

                                    break 
                                end
                            end
                        end

                        if not matchFound and not paidmatchFound and isLoop1Active then
                            for _, form in ipairs(forms) do
                                if form.rebirthReq >= data.Rebirth.Value then
                                    formtouse = form.name
                                    break
                                end
                            end

                        end
                        equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
                        equipRemote:InvokeServer(formtouse)
                        repeat
                            task.wait()
                            if game.Players.LocalPlayer.Status.SelectedTransformation.Value ~=
                                game.Players.LocalPlayer.Status.Transformation.Value then
                                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
                            end
                        until game.Players.LocalPlayer.Status.SelectedTransformation.Value ==
                            game.Players.LocalPlayer.Status.Transformation.Value or
                            game.Workspace.Living[targetted].Stats.Ki.Value < 300
                    end

                end)
                task.wait(.5)
            end
        end)
        charge = true
    end

    if flying == false and getgenv().dead == false and autoFarmLoopRunning == true then
        success, err = pcall(function()

            game.Workspace.Living:WaitForChild(targetted)
            game.Workspace.Living[targetted]:WaitForChild("HumanoidRootPart")
            local bv = game.Workspace.Living[targetted].HumanoidRootPart:WaitForChild("BodyVelocity")
            local bg = game.Workspace.Living[targetted].HumanoidRootPart:WaitForChild("BodyGyro")
            

            bg.P = 1
            bg.MaxTorque = Vector3.new(500000, 500000, 500000)
            bv.P = 1
            bv.MaxForce = Vector3.new(100000, 100000, 100000)
            flying = true
        end)
        if success then
            warn("Fly Function executed successfully")
            -- Access the result returned by the function
            
        else
            warn("Error occurred:", err)
            
        end
    end

    if getgenv().dead == false and autoFarmLoopRunning == true then
       warn("entered if for auto farm loop")
        task.wait()

        
             success, err = pcall(function()
                while autoFarmLoopRunning do
                    task.wait()
                    check1()
                    local SelectedQuests, SelectedMobs, sameplanet;
                     success1, err1 = pcall(function()

                        while autoFarmLoopRunning do
                            if breakagain == true then
                                breakagain = false
                                break
                            end
                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
                                    task.wait()
                                    local q;
                                    getgenv().switch1 = 1
                                    q = getgenv().switch1
                                    SelectedQuests, SelectedMobs, sameplanet = getQuest(q)

                                    if v.Name:lower() == SelectedMobs:lower() then

                                        local humanoid = v.Humanoid

                                        if humanoid then
                                            local currentState = humanoid:GetState()

                                            if currentState == Enum.HumanoidStateType.Dead then
                                                getgenv().switch1 = 2
                                                q = getgenv().switch1
                                                SelectedQuests, SelectedMobs, sameplanet = getQuest(q)

                                            end
                                        end
                                        break
                                    end
                                end
                            end

                            if string.len(game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId]
                                              .Quest.Value) <= 0 or questneeded == true then
                                
                                SelectedMobs1 = SelectedMobs

                                checkValue = getCheckValue()
                                if checkValue >= 150000000 and game.placeId ~= 5151400895 then
                                    SelectedQuests, SelectedMobs1 = "SSJG Kakata", "SSJG Kakata"
                                    local A_1 = "Vills Planet"
                                    local Event = game:GetService("ReplicatedStorage").Package.Events.TP
                                    Event:InvokeServer(A_1)
                                end

                                if game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId].Quest
                                    .Value ~= SelectedQuests and  isLoop1Active then 
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService(
                                                                                                     "Workspace").Others
                                                                                                     .NPCs[SelectedQuests]
                                                                                                     .HumanoidRootPart
                                                                                                     .CFrame
                                    repeat
                                        task.wait()

                                        game.ReplicatedStorage.Package.Events.Qaction:InvokeServer(game:GetService(
                                                                                                       "Workspace").Others
                                                                                                       .NPCs[SelectedQuests])
                                    until game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId]
                                        .Quest.Value == SelectedQuests or
                                        game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                end -- undefine
                                
                            end

                            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
                                    task.wait()

                                    if v.Name:lower() == SelectedMobs1:lower() and isLoop1Active and game.Players.LocalPlayer.Character and
                                        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                                        v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 or v.Name:lower() == "ssjg kakata" and SelectedMobs1:lower() == "ssjg kakata" then
                                        task.wait()
                                        if v.Name:lower() == "ssjg kakata" then
                                            repeat
                                                pcall(function()
                                                    if v.Humanoid.Health > 0 then
                                                        ssjgalive = true
                                                    end
                                                    end)
                                            wait()
                                            until ssjgalive == true
end
                                        
                                        questneeded = false
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart
                                                                                                         .CFrame +
                                                                                                         Vector3.new(0,
                                                0, 0)
                                        

                                        local Echar = v
                                        task.spawn(function()
                                            repeat

                                                local myChar = game.Players.LocalPlayer.Character
                                                
                                                myChar.HumanoidRootPart.CFrame =
                                                    Echar:GetPrimaryPartCFrame() * CFrame.new(0, 0, 5)

                                                task.wait()
                                            until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                                game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                        end)

                                        task.wait(0.2)
                                        local alignment = data.Allignment.Value
                                        if alignment == "Evil" then
                                            puntype = "Soul Punisher"
                                        else
                                            puntype = "Destruction"

                                        end
                                        repeat
                                            task.wait()
                                            
                                            if checkValue > 2100000 and game.Workspace.Living[targetted].Stats.Ki.Value >
                                                10000 then -- op move stack 1

                                                repeat
                                                   
                                                   
                                                        task.wait()
                                                        A_2 = "Blacknwhite27"
                                                        local spam = 0
                                                        repeat
                                                            task.spawn(function()
                                                        
                                                               
                                                        
                                                        for _, A_1 in ipairs(attacks2) do
                                                                      if isLoop1Active then
                                                            task.spawn(function()                                            
                                                                task.wait()
                                                                game:GetService("ReplicatedStorage").Package.Events.mel:InvokeServer(
                                                                    A_1, A_2)
                                                            end) 
                                                            end
                                                            
                                                         
                                                        end
                                                        spam = spam + 1
                                                        wait(.1)
                                                    end) 
                                                    until spam == 10 or
                                                    game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                                    
                                                    
                                                    
                                                    

                                                    task.wait(0.3)
                                                until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                                    game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
                                                    game.Workspace.Living[targetted].Stats.Ki.Value < 10000
                                            else
                                                task.spawn(function()
                                                    repeat
                                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer(
                                                            "Blacknwhite27", 1)
                                                        task.wait()
                                                    until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                                        game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
                                                        game.Workspace.Living[targetted].Stats.Ki.Value > 10000 and
                                                        checkValue > 2100000

                                                end)

                                                repeat
                                                    if game.Workspace.Living[targetted].Stats.Ki.Value > 400 then

                                                        task.wait()
                                                        local Event =
                                                            game:GetService("ReplicatedStorage").Package.Events.mel
                                                        local A_2 = "Blacknwhite27"
                                                        task.spawn(function()
                                                            local A_1 = "Mach Kick"
                                                            Event:InvokeServer(A_1, A_2)

                                                        end)
                                                        task.spawn(function()
                                                            A_1 = "Energy Volley"
                                                            A_2 = {
                                                                ["FaceMouse"] = false,
                                                                ["MouseHit"] = CFrame.new(15932.0273, -12.8115005,
                                                                    15540.2061, 0.983303905, -0.0826973468, 0.162094966,
                                                                    0, 0.89077127, 0.454452157, -0.181971505,
                                                                    -0.446864575, 0.875898659)
                                                            }
                                                            A_3 = "Blacknwhite27"
                                                            Event =
                                                                game:GetService("ReplicatedStorage").Package.Events
                                                                    .voleys
                                                            Event:InvokeServer(A_1, A_2, A_3)

                                                        end)
                                                        task.wait(.3)
                                                    else

                                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer(
                                                            "Blacknwhite27", 1)

                                                        task.wait()

                                                    end
                                                    task.wait()
                                                until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                                    game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
                                                    game.Workspace.Living[targetted].Stats.Ki.Value > 10000 and
                                                    checkValue > 2100000

                                            end
                                            task.wait()
                                        until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
                                            game.Players.LocalPlayer.Character.Humanoid.Health <= 0
                                            
                                        if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
                                            getgenv().stackneeded = true
                                            getgenv().dead = true
                                            autoFarmLoopRunning = false
                                            flying = false
                                            charge = false
                                            questneeded = true

                                        end
                                        breakagain = true
                                        break
                                    end

                                end
                            else
                                questneeded = true
                            end
                            task.wait()
                        end
                    end)
                    if success1 then
                        warn("Function executed successfully")
                       
                        
                    else
                        warn("Error occurred:", err1)
                        questneeded = true
                    end
                end
            
            end)
            if success then
                warn("Function executed successfully")
                
                
            else
                warn("Error occurred:", err)
                questneeded = true
            end
            task.wait()
        
        
    end
end



        end
        wait(1)
    end
end)()

-- Ejecutar bucle 2:
coroutine.wrap(function()
    while true do
        if isLoop2Active then
            local success, err = pcall(function()
                while isLoop2Active do
                                    game.ReplicatedStorage.Package.Events.cha:InvokeServer("Blacknwhite27")
                    game:GetService("ReplicatedStorage"):WaitForChild("Package"):WaitForChild("Events"):WaitForChild("reb"):InvokeServer()
                                     game.ReplicatedStorage.Package.Events.cha:InvokeServer("Blacknwhite27")
                    game.ReplicatedStorage.Package.Events.cha:InvokeServer("Blacknwhite27")
                    
                    task.wait(0.2) -- Ajusta este valor según la rapidez que necesites
                end
            end)

            if not success then
                warn("Error en loop2:", err)
            end
        end
        task.wait(0.2) -- Ajusta este valor para el tiempo de espera entre iteraciones del bucle principal
    end
end)()

-- Ejecutar bucle 3:
coroutine.wrap(function()
    while true do
        if isLoop3Active then
            spawn(function()
                local success, err = pcall(function()
                    local replicatedStorage = game:GetService("ReplicatedStorage")
                    local events = replicatedStorage.Package.Events
                    local target = "Blacknwhite27"

                    -- Llamadas agrupadas para reducir overhead
                    pcall(function()
                        events.cha:InvokeServer(target)
                        events.voleys:InvokeServer("Energy Volley", { FaceMouse = false, MouseHit = CFrame.new() }, target)
                        events.mel:InvokeServer("High Power Rush", target)
                        events.cha:InvokeServer(target)
                        events.mel:InvokeServer("Mach Kick", target)
                        events.mel:InvokeServer("Wolf Fang Fist", target)
                        events.mel:InvokeServer("Super Dragon Fist", target)
                        events.mel:InvokeServer("Spirit Barrage", target)
                        events.mel:InvokeServer("God Slicer", target)
                        events.mel:InvokeServer("Flash Kick", target)
                        events.mel:InvokeServer("Spirit Breaking Cannon", target)
                        events.mel:InvokeServer("Meteor Strike", target)
                        events.mel:InvokeServer("Vanish Strike", target)
                        events.mel:InvokeServer("Bone Charge", target)
                        events.mel:InvokeServer("Uppercut", target)
                        events.mel:InvokeServer("Sledgehammer", target)
                        events.mel:InvokeServer("Vital Strike", target)
                        events.cha:InvokeServer(target)
                        
                        local args = { [1] = true }
                        game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
                        game.Players.LocalPlayer.Status.Blocking.Value = true
                        events.p:FireServer(target, 1)
                    end)

                    -- Espera antes de la siguiente iteración para reducir carga
                    task.wait(0.2)
                end)

                -- Manejo de errores
                if not success then
                    warn("Error en loop7:", err)
                end
            end)
        end
        task.wait(0.2) -- Aumentar la espera entre iteraciones principales para reducir la frecuencia de ejecución
    end
end)()

-- Bucle para manejo de muerte y otros eventos
spawn(function()
    while true do
        pcall(function()
            spawn(function()
                repeat
                    local success1, err1 = pcall(function()
                        task.wait(0.1) -- Aumentar la espera para verificar menos frecuentemente
                        deadcheck(false)
                    end)
                until not success1 or err1

                -- Manejo de errores
                if not success1 then
                    warn("Error en el manejo de muerte:", err1)
                end

                task.wait(0.2) -- Aumentar la espera entre iteraciones para reducir la carga
            end)
        end)
        task.wait(0.1) -- Aumentar la espera entre iteraciones principales para reducir la frecuencia de ejecución
    end
end)

-- Bucle para manejo de spam
spawn(function()
    while true do
        local spam = 0
        repeat
            local success, err = pcall(function()
                spam = spam + 1
                task.wait(0.5) -- Aumentar la espera entre iteraciones para reducir la frecuencia del spam
            end)
        until spam == 12 or not success

        -- Manejo de errores
        if not success then
            warn("Error en el spam:", err)
        end

        task.wait(2)
    end
end)()
            end

PGPDYH_fake_script()
