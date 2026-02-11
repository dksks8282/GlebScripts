-- СКРИПТ ГЛЕБА (ВАРИАНТ ЧЕРЕЗ WORKSPACE)
local sound = Instance.new("Sound")
sound.Parent = game:GetService("SoundService")

-- Эта команда берет файл прямо из папки твоего чита!
local success, asset = pcall(function()
    return getcustomasset("Midu_Echoing.mp3")
end)

if success then
    sound.SoundId = asset
    sound.Volume = 10
    sound:Play()
    print("Глеб, музыка успешно найдена в папке workspace!")
else
    print("Ошибка: Глеб, проверь, лежит ли файл в папке workspace!")
end
