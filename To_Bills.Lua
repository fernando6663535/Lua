
	-- Funciones
	local function mundoDeBills()
		game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Vills Planet")
	end
	local function statsAltos()
		local player = game.Players.LocalPlayer
		local statsFolder = game.Workspace.Living[player.Name].Stats
		local strength = statsFolder.Strength
		local speed = statsFolder.Speed
		local energy = statsFolder.Energy
		local defense = statsFolder.Defense
		local statsrequerimiento = game.Workspace.Living[player.Name].Stats.Rebirth.Value
		local b= statsrequerimiento*100
		local function s()
			while strength.Value<b do
				if strength.Value>=b then
					break
				end
			end
		end
		spawn (s)
		local function l()
			while energy.Value<b do
				wait(.3)
				--KIBLAST
				if  energy.Value >=b then
					break
				end
			end
		end
		spawn (l)
		local function m()
			while defense.Value <b do
				--DEFENSE
				wait(.3)
				if defense.Value >=b then
					break
				end
			end
		end
		spawn (m)
		local function p()
			while speed.Value <b do
				wait(.3)
				game:GetService("ReplicatedStorage"):WaitForChild("Package"):WaitForChild("Events"):WaitForChild("of"):FireServer()
				if speed.Value >=b then
					break
				end
			end
		end
		spawn (p)
		while speed.Value <b do
			wait(.3)
			if speed.Value >=b then
				break
			end
		end
	end
	
	local function statsBajos()
		local player = game.Players.LocalPlayer
		local statsFolder = game.Workspace.Living[player.Name].Stats
		local strength = statsFolder.Strength
		local speed = statsFolder.Speed
		local energy = statsFolder.Energy
		local defense = statsFolder.Defense
		local function s()
			while strength.Value<0 do
				wait(.3)
				--PUNCH
				if strength.Value>=0 then
					break
				end
			end
		end
		spawn (s)
		local function l()
			while energy.Value<0 do
				wait(.3)
				--KIBLAST
				if  energy.Value >=0 then
					break
				end
			end
		end
		spawn (l)
		local function m()
			while defense.Value <0 do
				--DEFENSE
				wait(.3)
				if defense.Value >=0 then
					break
				end
			end
		end
		spawn (m)
		local function p()
			while speed.Value <0 do
				wait(.3)
				game:GetService("ReplicatedStorage"):WaitForChild("Package"):WaitForChild("Events"):WaitForChild("of"):FireServer()
				if speed.Value >=0 then
					break
				end
			end
		end
		spawn (p)
		while speed.Value <0 do
			wait(.3)
			if speed.Value >=0 then
				break
			end
		end
	end
	
	firstquest = true
	autostack = false
	local plr = game.Players.LocalPlayer
	local player = game.Players.LocalPlayer
	local rs = game:GetService("RunService")
	local data = game.ReplicatedStorage.Datas[player.UserId]
	local events = game.ReplicatedStorage.Package.Events
	
	game:GetService("ReplicatedStorage").Package.Events.Start:InvokeServer()
	game:GetService("ReplicatedStorage").Package.Events.Start:InvokeServer()
	if data.Strength.Value>=8000000 then
	else
	end
	wait()
	-- ANTIAFK
	local bb=game:service'VirtualUser'
	game:service'Players'.LocalPlayer.Idled:connect(function()
		bb:CaptureController()bb:ClickButton2(Vector2.new())end)
	spawn(function()
		while _G.charge == true do
			wait ()	
		end 
	end)
	_G.block = true
	spawn(function ()
		while _G.block == true do
			local args = {
				[1] = true
			}
	
			game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(unpack(args))
			wait()
		end 
	end)
	
	
	local function kiRequerimiento()
		energya = game.Workspace.Living[player.Name].Stats.Energy.Value
		ki = game.Workspace.Living[player.Name].Stats.Ki.Value
		kiUsuario = energya / 500
		local function a(number)
			return math.floor(number + 0.5)
		end
		kiOriginal = a(kiUsuario)
		caca = kiOriginal / 6 + 100
		warn("Actualizada "..caca.." - "..kiOriginal)
	end
	kiRequerimiento()
	
	_G.fasesalv=true
	spawn(function ()
		while _G.fasesalv do
			local fases={"J"}
			local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
			local player = game.Players.LocalPlayer
			local skills = game.ReplicatedStorage.Package.Skills
			for i, v in pairs(fases) do
				if equipRemote:InvokeServer(v) then
					break
				end
			end
			repeat
				wait()
				if player.Status.SelectedTransformation.Value ~= player.Status.Transformation.Value then
					kiRequerimiento()
					if ki >= caca then
						warn("Tu ki es de: "..ki.." y el requerimiento es de "..caca)
						game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
					else
						warn("No tienes ki")
					end
				else
					warn("Ya tienes la fase")
				end
			until game.Players.LocalPlayer.Status.SelectedTransformation.Value == game.Players.LocalPlayer.Status.Transformation.Value
			wait()
		end
	end)


	-- validacion de stats
	local  function billsplanet()
		while true do
			local A_1 = "Earth"
			local Event = game:GetService("ReplicatedStorage").Package.Events.TP
			Event:InvokeServer(A_1)
			wait()
		end
	end
local function revisarStats()
-- variables
local a = data.Strength.Value
local b = data.Energy.Value
local c = data.Defense.Value
local d = data.Speed.Value
local f = data.Rebirth.Value
local treinkaK = 30000
if a < treinkaK or b < treinkaK or c < treinkaK or d < treinkaK then
	wait()
if f >=300 then
	statsAltos()
wait()
	if game.placeId ~= 3311165597 then 
		billsplanet()
	end
else
	statsBajos()
wait()
	if game.placeId ~= 3311165597 then 
		billsplanet()
	end
end
end
end

	-- Farm Logica
	local function autoquest(boolean)
		SelectedMobs = ""
		local a = data.Strength.Value
		local b = data.Energy.Value
		local c = data.Defense.Value
		local d = data.Speed.Value

		local minimo = a  -- initialize smallest variable to the first number

		if b < minimo then
			minimo = b
		end

		if c < minimo then
			minimo = c
		end

		if d < minimo then
			minimo = d
		end

		checkValue = minimo
		revisarStats()
		for indice, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
			revisarStats()-- revisa si tienes stats
				if minimo >= 29000 and minimo <200000 then
					if v.Humanoid.Health >0 and v.Name == "Kliin" then
						SelectedQuests = v.name
						SelectedMobs = SelectedQuests
						return
					end
				end
		end
	
		if checkValue >= 200000000 and game.placeId ~= 5151400895  then
			for indice, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
				delay(0.5,mundoDeBills)
				if v.Humanoid.Health>0 and v.Name == "SSJG akata" then
					SelectedQuests = v.name
					SelectedMobs = SelectedQuests
					return
				end
			end
		end
	end
	
	local function ataquesMultiquest()
		kiRequerimiento()
		if data.Strength.Value >10000000 and ki > caca and data.Strength.Value <2000000000000 then

		elseif data.Strength.Value <= 10000000 and ki > caca then

		end
	end
	
	getgenv().stacked = false 
	
	--Function
	local function quest()
		if game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value ~= SelectedQuests then
			player.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Others.NPCs[SelectedQuests].HumanoidRootPart.CFrame
			repeat
				wait()
				revisarStats()-- revisa si tienes stats
				events.Qaction:InvokeServer(game:GetService("Workspace").Others.NPCs[SelectedQuests])
			until game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value == SelectedQuests
		end
	end

	spawn(function()
		while true do wait()
			pcall(function()
				while true and wait() do
					if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  
					then
						for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
							revisarStats()-- revisa si tienes stats
							autoquest()	--inicia el farm
							if v.Name:lower() == SelectedMobs:lower() and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								quest()
								getgenv().farm = true
								repeat
									wait()
									plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
									delay(0.5,ataquesMultiquest)
									game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
								until getgenv().farm == false or v == nil or v.Humanoid.Health <= 0 or plr.Character.Humanoid.Health <= 0
	
								if plr.Character.Humanoid.Health <= 0 then 
									getgenv().farm = false
									getgenv().stacked = false
									repeat
										print("in auto loop died check")
										wait(1)
	
									until plr.Character.Humanoid.Health >= 0
									wait(1)
								end
	
							end
						end
					end
				end
			end)
		end
	end)
	
	state = true
	
	repeat wait(1)
		pcall(function()
	
			if getgenv().stacked == false then
				count = 0
				repeat 
					count = 1
					wait(1)
					stack()
					getgenv().stacked = true
				until count == 1
			end
			wait(1)
		end)
	until sddddddddddddddddd == 1032131313131313
