local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedInput = Instance.new("TextBox")
local ApplyBtn = Instance.new("TextButton")
local FlyBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 200, 0, 220)
MainFrame.Position = UDim2.new(0.5, -100, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Active = true
MainFrame.Draggable = true 

UICorner.Parent = MainFrame

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "GLEB HUB V3"
Title.TextColor3 = Color3.fromRGB(255, 255, 0)
Title.BackgroundTransparency = 1
Title.TextSize = 20

FlyBtn.Parent = MainFrame
FlyBtn.Size = UDim2.new(0.8, 0, 0, 40)
FlyBtn.Position = UDim2.new(0.1, 0, 0.25, 0)
FlyBtn.Text = "FLY: OFF"
FlyBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

SpeedInput.Parent = MainFrame
SpeedInput.Size = UDim2.new(0.8, 0, 0, 40)
SpeedInput.Position = UDim2.new(0.1, 0, 0.5, 0)
SpeedInput.PlaceholderText = "Speed (+ or -)"
SpeedInput.Text = ""

ApplyBtn.Parent = MainFrame
ApplyBtn.Size = UDim2.new(0.8, 0, 0, 40)
ApplyBtn.Position = UDim2.new(0.1, 0, 0.75, 0)
ApplyBtn.Text = "APPLY"
ApplyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
ApplyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local flying = false
local speed = 50
local bv = Instance.new("BodyVelocity")
local bg = Instance.new("BodyGyro")

FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    local char = game.Players.LocalPlayer.Character
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    if flying then
        FlyBtn.Text = "FLY: ON"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        
        bv.Parent = hrp
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Velocity = Vector3.new(0, 0, 0)
        
        bg.Parent = hrp
        bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.CFrame = hrp.CFrame
        
        task.spawn(function()
            while flying do
                bg.CFrame = workspace.CurrentCamera.CFrame
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * speed
                task.wait()
            end
            bv.Parent = nil
            bg.Parent = nil
        end)
    else
        FlyBtn.Text = "FLY: OFF"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    end
end)

ApplyBtn.MouseButton1Click:Connect(function()
    local val = SpeedInput.Text
    local num = tonumber(val:match("%d+")) or 0
    if string.find(val, "+") then
        speed = 50 + num
    elseif string.find(val, "-") then
        speed = 50 - num
    else
        speed = num > 0 and num or 50
    end
end)
