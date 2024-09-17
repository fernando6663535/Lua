local player = game.Players.LocalPlayer
local teleportService = game:GetService("TeleportService")
local queueTeleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

local function executeScripts()
    -- Ejecuta ambos scripts desde las URLs proporcionadas
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Fer3.lua'))()
    if queueTeleport then
        queueTeleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Fer3.lua'))()")
        queueTeleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Freettt.lua'))()")
    end
end

local function onTeleport()
    executeScripts()
end

-- Ejecuta los scripts inmediatamente
executeScripts()

-- Configura eventos para ejecutar los scripts durante el teletransporte
teleportService.TeleportInitFailed:Connect(onTeleport)
teleportService.TeleportCompleted:Connect(onTeleport)
