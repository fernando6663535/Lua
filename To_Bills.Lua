local player = game.Players.LocalPlayer
local teleportService = game:GetService("TeleportService")
local queueTeleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

local function executeScript()
    if queueTeleport then
        queueTeleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/fernando6663535/Lua/main/Farm.lua'))()")
    end
end

local function onTeleport()
    executeScript()
end

teleportService.TeleportInitFailed:Connect(onTeleport)
teleportService.TeleportCompleted:Connect(onTeleport)

executeScript()
