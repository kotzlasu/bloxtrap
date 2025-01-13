-- GUI przyciski
local ScreenGui = Instance.new("ScreenGui")
local PawObbyButton = Instance.new("TextButton")
local GreenLightButton = Instance.new("TextButton")
local SpeedButton = Instance.new("TextButton")
local JumpButton = Instance.new("TextButton")
local TpButton = Instance.new("TextButton")

-- Ustawienia GUI
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Przycisk "Paw Obby"
PawObbyButton.Parent = ScreenGui
PawObbyButton.Size = UDim2.new(0, 200, 0, 50)
PawObbyButton.Position = UDim2.new(0, 50, 0, 50)
PawObbyButton.Text = "Paw Obby"

-- Przycisk "Green Light Red Light"
GreenLightButton.Parent = ScreenGui
GreenLightButton.Size = UDim2.new(0, 200, 0, 50)
GreenLightButton.Position = UDim2.new(0, 50, 0, 120)
GreenLightButton.Text = "Red Light Green Light"

-- Przycisk "Speed 50"
SpeedButton.Parent = ScreenGui
SpeedButton.Size = UDim2.new(0, 200, 0, 50)
SpeedButton.Position = UDim2.new(0, 50, 0, 190)
SpeedButton.Text = "Speed 50"

-- Przycisk "Infinite Jump"
JumpButton.Parent = ScreenGui
JumpButton.Size = UDim2.new(0, 200, 0, 50)
JumpButton.Position = UDim2.new(0, 50, 0, 260)
JumpButton.Text = "Infinite Jump"

-- Przycisk "Ctrl To TP"
TpButton.Parent = ScreenGui
TpButton.Size = UDim2.new(0, 200, 0, 50)
TpButton.Position = UDim2.new(0, 50, 0, 330)
TpButton.Text = "Ctrl To TP"

-- Skrypt dla Paw Obby
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

    local duration = 30 -- Czas tweenowania w sekundach
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

-- Skrypt dla Green Light Red Light
GreenLightButton.MouseButton1Click:Connect(function()
    local startPosition = CFrame.new(8936.64, 237.481, -10345.6)
    local endPosition = CFrame.new(8455.02, 237.455, -10349.8)
    local duration = 2.7 -- Czas tweenowania w sekundach

    -- Pobierz gracza lokalnego
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer -- Lokalny gracz
    local character = player.Character or player.CharacterAdded:Wait() -- Pobiera model postaci gracza

    -- Znajdź HumanoidRootPart, który steruje pozycją gracza
    local rootPart = character:WaitForChild("HumanoidRootPart")

    -- Utwórz TweenService
    local TweenService = game:GetService("TweenService")

    -- Właściwości Tweena
    local tweenInfo = TweenInfo.new(
        duration, -- Czas trwania
        Enum.EasingStyle.Quad, -- Styl easing (np. szybki start, wolniejsze zakończenie)
        Enum.EasingDirection.Out, -- Kierunek easing
        0, -- Liczba powtórzeń
        false, -- Czy odwracać (reverse)
        0 -- Opóźnienie
    )

    -- Cel Tweena
    local tweenGoals = {
        CFrame = endPosition
    }

    -- Utwórz Tween
    local tween = TweenService:Create(rootPart, tweenInfo, tweenGoals)

    -- Uruchom Tween
    tween:Play()
end)

-- Skrypt dla Speed 50
SpeedButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 50
end)

-- Skrypt dla Infinite Jump
JumpButton.MouseButton1Click:Connect(function()
    _G.infinjump = not _G.infinjump
    if _G.infinJumpStarted == nil then
        _G.infinJumpStarted = true
        local plr = game:GetService("Players").LocalPlayer
        local m = plr:GetMouse()
        m.KeyDown:Connect(function(k)
            if _G.infinjump then
                if k:byte() == 32 then
                    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                    humanoid:ChangeState("Jumping")
                end
            end
        end)
    end
end)

-- Skrypt dla Ctrl To TP
TpButton.MouseButton1Click:Connect(function()
    if _G.WRDClickTeleport == nil then
        _G.WRDClickTeleport = true
        local player = game:GetService("Players").LocalPlayer
        local UserInputService = game:GetService("UserInputService")
        local mouse = player:GetMouse()

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
