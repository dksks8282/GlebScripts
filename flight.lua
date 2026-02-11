local ScreenGui = Instance.new("ScreenGui")
local TextButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Настройки кнопки
ScreenGui.Parent = game.CoreGui
TextButton.Parent = ScreenGui
TextButton.Size = UDim2.new(0, 180, 0, 60)
TextButton.Position = UDim2.new(0.5, -90, 0.05, 0)
TextButton.Text = "FLY: OFF"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
TextButton.Font = Enum.Font.SourceSansBold
TextButton.TextSize = 30

UICorner.Parent = TextButton

local flying = false
local speed = 60

TextButton.MouseButton1Click:Connect(function()
    flying = not flying
    local char = game.Players.LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    if flying then
        TextButton.Text = "FLY: ON"
        TextButton.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        
        local bg = Instance.new("BodyGyro", char.HumanoidRootPart)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = char.HumanoidRootPart.CFrame
        bg.Name = "FlightGyro"
        
        local bv = Instance.new("BodyVelocity", char.HumanoidRootPart)
        bv.velocity = Vector3.new(0, 0.1, 0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Name = "FlightVelocity"
        
        task.spawn(function()
            while flying do
                task.wait()
                char.Humanoid.PlatformStand = true
                bv.velocity = workspace.CurrentCamera.CFrame.LookVector * speed
                bg.cframe = workspace.CurrentCamera.CFrame
            end
            char.Humanoid.PlatformStand = false
            if char.HumanoidRootPart:FindFirstChild("FlightGyro") then char.HumanoidRootPart.FlightGyro:Destroy() end
            if char.HumanoidRootPart:FindFirstChild("FlightVelocity") then char.HumanoidRootPart.FlightVelocity:Destroy() end
        end)
    else
        TextButton.Text = "FLY: OFF"
        TextButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    end
end)
