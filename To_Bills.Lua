local player = game.Players.LocalPlayer
local teleportService = game:GetService("TeleportService")
local queueTeleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

local function executeScripts()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Fer3.lua'))()
    
    if queueTeleport then
        queueTeleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Fer3.lua'))()")
        
        -- Ejecuta el segundo script después del primero
        wait(1)
        
        queueTeleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Freettt.lua'))()")
    end
end

local function onTeleport()
    executeScripts()
end

executeScripts()
teleportService.TeleportInitFailed:Connect(onTeleport)
teleportService.TeleportCompleted:Connect(onTeleport)
