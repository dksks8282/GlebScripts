local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedInput = Instance.new("TextBox")
local ApplyBtn = Instance.new("TextButton")
local FlyBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 220, 0, 240)
MainFrame.Position = UDim2.new(0.5, -110, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Active = true
MainFrame.Draggable = true 

UICorner.Parent = MainFrame

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Text = "GLEB JOYSTICK FLY"
Title.TextColor3 = Color3.fromRGB(0, 255, 255)
Title.BackgroundTransparency = 1
Title.TextSize = 18

FlyBtn.Parent = MainFrame
FlyBtn.Size = UDim2.new(0.85, 0, 0, 45)
FlyBtn.Position = UDim2.new(0.075, 0, 0.25, 0)
FlyBtn.Text = "FLY: OFF"
FlyBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

SpeedInput.Parent = MainFrame
SpeedInput.Size = UDim2.new(0.85, 0, 0, 45)
SpeedInput.Position = UDim2.new(0.075, 0, 0.5, 0)
SpeedInput.PlaceholderText = "Speed (+/-)"
SpeedInput.Text = ""

ApplyBtn.Parent = MainFrame
ApplyBtn.Size = UDim2.new(0.85, 0, 0, 45)
ApplyBtn.Position = UDim2.new(0.075, 0, 0.75, 0)
ApplyBtn.Text = "SET SPEED"
ApplyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
ApplyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local flying = false
local speed = 50
local player = game.Players.LocalPlayer

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
                -- Глеб, теперь летим СТРОГО по направлению джойстика
                local moveDir = hum.MoveDirection
                if moveDir.Magnitude > 0 then
                    bv.Velocity = moveDir * speed
                    bg.CFrame = CFrame.new(hrp.Position, hrp.Position + moveDir)
                else
                    bv.Velocity = Vector3.new(0, 0, 0)
                end
                
                hum:ChangeState(Enum.HumanoidStateType.Freefall)
                task.wait()
            end
            if hrp:FindFirstChild("GlebFly") then hrp.GlebFly:Destroy() end
            if hrp:FindFirstChild("GlebGyro") then hrp.GlebGyro:Destroy() end
            hum:ChangeState(Enum.HumanoidStateType.Landing)
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
