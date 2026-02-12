-- КОПИРОВЩИК НИКОВ ДЛЯ ГЛЕБА
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local mouse = localPlayer:GetMouse()

-- Создаем GUI
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
sg.Name = "GlebCopyGui"

local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 160, 0, 80)
frame.Position = UDim2.new(0.5, -80, 0.5, -40)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 2
frame.Active = true
frame.Draggable = true -- Можно двигать пальцем

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.9, 0, 0.6, 0)
button.Position = UDim2.new(0.05, 0, 0.2, 0)
button.Text = "ВЫБРАТЬ ИГРОКА"
button.TextColor3 = Color3.new(1, 1, 1)
button.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Сначала красная
button.TextScaled = true

local isSelecting = false

-- Логика кнопки
button.MouseButton1Click:Connect(function()
    isSelecting = true
    button.Text = "ЖМИ НА ИГРОКА"
    button.BackgroundColor3 = Color3.fromRGB(0, 200, 0) -- Становится зеленой
end)

-- Логика клика по игроку
mouse.Button1Down:Connect(function()
    if isSelecting then
        local target = mouse.Target
        if target and target.Parent:FindFirstChild("Humanoid") then
            local targetName = target.Parent.Name
            
            -- Копируем в буфер (сабвуфер) обмена
            setclipboard(targetName)
            
            -- Уведомление
            game.StarterGui:SetCore("SendNotification", {
                Title = "ГЛЕБ ХАК",
                Text = "Ник скопирован: " .. targetName,
                Duration = 3
            })
            
            -- ВОЗВРАЩАЕМ ВСЕ ОБРАТНО
            isSelecting = false
            button.Text = "ВЫБРАТЬ ИГРОКА"
            button.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Снова красная
        end
    end
end)
