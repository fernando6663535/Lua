local player = game.Players.LocalPlayer

-- Ejecuta los scripts externos primero
loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Lua/main/Fer2.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Lua/main/To_Bills.Lua"))()

-- Verifica si el jugador está en el lugar con el ID especificado
if game.PlaceId == 5151400895 then
    local data = game.ReplicatedStorage.Datas[player.UserId]
    if data.Strength.Value >= 8000000 then
        wait(4)
        game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Godly SSJ2")
        wait(1)
        game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
    end
    wait(.01)
else
    -- Si no está en el lugar especificado, ejecuta directamente el loadstring
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Fernanflop091o/PARA_AMIGOS-ASER-SCRITP/main/Fern.lua"))()
end
