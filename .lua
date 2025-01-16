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

local Close_Button = Instance.new("ImageButton")
Close_Button.Name = "Close Button"
Close_Button.Position = UDim2.new(0.91, 0, 0.03, 0)
Close_Button.Size = UDim2.new(0, 25, 0, 25)
Close_Button.BackgroundColor3 = Color3.new(1, 1, 1)
Close_Button.BackgroundTransparency = 1
Close_Button.BorderSizePixel = 0
Close_Button.BorderColor3 = Color3.new(0, 0, 0)
Close_Button.Transparency = 1
Close_Button.Image = "rbxassetid://108156789436291"
Close_Button.Parent = Main

-- Dragging functionality
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Main.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        update(input)
    end
end)

local Colors = Instance.new("Frame")
Colors.Name = "Colors"
Colors.Position = UDim2.new(0.0340021, 0, -0.000749207, 0)
Colors.Size = UDim2.new(0, 69, 0, 50)
Colors.BackgroundTransparency = 1
Colors.Parent = Main

local Red = Instance.new("Frame")
Red.Name = "Red"
Red.Position = UDim2.new(0.0425, 0, 0.34, 0)
Red.Size = UDim2.new(0, 15, 0, 15)
Red.BackgroundColor3 = Color3.new(1, 0.372549, 0.352941)
Red.BorderSizePixel = 0
Red.Parent = Colors

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Red

local Yellow = Instance.new("Frame")
Yellow.Name = "Yellow"
Yellow.Position = UDim2.new(0.0425, 0, 0.34, 0)
Yellow.Size = UDim2.new(0, 15, 0, 15)
Yellow.BackgroundColor3 = Color3.new(1, 0.745098, 0.180392)
Yellow.BorderSizePixel = 0
Yellow.Parent = Colors

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(1, 0)
UICorner2.Parent = Yellow

local Green = Instance.new("Frame")
Green.Name = "Green"
Green.Position = UDim2.new(0.0425, 0, 0.34, 0)
Green.Size = UDim2.new(0, 15, 0, 15)
Green.BackgroundColor3 = Color3.new(0.164706, 0.792157, 0.266667)
Green.BorderSizePixel = 0
Green.Parent = Colors

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(1, 0)
UICorner3.Parent = Green

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Colors

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Position = UDim2.new(0, 0, 0.133333, 0)
ScrollingFrame.Size = UDim2.new(0, 400, 0, 260)
ScrollingFrame.BackgroundTransparency = 1
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
local BrookHaveenButton = createButton("Brookhaveen unban", "BROOKHAVEEN UNBAN", UDim2.new(0.0340021, 0, 0.373144, 0))

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
        local plr = game.Players.LocalPlayer
        local m = plr:GetMouse()
        m.KeyDown:Connect(function(k)
            if _G.infinjump and k:byte() == 32 then
                local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end)

-- Click Teleport Functionality
TpButton.MouseButton1Click:Connect(function()
    _G.WRDClickTeleport = not _G.WRDClickTeleport
    local player = game.Players.LocalPlayer
    local UserInputService = game:GetService("UserInputService")
    local mouse = player:GetMouse()

    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            if _G.WRDClickTeleport then
                player.Character:MoveTo(mouse.Hit.p)
            end
        end
    end)
end)

-- Brookhaven Unban Functionality
BrookHaveenButton.MouseButton1Click:Connect(function()
    local function removeBannedBlocks()
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Name:find("BannedBlock") then
                obj:Destroy()
            end
        end
    end

    removeBannedBlocks()

    workspace.ChildAdded:Connect(function(child)
        if child:IsA("BasePart") and child.Name:find("BannedBlock") then
            child:Destroy()
        end
    end)
end)

-- Toggle GUI with "K" Key
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.Q then
        ScreenGui.Enabled = not ScreenGui.Enabled -- Przełącz widoczność GUI
    end
end)
