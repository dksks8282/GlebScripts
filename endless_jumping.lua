local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Настройки меню
ScreenGui.Parent = game:GetService("CoreGui")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 150, 0, 70)
Frame.Position = UDim2.new(0.5, -75, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Active = true
Frame.Draggable = true -- Можно двигать!

UICorner.Parent = Frame

TextButton.Parent = Frame
TextButton.Size = UDim2.new(0, 130, 0, 50)
TextButton.Position = UDim2.new(0, 10, 0, 10)
TextButton.Text = "ВОЗДУХ: ВЫКЛ"
TextButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.TextScaled = true

local player = game.Players.LocalPlayer
local active = false
local platform = nil

TextButton.MouseButton1Click:Connect(function()
    active = not active
    if active then
        TextButton.Text = "ВОЗДУХ: ВКЛ"
        TextButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        
        -- Создаем платформу
        platform = Instance.new("Part")
        platform.Size = Vector3.new(10, 1, 10) -- Большая и удобная
        platform.Transparency = 1 -- Сделал невидимой, но можешь поставить 0.5 чтобы видеть её
        platform.Anchored = true
        platform.Parent = game.Workspace
        
        -- Цикл слежения за Глебом
        task.spawn(function()
            while active do
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    -- Платформа будет ровно под ногами
                    platform.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, -3.5, 0)
                end
                task.wait() -- Чтобы не лагало
            end
        end)
    else
        TextButton.Text = "ВОЗДУХ: ВЫКЛ"
        TextButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        if platform then
            platform:Destroy()
            platform = nil
        end
    end
end)
