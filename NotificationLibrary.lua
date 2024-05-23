local function createModernNotification(title, text, duration, iconId)
    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = "NotificationGui"
    gui.Parent = player.PlayerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.25, 0, 0.1, 0)  -- Más estrecho en los lados
    frame.Position = UDim2.new(0.725, 0, 0.85, 0)  -- Posición en la esquina inferior derecha
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)  -- Color negro brillante y un poco más claro
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 3  -- Grosor del borde
    frame.BorderColor3 = Color3.fromRGB(30, 30, 30)  -- Borde negro brillante y un poco más claro
    frame.Parent = gui

    local icon = Instance.new("ImageLabel")
    icon.Size = UDim2.new(0.2, 0, 0.8, 0)
    icon.Position = UDim2.new(0.05, 0, 0.1, 0)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://" .. iconId
    icon.Parent = frame

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = title
    titleLabel.Font = Enum.Font.SourceSansSemibold
    titleLabel.TextSize = 14
    titleLabel.Size = UDim2.new(0.75, 0, 0.5, 0)
    titleLabel.Position = UDim2.new(0.25, 0, 0, 0)  -- Ajuste de posición
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = frame

    local textLabel = Instance.new("TextLabel")
    textLabel.Text = text
    textLabel.Font = Enum.Font.SourceSans
    textLabel.TextSize = 12
    textLabel.Size = UDim2.new(0.75, 0, 0.5, 0)
    textLabel.Position = UDim2.new(0.25, 0, 0.5, 0)  -- Ajuste de posición
    textLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    textLabel.BackgroundTransparency = 1
    textLabel.Parent = frame

    frame.Position = UDim2.new(1, 0, 1, 0)
    frame:TweenPosition(UDim2.new(0.725, 0, 0.85, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)

    wait(duration)
    frame:TweenPosition(UDim2.new(1, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.5, true)
    wait(0.5)
    gui:Destroy()
end

-- Ejemplo de uso:
createModernNotification("Farmeo/:3_V.2.12❤️", "'♻️' -👀", 5, 17418906670)
