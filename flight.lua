local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedInput = Instance.new("TextBox")
local ApplyBtn = Instance.new("TextButton")
local FlyBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Настройка меню (Глеб, его можно двигать!)
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 200, 0, 220)
MainFrame.Position = UDim2.new(0.5, -100, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Active = true
MainFrame.Draggable = true -- Это чтобы ты мог его двигать

UICorner.Parent = MainFrame

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "GLEB HUB"
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
SpeedInput.PlaceholderText = "Скорость (+ или -)"
SpeedInput.Text = ""

ApplyBtn.Parent = MainFrame
ApplyBtn.Size = UDim2.new(0.8, 0, 0, 40)
ApplyBtn.Position = UDim2.new(0.1, 0, 0.75, 0)
ApplyBtn.Text = "ПРИМЕНИТЬ"
ApplyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
ApplyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Логика полета (Невидимая вода)
local flying = false
local currentSpeed = 50

FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    
    if flying then
        FlyBtn.Text = "FLY: ON"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        char.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
        char.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
        
        task.spawn(function()
            while flying do
                char.HumanoidRootPart.Velocity = char.Humanoid.MoveDirection * currentSpeed + Vector3.new(0, 1.5, 0)
                task.wait()
            end
        end)
    else
        FlyBtn.Text = "FLY: OFF"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        char.Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
    end
end)

ApplyBtn.MouseButton1Click:Connect(function()
    local val = SpeedInput.Text
    if string.find(val, "+") then
        currentSpeed = 50 + tonumber(val:match("%d+"))
    elseif string.find(val, "-") then
        currentSpeed = 50 - tonumber(val:match("%d+"))
    else
        currentSpeed = tonumber(val) or 50
    end
    print("Новая скорость Глеба: " .. currentSpeed)
end)
