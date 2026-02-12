-- ГЛЕБ: КОД ДЛЯ ЛЕВОЙ РУКИ (Синяя кепка)
local meshId = "417456840"
local texId = "417456998"

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- Делаем всё тело невидимым сразу
for _, v in pairs(char:GetChildren()) do
    if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
        v.Transparency = 1
    end
end

local arm = char:WaitForChild("Left Arm")
local hat = Instance.new("Part", char)
hat.Name = "Gleb_Left_Cap"
hat.CanCollide = false
hat.Transparency = 0

local mesh = Instance.new("SpecialMesh", hat)
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxassetid://" .. meshId
mesh.TextureId = "rbxassetid://" .. texId
mesh.Scale = Vector3.new(1.2, 1.2, 1.2)

local weld = Instance.new("Weld", hat)
weld.Part0 = arm
weld.Part1 = hat
weld.C0 = CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(90), 0, 0)

print("Глеб, левая кепка из облака готова!")
