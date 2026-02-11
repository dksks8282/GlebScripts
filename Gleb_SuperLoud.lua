-- Скрипт создан специально для Глеба
local sound = Instance.new("Sound")
sound.Name = "Midu_Echoing.mp3"
sound.Parent = game:GetService("SoundService")

-- Твоя ссылка из репозитория GlebScripts
sound.SoundId = "https://raw.githubusercontent.com/dksks8282/GlebScripts/main/Midu_Echoing.mp3"

-- Настройки для максимального шума
sound.Volume = 10 
sound.Looped = true 

-- Чтобы слышать везде, даже если камера далеко
sound.RollOffMode = Enum.RollOffMode.Linear
sound.ReferenceDistance = 100000
sound.MaxDistance = 100000

-- ПОЕХАЛИ!
sound:Play()

print("Gleb_SuperLoud.lua успешно запущен! Глеб, наслаждайся музыкой!")
