local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Enabled = true -- Na początku GUI jest włączone
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Position = UDim2.new(0.341502, 0, 0.285917, 0)
Main.Size = UDim2.new(0, 400, 0, 300)
Main.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Position = UDim2.new(0, 0, 0.133333, 0)
ScrollingFrame.Size = UDim2.new(0, 400, 0, 260)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarImageColor3 = Color3.new(0, 0, 0)
ScrollingFrame.Active = true
ScrollingFrame.Parent = Main

-- Colors Section
local Colors = Instance.new("Frame")
Colors.Name = "Colors"
Colors.Position = UDim2.new(0.0340021, 0, -0.000749207, 0)
Colors.Size = UDim2.new(0, 69, 0, 50)
Colors.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
Colors.BackgroundTransparency = 1
Colors.BorderSizePixel = 0
Colors.Transparency = 1
Colors.Parent = Main

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

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Name = "UIListLayout"
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Colors

-- Buttons Section
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

-- Red Light Green Light Button
local RedLight_Green_Light = createButton("RedLight Green Light", "RED LIGHT GREEN LIGHT", UDim2.new(0.0340021, 0, 0.373144, 0))

-- Paw Obby Button
local Paw_Obby = createButton("Paw Obby", "PAW OBBY", UDim2.new(0.0340021, 0, 0.499584, 0))

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

-- Toggle GUI with "K" Key
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.K then
        ScreenGui.Enabled = not ScreenGui.Enabled -- Przełącz widoczność GUI
    end
end)
