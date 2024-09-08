-- Cargar y ejecutar el primer script
loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Lua/main/To_Bills.Lua"))()

-- Obtener el jugador local
local player = game.Players.LocalPlayer

-- Función para ejecutar el segundo script
local function executeSecondScript()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Fern.lua"))()
end

-- Verificar el lugar y realizar acciones basadas en la condición
if game.PlaceId == 5151400895 then
    local data = game.ReplicatedStorage.Datas[player.UserId]
    if data.Strength.Value >= 8000000 then
        wait(4)
        game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Godly SSJ2")
        wait(1)
        game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
    end
    wait()
end

-- Ejecutar el segundo script
executeSecondScript()
