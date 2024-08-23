-- Cargar el contenido externo al inicio
local success, err = pcall(function()
    
end)

if not success then
    warn("Error al cargar Farm.lua: ", err)
end

-- Definición de funciones y variables
local cloneref = cloneref or function(o) return o end
Players = cloneref(game:GetService("Players"))
HttpService = cloneref(game:GetService("HttpService"))

Holder = Instance.new("Frame")
Title = Instance.new("TextLabel")
Plugins = Instance.new("TextLabel")
PluginsFrame = Instance.new("Frame")
SaveChatlogs = Instance.new("TextButton")
join = Instance.new("Frame")
selectJoin = Instance.new("TextButton")

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

IYMouse = Players.LocalPlayer:GetMouse()
PlayerGui = Players.LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
UserInputService = cloneref(game:GetService("UserInputService"))
TweenService = cloneref(game:GetService("TweenService"))
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
    return tonumber(str) ~= nil or str == 'inf'
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

function saves()
    if writefileExploit() and readfileExploit() and jsonAttempts < 10 then
        local readSuccess, out = readfile("IY_FE.iy", true)
        if readSuccess then
            if out ~= nil and tostring(out):gsub("%s", "") ~= "" then
                local success, response = pcall(function()
                    local json = HttpService:JSONDecode(out)
                    if json.prefix ~= nil then prefix = json.prefix else prefix = ';' end
                    if json.StayOpen ~= nil then StayOpen = json.StayOpen else StayOpen = false end
                    if json.keepIY ~= nil then KeepInfYield = json.keepIY else KeepInfYield = true end
                    if json.espTransparency ~= nil then espTransparency = json.espTransparency else espTransparency = 0.3 end
                    if json.logsEnabled ~= nil then logsEnabled = json.logsEnabled else logsEnabled = false end
                    if json.jLogsEnabled ~= nil then jLogsEnabled = json.jLogsEnabled else jLogsEnabled = false end
                    if json.aliases ~= nil then aliases = json.aliases else aliases = {} end
                    if json.binds ~= nil then binds = (json.binds or {}) else binds = {} end
                    if json.spawnCmds ~= nil then spawnCmds = json.spawnCmds end
                    if json.WayPoints ~= nil then AllWaypoints = json.WayPoints else WayPoints = {} AllWaypoints = {} end
                    if json.PluginsTable ~= nil then PluginsTable = json.PluginsTable else PluginsTable = {} end
                    if json.currentShade1 ~= nil then currentShade1 = Color3.new(json.currentShade1[1],json.currentShade1[2],json.currentShade1[3]) end
                    if json.currentShade2 ~= nil then currentShade2 = Color3.new(json.currentShade2[1],json.currentShade2[2],json.currentShade2[3]) end
                    if json.currentShade3 ~= nil then currentShade3 = Color3.new(json.currentShade3[1],json.currentShade3[2],json.currentShade3[3]) end
                    if json.currentText1 ~= nil then currentText1 = Color3.new(json.currentText1[1],json.currentText1[2],json.currentText1[3]) end
                    if json.currentText2 ~= nil then currentText2 = Color3.new(json.currentText2[1],json.currentText2[2],json.currentText2[3]) end
                    if json.currentScroll ~= nil then currentScroll = Color3.new(json.currentScroll[1],json.currentScroll[2],json.currentScroll[3]) end
                    if json.eventBinds ~= nil then loadedEventData = json.eventBinds end
                end)
                if not success then
                    jsonAttempts = jsonAttempts + 1
                    warn("Save Json Error:", response)
                    warn("Overwriting Save File")
                    writefile("IY_FE.iy", defaults, true)
                    wait()
                    saves()
                end
            else
                writefile("IY_FE.iy", defaults, true)
                wait()
                local dReadSuccess, dOut = readfile("IY_FE.iy", true)
                if dReadSuccess and dOut ~= nil and tostring(dOut):gsub("%s", "") ~= "" then
                    saves()
                else
                    nosaves = true
                    useFactorySettings()
                    createPopup("There was a problem writing a save file to your PC.\n\nPlease contact the developer/support team for your exploit and tell them writefile/readfile is not working.\n\nYour settings, keybinds, waypoints, and aliases will not save if you continue.\n\nThings to try:\n> Make sure a 'workspace' folder is located in the same folder as your exploit\n> If your exploit is inside of a zip/rar file, extract it.\n> Rejoin the game and try again or restart your PC and try again.")
                end
            end
        else
            writefile("IY_FE.iy", defaults, true)
            wait()
            local dReadSuccess, dOut = readfile("IY_FE.iy", true)
            if dReadSuccess and dOut ~= nil and tostring(dOut):gsub("%s", "") ~= "" then
                saves()
            else
                nosaves = true
                useFactorySettings()
                createPopup("There was a problem writing a save file to your PC.\n\nPlease contact the developer/support team for your exploit and tell them writefile/readfile is not working.\n\nYour settings, keybinds, waypoints, and aliases will not save if you continue.\n\nThings to try:\n> Make sure a 'workspace' folder is located in the same folder as your exploit\n> If your exploit is inside of a zip/rar file, extract it.\n> Rejoin the game and try again or restart your PC and try again.")
            end
        end
    else
        if jsonAttempts >= 10 then
            nosaves = true
            useFactorySettings()
            createPopup("Sorry, we have attempted to parse your save file, but it is unreadable!\n\nInfinite Yield is now using factory settings until your exploit's file system works.\n\nYour save file has not been deleted.")
        else
            nosaves = true
            useFactorySettings()
        end
    end
end

saves()

local TeleportCheck = false
Players.LocalPlayer.OnTeleport:Connect(function(State)
    print("Teleport detectado: ", State)
    if KeepInfYield and not TeleportCheck and queueteleport then
        TeleportCheck = true
        queueteleport([[
            task.wait(4.5)
            local success, err = pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/fernando6663535/Lua/main/Farm.lua'))()
            end)
            if not success then
                warn("Error al cargar Farm.lua después del teletransporte: ", err)
            end
        ]])
    end
end)
