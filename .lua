-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GuiRufiego"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Enabled = true -- On by default
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Position = UDim2.new(0.341502, 0, 0.285917, 0)
Main.Size = UDim2.new(0, 400, 0, 300)
Main.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local Colors = Instance.new("Frame")
Colors.Name = "Colors"
Colors.Position = UDim2.new(0.0340021, 0, -0.000749207, 0)
Colors.Size = UDim2.new(0, 69, 0, 50)
Colors.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
Colors.BackgroundTransparency = 1
Colors.BorderSizePixel = 0
Colors.BorderColor3 = Color3.new(0, 0, 0)
Colors.Transparency = 1
Colors.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Red = Instance.new("Frame")
Red.Name = "Red"
Red.Position = UDim2.new(0.0425, 0, 0.34, 0)
Red.Size = UDim2.new(0, 15, 0, 15)
Red.BackgroundColor3 = Color3.new(1, 0.372549, 0.352941)
Red.BorderSizePixel = 0
Red.BorderColor3 = Color3.new(0, 0, 0)
Red.Parent = Colors

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Red

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Name = "UIListLayout"
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Colors

local Yellow = Instance.new("Frame")
Yellow.Name = "Yellow"
Yellow.Position = UDim2.new(0.0425, 0, 0.34, 0)
Yellow.Size = UDim2.new(0, 15, 0, 15)
Yellow.BackgroundColor3 = Color3.new(1, 0.745098, 0.180392)
Yellow.BorderSizePixel = 0
Yellow.BorderColor3 = Color3.new(0, 0, 0)
Yellow.Parent = Colors

local UICorner2 = Instance.new("UICorner")
UICorner2.Name = "UICorner"
UICorner2.CornerRadius = UDim.new(1, 0)
UICorner2.Parent = Yellow

local Green = Instance.new("Frame")
Green.Name = "Green"
Green.Position = UDim2.new(0.0425, 0, 0.34, 0)
Green.Size = UDim2.new(0, 15, 0, 15)
Green.BackgroundColor3 = Color3.new(0.164706, 0.792157, 0.266667)
Green.BorderSizePixel = 0
Green.BorderColor3 = Color3.new(0, 0, 0)
Green.Parent = Colors

local UICorner3 = Instance.new("UICorner")
UICorner3.Name = "UICorner"
UICorner3.CornerRadius = UDim.new(1, 0)
UICorner3.Parent = Green

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Position = UDim2.new(0, 0, 0.133333, 0)
ScrollingFrame.Size = UDim2.new(0, 400, 0, 260)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarImageColor3 = Color3.new(0, 0, 0)
ScrollingFrame.Active = true
ScrollingFrame.Parent = Main

-- Create buttons and functions for GUI
local function createButton(name, text, position)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Position = position
    button.Size = UDim2.new(0, 369, 0, 50)
    button.BackgroundColor3 = Color3.new(1, 1, 1)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.new(0, 0, 0)
    button.TextSize = 14
    button.Font = Enum.Font.FredokaOne
    button.TextScaled = true
    button.TextWrapped = true
    button.Parent = ScrollingFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = button

    return button
end

local SpeedButton = createButton("Speed 50", "SPEED 50", UDim2.new(0.0340021, 0, 0.0145075, 0))
local JumpButton = createButton("Inf Jump", "INFINITY JUMP", UDim2.new(0.0340021, 0, 0.137325, 0))
local TpButton = createButton("Ctrl To Tp", "CTRL TO TP", UDim2.new(0.0340021, 0, 0.255013, 0))
local RedLightGreenLightButton = createButton("RedLight Green Light", "RED LIGHT GREEN LIGHT", UDim2.new(0.0340021, 0, 0.373144, 0))
local PawObbyButton = createButton("Paw Obby", "PAW OBBY", UDim2.new(0.0340021, 0, 0.499584, 0))

-- Speed 50 Functionality
SpeedButton.MouseButton1Click:Connect(function()
    while true do
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 50
        end
        wait(0)
    end
end)

-- Infinite Jump Functionality
JumpButton.MouseButton1Click:Connect(function()
    _G.infinjump = not _G.infinjump
    if _G.infinJumpStarted == nil then
        _G.infinJumpStarted = true
        local plr = game:GetService('Players').LocalPlayer
        local m = plr:GetMouse()
        m.KeyDown:Connect(function(k)
            if _G.infinjump then
                if k:byte() == 32 then
                    local humanoid = game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                    humanoid:ChangeState('Jumping')
                    wait()
                    humanoid:ChangeState('Seated')
                end
            end
        end)
    end
end)

-- Click Teleport Functionality
TpButton.MouseButton1Click:Connect(function()
    if _G.WRDClickTeleport == nil then
        _G.WRDClickTeleport = true

        local player = game:GetService("Players").LocalPlayer
        local UserInputService = game:GetService("UserInputService")
        local mouse = player:GetMouse()

        repeat wait() until mouse

        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                if _G.WRDClickTeleport and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                    player.Character:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z))
                end
            end
        end)
    else
        _G.WRDClickTeleport = not _G.WRDClickTeleport
    end
end)

-- Red Light Green Light Functionality
RedLightGreenLightButton.MouseButton1Click:Connect(function()
    local startPosition = CFrame.new(8936.64, 237.481, -10345.6)
    local endPosition = CFrame.new(8455.02, 237.455, -10349.8)
    local duration = 2.7 -- Tween duration

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local TweenService = game:GetService("TweenService")

    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
    local tweenGoals = { CFrame = endPosition }

    local tween = TweenService:Create(rootPart, tweenInfo, tweenGoals)
    tween:Play()
end)

-- Paw Obby Functionality
PawObbyButton.MouseButton1Click:Connect(function()
    local positions = {
        CFrame.new(-5383.3935546875, -73.54806518554688, -2215.02783203125),
        CFrame.new(-5443.85888671875, -55.67308807373047, -2218.123563859375),
        CFrame.new(-5439.4150390625, -44.298080773047, -2190.745361328125),
        CFrame.new(-5441.176025, -29.42316955566406, -2188.8974609375),
        CFrame.new(-5348.40185546875, -27.173115839108594, -2192.63263046875),
        CFrame.new(-5338.681640625, -25.548118530108594, -2221.114990234375),
        CFrame.new(-5250.99140625, 9.45119287943848, -2226.23706546875),
        CFrame.new(-5247.09375, 39.126911633008, -2289.596435546875),
        CFrame.new(-5309.7724921875, 21.4519119266953, -2271.573486328125),
        CFrame.new(-5370.22626953125, 21.4519119266953, -2253.1884765625),
        CFrame.new(-5443.0307671875, 50.32691192669531, -2175.067138671875)
    }

    local duration = 30 -- Tween duration
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local TweenService = game:GetService("TweenService")

    local partDuration = duration / #positions
    local function createTween(targetPosition)
        local tweenInfo = TweenInfo.new(
            partDuration,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out,
            0,
            false,
            0
        )
        local tweenGoals = { CFrame = targetPosition }
        return TweenService:Create(rootPart, tweenInfo, tweenGoals)
    end

    for i, position in ipairs(positions) do
        local tween = createTween(position)
        tween:Play()
        tween.Completed:Wait()
    end
end)

-- Toggle GUI with "K" Key
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.K then
        ScreenGui.Enabled = not ScreenGui.Enabled -- Toggle visibility
    end
end)
