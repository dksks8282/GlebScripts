-- ГЛЕБ: КОД ДЛЯ ПРАВОЙ РУКИ (Секретная кепка)
local meshId = "133041390273127"

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local arm = char:WaitForChild("Right Arm")
local hat = Instance.new("Part", char)
hat.Name = "Gleb_Right_Cap"
hat.CanCollide = false
hat.Transparency = 0

local mesh = Instance.new("SpecialMesh", hat)
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxassetid://" .. meshId
mesh.Scale = Vector3.new(1.2, 1.2, 1.2)

local weld = Instance.new("Weld", hat)
weld.Part0 = arm
weld.Part1 = hat
weld.C0 = CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(90), 0, 0)

print("Глеб, правая кепка из облака готова!")
