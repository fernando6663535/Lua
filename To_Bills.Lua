local cloneref = cloneref or function(o) return o end
COREGUI = cloneref(game:GetService("CoreGui"))
Players = cloneref(game:GetService("Players"))
Holder = Instance.new("Frame")
Title = Instance.new("TextLabel")
Plugins = Instance.new("TextLabel")
PluginsFrame = Instance.new("Frame")
SaveChatlogs = Instance.new("TextButton")
join = Instance.new("Frame")
selectJoin = Instance.new("TextButton")

shade1 = {}
shade2 = {}
shade3 = {}
text1 = {}
text2 = {}
scroll = {}

Plugins = Instance.new("TextButton")
Plugins.Position = UDim2.new(0, 5, 0, 175)
Plugins.Size = UDim2.new(1, -10, 0, 25)
Plugins.Name = "Plugins"
Plugins.Parent = SettingsHolder

join.Name = "join"
join.Parent = background
join.Active = true
join.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.145098)
join.BorderSizePixel = 0
join.ClipsDescendants = true
join.Size = UDim2.new(0, 338, 0, 245)
join.Visible = false
join.ZIndex = 10
table.insert(shade1, join)

IYMouse = Players.LocalPlayer:GetMouse()
PlayerGui = Players.LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
UserInputService = cloneref(game:GetService("UserInputService"))
TweenService = cloneref(game:GetService("TweenService"))
HttpService = cloneref(game:GetService("HttpService"))
MarketplaceService = cloneref(game:GetService("MarketplaceService"))
RunService = cloneref(game:GetService("RunService"))
TeleportService = cloneref(game:GetService("TeleportService"))
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
PlaceId, JobId = game.PlaceId, game.JobId

local writefile = type(writefile) == "function" and function(file, data, safe)
    if safe == true then return pcall(writefile, file, data) end
    writefile(file, data)
end

local readfile = type(readfile) == "function" and function(file, safe)
    if safe == true then return pcall(readfile, file) end
    return readfile(file)
end

function writefileExploit()
    if writefile then
        return true
    end
end

function readfileExploit()
    if readfile then
        return true
    end
end

function isNumber(str)
    if tonumber(str) ~= nil or str == 'inf' then
        return true
    end
end

AllWaypoints = {}

eventEditor = (function()
    local events = {}

    local function registerEvent(name, sets)
        events[name] = {
            commands = {},
            sets = sets or {}
        }
    end

    local onEdited = nil

    local function saveData()
        local result = {}
        for i, v in pairs(events) do
            result[i] = v.commands
        end
        return HttpService:JSONEncode(result)
    end

    local function loadData(str)
        local data = HttpService:JSONDecode(str)
        for i, v in pairs(data) do
            if events[i] then
                events[i].commands = v
            end
        end
    end

    return {
        SaveData = saveData,
        LoadData = loadData,
    }
end)()

local loadedEventData = nil
local jsonAttempts = 0
function saves()
    if writefileExploit() and readfileExploit() and jsonAttempts < 10 then
        local readSuccess, out = readfile("IY_FE.iy", true)
        if readSuccess and out and out:match("%S") then
            local success, json = pcall(HttpService.JSONDecode, HttpService, out)
            if success then
                prefix = json.prefix or prefix
                StayOpen = json.StayOpen or StayOpen
                KeepInfYield = json.keepIY or KeepInfYield
                loadedEventData = json.eventBinds or loadedEventData
            else
                jsonAttempts = jsonAttempts + 1
                warn("Save Json Error:", json)
                writefile("IY_FE.iy", defaults, true)
                wait()
                saves()
            end
        else
            writefile("IY_FE.iy", defaults, true)
            nosaves = true
            useFactorySettings()
        end
    else
        nosaves = true
        useFactorySettings()
    end
end

saves()

local TeleportCheck = false
local executedOnce = false  -- Variable para rastrear si el código ya ha sido ejecutado

Players.LocalPlayer.OnTeleport:Connect(function(State)
    if KeepInfYield and not TeleportCheck and queueteleport and not executedOnce then
        TeleportCheck = true  -- Cambiar a true para prevenir múltiples ejecuciones simultáneas
        executedOnce = true  -- Marcar como ejecutado para evitar futuras ejecuciones

        queueteleport([[
            task.wait(0.3)
            loadstring(game:HttpGet('https://raw.githubusercontent.com/fernando6663535/Lua/main/Farm.lua'))()
        ]])
    end
end)
