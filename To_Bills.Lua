local player = game.Players.LocalPlayer
local teleportService = game:GetService("TeleportService")
local queueTeleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

local function executeScripts()
    if queueTeleport then
        queueTeleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Fer3.lua'))()")
        queueTeleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Freettt.lua'))()")
    end
end

local function onTeleport()
    executeScripts()
end

-- Ejecutar el primer script una sola vez al inicio
local function initialExecution()
    local success, result = pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Fer3.lua'))()
    end)
    if not success then
        warn("Error ejecutando el script inicial:", result)
    end
end

-- Ejecutar el script inicial
initialExecution()

-- Conectar los eventos para detectar cuando el jugador es teletransportado
teleportService.TeleportInitFailed:Connect(onTeleport)
teleportService.TeleportCompleted:Connect(onTeleport)

-- Ejecutar ambos scripts manualmente para asegurarse de que el código se ejecute si ya está en el proceso de teletransporte
executeScripts()
