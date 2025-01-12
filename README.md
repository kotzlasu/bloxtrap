local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Bitting Simulator",
    LoadingTitle = "Tester Hub",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Tester Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

local MainTab = Window:CreateTab("Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
    Title = "Miłego Korzystania",
    Content = ":3",
    Duration = 5,
    Image = nil,
    Actions = { -- Notification Buttons
        Ignore = {
            Name = "Okay!",
            Callback = function()
                print("The user tapped Okay!")
            end,
        },
    },
})

local Dropdown = MainTab:CreateDropdown({
    Name = "Select Area",
    Options = {"Starter Island", "Desert Island", "City Island", "Moon Island", "Mushroom Island", "Candy Island", "Floating Island", "Tea Land", "Food Land"},
    CurrentOption = {"Starter Island"},
    MultipleOptions = false,
    Flag = "teleport", -- A flag is the identifier for the dropdown
    Callback = function(Option)
        local optionName = ""
        for _, name in pairs(Option) do
            optionName = name
            break
        end
        print("Selected option:", optionName)
        local teleportLocations = {
            ["Starter Island"] = Vector3.new(-136.558, 44.816, -243.592),
            ["Desert Island"] = Vector3.new(307.058, 42.179, 216.119),
            ["City Island"] = Vector3.new(-668.565, 42.179, 268.471),
            ["Moon Island"] = Vector3.new(523.635, 37.239, -420.825),
            ["Mushroom Island"] = Vector3.new(-683.439, 39.821, -877.503),
            ["Candy Island"] = Vector3.new(215.833, 38.825, -904.521),
            ["Floating Island"] = Vector3.new(704.831, 83.19, -954.449),
            ["Tea Land"] = Vector3.new(315.476, 42.077, -1354.354),
            ["Food Land"] = Vector3.new(-248, 37, -1376)
        }

        local selectedPosition = teleportLocations[optionName]
        print("Selected position:", selectedPosition)
        if selectedPosition then
            local character = game.Players.LocalPlayer.Character
            print("Character:", character)
            if character and character:FindFirstChild("HumanoidRootPart") then
                print("HumanoidRootPart found. Teleporting...")
                character.HumanoidRootPart.CFrame = CFrame.new(selectedPosition)
            else
                print("HumanoidRootPart not found in character!")
            end
        else
            print("Selected position not found in teleportLocations table.")
        end
    end,
})
local PlayerTab = Window:CreateTab("Player", nil)
local PlayerSection = PlayerTab:CreateSection("Player")

local Toggle = PlayerTab:CreateToggle({
   Name = "Inf Jump",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
--Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
    --Ensures this only runs once to save resources
    _G.infinJumpStarted = true

    --Notifies readiness
    game.StarterGui:SetCore("SendNotification", {Title="Tester Hub"; Text="If you see this, it means it's working"; Duration=5;})

    --The actual infinite jump
    local plr = game:GetService('Players').LocalPlayer
    local m = plr:GetMouse()
    m.KeyDown:connect(function(k)
        if _G.infinjump then
            if k:byte() == 32 then
                humanoid = game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                humanoid:ChangeState('Jumping')
                wait()
                humanoid:ChangeState('Seated')
            end
        end
    end)
end
   end,
})

local Slider = PlayerTab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 300},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "Slider1", -- A flag is the identifier for the configuration file
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
    end,
})

local Dropdown = MainTab:CreateDropdown({
    Name = "Area 1 Boss",
    Options = {"1Boss HP75 💪-1", "2Boss HP200 💪-2", "3Boss HP350 💪-3", "4Boss HP650 💪-5"},
    CurrentOption = {"Not Selected"},
    MultipleOptions = false,
    Flag = "teleport", -- A flag is the identifier for the dropdown
    Callback = function(Option)
        local optionName = ""
        for _, name in pairs(Option) do
            optionName = name
            break
        end
        print("Selected option:", optionName)
        local teleportLocations = {
            ["1Boss HP75 💪-1"] = Vector3.new(-148.55413818359375, 46.595645904541016, -293.77789306640625),
            ["2Boss HP200 💪-2"] = Vector3.new(-132.85650634765625, 51.154869079589844, -292.333740234375),
            ["3Boss HP350 💪-3"] = Vector3.new(-119.04786682128906, 48.10368347167969, -294.42449951171875),
            ["4Boss HP650 💪-5"] = Vector3.new(-106.0896987915039, 48.33304977416992, -294.2380676269531),
        }
        local selectedPosition = teleportLocations[optionName]
        print("Selected position:", selectedPosition)
        if selectedPosition then
            local character = game.Players.LocalPlayer.Character
            print("Character:", character)
            if character and character:FindFirstChild("HumanoidRootPart") then
                print("HumanoidRootPart found. Teleporting...")
                character.HumanoidRootPart.CFrame = CFrame.new(selectedPosition)
            else
                print("HumanoidRootPart not found in character!")
            end
        else
            print("Selected position not found in teleportLocations table.")
        end
    end,
})

local Dropdown = MainTab:CreateDropdown({
    Name = "Area 2 Boss",
    Options = {"1Boss HP650 💪-5", "2Boss HP1600 💪-10", "3Boss HP3500 💪-12", "4Boss HP5000 💪-15"},
    CurrentOption = {"Not Selected"},
    MultipleOptions = false,
    Flag = "teleport", -- A flag is the identifier for the dropdown
    Callback = function(Option)
        local optionName = ""
        for _, name in pairs(Option) do
            optionName = name
            break
        end
        print("Selected option:", optionName)
        local teleportLocations = {
            ["1Boss HP650 💪-5"] = Vector3.new(324.598, 42.323, 264.285),
            ["2Boss HP1600 💪-10"] = Vector3.new(309.658, 43.193, 260.515),
            ["3Boss HP3500 💪-12"] = Vector3.new(295.858, 43.193, 262.478),
            ["4Boss HP5000 💪-15"] = Vector3.new(286.258, 41.293, 263.378),
        }
        local selectedPosition = teleportLocations[optionName]
        print("Selected position:", selectedPosition)
        if selectedPosition then
            local character = game.Players.LocalPlayer.Character
            print("Character:", character)
            if character and character:FindFirstChild("HumanoidRootPart") then
                print("HumanoidRootPart found. Teleporting...")
                character.HumanoidRootPart.CFrame = CFrame.new(selectedPosition)
            else
                print("HumanoidRootPart not found in character!")
            end
        else
            print("Selected position not found in teleportLocations table.")
        end
    end,
})
