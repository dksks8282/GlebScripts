-- ==========================================
-- ИСПРАВЛЕННЫЙ КОД ГЛЕБА (ТОЛЬКО ПРЯМАЯ ССЫЛКА)
-- ==========================================

local sound = Instance.new("Sound")
sound.Name = "Gleb_Mega_Music"
sound.Parent = game:GetService("SoundService")

-- Глеб, вот эта ссылка ПРАВИЛЬНАЯ (без слова blob):
sound.SoundId = "https://raw.githubusercontent.com/dksks8282/GlebScripts/main/Midu_Echoing.mp3"

sound.Volume = 10 
sound.Looped = true 
sound.RollOffMode = Enum.RollOffMode.Linear
sound.ReferenceDistance = 100000
sound.MaxDistance = 100000

-- Пытаемся запустить
sound:Play()

print("Скрипт Глеба запущен! Если звук не пошел сразу - подожди 5 секунд загрузки.")
