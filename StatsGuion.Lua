local s = game.Players.LocalPlayer.PlayerGui.Main.MainFrame.Frames.Stats
s.Visible, s.Position = true, UDim2.new(0, 0, 0, 0)
s.Visible, s.Position = true, UDim2.new(0.3, 0, 0.2, 22)
s.BackgroundColor3 = Color3.new(0, 0, 0)
s.Size = UDim2.new(0.1, 298, 0.1, 298)

-- Cambiar el color del texto dentro del objeto "Stats" y agregar contorno rojo
for _, child in ipairs(s:GetChildren()) do
    if child:IsA("TextLabel") then
        child.TextColor3 = Color3.new(0, 0, 0) 
        child.TextStrokeColor3 = Color3.new(0, 0, 255) 
        child.TextStrokeTransparency = 0 
    end
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

-- Función para actualizar los números originales y hacerlos invisibles
local function updateOriginalNumbers()
    for _, child in ipairs(s:GetChildren()) do
        if child:IsA("TextLabel") then
            local numbers = tonumber(child.Text:match("%d+"))
            if numbers then
                local formattedNumber = formatNumber(numbers)
                child.Text = formattedNumber
                child.Visible = false -- Hacer invisible el número original
            end
        end
    end
end

-- Función para actualizar los números clonados
local function updateClonedNumbers()
    for _, child in ipairs(s:GetChildren()) do
        if child:IsA("TextLabel") and string.find(child.Name, "Cloned") then
            local original = s:FindFirstChild(child.Name:gsub("Cloned", ""))
            if original then
                local numbers = tonumber(original.Text:match("%d+"))
                if numbers then
                    local formattedNumber = formatNumber(numbers)
                    local prefix = ""  -- Inicializar el prefijo como una cadena vacía
                    if string.find(child.Name, "Strength") then
                        prefix = "Strength: "
                    elseif string.find(child.Name, "Speed") then
                        prefix = "Speed: "
                    elseif string.find(child.Name, "Defense") then
                        prefix = "Defense: "
                    elseif string.find(child.Name, "Energy") then
                        prefix = "Energy: "
                    elseif string.find(child.Name, "Rebirth") then
                        prefix = "Rebirth: "
                        child.TextColor3 = Color3.new(1, 1, 0)  -- Cambiar el color a amarillo
                    end
                    child.Text = prefix .. formattedNumber
                end
            end
        end
    end
end

-- Actualizar los números originales y hacerlos invisibles
updateOriginalNumbers()

-- Clonar números formateados dentro del guion Stats
for _, child in ipairs(s:GetChildren()) do
    if child:IsA("TextLabel") then
        local numbers = tonumber(child.Text:match("%d+"))
        if numbers then
            local formattedNumber = formatNumber(numbers)
            local clonedLabel = Instance.new("TextLabel", s)
            clonedLabel.Name = "Cloned" .. child.Name
            clonedLabel.Text = child.Name .. " " .. formattedNumber  -- Agregar las palabras al inicio del número clonado
            clonedLabel.Font = Enum.Font.SourceSansBold -- Cambiar la fuente a SourceSansBold
            clonedLabel.TextSize = 45 -- Ajustar el tamaño del texto
            clonedLabel.TextColor3 = Color3.new(1, 1, 1)
            clonedLabel.BackgroundTransparency = 1
            clonedLabel.Position = child.Position
            clonedLabel.Size = child.Size
            if string.find(child.Name, "Rebirth") then
                clonedLabel.TextColor3 = Color3.new(1, 1, 0)  -- Cambiar el color a amarillo
            end
        end 
    end
end

-- Actualizar los números clonados cada segundo
while true do
    updateClonedNumbers()
    wait(1)
end
