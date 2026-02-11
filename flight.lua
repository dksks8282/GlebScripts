local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
local hrp = c:WaitForChild("HumanoidRootPart")
local t = game.Workspace.Terrain

t.WaterTransparency = 1 
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0

local active = false

local gui = Instance.new("ScreenGui", p.PlayerGui)
local btn = Instance.new("TextButton", gui)
btn.Size = UDim2.new(0, 120, 0, 40)
btn.Position = UDim2.new(0, 10, 0, 200)
btn.Text = "Water: OFF"
btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
btn.TextColor3 = Color3.new(1, 1, 1)

btn.MouseButton1Click:Connect(function()
    active = not active
    if active then
        btn.Text = "Water: ON"
        btn.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
        task.spawn(function()
            while active do
                local pos = hrp.Position
                local reg = Region3.new(pos - Vector3.new(7, 7, 7), pos + Vector3.new(7, 7, 7))
                reg = reg:ExpandToGrid(4)
                t:SetCells(reg, Enum.Material.Water, Enum.WaterOccupation.Full, Enum.WaterForce.None)
                task.wait(0.03)
            end
        end)
    else
        btn.Text = "Water: OFF"
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        t:Clear()
    end
end)
