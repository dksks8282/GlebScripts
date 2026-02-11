local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedInput = Instance.new("TextBox")
local ApplyBtn = Instance.new("TextButton")
local FlyBtn = Instance.new("TextButton")
local UpBtn = Instance.new("TextButton")
local DownBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Настройка меню
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 220, 0, 300) -- Увеличил высоту для новых кнопок
MainFrame.Position = UDim2.new(0.5, -110, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Active = true
MainFrame.Draggable = true 

UICorner.Parent = MainFrame

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "GLEB FLY PRO"
Title.TextColor3 = Color3.fromRGB(0, 255, 255)
Title.BackgroundTransparency = 1
Title.TextSize = 18

FlyBtn.Parent = MainFrame
FlyBtn.Size = UDim2.new(0.85, 0, 0, 35)
FlyBtn.Position = UDim2.new(0.075, 0, 0.15, 0)
FlyBtn.Text = "FLY: OFF"
FlyBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Кнопка ВВЕРХ
UpBtn.Parent = MainFrame
UpBtn.Size = UDim2.new(0.4, 0, 0, 35)
UpBtn.Position = UDim2.new(0.075, 0, 0.3, 0)
UpBtn.Text = "UP ↑"
UpBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
UpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Кнопка ВНИЗ
DownBtn.Parent = MainFrame
DownBtn.Size = UDim2.new(0.4, 0, 0, 35)
DownBtn.Position = UDim2.new(0.525, 0, 0.3, 0)
DownBtn.Text = "DOWN ↓"
DownBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
DownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

SpeedInput.Parent = MainFrame
SpeedInput.Size = UDim2.new(0.85, 0, 0, 35)
SpeedInput.Position = UDim2.new(0.075, 0, 0.5, 0)
SpeedInput.PlaceholderText = "Speed (+/-)"
SpeedInput.Text = ""

ApplyBtn.Parent = MainFrame
ApplyBtn.Size = UDim2.new(0.85, 0, 0, 35)
ApplyBtn.Position = UDim2.new(0.075, 0, 0.7, 0)
ApplyBtn.Text = "SET SPEED"
ApplyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
ApplyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local flying = false
local speed = 50
local upValue = 0
local player = game.Players.LocalPlayer

-- Логика кнопок высоты
UpBtn.MouseButton1Down:Connect(function() upValue = 1 end)
UpBtn.MouseButton1Up:Connect(function() upValue = 0 end)
DownBtn.MouseButton1Down:Connect(function() upValue = -1 end)
DownBtn.MouseButton1Up:Connect(function() upValue = 0 end)

FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    
    if not hrp or not hum then return end
    
    if flying then
        FlyBtn.Text = "FLY: ON"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "GlebFly"
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        local bg = Instance.new("BodyGyro", hrp)
        bg.Name = "GlebGyro"
        bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        
        task.spawn(function()
            while flying do
                local moveDir = hum.MoveDirection
                -- Основная скорость от джойстика + вертикальная скорость от кнопок
                local verticalVelocity = Vector3.new(0, upValue * speed, 0)
                
                if moveDir.Magnitude > 0 or upValue ~= 0 then
                    bv.Velocity = (moveDir * speed) + verticalVelocity
                    if moveDir.Magnitude > 0 then
                        bg.CFrame = CFrame.new(hrp.Position, hrp.Position + moveDir)
                    end
                else
                    bv.Velocity = Vector3.new(0, 0, 0)
                end
                hum:ChangeState(Enum.HumanoidStateType.Freefall)
                task.wait()
            end
            if hrp:FindFirstChild("GlebFly") then hrp.GlebFly:Destroy() end
            if hrp:FindFirstChild("GlebGyro") then hrp.GlebGyro:Destroy() end
        end)
    else
        FlyBtn.Text = "FLY: OFF"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    end
end)

ApplyBtn.MouseButton1Click:Connect(function()
    local val = SpeedInput.Text
    local num = tonumber(val:match("%d+")) or 0
    if string.find(val, "+") then speed = 50 + num
    elseif string.find(val, "-") then speed = 50 - num
    else speed = num > 0 and num or 50 end
end)
