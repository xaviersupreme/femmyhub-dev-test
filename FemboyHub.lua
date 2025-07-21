-- FemboyHub Main Script

-- Load the library
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/drillygzzly/Roblox-UI-Libs/main/1%20Tokyo%20Lib%20(FIXED)/Tokyo%20Lib%20Source.lua"))({
    cheatname = "FemboyHub",
    gamename = "Universal",
})

-- Initialize the library
library:init()
library:SetTheme(library.themes[1].theme) -- Set default theme

-- Load modules
local aimbot = require(game:GetService("ReplicatedStorage"):WaitForChild("modules"):WaitForChild("aimbot"))

-- Create the main window
local mainWindow = library.NewWindow({
    title = "FemboyHub",
    size = UDim2.new(0, 510, 0, 600)
})

-- Create the Aimbot tab
local aimbotTab = mainWindow:AddTab("Aimbot")

-- Aimbot Section
local aimbotSection = aimbotTab:AddSection("AimBot", 1)

aimbotSection:AddToggle({
    text = "Aimbot Enabled",
    flag = "aimbot_enabled",
    callback = function(v) aimbot:UpdateSettings({ enabled = v }) end
})

aimbotSection:AddToggle({
    text = "Prediction",
    flag = "aimbot_prediction",
    callback = function(v) aimbot:UpdateSettings({ prediction = v }) end
})

aimbotSection:AddList({
    text = "Aim Hitbox",
    values = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso", "Random"},
    selected = "HumanoidRootPart",
    flag = "aimbot_hitbox",
    callback = function(v) aimbot:UpdateSettings({ hitbox = v }) end
})

-- FOV Section
local fovSection = aimbotTab:AddSection("FOV", 1)

fovSection:AddToggle({
    text = "FOV Filled",
    flag = "aimbot_fovFilled",
    callback = function(v) aimbot:UpdateSettings({ fovFilled = v }) end
})

fovSection:AddSlider({
    text = "Silent FOV Size",
    min = 0,
    max = 500,
    increment = 1,
    value = 100,
    flag = "aimbot_silentFovSize",
    callback = function(v) aimbot:UpdateSettings({ silentFovSize = v }) end
})

fovSection:AddSlider({
    text = "Silent FOV Transparency",
    min = 0,
    max = 9,
    increment = 1,
    value = 9,
    flag = "aimbot_silentFovTransparency",
    callback = function(v) aimbot:UpdateSettings({ silentFovTransparency = v }) end
})

fovSection:AddSlider({
    text = "FOV Thickness",
    min = 0,
    max = 10,
    increment = 1,
    value = 2,
    flag = "aimbot_fovThickness",
    callback = function(v) aimbot:UpdateSettings({ fovThickness = v }) end
})

fovSection:AddColor({
    text = "FOV Color",
    color = Color3.fromRGB(132, 0, 255),
    flag = "aimbot_fovColor",
    callback = function(v) aimbot:UpdateSettings({ fovColor = v }) end
})

-- Aimbot Settings Section
local aimbotSettingsSection = aimbotTab:AddSection("Aimbot Settings", 2)

aimbotSettingsSection:AddList({
    text = "Aim Assist Type",
    values = {"Camera", "Mouse"},
    selected = "Camera",
    flag = "aimbot_aimAssistType",
    callback = function(v) aimbot:UpdateSettings({ aimAssistType = v }) end
})

aimbotSettingsSection:AddToggle({
    text = "Smoothness",
    flag = "aimbot_smoothness",
    callback = function(v) aimbot:UpdateSettings({ smoothness = v }) end
})

aimbotSettingsSection:AddSlider({
    text = "Smoothness Ammount",
    min = 0,
    max = 10,
    increment = 1,
    value = 2,
    flag = "aimbot_smoothnessAmount",
    callback = function(v) aimbot:UpdateSettings({ smoothnessAmount = v }) end
})

aimbotSettingsSection:AddSlider({
    text = "Prediction Velocity",
    min = 0,
    max = 60,
    increment = 1,
    value = 10,
    flag = "aimbot_predictionVelocity",
    callback = function(v) aimbot:UpdateSettings({ predictionVelocity = v }) end
})

aimbotSettingsSection:AddSlider({
    text = "Hit Chance",
    min = 0,
    max = 100,
    increment = 1,
    value = 100,
    flag = "aimbot_hitChance",
    callback = function(v) aimbot:UpdateSettings({ hitChance = v }) end
})

-- Trigger Bot Section
local triggerBotSection = aimbotTab:AddSection("Trigger Bot", 2)

triggerBotSection:AddToggle({
    text = "Trigger Bot Enabled",
    flag = "aimbot_triggerBot",
    callback = function(v) aimbot:UpdateSettings({ triggerBot = v }) end
})

triggerBotSection:AddSlider({
    text = "Delay (Ammount)",
    min = 0,
    max = 60,
    increment = 1,
    value = 0,
    flag = "aimbot_triggerBotDelay",
    callback = function(v) aimbot:UpdateSettings({ triggerBotDelay = v }) end
})

-- Connect the aimbot to the game loop
game:GetService("RunService").RenderStepped:Connect(function()
    aimbot:Run()
end)

library:SendNotification("FemboyHub Loaded!", 5)
print("FemboyHub Loaded!") 